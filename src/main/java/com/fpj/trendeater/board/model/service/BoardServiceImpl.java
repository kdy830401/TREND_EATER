package com.fpj.trendeater.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fpj.trendeater.admin.model.vo.Image;
import com.fpj.trendeater.admin.model.vo.PageInfo;
import com.fpj.trendeater.admin.model.vo.Product;
import com.fpj.trendeater.board.model.dao.BoardDAO;
import com.fpj.trendeater.board.model.vo.Board;
import com.fpj.trendeater.board.model.vo.BoardQnA;

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


/********************************* notice *********************************/
	
	// Notice 읽기(조회) - 페이징처리1 :총게시물수 가져오기
	@Override
	public int getListCount() {
		return bDAO.getListCount(sqlSession);
	}

	// Notice 읽기(조회) - 페이징처리2 : 필요한 게시판 가져오기
	@Override
	public ArrayList<Board> getBoardList(PageInfo pi) {
		return bDAO.getBoardList(sqlSession, pi);
	}
	
	// Notice 상세보기
   @Override
   @Transactional
   public Board selectBoard(int bId) {
      int result = bDAO.addReadCount(sqlSession, bId);
      
      Board b = null;
      if(result > 0 ) {
         b = bDAO.selectBoard(sqlSession,bId);
      }
      return b;
   }
   	
   // Notice 쓰기
   @Override
   public int insertNotice(Board b) {
	   return bDAO.insertNotice(sqlSession, b);
   }
   
   // Notice 수정
	@Override
	public int updateNotice(Board b) {
		return bDAO.updateNotice(sqlSession, b);
	}
	
	// Notice 삭제
	@Override
	public int deleteNotice(Board b) {
		return bDAO.deleteNotice(sqlSession, b);
	}

/******************************** QnA **********************************/
	
	// Qna 읽기(조회) - 페이징처리1 :총게시물수 가져오기
	@Override
	public int getQnaListCount() {
		return bDAO.getQnaListCount(sqlSession);
	}
	// Qna 읽기(조회) - 페이징처리2 : 필요한 게시판 가져오기
	@Override
	public ArrayList<BoardQnA> getBoardQnaList(PageInfo pi, BoardQnA b) {
		return bDAO.getBoardQnaList(sqlSession, pi, b);
	}
	
	// QnA 쓰기
	@Override
	public int insertBoardQna(BoardQnA b) {
		return bDAO.insertBoardQna(sqlSession, b);
	}

	// 수정을 위한 해당 id의 qna 전체 정보 받아오기
	@Override
	public BoardQnA selectBoardQna(BoardQnA b) {
		return bDAO.selectBoardQna(sqlSession, b);
	}

   	// QnA 수정 
	@Override
	public int updateBoardQna(BoardQnA b) {
		return bDAO.updateBoardQna(sqlSession, b);
	}
//	@Override
//	public int updateBoardQna(int qnaNo) {
//		return bDAO.updateBoardQna(sqlSession, qnaNo);
//	}

	// QnA 삭제 
	@Override
	public int deleteBoardQna(BoardQnA b) {
		return bDAO.deleteBoardQna(sqlSession, b);
	}










/***********************************************************************/	
	
}
