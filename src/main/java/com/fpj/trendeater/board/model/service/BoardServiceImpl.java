package com.fpj.trendeater.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fpj.trendeater.admin.model.vo.Image;
import com.fpj.trendeater.admin.model.vo.Product;
import com.fpj.trendeater.board.model.dao.BoardDAO;
import com.fpj.trendeater.board.model.vo.ApplyTastePerson;

@Service("bSerivce")
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDAO bDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public Product selectPrBoard(int pno) {
		return bDAO.selectPrBoard(sqlSession, pno);
	}

	@Override
	public ArrayList<Image> selectPrImage(int pno) {
		return bDAO.selectPrImage(sqlSession, pno);
	}

	@Override
	public int registerApplyTaste(ApplyTastePerson applyPerson) {
		return bDAO.registerApplyTaste(sqlSession, applyPerson);
	}

	
	
}
