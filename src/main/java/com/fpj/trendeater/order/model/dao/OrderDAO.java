package com.fpj.trendeater.order.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fpj.trendeater.admin.model.vo.Image;
import com.fpj.trendeater.cart.model.vo.Cart;
import com.fpj.trendeater.order.model.vo.Order;

@Repository("oDAO")
public class OrderDAO {

	//1.ORDER_STATUS TABLE에 insert
	public int insertOrderStatus(SqlSessionTemplate sqlSession, String orderStatus) {
		
		return sqlSession.insert("orderMapper.insertOrderStatus", orderStatus);
	}

	
	//2. ORDER TABLE에 insert
	public int insertOrderList(SqlSessionTemplate sqlSession, Order order) {
		return sqlSession.insert("orderMapper.insertOrderList", order);
	}

	
	//3. ORDER_DETAIL TABLE에 insert
	public int insertOrderDetail(SqlSessionTemplate sqlSession, ArrayList<Cart> cartList) {
		int odResult = 0;
		for(int i = 0; i < cartList.size(); i++) {
			sqlSession.insert("orderMapper.insertOrderDetail", cartList.get(i));
			odResult++;
		}
		return odResult;
	}

	
	//4. 장바구니 비우기
	public int deleteCartList(SqlSessionTemplate sqlSession, ArrayList<Cart> cartList) {
		
		int dCartList = 0;
		for(int i = 0; i < cartList.size(); i++ ) {
			sqlSession.delete("orderMapper.deleteCartList", cartList.get(i));
			dCartList++;
		}
		
		return dCartList;
	}

	//카트리스트에 따른 이미지 다시 받아오기
	public ArrayList<Image> selectImgList(SqlSessionTemplate sqlSession, ArrayList<Cart> cartList) {
		ArrayList<Image> images = new ArrayList<Image>();
		for(int i = 0; i<cartList.size();i++) {
			Image img = sqlSession.selectOne("orderMapper.selectImgList", cartList.get(i));
			images.add(img);
		}
		return images;
	}
	

}
