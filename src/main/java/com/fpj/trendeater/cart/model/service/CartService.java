package com.fpj.trendeater.cart.model.service;

import java.util.ArrayList;

import com.fpj.trendeater.admin.model.vo.Image;
import com.fpj.trendeater.admin.model.vo.PageInfo;
import com.fpj.trendeater.cart.model.vo.Cart;

public interface CartService {

	Cart checkCart(Cart crt);

	int insertCart(Cart cart);

	int getListCount(String emailId);

	ArrayList<Cart> selectCartList(String emailId, PageInfo pi);

	ArrayList<Image> selectThmbList();

	int deleteCart(Integer cartNo);

	ArrayList<Cart> cartsForPay(int[] cartList);

	ArrayList<Image> imgForCartPay(ArrayList<Cart> carts);

	


}
