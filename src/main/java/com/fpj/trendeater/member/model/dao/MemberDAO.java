package com.fpj.trendeater.member.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fpj.trendeater.member.model.vo.Member;

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

}
