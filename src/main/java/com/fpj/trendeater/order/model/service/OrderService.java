package com.fpj.trendeater.order.model.service;

import java.util.ArrayList;

import com.fpj.trendeater.admin.model.vo.Image;
import com.fpj.trendeater.cart.model.vo.Cart;
import com.fpj.trendeater.order.model.vo.Order;

public interface OrderService {
	//1.ORDER_STATUS TABLE에 insert
	int insertOrderStatus(String orderStatus);

	
	//2. ORDER_LIST TABLE에 insert
	int insertOrderList(Order order);

	//3. ORDER_DETAIL TABLE에 insert
	int insertOrderDetail(ArrayList<Cart> cartList);

	//4. 장바구니 비우기
	int deleteCartList(ArrayList<Cart> cartList);

	//카트리스트에 따른 이미지 다시 받아오기
	ArrayList<Image> selectImgList(ArrayList<Cart> cartList);

}
