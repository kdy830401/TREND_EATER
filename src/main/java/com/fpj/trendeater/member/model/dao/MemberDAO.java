package com.fpj.trendeater.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fpj.trendeater.admin.model.vo.PageInfo;
import com.fpj.trendeater.board.model.vo.ReviewImage;
import com.fpj.trendeater.board.model.vo.Scrap;
import com.fpj.trendeater.member.model.vo.LikeScrapList;
import com.fpj.trendeater.member.model.vo.Member;
import com.fpj.trendeater.member.model.vo.PointList;
import com.fpj.trendeater.member.model.vo.ReviewList;
import com.fpj.trendeater.member.model.vo.ScrapList;
import com.fpj.trendeater.order.model.vo.OrderStatus;

@Repository("mDAO")
public class MemberDAO {

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public Member login(SqlSessionTemplate sqlSession, Member m) {
		
	 return sqlSession.selectOne("memberMapper.loginMember", m);
		
		
		
	}

	public Member findId(SqlSessionTemplate sqlSession, Member m) {

		return  sqlSession.selectOne("memberMapper.findId", m);
		
		
	}

	public int findPwd(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
	
		return sqlSession.update("memberMapper.findPwd", map);
	}

	public int emailcheck2(SqlSessionTemplate sqlSession, String email) {
		
		return sqlSession.selectOne("memberMapper.emailcheck2", email);
		
		
	}

	public int updateInfo(SqlSessionTemplate sqlSession, Member m) {
	
		return sqlSession.update("memberMapper.updateInfo", m);
	}

	public Member selectMember(SqlSessionTemplate sqlSession, Member m) {
	
		return sqlSession.selectOne("memberMapper.selectMember", m);
	}

	public int countkakao(SqlSessionTemplate sqlSession, HashMap<String, Object> userInfo) {
		
		return sqlSession.selectOne("memberMapper.countkakao", userInfo);
	}

	public int insertKakao(SqlSessionTemplate sqlSession, HashMap<String, Object> userInfo) {
		
		return sqlSession.insert("memberMapper.insertkakao",userInfo);
	}

	public int countmember(SqlSessionTemplate sqlSession, HashMap<String, Object> userInfo) {
		
		return sqlSession.selectOne("memberMapper.countmember", userInfo);
	}

	public Member selectkakao(SqlSessionTemplate sqlSession, HashMap<String, Object> userInfo) {
		
		return sqlSession.selectOne("memberMapper.selectkakao",userInfo);
	}

	public int insertkakaomember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.insert("memberMapper.insertkakaomember", m);
	}

	public int deleteMember(SqlSessionTemplate sqlSession, Member member) {
		
		return sqlSession.update("memberMapper.deleteMember", member);
	}

	public ArrayList<Scrap> getMyScrapList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, Object> map) {
		int offset = (pi.getCurrentPage() - 1) * (pi.getBoardLimit());
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.getMyScrapList", map, rowBounds);
	}
	
	public int getReviewListCount(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.selectOne("memberMapper.getReviewListCount", email);
	}

	public ArrayList<ReviewList> getReviewList(SqlSessionTemplate sqlSession, PageInfo pi, String email) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

		return (ArrayList)sqlSession.selectList("memberMapper.getReviewList", email, rowBounds);
	}

	public int getReviewScrapListCount(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.selectOne("memberMapper.getReviewScrapListCount", email);
	}

	public ArrayList<LikeScrapList> getReviewScrapList(SqlSessionTemplate sqlSession, PageInfo pi, String email) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

		return (ArrayList)sqlSession.selectList("memberMapper.getReviewScrapList", email, rowBounds);
	}

	public int getScrapListCount(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.selectOne("memberMapper.getScrapListCount", email);
	}

	public ArrayList<ScrapList> getScrapList(SqlSessionTemplate sqlSession, PageInfo pi, String email) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

		return (ArrayList)sqlSession.selectList("memberMapper.getScrapList", email, rowBounds);
	}

	public ArrayList getAttendCheck(SqlSessionTemplate sqlSession, String email) {
		return (ArrayList)sqlSession.selectList("memberMapper.getAttendCheck", email);
	}

	public int insertAttendCheck(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.insert("memberMapper.insertAttendCheck", email);
	}

	public int insertAttendPoint(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.insert("memberMapper.insertAttendPoint", email);
	}

	public int deleteMyReview(SqlSessionTemplate sqlSession, int rNo) {
		return sqlSession.update("memberMapper.deleteMyReview", rNo);
	}

	public ArrayList<PointList> getPointList(SqlSessionTemplate sqlSession, String email) {
		return (ArrayList)sqlSession.selectList("memberMapper.getPointList", email);
	}

	public int deleteLikeScrap(SqlSessionTemplate sqlSession, int lNo) {
		return sqlSession.delete("memberMapper.deleteLikeScrap", lNo);
	}

	public int getPlusPoint(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.selectOne("memberMapper.getPlusPoint", email);
	}

	public int getMinusPoint(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.selectOne("memberMapper.getMinusPoint", email);
	}

	public String attendCheckTest(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.selectOne("memberMapper.attendCheckTest", email);
	}

	public ArrayList<ReviewImage> getReviewImageList(SqlSessionTemplate sqlSession, String email) {
		return (ArrayList)sqlSession.selectList("memberMapper.getReviewImageList", email);
	}

	public ArrayList<ReviewImage> getScrapReviewImageList(SqlSessionTemplate sqlSession, String email) {
		return (ArrayList)sqlSession.selectList("memberMapper.getScrapReviewImageList", email);
	}
	
	// 주문 내역
	// 1. 페이징
	public int getMyOrderListCount(SqlSessionTemplate sqlSession, String emailId) {
		return sqlSession.selectOne("memberMapper.getMyOrderListCount", emailId);
	}
	
	// 2. 주문 정보 받기
	// 2.1 주문 리스트 받기
	public ArrayList<OrderStatus> getMyOrderList(SqlSessionTemplate sqlSession, String emailId, PageInfo pi) {
		// 1. 건너뛸 페이지 수
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		
		// 2. Rowbounds
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());	
		return (ArrayList)sqlSession.selectList("memberMapper.myOrderList", emailId, rowBounds);
	}

	//회원가입 시 포인트 적립
	public int addPoint(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.insert("memberMapper.addPoint", m);
	
	}
	// 3. 사용자의 전체 주문 정보 받기
	public ArrayList<OrderStatus> getAllOrderList(SqlSessionTemplate sqlSession, String emailId) {
		return (ArrayList)sqlSession.selectList("memberMapper.getAllOrderList", emailId);

	}	
	
	public int updatePoint(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updatePoint", m);
	}
}
