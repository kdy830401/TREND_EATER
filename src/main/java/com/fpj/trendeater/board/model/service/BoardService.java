package com.fpj.trendeater.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.fpj.trendeater.admin.model.vo.Image;
import com.fpj.trendeater.admin.model.vo.PageInfo;
import com.fpj.trendeater.admin.model.vo.Product;

import com.fpj.trendeater.board.model.vo.ApplyTastePerson;

import com.fpj.trendeater.board.model.vo.Board;
import com.fpj.trendeater.board.model.vo.BoardQnA;


public interface BoardService {

	
	// 리뷰 게시판 상세보기
	Product selectPrBoard(int pno);

	// 리뷰 게시판 상세보기
	ArrayList<Image> selectPrImage(int pno);
	
	// 시식신청
	int registerApplyTaste(ApplyTastePerson applyPerson);
	
	//스크랩
	int scrap(HashMap<String, Object> map);
	
	// 스크랩 여부 체크
	int checkScrap(HashMap<String, Object> map);


/********************************** notice *********************************/	
	int getListCount(); // 페이징처리1 :총게시물수 가져오기
	ArrayList<Board> getBoardList(PageInfo pi);	// 페이징처리2 : 필요한 게시판 가져오기
	Board selectBoard(int bId);
	int insertNotice(Board b);	// notice(공지사항) 쓰기
	int updateNotice(Board b);	// notice(공지사항) 수정
	int deleteNotice(Board b);	// notice(공지사항) 삭제
	
/********************************** QnA *********************************/	
	int getQnaListCount();
	ArrayList<BoardQnA> getBoardQnaList(PageInfo pi);
	int insertBoardQna(BoardQnA b);		// 문의사항 게시판 글쓰기
	int updateBoardQna(BoardQnA b);
	int deleteBoardQna(BoardQnA b);

	



	


	
	
	
/***********************************************************************/	
	
	
}
