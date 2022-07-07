package com.fpj.trendeater.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fpj.trendeater.admin.model.vo.Image;
import com.fpj.trendeater.admin.model.vo.PageInfo;
import com.fpj.trendeater.admin.model.vo.Product;

import com.fpj.trendeater.board.model.vo.ApplyTastePerson;

import com.fpj.trendeater.board.model.vo.Board;
import com.fpj.trendeater.board.model.vo.BoardQnA;


@Repository("bDAO")
public class BoardDAO {

	// 리뷰게시판 상세보기
	public Product selectPrBoard(SqlSessionTemplate sqlSession, int pno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.selectPrBoard", pno);
	}
	// 리뷰게시판 상세보기
	public ArrayList<Image> selectPrImage(SqlSessionTemplate sqlSession, int pno) {
		return (ArrayList) sqlSession.selectList("boardMapper.selectPrImage", pno);
	}
	// 시식신청
	public int registerApplyTaste(SqlSessionTemplate sqlSession, ApplyTastePerson applyPerson) {
		return sqlSession.insert("boardMapper.registerApplyTaste", applyPerson);
	}
	// 시식신청 중복 체크
	public int dupCheckApply(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectOne("boardMapper.dupCheckApply", map);
	}
	
	// 스크랩 
	public int scrap(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		
		System.out.println(map);

		int checkNum = sqlSession.selectOne("boardMapper.checkScrap", map);
		
		int result = 0;
		if(checkNum > 0) {
			result = sqlSession.delete("boardMapper.deleteScrap", map);
			if(result > 0) {
				result = 2;
			}
		} else {
			result = sqlSession.insert("boardMapper.insertScrap", map);
			
		}
		
		return result; 
	}
	// 스크랩 체크
	public int checkScrap(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.checkScrap", map);
	}
	
	// 리뷰 평점 점수별 갯수 카운트
	public int[] getCountReviewPoint(SqlSessionTemplate sqlSession, HashMap<String, Object> countMap) {
		
		int[] resultArr = new int[5];
		int arr = 0;
		for(int i = 1; i <= 5; i++) {
			arr = i;
			System.out.println("arr;"+ arr);
			countMap.put("arr",arr);
			resultArr[i-1] = sqlSession.selectOne("boardMapper.getCountReviewPoint", countMap);
			System.out.println("result:"+resultArr[i-1]);
		}
		
		return resultArr;
	}



	

	
/********************************* notice *********************************/
	
	// Notice 읽기(조회) - 페이징처리1 :총게시물수 가져오기
	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.getListCount");
	}

	// Notice 읽기(조회) - 페이징처리2 : 원하는 게시판 번호 조회
	public ArrayList<Board> getBoardList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());  // 임포트 RowBounds 
		
		return (ArrayList)sqlSession.selectList("boardMapper.getBoardList", null, rowBounds);
	}
	
	// Notice 상세보기
	public int addReadCount(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.update("boardMapper.addReadCount",bId);
	}
	public Board selectBoard(SqlSessionTemplate sqlSession, int bId) {
		return sqlSession.selectOne("boardMapper.selectBoard",bId);
	}
	
	// Notice 쓰기
	public int insertNotice(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.insertNotice",b);
	}
	
	// Notice 수정
	public int updateNotice(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.update("boardMapper.updateNotice",b);
	}

	// Notice 삭제
	public int deleteNotice(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.update("boardMapper.deleteNotice",b);
	}
	
/*************************** QnA ***************************/ 	
	
	public int getQnaListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.getQnaListCount");
	}

	public ArrayList<BoardQnA> getBoardQnaList(SqlSessionTemplate sqlSession, PageInfo pi, BoardQnA b) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.getBoardQnaList", b, rowBounds);
//		return (ArrayList)sqlSession.selectList("boardMapper.getBoardQnaList", null, rowBounds);
	}

	// QnA 쓰기
	public int insertBoardQna(SqlSessionTemplate sqlSession, BoardQnA b) {
		return sqlSession.insert("boardMapper.insertBoardQna",b);
	}
	// 수정을 위한 해당 id의 qna 전체 정보 받아오기
	public BoardQnA selectBoardQna(SqlSessionTemplate sqlSession, BoardQnA b) {
		return sqlSession.selectOne("boardMapper.selectBoardQna", b); // selectOne : 0 or 1 // selectList : 2개이상
	}
	
	// QnA 수정
	public int updateBoardQna(SqlSessionTemplate sqlSession, BoardQnA b) {
		int a = sqlSession.update("boardMapper.updateBoardQna",b);
		System.out.println("dao="+a);
		return sqlSession.update("boardMapper.updateBoardQna",b);
	}
//	public int updateBoardQna(SqlSessionTemplate sqlSession, int qnaNo) {
//		return sqlSession.update("boardMapper.updateBoardQna",qnaNo);
//	}
	// QnA 삭제
	public int deleteBoardQna(SqlSessionTemplate sqlSession, BoardQnA b) {	// delete도 가능.  status='N'으로 변경 
		return sqlSession.update("boardMapper.deleteBoardQna",b);
	}


	

	
	
/***************************   ***************************/ 
	
	
	
	
}
