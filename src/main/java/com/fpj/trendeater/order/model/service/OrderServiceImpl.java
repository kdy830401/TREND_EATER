package com.fpj.trendeater.order.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fpj.trendeater.admin.model.vo.Image;
import com.fpj.trendeater.cart.model.vo.Cart;
import com.fpj.trendeater.order.model.dao.OrderDAO;
import com.fpj.trendeater.order.model.vo.Order;

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
	
	
	
	
	
	
	
	
	
	
	
	
}
