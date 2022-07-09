package com.fpj.trendeater.board.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fpj.trendeater.admin.controller.AdminController;
import com.fpj.trendeater.admin.model.service.AdminService;
import com.fpj.trendeater.admin.model.vo.Image;
import com.fpj.trendeater.admin.model.vo.Product;
import com.fpj.trendeater.board.model.exception.BoardException;
import com.fpj.trendeater.board.model.service.BoardService;
import com.fpj.trendeater.board.model.vo.PageInfo;
import com.fpj.trendeater.board.model.vo.Report;
import com.fpj.trendeater.board.model.vo.Review;
import com.fpj.trendeater.board.model.vo.ReviewImage;
import com.fpj.trendeater.board.model.vo.UserLike;
import com.fpj.trendeater.common.ReviewPagination;
import com.fpj.trendeater.member.model.vo.Member;
import com.google.gson.Gson;

@Controller
public class BoardController {

	@Autowired
	private BoardService bService;

	@Autowired
	private AdminService aService;

	@Autowired
	private AdminController aController;

	
	//상품 리스트
	@RequestMapping("prBoardList.bo")
	public ModelAndView prBoardList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
	
		ModelAndView boardMv = aController.productList(page, mv);
		
		boardMv.setViewName("prBoardList");

		return boardMv;
	}
	//상품상세보기
	@RequestMapping("prbdetail.bo")
	public ModelAndView prbBoardDetail(@RequestParam(value = "pno") int pno, 
									   @RequestParam(value = "page", required = false) Integer page,
									   ModelAndView mv) {

		System.out.println(pno);
		Product p = bService.selectPrBoard(pno);

//		System.out.println(p);
		ArrayList<Image> imgList = bService.selectPrImage(pno);

		if (p != null && imgList != null) {
			mv.addObject("p", p);
			mv.addObject("imgList", imgList);
			if(page != null) {
				mv.addObject("page", page);
			}
			mv.setViewName("prBoardDetail");

		} else {
			throw new BoardException("게시글을 불러오는데 실패하였습니다.");
		}

		return mv;
	}
	
	// 시식신청 게시판 리스트
	@RequestMapping("applyTaste.bo")
	public ModelAndView applyTasteBoardList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		
		ModelAndView applyMv = aController.applyTasteList(page, mv);
		
		ArrayList<Image> imgList = aService.getProductImgList();
		
		applyMv.addObject("imgList", imgList);
		applyMv.setViewName("applyTasteBoardList");
		
		return applyMv;
	}

	// test test2
	// test3 test4 test5
	// test3
	
	//이용준@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	@RequestMapping("rlist.bo")
	public ModelAndView reviewList(@RequestParam(value = "page", required=false) Integer page, ModelAndView mv, UserLike like, HttpSession session) {
		
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;			
		}
		
		int listCount = bService.reviewCount();
		
		PageInfo pi = ReviewPagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Review> reviewList = bService.getReviewList(pi);
		
		ArrayList<ReviewImage> reviewImageList = bService.getReviewImageList();
		
		String loginUser = (String)session.getAttribute("loginUser.email");
		
		UserLike li = new UserLike();
		li.setEmailId(loginUser);
//		li.setReviewNo(reviewNo);
		
		int count = bService.likeCount(li);
		
		
		if(reviewList != null && reviewImageList != null) {
			mv.addObject("reviewList", reviewList);
			mv.addObject("pi", pi); 
			mv.addObject("reviewImageList", reviewImageList);
			mv.addObject(count);
			mv.setViewName("reviewListView");
		} else {
			throw new BoardException("리뷰 전체 조회에 실패하였습니다");
		}
	
		return mv;
	}
	
	@RequestMapping("rinsertView.bo")
	public String reviewInsertForm() {
		return "reviewInsertForm";
	}
	

	@RequestMapping("rinsert.bo")
	public String insertReview(@ModelAttribute Review r,@ModelAttribute ReviewImage rImg, @RequestParam("uploadFile") ArrayList<MultipartFile> uploadFile,
			HttpServletRequest request)  {
		
		ArrayList<ReviewImage> imageList = new ArrayList<ReviewImage>();
		String savePath = null;
		ReviewImage reviewImage = new ReviewImage();
		if(uploadFile != null && !uploadFile.isEmpty()) {

			ArrayList<String> r2nameFileNames =saveFile(uploadFile, request);//변경파일명
	         ArrayList<String> originFiles = new ArrayList<String>();//원본파일명
	         
	         savePath = request.getSession().getServletContext().getRealPath("resources")+ "\\reviewImages";
	         //원본파일명 집어넣을 for문
	         for(int i=0; i<uploadFile.size(); i++ ) {
	            originFiles.add(uploadFile.get(i).getOriginalFilename());
	            //System.out.println("원본파일명"+originFiles);// 원본파일 제대로 뜨나 확인
	         }
	         
	         
	         for(int i = 0; i<uploadFile.size(); i++ ) {
	            rImg.setOriginName(originFiles.get(i));
	            rImg.setChangeName(r2nameFileNames.get(i));
	            rImg.setFilePath(savePath);
	           
	            imageList.add(rImg);
	         }
	         
	      }
	      int result1 = bService.insertReview(r);
	      int result2 = bService.insertReviewImage(imageList);
	      System.out.println("insert con : " + r + "++ imageList/" + imageList);
	      if( result1 + result2 > 1) {
	         return "redirect:rlist.bo";
	      } else {
	         for(int i = 0; i < imageList.size(); i++) {
	            File failFile = new File(savePath + "/" + imageList.get(i).getChangeName());
	            failFile.delete();
	         }
	         
	         throw new BoardException("리뷰 등록에 실패하였습니다.");
	      }

	}

	private ArrayList<String> saveFile(ArrayList<MultipartFile> file, HttpServletRequest request) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root +"/reviewImages";
		
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		// 랜덤번호 생성
		int ranNum=(int)(Math.random()*1000000);
		// 날짜 + 시간정보 저장
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		ArrayList<String> r2nameFileNames = new ArrayList<String>();
		for(int i = 0; i < file.size(); i++) {
		String originName = file.get(i).getOriginalFilename();
		
		String ext = null;
		
		int dot = originName.lastIndexOf(".");
		if(dot == -1) {
			ext = "";
		} else {
			ext = originName.substring(dot);
		}
		
		// 날짜 + 시간 + 랜덤번호 + 확장자로 파일명 생성
		String changeName = sdf.format(new Date(System.currentTimeMillis())) + ranNum + ext;
		
		String renamePath = folder + "/" + changeName;
		
		
		try {
			file.get(i).transferTo(new File(renamePath));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		r2nameFileNames.add(changeName);
		}
		System.out.println(r2nameFileNames);
		return r2nameFileNames;
	}
	
	
	//리뷰 신고하기
		@RequestMapping("reportReview.bo")
		@ResponseBody
		public String reportReview(@ModelAttribute Report rep, HttpSession session) {
			
			
			String id = ((Member)session.getAttribute("loginUser")).getEmail();

			rep.setEmailId(id);
			
			int result = bService.reportReview(rep);
			
			String repReview = Integer.toString(result);
		
			System.out.println("report : " + rep);
			if(result > 0) {
				return "success";
			} else {
				throw new BoardException("댓글 등록에 실패하였습니다.");
			}
				
		}
		// 좋아요 
		// 게시판 좋아요
		@ResponseBody
		@RequestMapping("likeInsert.bo")
		public String insertLike(UserLike like, HttpSession session, Model model) {
			
			int result = bService.insertLike(like);
			if(result>0) {
				return "success";
			}else {
				return "fail";
			}
			
		}
		
		// 게시판 좋아요 취소
		@ResponseBody
		@RequestMapping("likeDelete.bo")
		public String deleteLike(UserLike like, HttpSession session, Model model) {
			int result = bService.deleteLike(like);
			if(result>0) {
				return "success";
			}else {
				return "fail";
			}
			
		}
		
		// 게시판 전체 좋아요
		@ResponseBody
		@RequestMapping(value="allLike.bo", produces="application/json; charset=utf-8")
		public String selectLikeCount(int reviewNo, HttpSession session, Model model) {
			
			ArrayList<UserLike> list = bService.selectLikeCount(reviewNo);
			return new Gson().toJson(list);
			
		}
		
}
