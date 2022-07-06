package com.fpj.trendeater.board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fpj.trendeater.admin.controller.AdminController;
import com.fpj.trendeater.admin.model.service.AdminService;
import com.fpj.trendeater.admin.model.vo.Admin;
import com.fpj.trendeater.admin.model.vo.Image;
import com.fpj.trendeater.admin.model.vo.PageInfo;
import com.fpj.trendeater.admin.model.vo.Product;
import com.fpj.trendeater.board.model.exception.BoardException;
import com.fpj.trendeater.board.model.service.BoardService;
import com.fpj.trendeater.board.model.vo.ApplyTastePerson;
import com.fpj.trendeater.board.model.vo.Board;
import com.fpj.trendeater.board.model.vo.BoardQnA;
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
	@RequestMapping("prBoardList.bo")
	public ModelAndView prBoardList(@RequestParam(value="page", required=false) Integer page,
									@RequestParam(value="value", required=false) String value,
									ModelAndView mv, HttpServletRequest request) {
	
		System.out.println(value);
		
		boolean boardCheck = true;
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("boardCheck", boardCheck);
		map.put("value", value);
		
		ModelAndView boardMv = aController.productList(page, mv, value, request, map);
		
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
		if(request.getSession().getAttribute("loginUser") != null) {
			emailId = ((Member)request.getSession().getAttribute("loginUser")).getEmail();
			HashMap<String, Object> map = new HashMap<>();
			
			map.put("pNo", pno);
			map.put("emailId", emailId);
			
			scrapCheckNum = bService.checkScrap(map);
		}
		
		System.out.println(scrapCheckNum);
		System.out.println(pno);
		Product p = bService.selectPrBoard(pno);

//		System.out.println(p);
		ArrayList<Image> imgList = bService.selectPrImage(pno);
		
		

		if (p != null && imgList != null) {
			mv.addObject("p", p);
			mv.addObject("imgList", imgList);
			mv.addObject("scrapCheckNum", scrapCheckNum);
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
		ModelAndView applyMv = aController.applyTasteList(page, mv, boardCheck);
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
	
	// 스크랩
	@RequestMapping("scrap.me")
	public void scrap(@RequestParam("pNo") Integer pNo, HttpServletRequest request, HttpServletResponse response) {
		String emailId = ((Member)request.getSession().getAttribute("loginUser")).getEmail();
		
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("pNo", pNo);
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

		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

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
	

/********************************** Notice(공지사항) : 쓰기  *************************************/	
	// Notice 쓰기 by admin 
	@RequestMapping("noticeWriteView.bo")
	public String noticeWriteForm() {
		return "noticeWriteForm";
	}
	@RequestMapping("noticeWriteForm.bo")
	public String insertNotice(@ModelAttribute Board b) {

		int result = bService.insertNotice(b);
 
		if (result > 0) {
			return "redirect:noticeList.bo"; // 관리자 게시판으로 돌아가야함!
		} else {
			throw new BoardException("공지사항 등록에 실패하였습니다.");
		}
	}

	
/********************************** Notice(공지사항) : 수정  *************************************/	
	// Notice 수정
	@RequestMapping(value="noticeUpdate.bo", method=RequestMethod.GET)
	public String noticeUpdateForm() {
		return "noticeUpdateForm";
	}
	
	@RequestMapping(value="noticeUpdate.bo", method = RequestMethod.POST) 
	public String updateNotice(@ModelAttribute Board b, @RequestParam("page") int page,
									HttpSession session) {  
		
		String id = ((Admin)session.getAttribute("loginUser")).getId();
		b.setAdminId(id);
		
		int result = bService.updateNotice(b); 

		if(result > 0) {
			//model.addAttribute("board", b)...;
			// 보드 보낼 필요없음. 화면 상세보기 페이지로 가기 때문에 상세보기 페이지로 가는 bdetail.bo 이용하면 됨
			//return "redirect:bdetail.bo?bId=" + b.getBoardId() + "&page=" + page;
			
			// 리다이렉트인데 데이터보존됨
//			model.addAttribute("bId",b.getBoardId());
//			model.addAttribute("page",page);
			return "redirect:boardQna.bo";
			
		} else {
			throw new BoardException("공지사항 수정에 실패하였습니다.");
		}
	}
	
	
	
/********************************** Notice(공지사항) : 삭제  *************************************/	
	// Notice 삭제
	@RequestMapping(value="noticeDelete.bo", method=RequestMethod.POST)
	public String deleteNotice(@ModelAttribute Board b, HttpSession session) {  
			
		
		String id = ((Member)session.getAttribute("loginUser")).getEmail();
		b.setAdminId(id);
		
		int result = bService.deleteNotice(b);
		
		if(result > 0) {
			return "redirect:boardQna.bo";	// 관리자 게시판으로 돌아가야함!
		}else {
			throw new BoardException("공지사항 삭제에 실패하였습니다.");
		}
	}
	
	
	
	
	
/*********************************** Notice(공지사항) : 상세보기 **************************************************/

	@RequestMapping("noticeDetail.bo")
	public ModelAndView boardDetail(@RequestParam("bId") int bId, @RequestParam("page") int page, ModelAndView mv) {

		Board board = bService.selectBoard(bId);
		
		System.out.println("board="+board);
		
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
		
		int currentPage = 1;

		if (page != null) {
			currentPage = page;
		}

		// 페이징처리1 :총게시물수 가져오기
		int listCount = bService.getQnaListCount();
		// 페이징처리2 : 필요한 게시판 가져오기
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

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
		
		int result = bService.insertBoardQna(b);
 
		if (result > 0) {
			return "redirect:boardQna.bo";
		} else {
			throw new BoardException("문의사항 등록에 실패하였습니다.");
		}
	}
	
	
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
	public String deleteBoard(@ModelAttribute BoardQnA b, HttpSession session) {  
			
		
		String id = ((Member)session.getAttribute("loginUser")).getEmail();
		b.setEmailId(id);
		
		System.out.println("삭제 id="+id);
		System.out.println("삭제 b="+b);
		
		int result = bService.deleteBoardQna(b);
		
		System.out.println("삭제 result="+result);
		
		if(result > 0) {
			return "redirect:boardQna.bo";
		}else {
			throw new BoardException("QnA 삭제에 실패하였습니다.");
		}
	}
	
	

/*********************************** 댓글 ***********************************/	
	

}
