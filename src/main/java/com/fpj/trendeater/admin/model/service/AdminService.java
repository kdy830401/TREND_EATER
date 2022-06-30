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
	
	
	//####################김대열
	int registerProduct(Product product);
	int registerImage(ArrayList<Image> imageList, int i);
	
	
	int getListCount();

	ArrayList<Product> getProductList(PageInfo pi);

	ArrayList<Image> getProductImgList();
	
	int registerTaste(HashMap<String, Object> map);

	ArrayList<ApplyTaste> getTasteList();

	int checkTasteIng(int productNo);

	int endApplyTaste(int tasteNo);

	int updateTaste(HashMap<String, Object> map);
	
	int insertRequestProduct(ProductRequest pr);
	
	ArrayList<ProductRequest> selectRequestProductList();
	
	int delImage(int imgNo);
	
	//####################김주희
	
	//회원 리스트 뿌리기
	ArrayList<Member> selectMember();

	//회원 상태 변경
	int updateMember(HashMap<String, String> map);
	
	
	//회원 리스트의 총 명 수 
	int memberCount();

	//회원 검색
	ArrayList<Member> searchMember(String search);

	//회원 검색  총 명 수 
	int searchCount(String search);

	//관리자 로그인
	Admin adminlogin(Admin admin);
	
	//관리자 등록
	int insertAdmin(Admin admin);

	//아이디 중복확인
	int adminCount(Admin admin);

	int updateProduct(Product product);



	


	
}
