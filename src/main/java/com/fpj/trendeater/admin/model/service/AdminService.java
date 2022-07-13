package com.fpj.trendeater.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.web.servlet.ModelAndView;

import com.fpj.trendeater.admin.model.vo.Admin;
import com.fpj.trendeater.admin.model.vo.ApplyTaste;
import com.fpj.trendeater.admin.model.vo.Image;
import com.fpj.trendeater.admin.model.vo.PageInfo;
import com.fpj.trendeater.admin.model.vo.Product;
import com.fpj.trendeater.admin.model.vo.ProductRequest;

import com.fpj.trendeater.board.model.vo.Review;
import com.fpj.trendeater.board.model.vo.ReviewImage;

import com.fpj.trendeater.board.model.vo.ApplyTastePerson;
import com.fpj.trendeater.board.model.vo.Report;
import com.fpj.trendeater.member.model.vo.Member;
import com.fpj.trendeater.member.model.vo.ReviewList;

public interface AdminService {
	
	
	//####################김대열
	int registerProduct(Product product);
	int registerImage(ArrayList<Image> imageList, int i);
	
	
	int getListCount(HashMap<String, Object> map);

	ArrayList<Product> getProductList(PageInfo pi, HashMap<String, Object> map);

	ArrayList<Image> getProductImgList();
	
	int registerTaste(HashMap<String, Object> map);

	ArrayList<ApplyTaste> getTasteList(PageInfo pi, HashMap<String, Object> map);

	int checkTasteIng(int productNo);

	int endApplyTaste(int tasteNo);

	int updateTaste(HashMap<String, Object> map);
	
	int insertRequestProduct(ProductRequest pr);
	
	ArrayList<ProductRequest> selectRequestProductList(PageInfo pi, HashMap<String, Object> map);
	
	int updateProduct(Product product);

	int delImage(HashMap<String, Object> imgMap);
	
	// 사용자 게시물 삭제
	int deleteUserBoard(HashMap<String, Object> map);
	// 시식 신청 리스트 불러오기
	ArrayList<ApplyTastePerson> getApplyPersonList(PageInfo pi, HashMap<String, Object> map);
	// 관리자 게시물 삭제
	int deleteAdminBoard(HashMap<String, Object> map);
	
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
	

	//관리자 페이지 리뷰 조회
	ArrayList<Review> reviewList(PageInfo pi, String value);
	ArrayList<ReviewImage> reviewImageList();
	//신고된 리뷰 조회
	ArrayList<Report> getReportList(PageInfo pi, HashMap<String, Object> map);
	int getListCount(Integer reportNo);
	//신고된 리뷰 개수 조회
	int reportCount();
	//신고된 리뷰 확인 
	int reportConfirm(Report rp);
	//리뷰 삭제
	int reviewDelete(Review reviewList);
	int deleteReview(Review reviewList);
	

	


	



	


	
}
