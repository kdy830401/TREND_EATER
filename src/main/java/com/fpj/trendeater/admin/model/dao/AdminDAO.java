package com.fpj.trendeater.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fpj.trendeater.admin.model.vo.Admin;
import com.fpj.trendeater.admin.model.vo.ApplyTaste;
import com.fpj.trendeater.admin.model.vo.Image;
import com.fpj.trendeater.admin.model.vo.PageInfo;
import com.fpj.trendeater.admin.model.vo.Product;
import com.fpj.trendeater.admin.model.vo.ProductRequest;
import com.fpj.trendeater.member.model.vo.Member;

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
				
		return result;//sqlSession.insert("productMapper.registerProduct", product);
	}
	
	public int registerProductImage(SqlSessionTemplate sqlSession, ArrayList<Image> imageList, int i) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("list", imageList);
		map.put("identifyNo", i);
		
		return sqlSession.insert("adminMapper.registerProductImage", map);
	}

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.getListCount");
	}

	public ArrayList<Product> getProductList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds =new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("productMapper.getProductList", null, rowBounds);
	}

	public ArrayList<Image> getProductImgList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("productMapper.getProductImgList");
	}
	
	public int registerTaste(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.insert("adminMapper.registerTaste", map);
	}

	public ArrayList<ApplyTaste> getTasteList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectTaste");
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

	public ArrayList<ProductRequest> selectRequestProductList(SqlSessionTemplate sqlSession) {

		return (ArrayList)sqlSession.selectList("adminMapper.selectRequestProductList");
	}
	
	// 이미지 삭제
	public int delImage(SqlSessionTemplate sqlSession, int imgNo) {
		return sqlSession.delete("adminMapper.delImage", imgNo);
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
	
	// 상품 게시물 삭제
	public int deleteProductBoard(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.update("adminMapper.deleteProductBoard", map);
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






	/////김주희 끝




}
