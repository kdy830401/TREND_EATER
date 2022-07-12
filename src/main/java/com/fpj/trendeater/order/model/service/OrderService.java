package com.fpj.trendeater.order.model.service;

import java.util.ArrayList;

import com.fpj.trendeater.admin.model.vo.Image;
import com.fpj.trendeater.admin.model.vo.PageInfo;
import com.fpj.trendeater.admin.model.vo.Product;
import com.fpj.trendeater.cart.model.vo.Cart;
import com.fpj.trendeater.order.model.vo.Order;
import com.fpj.trendeater.order.model.vo.OrderDetail;
import com.fpj.trendeater.order.model.vo.OrderStatus;

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
	//바로구매 3. ORDER_DETAIL TABLE에 insert
	int insertOrderDetail(Cart cart);
	
	// 주문 내역, 주문 관리 - 상세보기
	ArrayList<OrderDetail> getMyOrderDetailList(int orderNo);

	ArrayList<Image> getMyOrderImgList(ArrayList<OrderDetail> orderDetailList);
	
	ArrayList<Product> getPdtDetailList(ArrayList<OrderDetail> orderDetailList);
	
	// 주문 관리
	int getOrderListCount();

	ArrayList<OrderStatus> getAdminOrderList(PageInfo pi);
	
	// 주문 관리 - 주문 상태 변경
	int changeOrderStatus(OrderStatus os);
	
	// 주문 관리 
	// 1. 특정카테고리 주문 목록
	int getCategoryListCount(String orderStatusName);
	
	ArrayList<OrderDetail> getCategoryList(PageInfo pi, String orderStatusName);

	// 2. 전체 주문 목록
	ArrayList<OrderStatus> getOrderAdminList();	
}
