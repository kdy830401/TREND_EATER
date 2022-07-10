package com.fpj.trendeater.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.fpj.trendeater.admin.model.vo.Image;
import com.fpj.trendeater.admin.model.vo.PageInfo;
import com.fpj.trendeater.admin.model.vo.Product;
//import com.fpj.trendeater.board.model.vo.PageInfo;
import com.fpj.trendeater.board.model.vo.Report;
import com.fpj.trendeater.board.model.vo.Review;
import com.fpj.trendeater.board.model.vo.ReviewImage;
import com.fpj.trendeater.board.model.vo.UserLike;

import com.fpj.trendeater.board.model.vo.ApplyTastePerson;

import com.fpj.trendeater.board.model.vo.Board;
import com.fpj.trendeater.board.model.vo.BoardQnA;
import com.fpj.trendeater.board.model.vo.EventBoard;


public interface BoardService {

	
	// 리뷰 게시판 상세보기
	Product selectPrBoard(int pno);

	// 리뷰 게시판 상세보기
	ArrayList<Image> selectPrImage(int pno);
	

	//이용준
	int reviewCount();

	ArrayList<Review> getReviewList(PageInfo pi);

	ArrayList<ReviewImage> getReviewImageList();

	int insertReview(Review r);

//	int insertReviewImage(ArrayList<ReviewImage> imageList, int reviewNo);
	int insertReviewImage(ArrayList<ReviewImage> imageList);

	int reportReview(Report rep);

		// 게시글 좋아요 여부 카운트
		int likeCount(UserLike li);
		// 게시글 좋아요
		int insertLike(UserLike like);
		
		// 게시글 좋아요 취소
		int deleteLike(UserLike like);
		
		// 전체 좋아요 개수
		ArrayList<UserLike> selectLikeCount(int ReviewNo);

	// 시식신청
	int registerApplyTaste(ApplyTastePerson applyPerson);
	// 시식신청 중복 체크
	int dupCheckApply(HashMap<String, Object> map);
	
	//스크랩
	int scrap(HashMap<String, Object> map);
	
	// 스크랩 여부 체크
	int checkScrap(HashMap<String, Object> map);
	
	// 리뷰 평점 점수별 갯수 카운트
	int[] getCountReviewPoint(HashMap<String, Object> countMap);


/*********************************** notice *********************************/	
	int getListCount(); // 페이징처리1 :총게시물수 가져오기
	ArrayList<Board> getBoardList(PageInfo pi);	// 페이징처리2 : 필요한 게시판 가져오기
	Board selectBoard(Board b);
	int insertNotice(Board b);	// notice(공지사항) 쓰기
	int updateNotice(Board b);	// notice(공지사항) 수정
	int deleteNotice(Board b);	// notice(공지사항) 삭제
	
/*********************************** QnA ***********************************/	
	int getQnaListCount();
	ArrayList<BoardQnA> getBoardQnaList(PageInfo pi, BoardQnA b);
	int insertBoardQna(BoardQnA b);		// 문의사항 게시판 글쓰기
	BoardQnA selectBoardQna(BoardQnA b); // 수정을 위한 해당 id의 qna 전체 정보 받아오기
	int updateBoardQna(BoardQnA b);

	int deleteBoardQna(int qnaNo);

/*********************************** admin **********************************/	
	
	Board adminNoticeSelect(Board b);
	ArrayList<BoardQnA> getBoardQnaListAdmin(PageInfo pi);

	int deleteBoardQna(BoardQnA b);

	
/********************************** Event Management *********************************/	
	int getEListCount();	//페이징처리 1: 총게시물 수 
	ArrayList<EventBoard> getEBoardList(PageInfo pi);//페이징처리 2 : 이벤트관리목록 불러오기
	
	int insertEBoard(EventBoard b);// 이벤트 게시판 삽입 1 글내용 삽입
	int insertEImgList(ArrayList<Image> imageList); // 이벤트 게시판 삽입2 그림 내용 삽입
	int insertEcategory(Integer category);// 이벤트 게시판 삽입 3 :카테고리 삽입
	
	EventBoard selectEBoard(int eNo);//이벤트게시판 상세보기 1 : 글
	ArrayList<Image> selectEFiles(int eNo);//이벤트게시판 상세보기 2: 그림

	int updateEBoard(EventBoard b);//이벤트 게시판 수정하기 1 : 글
	int deleteEOriginImage(EventBoard b);//이벤트 게시판 수정하기 2: 새로운 이미지 삽입 시 원본이미지 삭제
	int reuploadEImage(ArrayList<Image> imageList);// 이벤트게시판 수정하기 3 : 새로운 이미지 삽입

	int eDeleteBoard(int eno);//이벤트 게시판 삭제 (Status=N 파일삭제는 안함 )
	
	
	







	
	
	
	
	
}
