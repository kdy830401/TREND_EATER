package com.fpj.trendeater.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.fpj.trendeater.admin.model.vo.Admin;
import com.fpj.trendeater.admin.model.vo.ApplyTaste;
import com.fpj.trendeater.admin.model.vo.Image;
import com.fpj.trendeater.admin.model.vo.PageInfo;
import com.fpj.trendeater.admin.model.vo.Product;
import com.fpj.trendeater.admin.model.vo.ProductRequest;
import com.fpj.trendeater.member.model.vo.Member;

public interface AdminService {
	
	
	// 김대열
	int registerProduct(Product product, ArrayList<Image> imageList);

	int getListCount();

	ArrayList<Product> getProductList(PageInfo pi);

	ArrayList<Image> getProductImgList();
	
	int registerTaste(HashMap<String, Object> map);

	ArrayList<ApplyTaste> getTasteList();

	int checkTasteIng(int productNo);

	int endApplyTaste(int tasteNo);

	int updateTaste(HashMap<String, Object> map);
	
	//김주희
	ArrayList<Member> selectMember();

	int updateMember(HashMap<String, String> map);

	int memberCount();

	ArrayList<Member> searchMember(String search);

	int searchCount(String search);

	Admin adminlogin(Admin admin);

	int insertRequestProduct(ProductRequest pr);

	ArrayList<ProductRequest> selectRequestProductList();

	
}
