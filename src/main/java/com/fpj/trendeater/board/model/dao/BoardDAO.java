package com.fpj.trendeater.board.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fpj.trendeater.admin.model.vo.Image;
import com.fpj.trendeater.admin.model.vo.Product;

@Repository("bDAO")
public class BoardDAO {

	public Product selectPrBoard(SqlSessionTemplate sqlSession, int pno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.selectPrBoard", pno);
	}

	public ArrayList<Image> selectPrImage(SqlSessionTemplate sqlSession, int pno) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectPrImage", pno);
	}

}
