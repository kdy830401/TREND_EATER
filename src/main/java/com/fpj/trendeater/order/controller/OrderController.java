package com.fpj.trendeater.order.controller;

import java.io.InputStream;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fpj.trendeater.admin.model.vo.Image;
import com.fpj.trendeater.admin.model.vo.Product;
import com.fpj.trendeater.cart.model.vo.Cart;
import com.fpj.trendeater.order.model.exception.OrderException;
import com.fpj.trendeater.order.model.service.OrderService;
import com.fpj.trendeater.order.model.vo.Order;
import com.fpj.trendeater.order.model.vo.OrderDetail;

@Controller
public class OrderController {
	@Autowired private  OrderService oService;
	
//결제 	
	@RequestMapping("orderEnd.or")
	public String orderEnd(@ModelAttribute Cart cart, @ModelAttribute Order order, 
			@RequestParam("pointPlus2") int pointPlus, @RequestParam("pointUse") int pointUse, @RequestParam("cartNo")ArrayList<Integer> cartNo,
			@RequestParam("productAmount") ArrayList<Integer> productAmount, @RequestParam("productNo") ArrayList<Integer> productNo,
			@RequestParam("productPrice") ArrayList<Integer> productPrice, @RequestParam("productName") ArrayList<String> productName,
			Model model){
		System.out.println(cart);
		System.out.println(order);
		System.out.println(cartNo);
		System.out.println(productAmount);
		System.out.println(productNo);
		
		int pointUpdate =pointPlus - pointUse;
		String orderStatus = "1-주문";
		// ArrayList<Cart> cartList 에 필요한 정보담기
		ArrayList<Cart> cartList = new ArrayList<>();
		for(int i = 0; i < cartNo.size(); i++ ) {
			Cart carts = new Cart();
			carts.setCartNo(cartNo.get(i));
			carts.setProductAmount(productAmount.get(i));
			carts.setProductNo(productNo.get(i));
			carts.setProductName(productName.get(i));
			carts.setProductPrice(productPrice.get(i));
			cartList.add(carts);	
		}
		//카트리스트에 따른 이미지 다시 받아오기
		System.out.println("카트리스트 : " +cartList);
		ArrayList<Image> imageList = oService.selectImgList(cartList);
		System.out.println("이미지 리스트 : " + imageList);
		
		
		//1.ORDER_STATUS TABLE에 insert
		int result1 = oService.insertOrderStatus(orderStatus);
		
		//2. ORDER_LIST TABLE에 insert
		int result2 = oService.insertOrderList(order);
		
		
		//3. ORDER_DETAIL TABLE에 insert 
		int result3 = oService.insertOrderDetail(cartList);
		
		
		//4. 장바구니 비우기
		int result4 = oService.deleteCartList(cartList);
		
		
		//결과출력
		if(result1 + result2 + result3 + result4 < 4) {
			model.addAttribute("carts", cartList);
			model.addAttribute("images",imageList);
			return "orderEndView";
		}else {
			 throw new OrderException("게시글 수정에 실패하였습니다.");
		}
		
	}
	
	// 주문 내역, 주문 관리 - 상세보기
	@RequestMapping("orderDetail.or")
	public ModelAndView orderDetail(@RequestParam("orderNo") int orderNo, ModelAndView mv) {
		// 1. 주문 상세 정보 가져오기
		ArrayList<OrderDetail> orderDetailList = oService.getMyOrderDetailList(orderNo);
		
		// 2. 주문 상세 이미지 가져오기
		ArrayList<Image> orderImgList = oService.getMyOrderImgList(orderDetailList);
		
		// 3. 주문 품목 정보 가져오기
		ArrayList<Product> productList = oService.getPdtDetailList(orderDetailList);
		
		// 4. 이동
		if(orderDetailList !=null && orderImgList != null && productList != null) {
			mv.addObject("orderDetailList", orderDetailList);
			mv.addObject("orderImgList", orderImgList);	
			mv.addObject("productList", productList);
			mv.setViewName("orderDetail");
		} else {
			throw new OrderException("주문 상세보기에 실패했습니다.");
		}
		return mv;
	}	
	
	
	
}
