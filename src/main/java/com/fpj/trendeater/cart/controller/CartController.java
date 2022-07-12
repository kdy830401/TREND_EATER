package com.fpj.trendeater.cart.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fpj.trendeater.admin.model.vo.Image;
import com.fpj.trendeater.admin.model.vo.PageInfo;
import com.fpj.trendeater.cart.model.service.CartService;
import com.fpj.trendeater.cart.model.vo.Cart;
import com.fpj.trendeater.common.Pagination;
import com.fpj.trendeater.member.exception.CartException;
import com.fpj.trendeater.member.model.vo.Member;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;

@Controller
public class CartController {
	@Autowired
	private CartService ctService;
	
	// 상품페이지에서 장바구니에 상품 추가 전 장바구니에 같은 상품 존재 여부 확인
	@RequestMapping("checkCart.ct")
	public void checkCart(@RequestParam("productNo") int productNo, HttpServletResponse response, HttpSession session) {
		// 1. session에서 loginUser의 emailId 받아오기
				String emailId = ((Member)session.getAttribute("loginUser")).getEmail();
				
		// 2. cart 객체에 emailId와 productNo 넣어주기
		Cart crt = new Cart();
		crt.setEmailId(emailId);
		crt.setProductNo(productNo);
				
		Cart cart = ctService.checkCart(crt);
		
		boolean tf = false;
		if(cart != null) {
			tf=true;
		}
		
		try {
			new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(tf, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 상품페이지에서 장바구니 상품 추가
	@RequestMapping("addCart.ct")
	public String insertShoppingCart(@ModelAttribute Cart cart, HttpSession session) {
		// 1. cart emailId 넣기
		String emailId = ((Member)session.getAttribute("loginUser")).getEmail();
		cart.setEmailId(emailId);
		
		// 2. 장바구니 등록
		int result = ctService.insertCart(cart);
		
		// 3. 등록 확인 후 이동
		if(result>0) {
			return "redirect:list.ct";
		} else {
			throw new CartException("장바구니 등록에 실패하였습니다.");
		}
	}
	
	// 장바구니로 이동
	@RequestMapping("list.ct")
	public ModelAndView cartList(@RequestParam(value="page", required=false) Integer page,
			ModelAndView mv, HttpSession session) {
		// 1. 세션에서 사용자 이메일 가져오기
		String emailId = ((Member)session.getAttribute("loginUser")).getEmail();
		
		// 2. 페이징
		// 2.1 전체 장바구니 수 구하기
		int listCount = ctService.getListCount(emailId);
		
		// 2.2 현재 페이지 구하기 및 boardLimit 설정
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		int boardLimit = 10;
		
		// 2.3 페이징 계산
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, boardLimit);
		
		
		// 3. 사용자(loginUser)의 장바구니 리스트 가져오기
		ArrayList<Cart> cartList = ctService.selectCartList(emailId, pi);
		
		// 4. image 리스트 가져오기
		ArrayList<Image> thmbList = ctService.selectThmbList();
		
		// 5. 이동		
		if(cartList!=null) {
			mv.addObject("cartList", cartList);
			mv.addObject("thmbList", thmbList);
			mv.addObject("pi", pi);
			mv.setViewName("shoppingCart");
		} else {
			throw new CartException("장바구니 목록 불러오기에 실패했습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("deleteCart.ct")
	public void deleteCart(@RequestParam("cartNo") Integer cartNo, HttpServletResponse response) {
		
		int result = ctService.deleteCart(cartNo);
		
		boolean tf = false;
		if(result>0) {
			tf=true;
		}
		
		try {
			new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(tf, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}	
	
	// 장바구니 선택 품목 -> 결제페이지로 이동
	@RequestMapping("order.or")
	public ModelAndView paymentForm(@RequestParam("cartList") int[] cartList, 
			@RequestParam("cartAmountArr") int[] cartAmountArr, ModelAndView mv, HttpSession session) {
		// 1. 장바구니 정보 받아와서 완성하기
		// 1.1 db에서 cartNo에 따른 cart 객체 리스트 받아오기
		ArrayList<Cart> carts = ctService.cartsForPay(cartList);
		
		
		// 2.2 장바구니 정보에 수량 설정하기
		for(int i = 0; i<carts.size();i++) {
			carts.get(i).setProductAmount(cartAmountArr[i]);
		}

	
		// 3. 이미지 리스트 받기
		ArrayList<Image> images = ctService.imgForCartPay(carts);
		int cartsize = carts.size()-1;
		
		// 4. 보내기
		mv.addObject("carts", carts);
		mv.addObject("images", images);
		mv.addObject("cSize", cartsize);
		mv.setViewName("order");
		
		return mv;
		
	}	

}






























