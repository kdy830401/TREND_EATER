package com.fpj.trendeater.order.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fpj.trendeater.admin.model.vo.Image;
import com.fpj.trendeater.admin.model.vo.PageInfo;
import com.fpj.trendeater.admin.model.vo.Product;
import com.fpj.trendeater.cart.model.vo.Cart;
import com.fpj.trendeater.order.model.dao.OrderDAO;
import com.fpj.trendeater.order.model.vo.Order;
import com.fpj.trendeater.order.model.vo.OrderDetail;
import com.fpj.trendeater.order.model.vo.OrderStatus;

@Service("oService")
public class OrderServiceImpl implements OrderService {
	@Autowired private OrderDAO oDAO;
	@Autowired private SqlSessionTemplate sqlSession;
	
	//1.ORDER_STATUS TABLE에 insert
	@Override
	public int insertOrderStatus(String orderStatus) {
		return oDAO.insertOrderStatus(sqlSession, orderStatus);
	}
	
	
	//2. ORDER_LIST TABLE에 insert	
	@Override
	public int insertOrderList(Order order) {
		return oDAO.insertOrderList(sqlSession, order);
	}

	//3. ORDER_DETAIL TABLE에 insert
	@Override
	public int insertOrderDetail(ArrayList<Cart> cartList) {
		return oDAO.insertOrderDetail(sqlSession, cartList);
	}

	
	//4. 장바구니 비우기
	@Override
	public int deleteCartList(ArrayList<Cart> cartList) {
		
		return oDAO.deleteCartList(sqlSession, cartList);
	}

	//카트리스트에 따른 이미지 다시 받아오기
	@Override
	public ArrayList<Image> selectImgList(ArrayList<Cart> cartList) {
		return oDAO.selectImgList(sqlSession, cartList);
	}
	//바로구매 3. ORDER_DETAIL TABLE에 insert
		@Override
		public int insertOrderDetail(Cart cart) {
			return oDAO.insertOrderDetail(sqlSession, cart);
		}
	
	// 주문 내역, 주문 관리 - 상세보기
	// 1. 상세보기 리스트 가져오기
	@Override
	public ArrayList<OrderDetail> getMyOrderDetailList(int orderNo) {
		return oDAO.getMyOrderDetailList(sqlSession, orderNo);
	}

	// 2. 상세보기 이미지 리스트 가져오기
	@Override
	public ArrayList<Image> getMyOrderImgList(ArrayList<OrderDetail> orderDetailList) {
		return oDAO.getMyOrderImgList(sqlSession, orderDetailList);
	}
	
	// 3. 상품 리스트 가져오기
	@Override
	public ArrayList<Product> getPdtDetailList(ArrayList<OrderDetail> orderDetailList) {
		return oDAO.getPdtDetailList(sqlSession, orderDetailList);
	}	
	
	// 주문 관리
	@Override
	public int getOrderListCount() {
		return oDAO.getOrderListCount(sqlSession);
	}

	@Override
	public ArrayList<OrderStatus> getAdminOrderList(PageInfo pi) {
		return oDAO.getAdminOrderList(sqlSession, pi);
	}
	
	// 주문 관리 - 주문 상태 변경
	@Override
	public int changeOrderStatus(OrderStatus os) {
		return oDAO.changeOrderStatus(sqlSession, os);
	}
	
	// 주문 관리 
	// 1. 특정 카테고리 주문 목록
	@Override
	public int getCategoryListCount(String orderStatusName) {
		return oDAO.getCategoryListCount(sqlSession, orderStatusName);
	}

	@Override
	public ArrayList<OrderDetail> getCategoryList(PageInfo pi, String orderStatusName) {
		return oDAO.getCategoryList(sqlSession, pi, orderStatusName);
	}

	// 2. 전체 주문 목록
	@Override
	public ArrayList<OrderStatus> getOrderAdminList() {
		return oDAO.getOrderAdminList(sqlSession);
	}	
	
	
	
	
	
	
	
}
