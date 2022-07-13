
package com.fpj.trendeater.admin.controller;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.HandlerMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fpj.trendeater.admin.model.exception.AdminException;
import com.fpj.trendeater.admin.model.service.AdminService;
import com.fpj.trendeater.admin.model.vo.Admin;
import com.fpj.trendeater.admin.model.vo.ApplyTaste;
import com.fpj.trendeater.admin.model.vo.Image;
import com.fpj.trendeater.admin.model.vo.PageInfo;
import com.fpj.trendeater.admin.model.vo.Product;
import com.fpj.trendeater.admin.model.vo.ProductRequest;
import com.fpj.trendeater.board.controller.BoardController;
import com.fpj.trendeater.board.model.exception.BoardException;
import com.fpj.trendeater.board.model.service.BoardService;
import com.fpj.trendeater.board.model.vo.ApplyTastePerson;
import com.fpj.trendeater.board.model.vo.Board;
import com.fpj.trendeater.board.model.vo.BoardQnA;
import com.fpj.trendeater.board.model.vo.EventBoard;
import com.fpj.trendeater.board.model.vo.Reply;

import com.fpj.trendeater.board.model.vo.Report;
import com.fpj.trendeater.board.model.vo.Review;
import com.fpj.trendeater.board.model.vo.ReviewImage;

import com.fpj.trendeater.common.Pagination;
import com.fpj.trendeater.member.model.vo.Member;
import com.fpj.trendeater.member.model.vo.ReviewList;
import com.fpj.trendeater.order.model.service.OrderService;
import com.fpj.trendeater.order.model.vo.OrderDetail;
import com.fpj.trendeater.order.model.vo.OrderStatus;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;

@SessionAttributes("adminUser")
@Controller
public class AdminController {

	@Autowired
	private AdminService aService;

	@Autowired
	private BoardService bService;
	
	@Autowired
	private OrderService oService;

	@Autowired
	private BoardController bController;

	// ###############김대열

	// 상품 목록 불러오기
	@RequestMapping(value={"productList.ad" , "prbAdminList.ad", "searchProduct.ad", "searchPrbAdmin.ad"})
	public ModelAndView productList(@RequestParam(value = "page", required = false) Integer page, ModelAndView mv, 
									@RequestParam(value = "value", required = false) String value,
									@RequestParam(value = "searchValue", required=false) String searchValue,
									HttpServletRequest request, HashMap<String, Object> map) {

		/** 페이징 처리 **/
		// 현재페이지, boardLimit 등 페이지 정보 설정
		int currentPage = 1;

		if (page != null) {
			currentPage = page;
		}
		int boardLimit = 5;
		
		// 조회할 게시판 테이블 설정(기본 어드민)
		String table = "pListAdmin";
		boolean defaulBoard = false;
		
		// 제품게시판에서 받아온 boardCheck 변수를 체크하여 테이블 및 boardLimit 설정 boardCheck가 true값이면 제품 게시판 
		if(map.get("boardCheck") != null && (boolean)map.get("boardCheck") == true) {
			table = "pListBoard";
			boardLimit = 9;
		}
		// 받아온 boardCheck 값이 없으면 false 저장
		if(map.get("boardCheck") == null) {
			map.put("boardCheck", defaulBoard);
		}
		// 받아온 게시글 정렬 값이 없으면 null 저장
		if(map.get("value") == null) {
			map.put("value", value);
		}
		
//		System.out.println("searchValue: "+searchValue);
//		if(searchValue != null && searchValue.equals("")) {
//			searchValue = null;
//		}
		
		map.put("searchValue", searchValue);
		System.out.println("boardCheck: " + map.get("boardCheck"));
		map.put("table", table);
		
		// 전체 게시글 숫자 조회
		int listCount = aService.getListCount(map);
		
		// 페이지 정보 받아오기
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);

		System.out.println(pi);

		 // 상품 리스트 받아오기
		ArrayList<Product> list = aService.getProductList(pi, map);
//		System.out.println(list);
		
		// 상품 이미지 리스트 받아오기
		ArrayList<Image> imgList = aService.getProductImgList();
		
		// 요청을 보낸 url 위치 확인
		String url = (String)request.getAttribute(HandlerMapping.PATH_WITHIN_HANDLER_MAPPING_ATTRIBUTE);
//		System.out.println(url);
		if (list != null && imgList != null) {
			mv.addObject("list", list);
			mv.addObject("imgList", imgList);
			mv.addObject("pi", pi);
			mv.addObject("searchValue", searchValue);
			mv.addObject("value", value);
			
			// 요청을 보낸 url에 따라 반환하는 viewname 설정
			if(url.equals("/productList.ad") || url.equals("/searchProduct.ad")){
				mv.setViewName("productList");
			} else {
				mv.setViewName("prbAdminList");
			}
		} else {
			throw new AdminException("상품 목록을 불러오는데 실패하였습니다.");
		}

		return mv;

	}

	// 상품 등록 form 이동
	@RequestMapping("productRegistrationView.ad")
	public String productRegistrationForm() {

		return "productRegistrationForm";
	}

	// 상품등록 ver1
	@RequestMapping("registerProduct.ad")
	public String registerProduct(@ModelAttribute Product product, 
								  MultipartHttpServletRequest mRequest, 
								  HttpServletRequest request) {

		Map<String, MultipartFile> fileMap = mRequest.getFileMap();
		System.out.println(fileMap);
		ArrayList<MultipartFile> fileList = new ArrayList<>();
		HashMap<String, String> map = null;
		String savePath = null;
			Image productupload = new Image();
			String originName = null;
			ArrayList<Image> imageList = new ArrayList<Image>();
		
		if(fileMap != null && !fileMap.isEmpty()) {
			// fileMap에 담긴 MultipartFile 객체를 list에 담는다
			for(String key: fileMap.keySet()) {
				fileList.add(fileMap.get(key));
			}
			
			for(MultipartFile mf : fileList) {
				if(mf.getSize()>0) {
					
					String fieldName = mf.getName();
					System.out.println(fieldName);
					Image nutInfoupload = new Image();
					
					switch(fieldName) {
						case("productImg"):
							
							map = saveFile(mf, request);
							originName = mf.getOriginalFilename();
							savePath = map.get("savePath");
							productupload.setOriginName(originName);
							productupload.setChangeName(map.get("changeName"));
							productupload.setFilePath(map.get("savePath"));
							productupload.setFileLevel(1);
							productupload.setFileType(1);
							productupload.setBoardType(1);
			//				productupload.setIdentifyNo(product.getProductNo());
							imageList.add(productupload);
							break;
										
						case("nutInfoImg"):
							map = saveFile(mf, request);
							originName = mf.getOriginalFilename();
							savePath = map.get("savePath");
							nutInfoupload.setOriginName(originName);
							nutInfoupload.setChangeName(map.get("changeName"));
							nutInfoupload.setFilePath(map.get("savePath"));
							nutInfoupload.setFileLevel(2);
							nutInfoupload.setFileType(2);
							nutInfoupload.setBoardType(1);
		//					nutInfoupload.setIdentifyNo(product.getProductNo());
							imageList.add(nutInfoupload);
					}
				}
			}
		}
		
		
		
		// 상품사진 이미지 정보 설정
		
		System.out.println("size :" + imageList.size());
		
		String adminId = ((Admin) request.getSession().getAttribute("adminUser")).getId();
		String adminName = ((Admin) request.getSession().getAttribute("adminUser")).getName();
		product.setAdminId(adminId);
		product.setAdminName(adminName);

		// 상품 정보 등록(게시글 정보도 포함)
		int result1 = aService.registerProduct(product);
		// 상품 이미지 등록
		int result2 = aService.registerImage(imageList, product.getProductNo());

		System.out.println("imgresult : " + result2);
		if (result1 + result2 > 1 + imageList.size()) {
			return "redirect:productList.ad";
		} else {
			// 상품 등록 실패시 저장소 파일 삭제
			for (int i = 0; i < imageList.size(); i++) {
//				File failFile = new File(savePath + "/" + imageList.get(i).getChangeName());
//				failFile.delete();
				deleteFile(imageList.get(i).getChangeName(), request);
			}

			throw new AdminException("상품등록에 실패하였습니다.");

		}

	}
	

	// 파일 저장
	private HashMap<String, String> saveFile(MultipartFile file, HttpServletRequest request) {
		
		// 저장 경로 설정
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/productImgUploadFiles";
		
		// 저장 디렉토리 생성
		File folder = new File(savePath);
		if (!folder.exists()) {
			folder.mkdirs();
		}

		// 랜덤번호 생성
		int ranNum = (int) (Math.random() * 1000000);
		
		// 날짜 + 시간정보 저장
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");

		String originName = file.getOriginalFilename();

		String ext = null;

		int dot = originName.lastIndexOf(".");
		if (dot == -1) {
			ext = "";
		} else {
			ext = originName.substring(dot);
		}

		// 날짜 + 시간 + 랜덤번호 + 확장자로 파일명 생성
		String changeName = sdf.format(new Date(System.currentTimeMillis())) + ranNum + ext;

		HashMap<String, String> map = new HashMap<>();

		map.put("savePath", savePath);
		map.put("changeName", changeName);

		String renamePath = folder + "/" + changeName;

		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return map;
	}

	// 시식게시판 관리 리스트 불러오기
	@RequestMapping(value={"applyTaste.ad", "applyTastSearch.ad"})
	public ModelAndView applyTasteList(@RequestParam(value = "page", required = false) Integer page, 
									   @RequestParam(value = "searchValue", required = false) String searchValue,
									   @RequestParam(value = "value", required = false) String value, ModelAndView mv, boolean boardCheck) {
		
		int currentPage = 1;

		if (page != null) {
			currentPage = page;
		}

		int boardLimit = 5;
		
		// 기본 테이블(관리자 페이지) 정보 설정
		String table = "tasteBoardAdmin";
		
		// 회원 페이지 여부 체크에 따라 table 값 설정
		if(boardCheck == true) {
			table = "tasteBoard";
			boardLimit = 9;
			
		}
		
//		System.out.println("boardCheck:" + boardCheck);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("value", value);
		map.put("boardCheck", boardCheck);
		map.put("searchValue", searchValue);
		map.put("table", table);
		
		// 시식게시판 게시글 숫자 조회
		int listCount = aService.getListCount(map);
		
//		System.out.println(map);
//		System.out.println(value);
		
		// 페이지 정보 받아오기
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);

//		System.out.println(pi);

		
		// 시식게시판 리스트 받아오기
		ArrayList<ApplyTaste> aList = aService.getTasteList(pi, map);
		System.out.println(pi);
//		System.out.println(aList);
		
		mv.addObject("pi", pi);
		mv.addObject("aList", aList);
		mv.addObject("value", value);
		mv.addObject("searchValue", searchValue);
		mv.setViewName("applyTasteList");
		

		return mv;
	}

	// 시식 등록
	@RequestMapping("registerTaste.ad")
	public String registerTaste(@RequestParam("productNo") int productNo, @RequestParam("endDate") String endDate, HttpServletRequest request) {

//		System.out.println(productNo);
//		System.out.println(endDate);
		String adminId = ((Admin) request.getSession().getAttribute("adminUser")).getId();
		
		// 시식 신청 마감일 설정
		Date date = null;
		String[] endDateArr = endDate.split("-");
		int year = Integer.parseInt(endDateArr[0]);
		int month = Integer.parseInt(endDateArr[1]) - 1;
		int day = Integer.parseInt(endDateArr[2]);
		date = new Date(new GregorianCalendar(year, month, day).getTimeInMillis());

		
		HashMap<String, Object> map = new HashMap<>();
		map.put("productNo", productNo);
		map.put("endDate", date);
		map.put("adminId", adminId); // adminId 넣기
		
		// 시식 게시판 등록
		int result = aService.registerTaste(map);

		if (result > 0) {
			return "redirect:applyTaste.ad";

		} else {
			throw new AdminException("시식 게시판 정보를 불러오는데 실패하였습니다.");
		}
	}

	// 시식게시판 등록여부
	@RequestMapping("checkTasteIng.ad")
	public void checkTasteIng(@RequestParam(value = "productNo") int productNo, HttpServletResponse response) {
//		System.out.println(productNo);
		
		// 시식게시판 등록여부 체크
		int result = aService.checkTasteIng(productNo);

		try {
			PrintWriter pw = response.getWriter();
			pw.print(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 시식 종료
	@RequestMapping("endApplyTaste.ad")
	public void endApplyTaste(@RequestParam(value = "tasteNo") int tasteNo, HttpServletResponse response) {
//		System.out.println(tasteNo);
		
		// 시식 종료(마강)
		int result = aService.endApplyTaste(tasteNo);

		try {
			PrintWriter pw = response.getWriter();
			pw.print(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 시식 게시글 수정
	@RequestMapping("updateTaste.ad")
	public String updateTaste(@RequestParam(value = "endDate") String endDate, @RequestParam(value = "tasteNo") int tasteNo, @RequestParam(value = "tasteIng") int tasteIng) {

//		System.out.println(endDate);
//		System.out.println(tasteNo);
//		System.out.println(tasteIng);
//		
		System.out.println(endDate);
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		// 시식 마감일 설정
		if(endDate != null) {
			Date date = null;
			String endDateArr[] = endDate.split("-");
			int year = Integer.parseInt(endDateArr[0]);
			int month = Integer.parseInt(endDateArr[1]) - 1;
			int day = Integer.parseInt(endDateArr[2]);
			date = new Date(new GregorianCalendar(year, month, day).getTimeInMillis());
			map.put("endDate", date);
		}


		map.put("tasteNo", tasteNo);
		map.put("tasteIng", tasteIng);

		// 시식 정보 수정하기
		int result = aService.updateTaste(map);

		if (result > 0) {

			return "redirect:applyTaste.ad";
		} else {
			throw new AdminException("시식게시판 수정에 실패하였습니다.");
		}

	}

	// 상품 등록 요청
	@RequestMapping("requestProduct.bo")
	@ResponseBody
	public String requestProduct(@ModelAttribute("ProductRequest") ProductRequest pr, HttpSession session) {

		Member member = (Member) session.getAttribute("loginUser");
		
		pr.setEmail(member.getEmail());
		
		// 상품 등록 요청 정보 저장
		int result = aService.insertRequestProduct(pr);

		String res = Integer.toString(result);

		return res;

	}

	// 상품 요청 리스트 관리자 페이지에 뿌리기
	@RequestMapping(value={"requestProductList.ad", "requestProductSearch.ad"})
	public ModelAndView requestProductList(@RequestParam(value = "page", required = false) Integer page, 
										   @RequestParam(value = "searchCondition", required = false) String searchCondition,
										   @RequestParam(value = "searchValue", required = false) String searchValue,
										   @RequestParam(value = "value", required = false) String value, ModelAndView mv) {

		int currentPage = 1;

		if (page != null) {
			currentPage = page;
		}
		
		// 테이블 정보 설정
		String table = "productRequest";
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("value", value);
		map.put("searchCondition", searchCondition);
		map.put("searchValue", searchValue);
		map.put("table", table);
		
		// 게시글 수량 조회
		int listCount = aService.getListCount(map);
		int boardLimit = 5;
		
		// 페이지 정보 받아오기
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);

//		System.out.println(pi);
//		System.out.println("value :" + value);

		// 상품 요청 리스트 받아오기
		ArrayList<ProductRequest> prlist = aService.selectRequestProductList(pi, map);
		
//		System.out.println(prlist);

		if (prlist != null) {
			mv.addObject("prlist", prlist);
			mv.addObject("pi", pi);
			mv.addObject("value", value);
			mv.addObject("searchCondition", searchCondition);
			mv.addObject("searchValue", searchValue);
			mv.setViewName("requestProductList");
		} else {
			throw new AdminException("상품등록요청 리스트를 불러오지 못했습니다.");
		}
		return mv;
	}

	// 상품 수정 페이지 이동
	@RequestMapping("updateProductForm.ad")
	public ModelAndView updateProductView(@RequestParam("productNo") int productNo,
										  @RequestParam(value = "page", required = false) Integer page,ModelAndView mv) {

		
		HashMap<String, Object> map = new HashMap<>();
		map.put("update", "update");
		map.put("pno", productNo);
		System.out.println(productNo);
		// 상품 번호로 상품 정보 받아오기
		Product p = bService.selectPrBoard(map);
//		System.out.println(p);
		// 상품 이미지 정보 받아오기
		ArrayList<Image> imgList = bService.selectPrImage(productNo);
//		ModelAndView updateMv = bController.prbBoardDetail(productNo, 1, null, mv);
		System.out.println(imgList);
		
		if(p != null && imgList != null) {
			mv.addObject("p", p);
			mv.addObject("imgList", imgList);
			mv.addObject("page", page);
			mv.setViewName("updateProductForm");
		} else{
			throw new AdminException("상품수정 페이지 이동에 실패하였습니다.");
		}

		return mv;
	}

	// 상품 정보 수정
	@RequestMapping("updateProduct.ad")
	public String updateProduct(@ModelAttribute Product product, 
								@RequestParam(value = "delProductImgNo", required = false) Integer delProductImgNo, 
								@RequestParam(value = "delProductImgName", required = false) String delProductImgName, 
								@RequestParam(value = "delNutInfoImgNo", required = false) Integer delNutInfoImgNo, 
								@RequestParam(value = "delNutInfoImgName", required = false) String delNutInfoImgName, 
								@RequestParam(value = "productImg", required = false) MultipartFile productImg, 
								@RequestParam(value = "nutInfoImg", required = false) MultipartFile nutInfoImg, HttpServletRequest request) {

//		System.out.println(product);
//		System.out.println(delProductImgNo);
//		System.out.println(delProductImgName);
//		System.out.println(delNutInfoImgNo);
//		System.out.println(delNutInfoImgName);
//		System.out.println(productImg);
//		System.out.println(nutInfoImg);

		String savePath = null;
		ArrayList<Image> imgList = new ArrayList<>();
		HashMap<String, String> map = new HashMap<>();
		HashMap<String, Object> imgMap = new HashMap<>();
		Image updateProductImage = new Image();
		Image updateNutInfoImage = new Image();

		int count = 0;
		int result1 = 0;
		// 상품 사진 수정이 존재 할시 상품 사진 수정정보 설정 및 db와 저장소에서 기존 이미지 정보 삭제
		if (productImg != null && !productImg.isEmpty()) {

			map = saveFile(productImg, request);
			savePath = map.get("savePath");
			String originName = productImg.getOriginalFilename();
			updateProductImage.setChangeName(map.get("changeName"));
			updateProductImage.setOriginName(originName);
			updateProductImage.setBoardType(1);
			updateProductImage.setFileLevel(1);
			updateProductImage.setFilePath(savePath);
			updateProductImage.setFileType(1);
			updateProductImage.setIdentifyNo(product.getProductNo());
			imgList.add(updateProductImage);
			if (delProductImgName != null) {
				count += 2;
				imgMap.put("imgNo", delProductImgNo);
				result1 = aService.delImage(imgMap);
				deleteFile(delProductImgName, request);
			}
		}

		int result2 = 0;
		// 상세정보 사진 수정이 존재 할시 상세정보 사진 수정정보 설정 및 db와 저장소에서 기존 이미지 정보 삭제
		if (nutInfoImg != null && !nutInfoImg.isEmpty()) {
			map = saveFile(nutInfoImg, request);
			savePath = map.get("savePath");
			String originName = nutInfoImg.getOriginalFilename();
			updateNutInfoImage.setBoardType(1);
			updateNutInfoImage.setChangeName(map.get("changeName"));
			updateNutInfoImage.setFileLevel(2);
			updateNutInfoImage.setFilePath(savePath);
			updateNutInfoImage.setFileType(2);
			updateNutInfoImage.setIdentifyNo(product.getProductNo());
			updateNutInfoImage.setOriginName(originName);
			imgList.add(updateNutInfoImage);
			if (delNutInfoImgName != null) {
				count += 2;
				imgMap.put("imgNo", delNutInfoImgNo);
				result2 = aService.delImage(imgMap);
				deleteFile(delNutInfoImgName, request);

			}
		}

		String adminId = ((Admin) request.getSession().getAttribute("adminUser")).getId();
		String adminName = ((Admin) request.getSession().getAttribute("adminUser")).getName();

		product.setAdminId(adminId);
		product.setAdminName(adminName);


		int result3 = 0;
		// 사진 수정정보가 존재할시 사진 정보 db 등록
		if (!imgList.isEmpty()) {
			result3 = aService.registerImage(imgList, product.getProductNo());
			System.out.println("imgresult2 : " + result3);
		}
		
		// 게시글 정보 수정 등록
		int result4 = aService.updateProduct(product);
//		System.out.println("결과: "+ result1 + result2 + result3 + result4);
//		System.out.println("비교: " + count);
		
		if (result1 + result2 + result3 + result4 > count + 1) {
			return "redirect:productList.ad";
		} else {
			// 등록 실패시 저장소 사진 파일 삭제
			for (int i = 0; i < imgList.size(); i++) {
//				File failFile = new File(savePath + "/" + imgList.get(i).getChangeName());
//				failFile.delete();
				deleteFile(imgList.get(i).getChangeName(), request);
			}
			throw new AdminException("상품 정보 수정에 실패하였습니다.");
		}
	}

	// 파일삭제 메소드
	public void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/productImgUploadFiles";
		System.out.println(savePath);
		System.out.println("fileName: "+ fileName);
		File f = new File(savePath + "/" + fileName);
		if (f.exists()) {
			f.delete();
		}
	}

	// 사용자 게시글 삭제
	@RequestMapping(value={"deleteProductBoard.ad", "deleteTasteBoard.ad"})
	public void deleteUsertBoard(@RequestParam("bool") String bool, @RequestParam("pno") int pno, HttpServletResponse response,  HttpServletRequest request) {
		String url = (String)request.getAttribute(HandlerMapping.PATH_WITHIN_HANDLER_MAPPING_ATTRIBUTE);
		System.out.println(bool);
		HashMap<String, Object> map = new HashMap<>();
		map.put("pno", pno);
		map.put("bool", bool);
		System.out.println(url);
		if(url.equals("/deleteProductBoard.ad")) {
			map.put("type", "product");
		} else if(url.equals("/deleteTasteBoard.ad")) {
			map.put("type", "taste");
		}
		
		int result = aService.deleteUserBoard(map);
	
		try {
			PrintWriter pw = response.getWriter();
			pw.print(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 시식 신청자 불러오기
	@RequestMapping(value={"applyPersonList.ad","applyPersonSearch.ad"})
	public ModelAndView getApplyPersonList(@RequestParam(value = "page", required = false) Integer page,
										   @RequestParam(value = "searchCondition", required = false) String searchCondition,
										   @RequestParam(value = "searchValue", required = false) String searchValue,
										   @RequestParam(value = "value", required = false) String value, ModelAndView mv, HashMap<String, Object> map) {
		int currentPage = 1;

		if (page != null) {
			currentPage = page;
		}

		String table = "applyTaste";
		map.put("table", table);
		map.put("value", value);
		map.put("searchCondition", searchCondition);
		map.put("searchValue", searchValue);
		
		int listCount = aService.getListCount(map);
		
		int boardLimit = 5;
		
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);

		System.out.println(pi);
		System.out.println(map);
		ArrayList<ApplyTastePerson> applyPersonList = aService.getApplyPersonList(pi, map);

		if (applyPersonList != null) {
			mv.addObject("list", applyPersonList);
			mv.addObject("pi", pi);
			mv.addObject("value", value);
			mv.addObject("searchCondition", searchCondition);
			mv.addObject("searchValue", searchValue);
			mv.setViewName("applyPersonList");

		} else {
			throw new AdminException("시식 신청자 목록을 불러오는데 실패하였습니다.");
		}

		return mv;
	}
	
	// 관리자 페이지 게시글 삭제
	@RequestMapping(value={"deleteTasteAdmin.ad" ,"deleteProductAdmin.ad"})
	public void deleteAdminBoard(@RequestParam("pno") int pno, 
								 @RequestParam(value = "imgName[]", required=false) String[] imgNameArr,
								 @RequestParam(value = "imgNo[]", required=false) int[] imgNoArr,
								 HttpServletResponse response,  HttpServletRequest request) {
		
	
		
		
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("imgNo", imgNoArr);
		map.put("arr", "arr");
		
	
		
		String url = (String)request.getAttribute(HandlerMapping.PATH_WITHIN_HANDLER_MAPPING_ATTRIBUTE);
		map.put("pno", pno);
		System.out.println(url);
		
		int count = 0;
		if(url.equals("/deleteProductAdmin.ad")) {
			map.put("type", "product");
			count +=1;
		} else if(url.equals("/deleteTasteAdmin.ad")) {
			map.put("type", "taste");
		}
		int result1 = 0;
		if(imgNoArr != null) {
			count = imgNoArr.length;
			result1 = aService.delImage(map);
		}
		int result2 = aService.deleteAdminBoard(map);
		
		System.out.println("result1: " + result1);
		System.out.println("result2: " + result2);
		System.out.println("count:" + count);
		
		
		String data = null;
		if(result1 + result2 > count) {
			data = "true";
		} else {
			data = "false";
		}
		

		try {
			PrintWriter pw = response.getWriter();
			pw.print(data);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	

	////###############
	
	
	
	
	//##########김주희
	
	//김주희:회원 리스트 뷰페이지
	@RequestMapping("member.ad")
	public String adminMember(Model model) {

		ArrayList<Member> member = aService.selectMember();
		int result = aService.memberCount();
		model.addAttribute("member", member);
		model.addAttribute("result", result);
		return "memberList";

	}

	// 김주희:로그인 폼
	@RequestMapping("admin")
	public String adminView(Model model) {

		return "adminLogin";
	}

	// 김주희:회원 상태 변경
	@RequestMapping("/memberstatus.ad")
	public String updateMember(@RequestParam("email") String email, @RequestParam("checked") String checked) {

		HashMap<String, String> map = new HashMap<>();
		map.put("email", email);
		map.put("checked", checked);
		int result = aService.updateMember(map);
		String res = Integer.toString(result);

		return res;
	}

	// 김주희:회원 검색
	@RequestMapping("/searchmember.ad")
	public String searchMember(@RequestParam("search") String search, Model model) {

		ArrayList<Member> member = aService.searchMember(search);
		int result = aService.searchCount(search);
		model.addAttribute("result", result);
		model.addAttribute("member", member);
		return "memberList";
	}

	// 김주희:어드민 로그인
	@RequestMapping("/adminlogin.ad")
	public String adminlogin(@ModelAttribute("admin") Admin admin, Model model, HttpSession session) {

		Admin admind = aService.adminlogin(admin);
		if (admind != null) {
			session.setAttribute("adminUser", admind);
			return "redirect:member.ad";
		} else {
			throw new AdminException("관리자 로그인에 실패하였습니다.");
		}
	}

	// 어드민 로그인 뷰페이지 이동
	@RequestMapping("adminjoinform.ad")
	public String adminJoinForm() {

		return "adminJoinForm";
	}

	// 어드민 로그인
	@RequestMapping("adminJoin.ad")
	@ResponseBody
	public String adminJoin(@ModelAttribute("Admin") Admin admin, HttpSession session) {
		System.out.println(admin);

		Admin adminUser = (Admin) session.getAttribute("adminUser");

		String id = adminUser.getId();

		if (id.equals("supervisor")) {

			int result = aService.insertAdmin(admin);
			String res = Integer.toString(result);
			return res;

		} else {
			throw new AdminException("관리자 등록에 실패하였습니다.<br>등록자가 supervisor인지 확인하십시오.");
		}
	}

	// 아이디 중복체크
	@RequestMapping("adminIdCheck.ad")
	@ResponseBody
	public String adminIdCheck(@ModelAttribute("Admin") Admin admin) {
		int result = aService.adminCount(admin);

		String res = Integer.toString(result);
		return res;
	}
	
	//관리자 로그 아웃
	@RequestMapping("adminLogout.ad")
	public String AdminLogout(SessionStatus status) {
		//세션무효화
		status.setComplete();
		return "redirect:../admin";
	}

	@RequestMapping("exceldownload.ad")
	public String exceldownload(@RequestParam(value = "search",required=false)String search,HttpServletResponse response,Model model){
		
		
		ArrayList<Member> member= new ArrayList<Member>();

		
		//검색을 했을 때 검색된 회원리스트 뽑기
		if(search != null) {
			member = aService.searchMember(search);
	    
		//검색 안한 전체 회원 리스트 뽑기
		}else {
			member = aService.selectMember();
		}
		
		
		
		System.out.println(member);
		System.out.println(member.size());
		
		
		HSSFWorkbook objWorkBook = new HSSFWorkbook();
		HSSFSheet objSheet = null;
		HSSFRow objRow = null;
		HSSFCell objCell = null;
		
		HSSFFont font = objWorkBook.createFont();
		font.setFontHeightInPoints((short)9);
		font.setFontName("맑은고딕");
		
		HSSFCellStyle styleHd = objWorkBook.createCellStyle();
		styleHd.setFont(font);
		
		
		objSheet = objWorkBook.createSheet("첫번째 시트");
		
		objRow = objSheet.createRow(0);
		objRow.setHeight((short)0x150);
		

		objCell = objRow.createCell(0);
		objCell.setCellValue("이메일");
		objCell.setCellStyle(styleHd);
		
		objCell = objRow.createCell(1);
		objCell.setCellValue("이름");
		objCell.setCellStyle(styleHd);
		
		objCell = objRow.createCell(2);
		objCell.setCellValue("닉네임");
		objCell.setCellStyle(styleHd);
		
		objCell = objRow.createCell(3);
		objCell.setCellValue("휴대폰");
		objCell.setCellStyle(styleHd);
		
		objCell = objRow.createCell(4);
		objCell.setCellValue("생년월일");
		objCell.setCellStyle(styleHd);
		
		objCell = objRow.createCell(5);
		objCell.setCellValue("성별");
		objCell.setCellStyle(styleHd);
		
		
		objCell = objRow.createCell(6);
		objCell.setCellValue("가입일");
		objCell.setCellStyle(styleHd);
		
		objCell = objRow.createCell(7);
		objCell.setCellValue("주소");
		objCell.setCellStyle(styleHd);
		
		objCell = objRow.createCell(8);
		objCell.setCellValue("회원상태");
		objCell.setCellStyle(styleHd);
		
		
		
		
		
		if(member.size() < 2 ) {
			objRow = objSheet.createRow(1);
			objRow.setHeight((short)0x150);
			
			objCell = objRow.createCell(0);
			objCell.setCellValue(member.get(0).getEmail());
			objCell.setCellStyle(styleHd);
			
			objCell = objRow.createCell(1);
			objCell.setCellValue(member.get(0).getName());
			objCell.setCellStyle(styleHd);
			
			objCell = objRow.createCell(2);
			objCell.setCellValue(member.get(0).getNickName());
			objCell.setCellStyle(styleHd);
			
			objCell = objRow.createCell(3);
			objCell.setCellValue(member.get(0).getPhone());
			objCell.setCellStyle(styleHd);
			
			objCell = objRow.createCell(4);
			objCell.setCellValue(member.get(0).getBirthday());
			objCell.setCellStyle(styleHd);
			
			
			objCell = objRow.createCell(5);
			objCell.setCellValue(member.get(0).getGender());
			objCell.setCellStyle(styleHd);
			
			objCell = objRow.createCell(6);
			objCell.setCellValue(member.get(0).getCreateDate());
			objCell.setCellStyle(styleHd);
			
			objCell = objRow.createCell(7);
			objCell.setCellValue(member.get(0).getAddress());
			objCell.setCellStyle(styleHd);
			
			objCell = objRow.createCell(8);
			objCell.setCellValue(member.get(0).getStatus());
			objCell.setCellStyle(styleHd);
		
		} else if(member.size() >= 2){
				int cellNum = 0;
				int rowNum = 1;
			for(int i = 0;i <= member.size()-1 ;i++) {	
				
				objRow = objSheet.createRow(rowNum++);
				objRow.setHeight((short)0x150);
				
				
				objCell = objRow.createCell(0);
				objCell.setCellValue(member.get(i).getEmail());
				objCell.setCellStyle(styleHd);
				
				objCell = objRow.createCell(1);
				objCell.setCellValue(member.get(i).getName());
				objCell.setCellStyle(styleHd);
				
				objCell = objRow.createCell(2);
				objCell.setCellValue(member.get(i).getNickName());
				objCell.setCellStyle(styleHd);
				
				objCell = objRow.createCell(3);
				objCell.setCellValue(member.get(i).getPhone());
				objCell.setCellStyle(styleHd);
				
				objCell = objRow.createCell(4);
				objCell.setCellValue(member.get(i).getBirthday());
				objCell.setCellStyle(styleHd);
				
				
				objCell = objRow.createCell(5);
				objCell.setCellValue(member.get(i).getGender());
				objCell.setCellStyle(styleHd);
				
				objCell = objRow.createCell(6);
				objCell.setCellValue(member.get(i).getCreateDate());
				objCell.setCellStyle(styleHd);
				
				objCell = objRow.createCell(7);
				objCell.setCellValue(member.get(i).getAddress());
				objCell.setCellStyle(styleHd);
				
				objCell = objRow.createCell(8);
				objCell.setCellValue(member.get(i).getStatus());
				objCell.setCellStyle(styleHd);
				
				}
				
			
		}
		response.setContentType("Application/Msexcel");
		try {
			response.setHeader("Content-Disposition","ATTachment;Filename=" + URLEncoder.encode("Trend_Eater_회원 목록","UTF-8")+".xls");
			OutputStream fileOut = response.getOutputStream();
			objWorkBook.write(fileOut);
			fileOut.close();
			
			
			response.getOutputStream().flush();
			response.getOutputStream().close();
		
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return null;
	}
	//##########
	
	
	/*****			김인수			******/
	
	//이벤트 관리페이지로 이동
	@RequestMapping("eventlist.ad")
	public ModelAndView eBoardList(@RequestParam(value = "page", required = false) Integer page, ModelAndView mv) {
		
		int currentPage = 1;
		int boardLimit = 10;
		
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = bService.getEListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		ArrayList<EventBoard> list = bService.getEBoardList(pi);
		
		
		if(list !=null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("eventList");
		} else {
			throw new AdminException("이벤트 게시판 관리 목록 조회에 실패하였습니다.");
		}
		return mv;
	}
	// 이벤트작성뷰로 이동
	@RequestMapping("einsertView.ad")
	public String eBoardInsertForm() {
		return "eBoardInsertForm";
	}
	
	//이벤트 게시판 게시글 작성
	@RequestMapping("einsert.ad")
	public String insertEBoard(@RequestParam("category") Integer category, @ModelAttribute EventBoard b, @RequestParam("file[]")  ArrayList<MultipartFile> uploadFiles, 
			HttpServletRequest request, HttpSession session) {
		System.out.println(category);
		System.out.println(b);
		System.out.println(uploadFiles);
		System.out.println(uploadFiles.size());
		
		ArrayList<Image> imageList = new ArrayList<>();
		String filePath =null;
		if(uploadFiles !=null && !uploadFiles.isEmpty()) {
			
			ArrayList<String> r2nameFileNames =saveFiles(uploadFiles, request);//변경파일명
			ArrayList<String> originFiles = new ArrayList<String>();//원본파일명
			filePath = request.getSession().getServletContext().getRealPath("resources")+ "\\buploadFiles";
			//원본파일명 집어넣을 for문
			for(int i=0; i<uploadFiles.size(); i++ ) {
				originFiles.add(uploadFiles.get(i).getOriginalFilename());
				//System.out.println("원본파일명"+originFiles);// 원본파일 제대로 뜨나 확인
			}
			// 세션에서 운영자 아이디 받아오기
			String adminId = ((Admin)session.getAttribute("adminUser")).getId();
			b.setAdminId(adminId);//운영자 아이디 집어넣기
			b.setBoardType(2);//이벤트 보드타입 =2
			
			
			for(int i = 0; i<uploadFiles.size(); i++ ) {
				Image img = new Image();
				img.setOriginName(originFiles.get(i));
				img.setChangeName(r2nameFileNames.get(i));
				img.setFilePath(filePath);
				img.setBoardType(2);
				if(i == 0) {
					img.setFileLevel(1);
				}else {
					img.setFileLevel(2);
				}
				imageList.add(img);
			}
			
		}
		int result1 = bService.insertEBoard(b);//이벤트 게시판 글삽입
		int result2 = bService.insertEImgList(imageList);//이벤트 게시판 그림 삽입
		int result3 = bService.insertEcategory(category);//이벤트 게시판 카테고리 삽입
		
		if( result1 + result2 + result3 >3) {
			return "redirect:eventlist.ad";
		} else {
			for(int i = 0; i < imageList.size(); i++) {
				File failFile = new File(filePath + "/" + imageList.get(i).getChangeName());
				failFile.delete();
			}
			
			throw new AdminException("이벤트 등록에 실패하였습니다.");
		}
		
		
	}
	
	public ArrayList<String> saveFiles(ArrayList<MultipartFile> files, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		//System.out.println(root);
		String savePath = root + "\\buploadFiles";
		
		//폴더생성
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		//이름바꿔서 파일넣어주기
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmssSSS");
		
		ArrayList<String> r2nameFileNames = new ArrayList<String>();
		for(int i = 0; i < files.size(); i++) {
			//파일 원래이름 가져오기
			String originFileName = files.get(i).getOriginalFilename();
			//파일이름 바꿔주기
			String renameFileName = sdf.format(new Date(System.currentTimeMillis())) +originFileName;
			
			//System.out.println(originFileName);
			//System.out.println(renameFileName);
			
			//새로만든 이름으로 저장소에 저장
			String renamePath = folder + "\\" + renameFileName;
			  
			  try {
				files.get(i).transferTo(new File(renamePath));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} 
			
			r2nameFileNames.add(renameFileName);
			System.out.println(r2nameFileNames.toString());
			
			
		}
		return r2nameFileNames;
	}
	
	//이벤트 게시판 상세보기 
	@RequestMapping("edetail.ad")
	public ModelAndView eBoardDetail(@RequestParam("eNo") int eNo, @RequestParam(value = "page", required = false) int page, ModelAndView mv) {
		EventBoard board = bService.selectEBoard(eNo);
		ArrayList<Image> imageList = bService.selectEFiles(eNo);
		
		if(board !=null) {
			mv.addObject("board", board).addObject("imageList", imageList).addObject("page", page).setViewName("eBoardDetailView");
		} else {
			throw new BoardException("이벤트 게시글 상세보기에 실패하였습니다.");
		}
		return mv;
	}
	
	//이벤트 게시판 수정뷰로 이동
	@RequestMapping("eViewup.ad")
	public String eBoardUpdateForm(@ModelAttribute EventBoard b, @RequestParam(value = "page", required = false) int page, @RequestParam("boardNo") int eNo, Model model) {
		System.out.println(b);
		System.out.println(page);
		System.out.println(eNo);
		EventBoard board = bService.selectEBoard(eNo);
		ArrayList<Image> imageList = bService.selectEFiles(eNo);
		model.addAttribute("board", board).addAttribute("page", page).addAttribute("imageList", imageList);
		return "eBoardUpdateForm";
		
	}
	
	//이벤트 게시판 수정하기
	@RequestMapping("eupdate.ad")
	public String updateEBoard(@ModelAttribute EventBoard b, @RequestParam("page" )int page, @RequestParam(value = "reloadFile", required = false)ArrayList<MultipartFile> reloadFile, 
							@RequestParam("category") Integer category, HttpServletRequest request, @RequestParam("changeName") 
							ArrayList<String> changeName, @RequestParam("originName") ArrayList<String> originName, HttpSession session, Model model) {
		// 세션에서 운영자 아이디 받아오기
		String adminId = ((Admin)session.getAttribute("adminUser")).getId();
		b.setAdminId(adminId);
		
		ArrayList<Image> imageList = new ArrayList<>();
		String filePath = null;
		System.out.println(reloadFile);
		if(reloadFile != null && !reloadFile.isEmpty() && !reloadFile.get(0).getOriginalFilename().isEmpty()) {
			System.out.println("오리지날파일네임"+reloadFile.get(0).getOriginalFilename());
			System.out.println("체인지"+changeName);
			if(!changeName.isEmpty()) {
			deleteFile(changeName, request);//기존 업로드파일 삭제	
			}
			
			ArrayList<String> r2nameFileNames =saveFiles(reloadFile, request);
			ArrayList<String> originFiles = new ArrayList<String>();//원본파일명
			filePath = request.getSession().getServletContext().getRealPath("resources")+ "\\buploadFiles";
			//원본파일명 집어넣을 for문
			for(int i=0; i<reloadFile.size(); i++ ) {
				originFiles.add(reloadFile.get(i).getOriginalFilename());
			
			}
			for(int i = 0; i<reloadFile.size(); i++ ) {
				Image img = new Image();
				img.setOriginName(originFiles.get(i));
				img.setChangeName(r2nameFileNames.get(i));
				img.setFilePath(filePath);
				img.setBoardType(2);
				img.setIdentifyNo(b.getBoardNo());
				if(i == 0) {
					img.setFileLevel(1);
				}else {
					img.setFileLevel(2);
				}
				imageList.add(img);
			}
		}else {
			filePath = request.getSession().getServletContext().getRealPath("resources")+ "\\buploadFiles";
			for(int i = 0; i <originName.size(); i++) {
				Image img = new Image();
				img.setOriginName(originName.get(i));
				img.setChangeName(changeName.get(i));
				img.setFilePath(filePath);
				img.setBoardType(2);
				img.setIdentifyNo(b.getBoardNo());
				if(i == 0) {
					img.setFileLevel(1);
				}else {
					img.setFileLevel(2);
				}
				//System.out.println("elseOriginName" + originName.get(i));
				imageList.add(img);
			}
			
		}
		System.out.println(originName);
		System.out.println(imageList);
		int result1 = bService.updateEBoard(b);
		int result2 = bService.deleteEOriginImage(b);
		int result3 = bService.reuploadEImage(imageList);
		
		if( result1 + result2 + result3 >3) {
			model.addAttribute("eNo", b.getBoardNo());
			model.addAttribute("page", page);
			return "redirect:eventlist.ad";
		}else {
			throw new AdminException("이벤트 게시판 수정에 실패하였습니다.");
		}
		
	}
	
	public void deleteFile(ArrayList<String>fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "/buploadFiles";
//		System.out.println(savePath);
		
		for(int i=0; i< fileName.size(); i++) {
			File f = new File(savePath + "/" + fileName.get(i));
			
			if(f.exists()) {
				f.delete();
			}
		}
	}
	
	
	//이벤트 게시판 삭제 (Status=N 파일삭제는 안함 )
	@RequestMapping("edelete.ad")
	public String eDeleteBoard(@RequestParam("boardNo") int eno) {
		
		//System.out.println(eno);
		int result = bService.eDeleteBoard(eno);
		
		if(result>0) {
			return "redirect:eventlist.ad";
		}else {
			throw new AdminException("이벤트게시판 삭제에 실패하였습니다.");
		}
		
	}
	

	//이용준 관리자페이지 리뷰 리스트
	@RequestMapping("reviewList.ad")
		public ModelAndView reviewList(@RequestParam(value = "page", required=false) Integer page, ModelAndView mv,
										@RequestParam(value="value", required=false) String value) {
		
		int currentPage = 1;
		int boardLimit = 10;
		
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = bService.reviewCount(null);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		
		ArrayList<Review> reviewList = aService.reviewList(pi, value);
		
		ArrayList<ReviewImage> reviewImageList = aService.reviewImageList();
		
//		String loginUser = (String)session.getAttribute("loginUser.email");
		
//		UserLike li = new UserLike();
//		li.setEmailId(loginUser);
//		li.setReviewNo(reviewNo);
		
//		int count = bService.likeCount(li);
		
		
		if(reviewList != null && reviewImageList != null) {
			mv.addObject("reviewList", reviewList);
			mv.addObject("pi", pi); 
			mv.addObject("value", value); 
			mv.addObject("reviewImageList", reviewImageList);
//			mv.addObject(count);
			mv.setViewName("adminReviewList");
		} else {
			throw new AdminException("관리자페이지 리뷰 조회에 실패하였습니다");
		}
	
		return mv;
		}


	//신고된 리뷰 리스트 뷰 이동
	@RequestMapping("reportedReview.ad")
	public ModelAndView reportedList(@RequestParam(value = "page", required=false) Integer page, ModelAndView mv,
									@RequestParam(value="value", required=false) String value,
									@RequestParam(value="reportNo", required=false) Integer reportNo,
									@RequestParam(value="reportType", required=false) Integer reportType
			) {

		int currentPage = 1; 
		int boardLimit = 10;

		if (page != null) { 
			currentPage = page;
		}
		int listCount = aService.getListCount(reportNo);
		
		int reportCount = aService.reportCount();
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("value", value);
		map.put("reportNo", reportNo);
		map.put("reportType", reportType);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount,boardLimit);
		
		ArrayList<Report> reportList = aService.getReportList(pi, map);
		
		if(reportList != null) {
			mv.addObject("reportList", reportList);
			mv.addObject("pi", pi); 
			mv.addObject("map", map); 
			mv.addObject("reportCount", reportCount);
			mv.setViewName("reportedList");
			System.out.println("pi:"+pi);
			System.out.println("page : " + page);
		} else {
			throw new AdminException("신고된 리뷰 리스트 조회에 실패하였습니다.");
		}
		
		return mv;
	}
	
	//신고된 리뷰 확인
	@RequestMapping("reportConfirm.ad")

	public String reportConfirm(@RequestParam("reportNo") int reportNo, @RequestParam(value = "page", required=false) Integer page,

								Report rp, Model model) {
		
		System.out.println(reportNo);
		if(reportNo != 0) {
			rp.setReportNo(reportNo);
		}
		
		int result = aService.reportConfirm(rp);
		if(result > 0) {
			return "redirect:reportedReview.ad";
		}	else {
			throw new AdminException("신고 확인에 실패하였습니다..");
		}
	}
	
	@RequestMapping(value="deleteReview.ad", method=RequestMethod.GET)
	public String deleteReview(@RequestParam("reviewNo") int reviewNo, @RequestParam(value = "page", required=false) Integer page,
								 Review reviewList) {
			
		System.out.println("리뷰 삭제 reviewNo : " + reviewNo);		
		if(reviewNo != 0) {
			reviewList.setReviewNo(reviewNo);
		}
		System.out.println("리뷰 삭제 reviewList : " + reviewList);		
		
		int result = aService.reviewDelete(reviewList);
		if(result > 0) {
			return "redirect:reportedReview.ad";
		} else {
			throw new AdminException("리뷰 삭제에 실패하였습니다..");
		}
	}
	//회원 리뷰 리스트에서 삭제
	@RequestMapping(value="reviewDelete.ad", method=RequestMethod.GET)
	public String reviewDelete(@RequestParam("reviewNo") int reviewNo, @RequestParam(value = "page", required=false) Integer page,
								 Review reviewList) {
			
		System.out.println("리뷰 삭제 reviewNo : " + reviewNo);		
		if(reviewNo != 0) {
			reviewList.setReviewNo(reviewNo);
		}
		System.out.println("리뷰 삭제 reviewList : " + reviewList);		
		
		int result = aService.deleteReview(reviewList);
		if(result > 0) {
			return "redirect:reviewList.ad";
		} else {
			throw new AdminException("리뷰 삭제에 실패하였습니다..");
		}
	}
	
	
	
/*********************************** admin notice 조회 ***********************************/
	
	@RequestMapping("adminNoticeList.ad")
	public ModelAndView adminNoticeList(@RequestParam(value = "page", required=false) Integer page, ModelAndView mv) {
		
		int currentPage = 1; 

		if (page != null) { 
			currentPage = page;
		}
		int boardLimit = 5;

		int listCount = bService.getListCount();

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount,boardLimit);

		ArrayList<Board> list = bService.getBoardList(pi);

		if (list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("adminNoticeList");
		} else {
			throw new BoardException("공지사항 조회에 실패했습니다");
		}
		return mv;
		
	}
	
/***********************************  admin notice : 상세보기 **************************************************/

	@RequestMapping("adminNoticeDetail.ad")
	public ModelAndView adminNoticeDetail(@ModelAttribute Board b, HttpSession session,
			/* @RequestParam(value="boardId", required=false) int boardId, */
										  @RequestParam("page") int page, ModelAndView mv) {

//		public String adminNoticeWriteView(@ModelAttribute Board b, Model model, HttpSession session) {
//		
//		String adId = ((Admin)session.getAttribute("adminUser")).getId();
//		b.setAdminId(adId);
//		model.addAttribute("b",b);
//		return "adminNoticeWriteView";

		String adId = ((Admin)session.getAttribute("adminUser")).getId();
		b.setAdminId(adId);
		System.out.println("ad상세_b"+b);
		
		Board board = bService.selectBoard(b);
//		System.out.println("ad상세_boardId="+boardId);
//		Board board = bService.selectBoard(boardId);
		

//		System.out.println("ad상세_board="+board);
		
		if (board != null) {
			mv.addObject("board", board).addObject("page", page).setViewName("adminNoticeDetailView");
		} else {
			throw new BoardException("게시글 상세보기에 실패하였습니다.");
		}
		return mv;
	}
	
	


/**********************************  admin notice : 쓰기  *************************************/	

	@RequestMapping("adminNoticeWriteView.ad")
	public String adminNoticeWriteView(@ModelAttribute Board b, Model model, HttpSession session) {
		
		String adId = ((Admin)session.getAttribute("adminUser")).getId();
		b.setAdminId(adId);
		model.addAttribute("b",b);

		return "adminNoticeWriteView";
	}
	@RequestMapping("adminNoticeWriteForm.ad")
	public String insertNotice(@ModelAttribute Board b) {
		
		int result = bService.insertNotice(b);

		if (result > 0) {
			return "redirect:adminNoticeList.ad"; 
		} else {
			throw new BoardException("공지사항 등록에 실패하였습니다.");
		}
	}

	
/**********************************  admin notice : 수정  *************************************/	

	@RequestMapping(value="adminNoticeUpdateForm.ad", method=RequestMethod.POST)
	public String adminNoticeUpdateForm(@RequestParam("boardId") int boardId, Model model) {  // qnaNo 하나만 받아옴
		
		System.out.println("ad수정뷰_boardId="+boardId);
		
		Board b = new Board();
		b.setBoardId(boardId);
		System.out.println("ad수정뷰_b="+b);
		
		Board board = bService.adminNoticeSelect(b); // select one
		System.out.println("ad수정뷰_board="+board);

		model.addAttribute("b", board);
		
		return "adminNoticeUpdateForm";
	}
	
	@RequestMapping(value="adminNoticeUpdate.ad", method = RequestMethod.POST) 
	public String adminNoticeUpdate(@ModelAttribute Board b/* , @RequestParam("boardId") int boardId */) { 
									 
		// 수정할 해당 게시판 번호(식별자 역할) 필요
		// 위의 updateForm에서 boardId 받아와서 board b에 넣어줘서 board b안에 있으니 따로 받아올 필요 x
		/* b.setBoardId(boardId); */
		
		int result = bService.updateNotice(b); 

		if(result > 0) {
			return "redirect:adminNoticeList.ad";
			
		} else {
			throw new BoardException("공지사항 수정에 실패하였습니다.");
		}
	}
	
	
	
/**********************************  admin notice : 삭제  *************************************/	
	// Notice 삭제
	@RequestMapping(value="adminNoticeDelete.ad", method=RequestMethod.GET)
	public String deleteNotice(@ModelAttribute Board b, @RequestParam("boardId") int boardId)  {  

		int result = bService.deleteNotice(b);
		System.out.println("ad삭제b="+b);
		System.out.println("ad삭제result="+result);
		
		if(result > 0) {
			return "redirect:adminNoticeList.ad";	
		}else {
			throw new BoardException("공지사항 삭제에 실패하였습니다.");
		}
	}
	
	

/****************************************** admin QnA : 조회  ********************************************/
	// QnA : 조회 
	@RequestMapping("adminQnaList.ad")
	public ModelAndView qnaList(@ModelAttribute BoardQnA b, @RequestParam(value = "page", required = false) Integer page, 
												ModelAndView mv) {
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}
		int boardLimit = 5;
		
		// 페이징처리1 :총게시물수 가져오기
		int listCount = bService.getQnaListCount();
		System.out.println(listCount);
		// 페이징처리2 : 필요한 게시판 가져오기 		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount,boardLimit);

		ArrayList<BoardQnA> list = bService.getBoardQnaListAdmin(pi);
		System.out.println("adQnA조회_pi=" + pi);
		System.out.println("adQnA조회_list=" + list); // 항상 디버깅 찍어보기
		ArrayList<Reply> replyList = bService.getQnaReplyListAdmin();
		System.out.println("replyList="+replyList);
		
		if (list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.addObject("replyList", replyList);
			mv.setViewName("adminQnaList");
		} else {
			throw new BoardException("문의사항 전체 조회에 실패했습니다");
		}
		return mv;
	}

/********************************************** admin QnA : 쓰기  *******************************************************/

//	// QnA : 쓰기
//	@RequestMapping("adminQnaAnsView.ad")
//	public String boardQnaWriteForm() {
//		return "adminQnaAnsView";
//	}
	
	@RequestMapping("adminQnaAnsWrite.ad")

	public String adminQnaAnsWrite(@ModelAttribute Reply reply, HttpSession session, @RequestParam("lastFor") int lastFor) {

		// 보낼꺼 : adminId, refQnaNo,  replyContent
		// adminId는 아래 세션 어드민에서 받아옴. replyContent는 textarea에서 보내고 refQnaNo는 인풋히든에서 보냄
		String id = ((Admin)session.getAttribute("adminUser")).getId(); // session영역에서 로그인 중인 유저의 id정보를 얻어서 vo Member타입으로 형변환
		reply.setAdminId(id); // adminId 

		System.out.println();
		System.out.println("controller reply : " + reply);
		System.out.println("lastFor="+lastFor);
		
		String replyContent = reply.getReplyContent();
		for(int i = 0; i < lastFor; i++) {
			int index = replyContent.lastIndexOf(",");
			replyContent = replyContent.substring(0, index);
		}
		System.out.println(replyContent);
		reply.setReplyContent(replyContent);
		
//		System.out.println("admin답변 쓰기_reply="+reply);
		int result = bService.adminQnaAnsWrite(reply);
//		System.out.println("admin답변 쓰기_result="+result);

 
		if (result > 0) {
			return "redirect:adminQnaList.ad";
		} else {
			throw new BoardException("문의사항 등록에 실패하였습니다.");
		}
	}
	
//	@RequestMapping("adminQnaAnsWrite.ad")
////	@ResponseBody
//	public String addReply(@ModelAttribute Reply r, HttpSession session) {
//			// 누가 썼는지 알아야하기 때문에 모델어트리뷰트나 HttpSession을 통해서 가져올 수 있음
//		String id = ((Admin)session.getAttribute("adminUser")).getId(); // session영역에서 로그인 중인 유저의 id정보를 얻어서 vo Member타입으로 형변환
//		r.set(id);
//		
//		int result = bService.insertReply(r);
//		
//		if(result > 0) {
//			return "success";	// "success"를 str으로 넘기고 있기에 view이름이 아니라는걸 알려주기 위하여 @ResponseBody 어노테이션 필요
//		}else {
//			throw new BoardException("댓글 등록에 실패하였습니다.");
//		}
//	}
//	@RequestMapping("adminQnaAnsWrite.ad")
////@ResponseBody
//public String addReply(@ModelAttribute Reply r, HttpSession session) {
//		// 누가 썼는지 알아야하기 때문에 모델어트리뷰트나 HttpSession을 통해서 가져올 수 있음
//	String id = ((Admin)session.getAttribute("adminUser")).getId(); // session영역에서 로그인 중인 유저의 id정보를 얻어서 vo Member타입으로 형변환
//	r.set(id);
//	
//	int result = bService.insertReply(r);
//	
//	if(result > 0) {
//		return "success";	// "success"를 str으로 넘기고 있기에 view이름이 아니라는걸 알려주기 위하여 @ResponseBody 어노테이션 필요
//	}else {
//		throw new BoardException("댓글 등록에 실패하였습니다.");
//	}
//}
	
/********************************************** admin QnA : 수정  *******************************************************/
	

	@RequestMapping("adminQnaAnsUpdateView.ad")
	public ModelAndView adminQnaAnsUpdate(@ModelAttribute Reply r, ModelAndView mv){
//	public String boardUpdateForm(@RequestParam("qnaNo") int qnaNo, Model model) {
								
		System.out.println("admin 수정 뷰_r="+r); // replyNo가 나와야함
		Reply reply = bService.adminQnaAnsSelect(r);
//		model.addAttribute("replyNo", reply);
//		return "adminQnaAnsUpdateForm";
		
		if (reply != null) {
			mv.addObject("Reply",r);
			mv.setViewName("adminQnaList");
		} else {
			throw new BoardException("공지사항 조회에 실패했습니다");
		}
		return mv;
		
//		ArrayList<Board> list = bService.getBoardList(pi);
//
//		if (list != null) {
//			mv.addObject("list", list);
//			mv.addObject("pi", pi);
//			mv.setViewName("adminNoticeList");
//		} else {
//			throw new BoardException("공지사항 조회에 실패했습니다");
//		}
//		return mv;
	}
	
	@RequestMapping("adminQnaAnsUpdateForm.ad") 
	public String adminQnaAnsUpdate(@RequestParam("replyNo") int replyNo) {

		System.out.println("admin 수정_replyNo="+replyNo);
		int result = bService.adminQnaAnsUpdate(replyNo); 
		System.out.println("admin 수정_result="+result);
		
		if(result > 0) {
			return "redirect:adminQnaList.ad";
		} else {
			throw new BoardException("답변 수정에 실패하였습니다.");
		}
	}
	
	
/********************************************** admin QnA : 삭제  *******************************************************/
	

	@RequestMapping("adminQnaAnsDelete.ad")
	public String adminQnaAnsDelete(@RequestParam("replyNo") int replyNo) {
  
		System.out.println("admin 삭제_replyNo="+replyNo);
		
		int result = bService.adminQnaAnsDelete(replyNo);
		System.out.println("admin 삭제_result="+result);
		
		if(result > 0) {
			return "redirect:adminQnaList.ad";
		}else {
			throw new BoardException("답변 삭제에 실패하였습니다.");
		}
	}
		
	

	
	
	/*********************************** 주문 관리  ***********************************/		
	// 주문 관리 페이지
	@RequestMapping("orderAdminList.ad")
	public ModelAndView orderAdminList(@RequestParam(value="page", required=false) Integer page, 
			 HttpSession session, ModelAndView mv) {
//		// 1. 관리자 여부 확인 -> 나중에 TP로 완성하기
//		Admin admin = (Admin)session.getAttribute("admin");
//		if(admin != null) {
//		
//		} else {
//			throw new BoardException()
//		}
		
		// 2. 페이징	
		// 2.1 주문 정보 리스트 숫자 구하기
		int listCount = oService.getOrderListCount();
		
		// 2.2 현재 페이지 구하기
		int currentPage=1;
		if(page != null) {
			currentPage = page;
		}
		
		// 2.3 한 페이지에 들어갈 게시물 수
		int boardLimit = 10;
		
		// 2.4 페이징 계산		
		PageInfo pi = new Pagination().getPageInfo(currentPage, listCount, boardLimit);
		
		// 3. 주문 정보 가져오기
		// 3.1 특정 페이지의 주문 정보 가져오기 
		ArrayList<OrderStatus> orderAdminList = oService.getAdminOrderList(pi);
		
		// 3.2 전체 주문 목록가져오기(for 현황박스)
		ArrayList<OrderStatus> orderCountList = oService.getOrderAdminList();
		
		// 4. mv에 담아 이동
		if(orderAdminList != null) {
			mv.addObject("orderAdminList", orderAdminList);
			mv.addObject("orderCountList", orderCountList);
			mv.addObject("pi", pi);
			mv.setViewName("orderAdminList");
		} else {
			throw new BoardException("주문 관리 조회에 실패했습니다.");
		}
		return mv;		
	}

//	// 주문 관리 - 주문 목록
//	@RequestMapping("categoryList.ad")
//	public ModelAndView getCategoryList(@RequestParam(value="page", required=false) Integer page, 
//			 HttpSession session, ModelAndView mv, @RequestParam(value="orderStatusName", required=false) String orderStatusNam) {
////		// 1. 관리자 여부 확인 -> 나중에 TP로 완성하기
//		
//		// 2. 페이징	
//		// 2.1 주문 정보 리스트 숫자 구하기
//		String orderStatusName = "주문";
//		if(orderStatusNam !=null) {
//			orderStatusName = orderStatusNam;
//		}
//		int listCount = oService.getCategoryListCount(orderStatusName);
//		
//		// 2.2 현재 페이지 구하기
//		int currentPage=1;
//		if(page != null) {
//			currentPage = page;
//		}
//		
//		// 2.3 한 페이지에 들어갈 게시물 수
//		int boardLimit = 10;
//		
//		// 2.4 페이징 계산		
//		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);		
//		
//		// 3. 주문(ordered) 목록 가져오기
//		ArrayList<OrderDetail> categoryList = oService.getCategoryList(pi, orderStatusName);
//		System.out.println("ordered : " + categoryList);
//		
//		// 4. 이동	
//		mv.addObject("categoryList", categoryList);
//		mv.addObject("pi", pi);
//		mv.setViewName("categoryList");
//		return mv;
//	}	

	// 주문 관리 - 주문 목록
	@RequestMapping("categoryList.ad")
	public ModelAndView orderCategoryList(@RequestParam(value="page", required=false) Integer page, 
			 HttpSession session, ModelAndView mv, @RequestParam(value="orderStatusNam", required=false) String orderStatusNam) {
//		// 1. 관리자 여부 확인 -> 나중에 TP로 완성하기
		
		// 2. 페이징	
		// 2.1 주문 정보 리스트 숫자 구하기
		String orderStatusName = "주문";
		if(orderStatusNam !=null) {
			orderStatusName = orderStatusNam;
		}
		System.out.println("orderStatusName : " + orderStatusName);
		int listCount = oService.getCategoryListCount(orderStatusName);
		
		// 2.2 현재 페이지 구하기
		int currentPage=1;
		if(page != null) {
			currentPage = page;
		}
		
		// 2.3 한 페이지에 들어갈 게시물 수
		int boardLimit = 10;
		
		// 2.4 페이징 계산		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);		
		
		// 3. category에 해당하는 주문(ordered) 목록 가져오기
		ArrayList<OrderDetail> categoryList = oService.getCategoryList(pi, orderStatusName);
//		System.out.println("ordered : " + categoryList);
		
		// 3.1 전체 주문 목록가져오기(for 현황박스)
		ArrayList<OrderStatus> orderCountList = oService.getOrderAdminList();
		
		// 4. 이동	
		mv.addObject("categoryList", categoryList);
		mv.addObject("pi", pi);
		mv.addObject("orderCountList", orderCountList);
		mv.setViewName("categoryList");
		return mv;
	}	
	
	
	// 주문 관리 - 주문 상태 변경
	@RequestMapping("changeOrderStatus.ad")
	public void changeOrderStatus(@ModelAttribute OrderStatus os, HttpServletResponse response) {
		System.out.println("os : " + os);
		
		int result = oService.changeOrderStatus(os);
		
		
		if(result<1) {
			throw new BoardException("주문 상태 변경에 실패했습니다.");
		}
		
		try {
			new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(result, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	

	

}













