package com.fpj.trendeater.cart.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fpj.trendeater.admin.model.vo.Image;
import com.fpj.trendeater.admin.model.vo.PageInfo;
import com.fpj.trendeater.cart.model.vo.Cart;

@Repository
public class CartDAO {
	// 상품페이지에서 장바구니에 상품 추가 전 장바구니에 같은 상품 존재 여부 확인
	public Cart checkCart(SqlSessionTemplate sqlSession, Cart crt) {
		return sqlSession.selectOne("cartMapper.checkCart", crt);
	}
	
	// 상품페이지에서 장바구니 상품 추가
	public int insertCart(SqlSessionTemplate sqlSession, Cart cart) {
		return sqlSession.insert("cartMapper.insertCart", cart);
	}
	
	// 장바구니 페이징
	public int getListCount(SqlSessionTemplate sqlSession, String emailId) {
		return sqlSession.selectOne("cartMapper.getListCount", emailId);
	}

	public ArrayList<Cart> selectCartList(SqlSessionTemplate sqlSession, String emailId, PageInfo pi) {
		// 1. 건너뛸 페이지 수
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		
		// 2. Rowbounds
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());		
		return (ArrayList)sqlSession.selectList("cartMapper.selectCartList", emailId, rowBounds);
	}

	public ArrayList<Image> selectThmbList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("cartMapper.selectThmbList");
	}

	public int deleteCart(SqlSessionTemplate sqlSession, Integer cartNo) {
		return sqlSession.delete("cartMapper.deleteCart", cartNo);
	}

	public ArrayList<Cart> cartsForPay(SqlSessionTemplate sqlSession, int[] cartList) {
		ArrayList<Cart> carts = new ArrayList<Cart>();
		
		for(int i = 0; i<cartList.length;i++) {
			int cartNo = cartList[i];
			Cart cart = sqlSession.selectOne("cartMapper.cartsForPay", cartNo);
			carts.add(cart);
		}
		return carts;
	}

	public ArrayList<Image> imgForCartPay(SqlSessionTemplate sqlSession, ArrayList<Cart> carts) {
		ArrayList<Image> images = new ArrayList<Image>();
		for(int i = 0; i<carts.size();i++) {
			Image img = sqlSession.selectOne("cartMapper.imgForCartPay", carts.get(i));
			images.add(img);
		}
		
		return images;
	}
	
	




}
