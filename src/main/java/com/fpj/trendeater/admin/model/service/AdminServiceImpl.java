package com.fpj.trendeater.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fpj.trendeater.admin.model.dao.AdminDAO;
import com.fpj.trendeater.admin.model.vo.Admin;
import com.fpj.trendeater.admin.model.vo.ApplyTaste;
import com.fpj.trendeater.admin.model.vo.Image;
import com.fpj.trendeater.admin.model.vo.PageInfo;
import com.fpj.trendeater.admin.model.vo.Product;
import com.fpj.trendeater.admin.model.vo.ProductRequest;
import com.fpj.trendeater.member.model.vo.Member;

@Service("aService")
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminDAO aDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	@Transactional
	public int registerProduct(Product product, ArrayList<Image> imageList) {
	
		int result1 = aDAO.registerProduct(sqlSession, product);
		
		System.out.println("result1 : " + result1);
		int result2 = 0;
		
		if(result1 > 1) {
			result2 = aDAO.registerProductImage(sqlSession, imageList);
		}
		
		return result1 + result2;
	}

	@Override
	public int getListCount() {
		
		
		return aDAO.getListCount(sqlSession);
	}

	@Override
	public ArrayList<Product> getProductList(PageInfo pi) {
	
		return aDAO.getProductList(sqlSession, pi);
	}

	@Override
	public ArrayList<Image> getProductImgList() {
		// TODO Auto-generated method stub
		return aDAO.getProductImgList(sqlSession);
	}
	
	@Override
	public int registerTaste(HashMap<String, Object> map) {
		return aDAO.registerTaste(sqlSession, map);
	}

	@Override
	public ArrayList<ApplyTaste> getTasteList() {
		
		return aDAO.getTasteList(sqlSession);
	}

	@Override
	public int checkTasteIng(int productNo) {
		return aDAO.checkTasteIng(sqlSession, productNo);
	}

	@Override
	public int endApplyTaste(int tasteNo) {
		return aDAO.endApplyTaste(sqlSession, tasteNo);
	}
	
	@Override
	public int updateTaste(HashMap<String, Object> map) {
		return aDAO.updateTaste(sqlSession, map);
	}
	// 김대열 끝
	
	
	
	//김주희
	@Override
	public ArrayList<Member> selectMember() {
		
		return aDAO.selectMember(sqlSession);
	}

	@Override
	public int updateMember(HashMap<String, String> map) {
	
		return aDAO.updateMember(sqlSession,map);
	}

	@Override
	public int memberCount() {
		
		return aDAO.memberCount(sqlSession);
	}

	@Override
	public ArrayList<Member> searchMember(String search) {
		
		return aDAO.searchMember(sqlSession,search);
	}

	@Override
	public int searchCount(String search) {
		// TODO Auto-generated method stub
		return aDAO.searchCount(sqlSession,search);
	}

	@Override
	public Admin adminlogin(Admin admin) {
		
		return aDAO.adminlogin(sqlSession,admin);
	}

	@Override
	public int insertRequestProduct(ProductRequest pr) {
		
		return aDAO.insertRequestProduct(sqlSession,pr);
	}

	@Override
	public ArrayList<ProductRequest> selectRequestProductList() {
		
		return aDAO.selectRequestProductList(sqlSession);
	}





	




}
