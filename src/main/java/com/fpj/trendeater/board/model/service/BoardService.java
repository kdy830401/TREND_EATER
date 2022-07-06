package com.fpj.trendeater.board.model.service;

import java.util.ArrayList;

import com.fpj.trendeater.admin.model.vo.Image;
import com.fpj.trendeater.admin.model.vo.PageInfo;
import com.fpj.trendeater.admin.model.vo.Product;
import com.fpj.trendeater.board.model.vo.Board;
import com.fpj.trendeater.board.model.vo.BoardQnA;

public interface BoardService {

	Product selectPrBoard(int pno);

	ArrayList<Image> selectPrImage(int pno);


/********************************** notice *********************************/	
	int getListCount(); // 페이징처리1 :총게시물수 가져오기
	ArrayList<Board> getBoardList(PageInfo pi);	// 페이징처리2 : 필요한 게시판 가져오기
	Board selectBoard(int bId);
	int insertNotice(Board b);	// notice(공지사항) 쓰기
	int updateNotice(Board b);	// notice(공지사항) 수정
	int deleteNotice(Board b);	// notice(공지사항) 삭제
	
/********************************** QnA *********************************/	
	int getQnaListCount();
	ArrayList<BoardQnA> getBoardQnaList(PageInfo pi, BoardQnA b);
	int insertBoardQna(BoardQnA b);		// 문의사항 게시판 글쓰기
	BoardQnA selectBoardQna(BoardQnA b); // 수정을 위한 해당 id의 qna 전체 정보 받아오기
	int updateBoardQna(BoardQnA b);
	int deleteBoardQna(BoardQnA b);


	
	
	
/***********************************************************************/	
	
	
}
