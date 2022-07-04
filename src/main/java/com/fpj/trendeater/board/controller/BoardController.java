package com.fpj.trendeater.board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fpj.trendeater.admin.controller.AdminController;
import com.fpj.trendeater.admin.model.service.AdminService;
import com.fpj.trendeater.admin.model.vo.Image;
import com.fpj.trendeater.admin.model.vo.Product;
import com.fpj.trendeater.board.model.exception.BoardException;
import com.fpj.trendeater.board.model.service.BoardService;
import com.fpj.trendeater.board.model.vo.ApplyTastePerson;
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
	public ModelAndView prBoardList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv, HttpServletRequest request) {
	
//		mv.setViewName("true");
		
		boolean boardCheck = true;
		
		ModelAndView boardMv = aController.productList(page, mv, request, boardCheck);
		
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
	

}
