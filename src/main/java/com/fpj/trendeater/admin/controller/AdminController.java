
package com.fpj.trendeater.admin.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fpj.trendeater.admin.model.exception.AdminException;
import com.fpj.trendeater.admin.model.service.AdminService;
import com.fpj.trendeater.admin.model.vo.Admin;
import com.fpj.trendeater.admin.model.vo.ApplyTaste;
import com.fpj.trendeater.admin.model.vo.Image;
import com.fpj.trendeater.admin.model.vo.PageInfo;
import com.fpj.trendeater.admin.model.vo.Product;

import com.fpj.trendeater.admin.model.vo.ProductRequest;
import com.fpj.trendeater.board.model.service.BoardService;
import com.fpj.trendeater.common.Pagination;
import com.fpj.trendeater.member.model.vo.Member;

@SessionAttributes("adminUser")
@Controller
public class AdminController {
	
	@Autowired
	private AdminService aService;
	
	@Autowired
	private BoardService bService;

	
	
	//###############김대열 
	
	@RequestMapping("productList.ad")
	
	public ModelAndView productList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = aService.getListCount();
		
		System.out.println(listCount);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		System.out.println(pi);
		ArrayList<Product> list = aService.getProductList(pi);
		ArrayList<Image> imgList = aService.getProductImgList();
		
		
		if(list != null && imgList != null) {
			mv.addObject("list",list);
			mv.addObject("imgList",imgList);
			mv.addObject("pi",pi);
			mv.setViewName("productList");
		} else {
			throw new AdminException("상품 목록을 불러오는데 실패하였습니다.");
		}
 		
		return mv;
		
	}
	
	@RequestMapping("productRegistrationView.ad")
	public String productRegistrationForm() {
		
		return "productRegistrationForm";
	}
	
	@RequestMapping("registerProduct.ad")
	public String registerProduct(@ModelAttribute Product product, 
								  @RequestParam(value="productImg", required=false) MultipartFile productImg,
								  @RequestParam(value="nutInfoImg", required=false) MultipartFile nutInfoImg, HttpServletRequest request) {
		
		
		System.out.println(product);
		System.out.println(productImg);
		System.out.println(nutInfoImg);
		ArrayList<Image> imageList = new ArrayList<Image>();
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root +"/productImgUploadFiles";
		
		Image productupload = new Image();
		if(productImg != null && !productImg.isEmpty()) {
			
			System.out.println(savePath);
			String changeName = saveFile(productImg, savePath, request);
			String originName = productImg.getOriginalFilename();
			
			productupload.setOriginName(originName);
			productupload.setChangeName(changeName);
			productupload.setFilePath(savePath);
			productupload.setFileLevel(1);
			productupload.setFileType(1);
			productupload.setBoardType(1);
			productupload.setIdentifyNo(product.getProductNo());
			imageList.add(productupload);
		}
		
		Image nutInfoupload = new Image();
		if(nutInfoImg != null && !nutInfoImg.isEmpty()) {
			
			String changeName = saveFile(nutInfoImg, savePath, request);
			String originName = nutInfoImg.getOriginalFilename();
			
			nutInfoupload.setOriginName(originName);
			nutInfoupload.setChangeName(changeName);
			nutInfoupload.setFilePath(savePath);
			nutInfoupload.setFileLevel(2);
			nutInfoupload.setFileType(2);
			nutInfoupload.setBoardType(1);
			nutInfoupload.setIdentifyNo(product.getProductNo());
			imageList.add(nutInfoupload);
		}
//		String adminId = ((Admin)request.getSession().getAttribute("loginAdmin")).getAdminId();
//		String adminName = ((Admin)request.getSession().getAttribute("loginAdmin")).getAdminName();
		product.setAdminId(null);
		product.setAdminName(null);
		
		int result = aService.registerProduct(product, imageList);
		
		if(result > 2) {
			return "redirect:productList.ad";
		} else {
			
			for(int i = 0; i < imageList.size(); i++) {
				File failFile = new File(savePath + "/" + imageList.get(i).getChangeName());
				failFile.delete();
			}
			
			throw new AdminException("상품등록에 실패하였습니다.");
			
		}
		
	}

	private String saveFile(MultipartFile file, String savePath, HttpServletRequest request) {

		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		// 랜덤번호 생성
		int ranNum=(int)(Math.random()*1000000);
		// 날짜 + 시간정보 저장
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		
		String originName = file.getOriginalFilename();
		
		String ext = null;
		
		int dot = originName.lastIndexOf(".");
		if(dot == -1) {
			ext = "";
		} else {
			ext = originName.substring(dot);
		}
		
		// 날짜 + 시간 + 랜덤번호 + 확장자로 파일명 생성
		String changeName = sdf.format(new Date(System.currentTimeMillis())) + ranNum + ext;
		
		System.out.println("originName" + originName);
		System.out.println("changeName" + changeName);
		
		String renamePath = folder + "/" + changeName;
		
		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
	}
	
	@RequestMapping("applyTaste.ad")
	public ModelAndView applyTasteList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		
		ModelAndView applyMv = productList(page, mv);
		
		ArrayList<ApplyTaste> aList = aService.getTasteList();
		System.out.println(aList);
		applyMv.addObject("aList", aList);
		applyMv.setViewName("applyTasteList");
		
		return applyMv;
	}
	
	@RequestMapping("registerTaste.ad")
	public String registerTaste(@RequestParam("productNo") int productNo, @RequestParam("endDate") String endDate, HttpServletRequest request) {
		
		System.out.println(productNo);
		System.out.println(endDate);
//		String adminId = ((Admin)request.getSession().getAttribute("adminUser")).getId();

		Date date = null;
		String[] endDateArr = endDate.split("-");
		int year = Integer.parseInt(endDateArr[0]);
		int month = Integer.parseInt(endDateArr[1]) - 1;
		int day = Integer.parseInt(endDateArr[2]);
		
		date = new Date(new GregorianCalendar(year, month, day).getTimeInMillis());
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("productNo", productNo);
		map.put("endDate", date);
		map.put("adminId", null); // adminId 넣기
		
		int result = aService.registerTaste(map);

		if (result > 0) {
			return "redirect:applyTaste.ad";

		} else {
			throw new AdminException("시식 게시판 정보를 불러오는데 실패하였습니다.");
		}
	}
	
	@RequestMapping("checkTasteIng.ad")
	public void checkTasteIng(@RequestParam(value="productNo") int productNo, HttpServletResponse response) {
//		System.out.println(productNo);
		
		int result = aService.checkTasteIng(productNo);
		
		try {
			PrintWriter pw = response.getWriter();
			pw.print(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("endApplyTaste.ad")
	public void endApplyTaste(@RequestParam(value="tasteNo") int tasteNo, HttpServletResponse response) {
//		System.out.println(tasteNo);
		
		int result = aService.endApplyTaste(tasteNo);
		
		try {
			PrintWriter pw = response.getWriter();
			pw.print(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@RequestMapping("updateTaste.ad")
	public String updateTaste(@RequestParam(value = "endDate") String endDate,
							  @RequestParam(value = "tasteNo") int tasteNo,
							  @RequestParam(value = "tasteIng") int tasteIng) {
		
//		System.out.println(endDate);
//		System.out.println(tasteNo);
//		System.out.println(tasteIng);
//		
		Date date = null;
		String endDateArr[] = endDate.split("-");
		int year = Integer.parseInt(endDateArr[0]);
		int month = Integer.parseInt(endDateArr[1]) -1 ;
		int day = Integer.parseInt(endDateArr[2]);
		
		date = new Date(new GregorianCalendar(year, month, day).getTimeInMillis());
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("endDate", date);
		map.put("tasteNo", tasteNo);
		map.put("tasteIng", tasteIng);
		
		int result = aService.updateTaste(map);
		
		if(result > 0) {
			
			return "redirect:applyTaste.ad";
		} else {
			throw new AdminException("시식게시판 수정에 실패하였습니다.");
		}
		
	}
	
	
	
		//상품 등록 요청
		@RequestMapping("requestProduct.bo")
		public String requestProduct(@ModelAttribute("ProductRequest")ProductRequest pr,HttpSession session) {
			
		
			
			Member member = (Member)session.getAttribute("loginUser");
			
			pr.setEmail(member.getEmail());
			
			
			
			int result = aService.insertRequestProduct(pr);
			
			
			if(result > 0) {
				return "redirect:prBoardList.bo";
				
			}else {
				throw new AdminException("상품등록 요청에 실패하였습니다.");
			}
			
		}
		
		
		//상품 요청 리스트 관리자 페이지에 뿌리기
		@RequestMapping("requestProductList.ad")
		public String requestProductList(Model model) {
			
			ArrayList<ProductRequest> prlist = aService.selectRequestProductList();
			
			if(prlist != null) {			
				model.addAttribute("prlist",prlist);
				return "requestProductList";
			}else {
				throw new AdminException("상품등록 리스트를 불러오지 못했습니다.");		
			}

		}
		
	
	////###############
	
	
	
	
	//##########김주희
	
	//김주희:회원 리스트 뷰페이지
	@RequestMapping("/member.ad")
	public String adminMember(Model model) {
		
		ArrayList<Member> member = aService.selectMember();
		int result = aService.memberCount();
		
		
		System.out.println(member);
		System.out.println(result);
		model.addAttribute("member",member);
		model.addAttribute("result",result);
		return "memberList";

	}
	
	
	//김주희:로그인 폼
	@RequestMapping("admin")
	public String adminView(Model model) {

		return "adminLogin";

	}
	
	
	//김주희:회원 상태 변경
	@RequestMapping("/memberstatus.ad")
	public String updateMember(@RequestParam("email")String email,@RequestParam("checked")String checked) {
		
		
		
		HashMap<String, String> map = new HashMap<>();
		map.put("email",email);
		map.put("checked",checked);

			
		int result = aService.updateMember(map);
		
		
		
		String res = Integer.toString(result);
		
		
		return res;
	}
	
	
	//김주희:회원 검색
	@RequestMapping("/searchmember.ad")
	public String searchMember(@RequestParam("search")String search,Model model) {
		
		
		ArrayList<Member> member = aService.searchMember(search);
		int result = aService.searchCount(search);

		System.out.println(result);
		
		System.out.println(member);
		
		model.addAttribute("result",result);
		model.addAttribute("member",member);
		return "memberList";
	}
	
	//김주희:어드민 로그인
	@RequestMapping("/adminlogin.ad")
	public String adminlogin(@ModelAttribute("admin")Admin admin,Model model,HttpSession session) {
		
	
		Admin admind = aService.adminlogin(admin);
		System.out.println(admind);
		
		
		if(admind != null ) {
			session.setAttribute("adminUser",admind);
			return "redirect:member.ad";
		}else {			
			throw new AdminException("관리자 로그인에 실패하였습니다.");
		}
		
		
		
		
	}
	
	
	//##########
}

