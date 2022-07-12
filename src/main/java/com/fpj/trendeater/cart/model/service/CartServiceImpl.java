package com.fpj.trendeater.cart.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fpj.trendeater.admin.model.vo.Image;
import com.fpj.trendeater.admin.model.vo.PageInfo;
import com.fpj.trendeater.cart.model.dao.CartDAO;
import com.fpj.trendeater.cart.model.vo.Cart;

@Service
public class CartServiceImpl implements CartService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private CartDAO ctDAO;

	@Override
	public Cart checkCart(Cart crt) {
		return ctDAO.checkCart(sqlSession, crt);
	}

	@Override
	public int insertCart(Cart cart) {
		return ctDAO.insertCart(sqlSession, cart);
	}

	@Override
	public int getListCount(String emailId) {
		return ctDAO.getListCount(sqlSession, emailId);
	}

	@Override
	public ArrayList<Cart> selectCartList(String emailId, PageInfo pi) {
		return ctDAO.selectCartList(sqlSession, emailId, pi);
	}

	@Override
	public ArrayList<Image> selectThmbList() {
		return ctDAO.selectThmbList(sqlSession);
	}

	@Override
	public int deleteCart(Integer cartNo) {
		return ctDAO.deleteCart(sqlSession, cartNo);
	}

	// 장바구니에서 결제 페이지로 이동
	// 1. 선택 장바구니 리스트 받아오기
	@Override
	public ArrayList<Cart> cartsForPay(int[] cartList) {
		return ctDAO.cartsForPay(sqlSession, cartList);
	}
	
	// 2. 이미지 리스트 받아오기
	@Override
	public ArrayList<Image> imgForCartPay(ArrayList<Cart> carts) {
		return ctDAO.imgForCartPay(sqlSession, carts);
	}




}
