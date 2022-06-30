package com.fpj.trendeater.member.model.service;

import java.util.HashMap;

import com.fpj.trendeater.member.model.vo.Member;

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


	
}
