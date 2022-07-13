package com.fpj.trendeater.board.controller;


import java.io.File;

import java.sql.Date;
import java.text.SimpleDateFormat;

import java.io.IOException;
import java.io.PrintWriter;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fpj.trendeater.admin.controller.AdminController;
import com.fpj.trendeater.admin.model.exception.AdminException;
import com.fpj.trendeater.admin.model.service.AdminService;
import com.fpj.trendeater.admin.model.vo.Admin;
import com.fpj.trendeater.admin.model.vo.Image;
import com.fpj.trendeater.admin.model.vo.PageInfo;
import com.fpj.trendeater.admin.model.vo.Product;
import com.fpj.trendeater.board.model.exception.BoardException;
import com.fpj.trendeater.board.model.service.BoardService;

//import com.fpj.trendeater.board.model.vo.PageInfo;
import com.fpj.trendeater.board.model.vo.Report;
import com.fpj.trendeater.board.model.vo.Review;
import com.fpj.trendeater.board.model.vo.ReviewImage;
import com.fpj.trendeater.board.model.vo.UserLike;
import com.fpj.trendeater.common.ReviewPagination;

import com.google.gson.Gson;

import com.fpj.trendeater.board.model.vo.ApplyTastePerson;
import com.fpj.trendeater.board.model.vo.Board;
import com.fpj.trendeater.board.model.vo.BoardQnA;
import com.fpj.trendeater.board.model.vo.EventBoard;
import com.fpj.trendeater.common.CountReviewPoint;
import com.fpj.trendeater.common.Pagination;
import com.fpj.trendeater.member.model.vo.Member;


@Controller
public class BoardController {

	@Autowired
	private BoardService bService;

	@Autowired
	private AdminService aService;

	@Autowired
	private AdminController aController;

	
	//상품 리스트
	@RequestMapping(value={"prBoardList.bo", "searchProduct.bo"})
	public ModelAndView prBoardList(@RequestParam(value="page", required=false) Integer page,
									@RequestParam(value="value", required=false) String value,
									@RequestParam(value="searchValue", required=false) String searchValue,
									ModelAndView mv, HttpServletRequest request) {
	
		System.out.println(value);
		
		boolean boardCheck = true;
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("boardCheck", boardCheck);
		map.put("value", value);
		
		ModelAndView boardMv = aController.productList(page, mv, value, searchValue, request, map);
		
		boardMv.setViewName("prBoardList");

		return boardMv;
	}
	
	//상품상세보기
	@RequestMapping("prbdetail.bo")
	public ModelAndView prbBoardDetail(@RequestParam(value = "pno") int pno, 
									   @RequestParam(value = "page", required = false) Integer page,
									   HttpServletRequest request,
									   ModelAndView mv) {

		String emailId = null;
		int scrapCheckNum = 0;
		HashMap<String, Object> map = new HashMap<>();
		
			emailId = ((Member)request.getSession().getAttribute("loginUser")).getEmail();
			System.out.println(pno);
			map.put("pno", pno);
			map.put("emailId", emailId);
			
			scrapCheckNum = bService.checkScrap(map);
		
		
		
//		System.out.println(scrapCheckNum);
//		System.out.println(pno);
		Product p = bService.selectPrBoard(map);
		System.out.println(map);
		// review rating 점수별 갯수 구하기
		HashMap<String, Object> countMap = new HashMap<>();
		countMap.put("pno", pno);
		countMap.put("reviewType", "review_rating");
		
		int[] ratingCountArr = bService.getCountReviewPoint(countMap);
		
		// 추천의사 점수별 갯수 구하기
		countMap.put("reviewType", "recommend");
		int[] recommendCountArr = bService.getCountReviewPoint(countMap);
		
		// 재구매 의사 점수별 갯수 구하기
		countMap.put("reviewType", "repurcharse");
		int[] repurcharseCountArr = bService.getCountReviewPoint(countMap);
		
		int[] ratingRatioArr = CountReviewPoint.getCountReviewPoint(ratingCountArr, p.getReviewCount());
		int[] recommendRatioArr = CountReviewPoint.getCountReviewPoint(recommendCountArr, p.getReviewCount());
		int[] repurcharseRatioArr = CountReviewPoint.getCountReviewPoint(repurcharseCountArr, p.getReviewCount());
		
//		System.out.println(p);
		ArrayList<Image> imgList = bService.selectPrImage(pno);
		
		

		if (p != null && imgList != null) {
			mv.addObject("p", p);
			mv.addObject("imgList", imgList);
			mv.addObject("scrapCheckNum", scrapCheckNum);
			mv.addObject("ratingRatioArr", ratingRatioArr);
			mv.addObject("recommendRatioArr", recommendRatioArr);
			mv.addObject("repurcharseRatioArr", repurcharseRatioArr);
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
	@RequestMapping("applyTasteBoard.bo")
	public ModelAndView applyTasteBoardList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		
		boolean boardCheck = true;
		ModelAndView applyMv = aController.applyTasteList(page, null, null, mv, boardCheck);
		ArrayList<Image> imgList = aService.getProductImgList();
		
		applyMv.addObject("imgList", imgList);
		applyMv.setViewName("applyTasteBoardList");
		
		return applyMv;
	}
	
	// 시식 신청 등록
	@RequestMapping("applyTastePerson.bo")
	public String registerApplyTaste(@ModelAttribute ApplyTastePerson applyPerson,
								@RequestParam("address1") String address1,
								@RequestParam("address2") String address2, HttpServletRequest request) {
		System.out.println(applyPerson);
		System.out.println(address1);
		System.out.println(address2);
		
		String emailId = ((Member)request.getSession().getAttribute("loginUser")).getEmail();
		String address = address1 + " " + address2;
		System.out.println(address);
		applyPerson.setAddress(address);
		if(emailId != null) {
			applyPerson.setEmailId(emailId);
		}
		
		int result = bService.registerApplyTaste(applyPerson);
		
		if(result > 0) {
			return "redirect:applyTasteBoard.bo";
		} else {
			throw new BoardException("시식 신청에 실패하였습니다");
		}
		
	}
	
	// 시식신청 중복 체크
	@RequestMapping("dupCheckApply.bo")
	public void dupCheckApply(@RequestParam("tasteNo") int tasteNo, HttpServletRequest request, HttpServletResponse response) {
		
		String emailId = ((Member)request.getSession().getAttribute("loginUser")).getEmail();
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("emailId", emailId);
		map.put("tasteNo", tasteNo);
		
		int result = bService.dupCheckApply(map);
		
		try {
			PrintWriter pw = response.getWriter();
			pw.print(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	// 스크랩
	@RequestMapping("scrap.me")
	public void scrap(@RequestParam("pNo") Integer pno, HttpServletRequest request, HttpServletResponse response) {
		String emailId = ((Member)request.getSession().getAttribute("loginUser")).getEmail();
		
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("pno", pno);
		map.put("emailId", emailId);
		
		int result = bService.scrap(map);
		
		try {
			PrintWriter pw = response.getWriter();
			pw.print(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}



	
/********************************** Notice(공지사항) : 조회 *************************************/

	// Notice 공지사항 조회 + 페이지네이션
	@RequestMapping("noticeList.bo")
	public ModelAndView boardList(@RequestParam(value = "page", required = false) Integer page, ModelAndView mv) {

		int currentPage = 1; 

		if (page != null) { 
			currentPage = page;
		}

		int listCount = bService.getListCount();
		
		int boardLimit = 10;

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);

		ArrayList<Board> list = bService.getBoardList(pi);

		if (list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("boardNoticeList");
		} else {
			throw new BoardException("게시글 전체 조회에 실패했습니다");
		}
		return mv;
	}
	

///********************************** Notice(공지사항) : 쓰기  *************************************/	
//	// Notice 쓰기 by admin 
//	@RequestMapping("noticeWriteView.bo")
//	public String noticeWriteForm() {
//		return "noticeWriteForm";
//	}
//	@RequestMapping("noticeWriteForm.bo")
//	public String insertNotice(@ModelAttribute Board b) {
//
//		int result = bService.insertNotice(b);
// 
//		if (result > 0) {
//			return "redirect:noticeList.bo"; // 관리자 게시판으로 돌아가야함!
//		} else {
//			throw new BoardException("공지사항 등록에 실패하였습니다.");
//		}
//	}
//
//	
///********************************** Notice(공지사항) : 수정  *************************************/	
//	// Notice 수정
//	@RequestMapping(value="noticeUpdate.bo", method=RequestMethod.GET)
//	public String noticeUpdateForm() {
//		return "noticeUpdateForm";
//	}
//	
//	@RequestMapping(value="noticeUpdate.bo", method = RequestMethod.POST) 
//	public String updateNotice(@ModelAttribute Board b, @RequestParam("page") int page,
//									HttpSession session) {  
//		
//		String id = ((Admin)session.getAttribute("loginUser")).getId();
//		b.setAdminId(id);
//		
//		int result = bService.updateNotice(b); 
//
//		if(result > 0) {
//			//model.addAttribute("board", b)...;
//			// 보드 보낼 필요없음. 화면 상세보기 페이지로 가기 때문에 상세보기 페이지로 가는 bdetail.bo 이용하면 됨
//			//return "redirect:bdetail.bo?bId=" + b.getBoardId() + "&page=" + page;
//			
//			// 리다이렉트인데 데이터보존됨
////			model.addAttribute("bId",b.getBoardId());
////			model.addAttribute("page",page);
//			return "redirect:boardQna.bo";
//			
//		} else {
//			throw new BoardException("공지사항 수정에 실패하였습니다.");
//		}
//	}
//	
//	
//	
///********************************** Notice(공지사항) : 삭제  *************************************/	
//	// Notice 삭제
//	@RequestMapping(value="noticeDelete.bo", method=RequestMethod.POST)
//	public String deleteNotice(@ModelAttribute Board b, HttpSession session) {  
//			
//		
//		String id = ((Member)session.getAttribute("loginUser")).getEmail();
//		b.setAdminId(id);
//		
//		int result = bService.deleteNotice(b);
//		
//		if(result > 0) {
//			return "redirect:boardQna.bo";	// 관리자 게시판으로 돌아가야함!
//		}else {
//			throw new BoardException("공지사항 삭제에 실패하였습니다.");
//		}
//	}

	
	
/*********************************** Notice(공지사항) : 상세보기 **************************************************/

	@RequestMapping("noticeDetail.bo")
	public ModelAndView boardDetail(@ModelAttribute Board b, @RequestParam("page") int page, ModelAndView mv) { 
			
//		String adId = ((Admin)session.getAttribute("adminUser")).getId();
//		b.setAdminId(adId);
		
		System.out.println("공지사항 상세보기_page="+page);
		System.out.println("공지사항 상세보기_b="+b);
		Board board = bService.selectBoard(b);
		
		System.out.println("공지사항 상세보기_board="+board);
		
		if (board != null) {
			mv.addObject("board", board).addObject("page", page).setViewName("boardDetailView");
		} else {
			throw new BoardException("게시글 상세보기에 실패하였습니다.");
		}
		return mv;
	}

	
	

/********************************************** QnA : 조회  *******************************************************/
	// QnA : 조회 
	@RequestMapping("boardQna.bo")
	public ModelAndView qnaList(@ModelAttribute BoardQnA b, @RequestParam(value = "page", required = false) Integer page, 
												ModelAndView mv, HttpSession session) {

		String id = ((Member)session.getAttribute("loginUser")).getEmail();
		b.setEmailId(id);
		
		System.out.println("QnA조회_b="+b);
		
		int currentPage = 1;

		if (page != null) {
			currentPage = page;
		}

		// 페이징처리1 :총게시물수 가져오기
		int listCount = bService.getQnaListCount();
		// 페이징처리2 : 필요한 게시판 가져오기
		int boardLimit = 10;
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);

		ArrayList<BoardQnA> list = bService.getBoardQnaList(pi, b);
		System.out.println("pi=" + pi);
		System.out.println("list=" + list); // 항상 디버깅 찍어보기

		if (list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("boardQna");
		} else {
			throw new BoardException("문의사항 전체 조회에 실패했습니다");
		}
		return mv;
	}

/********************************************** QnA : 쓰기  *******************************************************/

	// QnA : 쓰기
	@RequestMapping("boardQnaWriteView.bo")
	public String boardQnaWriteForm() {
		return "boardQnaWriteForm";
	}
	
	@RequestMapping("boardQnaWriteForm.bo")
	public String insertBoardQna(@ModelAttribute BoardQnA b, HttpSession session) {

		String id = ((Member)session.getAttribute("loginUser")).getEmail();
		b.setEmailId(id);
		
		System.out.println("qna쓰기_b="+b);
		int result = bService.insertBoardQna(b);
 
		if (result > 0) {
			return "redirect:boardQna.bo";
		} else {
			throw new BoardException("문의사항 등록에 실패하였습니다.");
		}
	}
	
//	System.out.println("qna쓰기_b="+b);
//	System.out.println("qna쓰기_result="+result);
/********************************************** QnA : 수정  *******************************************************/
	
	// QnA : 수정
	@RequestMapping("boardQnaUpdateView.bo")
	public String boardUpdateForm(@RequestParam("qnaNo") int qnaNo,  // qnaNo 하나만 받아옴
																Model model) {
		BoardQnA b = new BoardQnA();
		b.setQnaNo(qnaNo);
		BoardQnA qna = bService.selectBoardQna(b); // select one
		
//		System.out.println("qna="+qna);
		model.addAttribute("qna", qna);
		
		return "boardQnaUpdateForm";
		// 뷰에서 데이터를 받아와야함 파라미터 데이터 가져오기 데이터를 다시 폼으로 뿌려줘야함 
		// 포스트방식, 인풋히든 밸류값, 
		
		
		// 인풋 히든,네임, 폼태그감싸고, 파람 으로 컨트롤에서 받아서 다시 뷰로보내서 모델앤뷰 뿌려주고
		// 업데이트폼에서 el로 받음. 수저
		
		// 강사님이 위험하다는거는 보드아이디를 보내서 보드아이디를 가지고 서비스
		// 디테일 불러온거 그냥 뿌려주는거
		// 방법1
		// 해당 피케이값 받아오는 로직필요 번호를 받아와서 db에서 값 가져와서 객체를 다시 뿌려주는 방법
		// 방법2
		// 인풋 히든 방법
		// 폼태그에 보드아이디를 가지는 인풋히든창 하나 만들고 보드 아이디를 가지고 서비스를 dao,db가지고
		// 폼으로 감싸서 보내 파람으로 데이터 받아와 (디테일 상세보기 불러오는것처럼) 메소드에 bid보내서 보드 객체를 가져와서 뿌려주면 됨. 주소창 보내는 곳 리턴만 바뀌는 것
		
	}
	
	@RequestMapping("boardQnaUpdateForm.bo") 
	public String updateBoardQna(@ModelAttribute BoardQnA b, /* @RequestParam("page") int page, */
								/* @RequestParam("qnaNo") int qnaNo, */
								 Model model/* , HttpSession session */) { 

//		String id = ((Member)session.getAttribute("loginUser")).getEmail();
//		b.setEmailId(id);
//		System.out.println("id="+id); 			// id=1@a.com
//		System.out.println("b1="+b);			    // b=BoardQnA [qnaNo=0, qnaTitle=null, qnaContent=null, qnaCreateDate=null, qnaModifyDate=null, qnaStatus=null, qnaAnsStatus=null, emailId=1@a.com]

		
		int result = bService.updateBoardQna(b); 
//		System.out.println("b2="+b);			  // b=BoardQnA [qnaNo=0, qnaTitle=null, qnaContent=null, qnaCreateDate=null, qnaModifyDate=null, qnaStatus=null, qnaAnsStatus=null, emailId=1@a.com]
//		System.out.println("result333="+result); // 0
		
		if(result > 0) {
			//model.addAttribute("board", b)...;
			// 보드 보낼 필요없음. 화면 상세보기 페이지로 가기 때문에 상세보기 페이지로 가는 bdetail.bo 이용하면 됨
			//return "redirect:bdetail.bo?bId=" + b.getBoardId() + "&page=" + page;
			
			// 리다이렉트인데 데이터보존됨
//			model.addAttribute("qna",qnaNo);
//			model.addAttribute("qna",b.getQnaTitle());
//			model.addAttribute("qna",b.getQnaContent());
//			model.addAttribute("qna",b.getQnaAnsStatus());
			return "redirect:boardQna.bo";
		} else {
			throw new BoardException("문의사항 수정에 실패하였습니다.");
		}
	}
	
	
/********************************************** QnA : 삭제  *******************************************************/
	
	// QnA : 삭제
	@RequestMapping("boardQnaDeleteForm.bo")
	public String deleteBoard(@RequestParam("qnaNo") int qnaNo) {
		
		int result = bService.deleteBoardQna(qnaNo);
		
		if(result > 0) {
			return "redirect:boardQna.bo";
		}else {
			throw new BoardException("QnA 삭제에 실패하였습니다.");
		}
	}
	
	

/**********************************************************************/	
	
	
	//이용준@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	@RequestMapping("rlist.bo")
	public ModelAndView reviewList(@RequestParam(value = "page", required=false) Integer page, 
								   @RequestParam(value="pno", required=false) Integer productNo,
								   ModelAndView mv, UserLike like, HttpSession session) {
		
		int currentPage = 1;
		
		if(page != null) {
			currentPage = page;			
		}
		
		int listCount = bService.reviewCount(productNo);
		
		int boardLimit = 5;
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		
		ArrayList<Review> reviewList = bService.getReviewList(pi, productNo);
		
		ArrayList<ReviewImage> reviewImageList = bService.getReviewImageList();
		
		String emailId = ((Member)session.getAttribute("loginUser")).getEmail();
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("emailId", emailId);
//		System.out.println(map);
		
		ArrayList<UserLike> likeList = bService.userLikeSelect(map);
		
		System.out.println(reviewImageList);
		System.out.println(pi);
		
		if(reviewList != null && reviewImageList != null) {
			mv.addObject("reviewList", reviewList);
			mv.addObject("pi", pi); 
			mv.addObject("reviewImageList", reviewImageList);

			mv.addObject("likeList",likeList);
			mv.addObject("pno", productNo);

			mv.setViewName("reviewListView");
			System.out.println("page : " + page);
		} else {
			throw new BoardException("리뷰 전체 조회에 실패하였습니다");
		}
	
		return mv;
	}
	
	@RequestMapping("rinsertView.bo")
	public String reviewInsertForm(@RequestParam("productNo") Integer productNo, Model model) {
		System.out.println(productNo);
		model.addAttribute("productNo", productNo);
		return "reviewInsertForm";
	}
	

	@RequestMapping("rinsert.bo")

	public String insertReview(@ModelAttribute Review r, @RequestParam("uploadFile") ArrayList<MultipartFile> uploadFile,
			HttpServletRequest request, Model model)  {
		

		
		ArrayList<ReviewImage> imageList = new ArrayList<ReviewImage>();
		String savePath = null;
//		ReviewImage reviewImage = new ReviewImage();

//		ArrayList<String> originFiles = new ArrayList<String>();//원본파일명
		System.out.println("업로드 파일:" + uploadFile);
		if(uploadFile != null && !uploadFile.isEmpty()) {
			ArrayList<String> r2nameFileNames =saveFile(uploadFile, request);//변경파일명
			savePath = request.getSession().getServletContext().getRealPath("resources")+ "\\reviewImages";
			
			System.out.println(r2nameFileNames);
			for(int i=0; i<uploadFile.size(); i++ ) {
	         ReviewImage rImg = new ReviewImage();
				//원본파일명 집어넣을 for문
//	            originFiles.add(uploadFile.get(i).getOriginalFilename());
	            //System.out.println("원본파일명"+originFiles);// 원본파일 제대로 뜨나 확인
	            rImg.setOriginName(uploadFile.get(i).getOriginalFilename());

	            rImg.setChangeName(r2nameFileNames.get(i));
	            rImg.setFilePath(savePath);
	            imageList.add(rImg);
	            System.out.println(("이미지 리스트 " + imageList));
	         }

	      }
		System.out.println(imageList);
	      int result1 = bService.insertReview(r);
	      int result2 = bService.insertReviewImage(imageList);
	      System.out.println("insert con : " + r + "++ imageList/" + imageList);
	      
	      if( result1 + result2 > 1) {

	    	  model.addAttribute("pno", r.getProductNo());

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
		System.out.println("저장: " +r2nameFileNames);
		return r2nameFileNames;
	}
	
	
	//리뷰 신고하기

		@RequestMapping("reportReview.bo")
		@ResponseBody
		public String reportReview(@ModelAttribute Report rep, HttpSession session,
									@RequestParam(value = "reportType", required=false) Integer reportType,
									@RequestParam(value = "reportContent", required=false) String reportContent,
									@RequestParam(value = "emailId", required=false) String emailId,
									@RequestParam(value = "reviewNo", required=false) Integer reviewNo
				) {
			
			String id = ((Member)session.getAttribute("loginUser")).getEmail();
			

			rep.setEmailId(id);
			rep.setReportContent(reportContent);
			rep.setReportType(reportType);
			rep.setReviewNo(reviewNo);
			
//			HashMap<String, Object> map = new HashMap<>();
//			map.put("rep", rep);
			
			int result = bService.reportReview(rep);
//			int result = bService.reportReview(map);
			
			String repReview = Integer.toString(result);
		
			System.out.println("report : " + rep);
			if(result > 0) {
				System.out.println("sssss report : " + rep);
				return "success";
			} else {
				System.out.println("fffff report : " + rep);
				throw new BoardException("신고에 실패하였습니다!!!!!!!.");
			}
				

		}
			
	// 좋아요 
	@RequestMapping("reviewLike.bo")
	public void reviewLike(@RequestParam(value="reviewNo", required=false) Integer reviewNo, HttpServletRequest request, HttpServletResponse response) {

		String emailId = ((Member)request.getSession().getAttribute("loginUser")).getEmail();
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("emailId", emailId);
		map.put("reviewNo", reviewNo);
		
		int result = bService.reviewLike(map);
		
		String data = null;
		if(result > 1) {
			data = "delete";
		}  else {
			data = "insert";
		}
			try {
			PrintWriter pw = response.getWriter();
			pw.print(data);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}			
		
	}

		@RequestMapping("someReviewList.bo")
	  	public ModelAndView someReviewList(@RequestParam(value = "page", required=false) Integer page,
	  										@RequestParam(value = "emailId", required=false) String emailId,
	  										ModelAndView mv, UserLike like, HttpSession session) {
	  		
	  		int currentPage = 1;
	  		
	  		if(page != null) {
	  			currentPage = page;			
	  		}
	  		
	  		int listCount = bService.someReviewCount();
	  		
	  		int boardLimit = 10;
	  		
	  		HashMap<String, String> map = new HashMap<>();
	  		map.put("emailId", emailId);
	  		
	  		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
	  		
	  		
	  		ArrayList<Review> reviewList = bService.someReviewList(pi, map);
	  		
	  		ArrayList<ReviewImage> reviewImageList = bService.someReviewImageList();
	  		
	  		String loginUser = (String)session.getAttribute("loginUser.email");
	  		
	  		UserLike li = new UserLike();
	  		li.setEmailId(loginUser);
//	  		li.setReviewNo(reviewNo);
	  		
//	  		int count = bService.likeCount(li);
	  		
	  		
	  		if(reviewList != null && reviewImageList != null) {
	  			mv.addObject("reviewList", reviewList);
	  			mv.addObject("pi", pi); 
	  			mv.addObject("reviewImageList", reviewImageList);
//	  			mv.addObject(count);
	  			mv.addObject(emailId);
	  			mv.setViewName("someMemberReviewList");
	  			System.out.println("someReviewList : " + reviewList);
	  		} else {
//	  			System.out.println("실패 someReviewList : " + reviewList);
	  			throw new BoardException("특정 회원 리뷰 전체 조회에 실패하였습니다");
	  		}
	  	
	  		return mv;
	  	}

	
	
	
	
	
	
	
/**********************************************************************/
	
	
/************************* UserEventBoard *********************************************/

	//유저가 보는 이벤트 페이지 리스트 
	@RequestMapping("elist.bo")
	public ModelAndView eListView(@RequestParam(value = "page", required = false) Integer page, ModelAndView mv) {
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
			mv.setViewName("eboardListView");
		} else {
			throw new BoardException("이벤트 게시판 관리 목록 조회에 실패하였습니다.");
		}
		return mv;
	}
	
	//유저가 보는 이벤트페이지 detail
	@RequestMapping("edetail.bo")
	public ModelAndView eDetailView(@RequestParam("eNo") int eNo, @RequestParam(value = "page", required = false) Integer page, ModelAndView mv) {
		EventBoard board = bService.selectEBoard(eNo);
		ArrayList<Image> imageList = bService.selectEFiles(eNo);
		
		if(board !=null) {
			mv.addObject("board", board).addObject("imageList", imageList).addObject("page", page).setViewName("eDatailView");
		} else {
			throw new BoardException("이벤트 게시글 상세보기에 실패하였습니다.");
		}
		return mv;
	}

}






















