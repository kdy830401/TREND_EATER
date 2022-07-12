package com.fpj.trendeater;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fpj.trendeater.admin.model.vo.Image;
import com.fpj.trendeater.admin.model.vo.Product;
import com.fpj.trendeater.board.model.service.BoardService;
import com.fpj.trendeater.board.model.vo.EventBoard;
import com.fpj.trendeater.board.model.vo.Review;
import com.fpj.trendeater.board.model.vo.ReviewImage;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private BoardService bService;
	
	@RequestMapping(value = "home.do", method = RequestMethod.GET)
	public String home(Model model) {
		// 이벤트 이미지 불러오기 최대 5개 썸네일 용만 file_level=0;
		//최신글 불러오기 이벤트
		ArrayList<EventBoard> eventB = bService.getRecentEboard();//글불러오기
		System.out.println(eventB);
		//System.out.println(Eventb.get(0).getBoardNo());
		ArrayList<Image> list = bService.getEImgList(eventB);//그림 불러오기
		System.out.println(list);
		model.addAttribute("eboard", eventB);
		model.addAttribute("eIList", list);
		
		//최신 제품불러오기 
		ArrayList<Product> pList = bService.getNewProducts();//글불러오기
		//System.out.println(pList);
		ArrayList<Image> pIList = bService.getNewPImages(pList);//그림 불러오기
		System.out.println("제품이미지 : "+pIList);
		System.out.println("신제품:목록" + pList);
		model.addAttribute("pList", pList);
		model.addAttribute("pIList", pIList);
		
		//평점 높은 제품 불러오기
		ArrayList<Product> bProducts = bService.getbProducts();//베스트상품 불러오기
		//System.out.println(bProducts);
		ArrayList<Image> bList = bService.getbImgList(bProducts);
		System.out.println("베스트이미지 : " + bList);
		
		model.addAttribute("bProducts", bProducts);
		model.addAttribute("bList", bList);
		
		
		
		//좋아요수가 가장 많은 리뷰 불러오기 
		ArrayList<Review> bReview = bService.getbReview();//리뷰글 불러오기
		System.out.println(bReview);
		//리뷰 그림 불러오기
		ArrayList<ReviewImage> bRImage = bService.getbRImage(bReview);
		System.out.println(bRImage);
		model.addAttribute("review", bReview);
		model.addAttribute("rImage", bRImage);
		return "home";
		
	}
	
}
