package com.fpj.trendeater.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.fpj.trendeater.admin.model.vo.PageInfo;
import com.fpj.trendeater.board.model.vo.ReviewImage;
import com.fpj.trendeater.board.model.vo.Scrap;
import com.fpj.trendeater.member.model.vo.LikeScrapList;
import com.fpj.trendeater.member.model.vo.Member;
import com.fpj.trendeater.member.model.vo.PointList;
import com.fpj.trendeater.member.model.vo.ReviewList;
import com.fpj.trendeater.member.model.vo.ScrapList;
import com.fpj.trendeater.order.model.vo.OrderStatus;

public interface MemberService {

	int insertMember(Member m);

	Member login(Member m);


	Member findId(Member m);

	int findPwd(HashMap<String, String> map);

	int emailcheck2(String email);

	int updateInfo(Member m);

	Member selectMember(Member m);

	String getAccessToken(String code);

	HashMap<String, Object> getUserInfo(String access_Token);

	int countkakao(HashMap<String, Object> userInfo);

	int insertKakao(HashMap<String, Object> userInfo);

	int countmember(HashMap<String, Object> userInfo);

	Member selectkakao(HashMap<String, Object> userInfo);

	int insertkakaoMember(Member m);

	void kakaoLogout(String access_Token);

	void unlink(String attribute);

	int deleteMember(Member member);

	ArrayList<Scrap> getMyScrapList(PageInfo pi, HashMap<String, Object> map);

	int getReviewListCount(String email);

	ArrayList<ReviewList> getReviewList(PageInfo pi, String email);

	int getReviewScrapListCount(String email);

	ArrayList<LikeScrapList> getReviewScrapList(PageInfo pi, String email);

	int getScrapListCount(String email);

	ArrayList<ScrapList> getScrapList(PageInfo pi, String email);

	ArrayList getAttendCheck(String email);

	int insertAttendCheck(String email);

	int insertAttendPoint(String email);

	int deleteMyReview(int rNo);

	ArrayList<PointList> getPointList(String email);

	int deleteLikeScrap(int lNo);

	int getPlusPoint(String email);

	int getMinusPoint(String email);

	String attendCheckTest(String email);

	ArrayList<ReviewImage> getReviewImageList(String email);

	ArrayList<ReviewImage> getScrapReviewImageList(String email);

	// 주문 내역
	// 1. 페이징
	int getMyOrderListCount(String emailId);
	
	// 2. 주문 정보 받기
	ArrayList<OrderStatus> getMyOrderList(String emailId, PageInfo pi);

	int addPoint(Member m);

	
	// 3. 사용자의 전체 주문 정보 받기
	ArrayList<OrderStatus> getAllOrderList(String emailId);

	int updatePoint(Member m);
	
}
