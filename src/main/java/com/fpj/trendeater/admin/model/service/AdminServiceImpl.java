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
	public int registerProduct(Product product) {
		return aDAO.registerProduct(sqlSession, product);
	}
	
	@Override
	public int registerImage(ArrayList<Image> imageList, int i) {
		return aDAO.registerProductImage(sqlSession, imageList, i);
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
	
	@Override
	public ArrayList<ProductRequest> selectRequestProductList() {
		
		return aDAO.selectRequestProductList(sqlSession);
	}
	
	// 이미지 삭제
	@Override
	public int delImage(int imgNo) {
		return aDAO.delImage(sqlSession, imgNo);
	}
	
	// 상품 정보 업데이트
	@Override
	public int updateProduct(Product product) {
		return aDAO.updateProduct(sqlSession, product);
	}


	// 김대열 끝
	
	
	
	
	//김주희
	//회원 리스트
	@Override
	public ArrayList<Member> selectMember() {
		
		return aDAO.selectMember(sqlSession);
	}
	//회원 상태 변경
	@Override
	public int updateMember(HashMap<String, String> map) {
	
		return aDAO.updateMember(sqlSession,map);
	}
	//회원 리스트 총 명 수 
	@Override
	public int memberCount() {
		
		return aDAO.memberCount(sqlSession);
	}
	//회원 검색
	@Override
	public ArrayList<Member> searchMember(String search) {
		
		return aDAO.searchMember(sqlSession,search);
	}
	//회원 검색 총 명 수
	@Override
	public int searchCount(String search) {
		// TODO Auto-generated method stub
		return aDAO.searchCount(sqlSession,search);
	}
	//관리자 로그인
	@Override
	public Admin adminlogin(Admin admin) {
		
		return aDAO.adminlogin(sqlSession,admin);
	}
	//관리자 등록
	@Override
	public int insertRequestProduct(ProductRequest pr) {
		
		return aDAO.insertRequestProduct(sqlSession,pr);
	}
	
	
	//어드민 로그인
	@Override
	public int insertAdmin(Admin admin) {
		return aDAO.insertAdmin(sqlSession,admin);
		
	}
	
	//아이디 중복 체크
	@Override
	public int adminCount(Admin admin) {
		
		return aDAO.adminCount(sqlSession,admin);
	}



	




	




}
