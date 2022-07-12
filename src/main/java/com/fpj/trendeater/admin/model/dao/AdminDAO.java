package com.fpj.trendeater.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
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

@Repository("aDAO")
public class AdminDAO {

	///// 김대열 시작
	public int registerProduct(SqlSessionTemplate sqlSession, Product product) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("product", product);
		int result = 0;
		sqlSession.insert("adminMapper.registerProduct", map);
		result = (int) map.get("result");
		
		System.out.println("result: " + result);
				
		return result;//sqlSession.insert("adminMapper.registerProduct", product);
	}
	
	public int registerProductImage(SqlSessionTemplate sqlSession, ArrayList<Image> imageList, int i) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("list", imageList);
		map.put("identifyNo", i);
		
		return sqlSession.insert("adminMapper.registerProductImage", map);
	}

	public int getListCount(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectOne("adminMapper.getListCount", map);
	}

	public ArrayList<Product> getProductList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, Object> map) {
		
			int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
			RowBounds rowBounds =new RowBounds(offset, pi.getBoardLimit());
		
		
		return (ArrayList)sqlSession.selectList("adminMapper.getProductList", map, rowBounds);
	}

	public ArrayList<Image> getProductImgList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.getProductImgList");
	}
	
	public int registerTaste(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.insert("adminMapper.registerTaste", map);
	}

	public ArrayList<ApplyTaste> getTasteList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, Object> map) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		System.out.println(map);
		return (ArrayList)sqlSession.selectList("adminMapper.selectTaste", map, rowBounds);
	}

	public int checkTasteIng(SqlSessionTemplate sqlSession, int productNo) {
		return sqlSession.selectOne("adminMapper.checkTasteIng", productNo);
	}

	public int endApplyTaste(SqlSessionTemplate sqlSession, int tasteNo) {
		return sqlSession.update("adminMapper.endApplyTaste", tasteNo);
	}
	
	public int updateTaste(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.update("adminMapper.updateTaste", map);
	}
	
	public int insertRequestProduct(SqlSessionTemplate sqlSession, ProductRequest pr) {
		
		return sqlSession.insert("adminMapper.insertRequestProduct",pr);
	}

	public ArrayList<ProductRequest> selectRequestProductList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, Object> map) {
		
		int offset = (pi.getCurrentPage() - 1) * (pi.getBoardLimit());
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.selectRequestProductList",map , rowBounds);
	}
	
	// 이미지 삭제
	public int delImage(SqlSessionTemplate sqlSession, HashMap<String, Object> imgMap) {
		return sqlSession.delete("adminMapper.delImage", imgMap);
	}	
	
	// 상품 업데이트
	public int updateProduct(SqlSessionTemplate sqlSession, Product product) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("product", product);
		int result = 0;
		sqlSession.insert("adminMapper.updateProduct", map);
		result = (int) map.get("result");
		
		System.out.println("result: " + result);
				
		return result;
	}
	
	// 사용자 게시물 삭제
	public int deleteUserBoard(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.update("adminMapper.deleteUserBoard", map);
	}

	// 시식신청 리스트 불러오기
	public ArrayList<ApplyTastePerson> getApplyPersonList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, Object> map) {
		
		int offset = (pi.getCurrentPage() - 1) * (pi.getBoardLimit());
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.getApplyPersonList", map, rowBounds);
	}
	
	// 관리자 게시글 삭제
	public int deleteAdminBoard(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		int result = 0;
		System.out.println(map);
		result = sqlSession.update("adminMapper.deleteAdminBoard", map);
		System.out.println(result);
		if(map.get("result") != null) {
			result = (int) map.get("result");
		}
		
		return result;
	}





	///// 김대열 끝
	
	
	
	/////김주희 
	//회워 리스트
	public ArrayList<Member> selectMember(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectMember");
	}
	//회원 상태 변경
	public int updateMember(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		
		return sqlSession.update("adminMapper.updateMember",map);
	}
	//회원 리스트 총 명 수
	public int memberCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.memberCount");
	}
	//회원 검색 
	public ArrayList<Member> searchMember(SqlSessionTemplate sqlSession, String search) {
		
		return (ArrayList)sqlSession.selectList("adminMapper.searchMember",search);
	}
	//회원 검색 총 명 수 
	public int searchCount(SqlSessionTemplate sqlSession, String search) {
		
		return sqlSession.selectOne("adminMapper.searchCount", search);
	}
	//관리자 로그인
	public Admin adminlogin(SqlSessionTemplate sqlSession, Admin admin) {
		
		return sqlSession.selectOne("adminMapper.selectAdmin", admin);
	}
	
	
	//관리자 등록
	public int insertAdmin(SqlSessionTemplate sqlSession, Admin admin) {
	
		return sqlSession.insert("adminMapper.insertAdmin", admin);
	}

	//아이디 중복확인
	public int adminCount(SqlSessionTemplate sqlSession, Admin admin) {
	
		return sqlSession.selectOne("adminMapper.adminCount",admin);
	}
	


	public ArrayList<Review> reviewList(SqlSessionTemplate sqlSession, PageInfo pi, String value) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.reviewList", value, rowBounds);
	}

	public ArrayList<ReviewImage> reviewImageList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.reviewImageList");
	}

	public ArrayList<Report> reportedList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, Object> map) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.reportedList", map, rowBounds);
	}

	public int reportCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.reportCount");
	}

	public int reportConfirm(SqlSessionTemplate sqlSession, Report rp) {
		return sqlSession.update("adminMapper.reportConfirm", rp);
	}

	public int getListCount(SqlSessionTemplate sqlSession, Integer reportNo) {
		return sqlSession.selectOne("adminMapper.reportListCount", reportNo);
	}

	public int reviewDelete(SqlSessionTemplate sqlSession, Review reviewList) {
		return sqlSession.update("adminMapper.reviewDelete", reviewList);
	}

	public int deleteReview(SqlSessionTemplate sqlSession, Review reviewList) {
		return sqlSession.update("adminMapper.deleteReview", reviewList);
	}






	/////김주희 끝




}
