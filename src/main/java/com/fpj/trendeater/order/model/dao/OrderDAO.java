package com.fpj.trendeater.order.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fpj.trendeater.admin.model.vo.Image;
import com.fpj.trendeater.admin.model.vo.PageInfo;
import com.fpj.trendeater.admin.model.vo.Product;
import com.fpj.trendeater.cart.model.vo.Cart;
import com.fpj.trendeater.order.model.vo.Order;
import com.fpj.trendeater.order.model.vo.OrderDetail;
import com.fpj.trendeater.order.model.vo.OrderStatus;

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
	//바로구매 3. ORDER_DETAIL TABLE에 insert
			public int insertOrderDetail(SqlSessionTemplate sqlSession, Cart cart) {
				return sqlSession.insert("orderMapper.insertOrderDetail", cart);
			}	
	// 주문 내역, 주문 관리 - 상세보기
	// 1. 상세보기 리스트 가져오기
	public ArrayList<OrderDetail> getMyOrderDetailList(SqlSessionTemplate sqlSession, int orderNo) {
		return (ArrayList)sqlSession.selectList("orderMapper.myOrderDetailList", orderNo);
	} 
	
	// 2 주문 상세보기 이미지 리스트 받기
	public ArrayList<Image> getMyOrderImgList(SqlSessionTemplate sqlSession, ArrayList<OrderDetail> orderDetailList) {
		ArrayList<Image> orderImgList = new ArrayList<Image>();
		for(int i = 0; i<orderDetailList.size();i++) {
			Image img = sqlSession.selectOne("orderMapper.getMyOrderImgList", orderDetailList.get(i));
			orderImgList.add(img);
		}
		return orderImgList;
	}
	
	// 3. 주문 품목 상세보기 리스트 받기
	public ArrayList<Product> getPdtDetailList(SqlSessionTemplate sqlSession, ArrayList<OrderDetail> orderDetailList) {
		ArrayList<Product> productList = new ArrayList<Product>();
		for(int i = 0; i< orderDetailList.size();i++) {
			Product pdt = sqlSession.selectOne("orderMapper.getPdtDetailList", orderDetailList.get(i));
			productList.add(pdt);
		}
		return productList;
	}	
	
	// 주문 관리
	// 1. 페이징
	public int getOrderListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("orderMapper.getOrderListCount");
	}
	
	// 2. 주문 내역 가져오기
	public ArrayList<OrderStatus> getAdminOrderList(SqlSessionTemplate sqlSession, PageInfo pi) {
		// 1. 건너뛸 페이지 수
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		
		// 2. Rowbounds
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());	
		return (ArrayList)sqlSession.selectList("orderMapper.getAdminOrderList", null, rowBounds);
	}
	
	// 주문 관리 - 주문 상태 변경
	public int changeOrderStatus(SqlSessionTemplate sqlSession, OrderStatus os) {
		return sqlSession.update("orderMapper.changeOrderStatus", os);
	}
	
	// 주문 관리
	// 1. 특정 카테고리의 주문 목록
	public int getCategoryListCount(SqlSessionTemplate sqlSession, String orderStatusName) {
		return sqlSession.selectOne("orderMapper.getCategoryListCount", orderStatusName);
	}

	public ArrayList<OrderDetail> getCategoryList(SqlSessionTemplate sqlSession, PageInfo pi, String orderStatusName) {
		// 1. 건너뛸 페이지 수
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		
		// 2. Rowbounds
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());	
		return (ArrayList)sqlSession.selectList("orderMapper.getOrderedList", orderStatusName, rowBounds);
	}

	// 2. 전체 주문 목록
	public ArrayList<OrderStatus> getOrderAdminList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("orderMapper.getOrderAdminList");
	}	
	
}
