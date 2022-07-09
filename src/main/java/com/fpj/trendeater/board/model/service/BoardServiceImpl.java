package com.fpj.trendeater.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fpj.trendeater.admin.model.vo.Image;
import com.fpj.trendeater.admin.model.vo.PageInfo;
import com.fpj.trendeater.admin.model.vo.Product;
import com.fpj.trendeater.board.model.dao.BoardDAO;

import com.fpj.trendeater.board.model.vo.PageInfo;
import com.fpj.trendeater.board.model.vo.Report;
import com.fpj.trendeater.board.model.vo.Review;
import com.fpj.trendeater.board.model.vo.ReviewImage;
import com.fpj.trendeater.board.model.vo.UserLike;

import com.fpj.trendeater.board.model.vo.ApplyTastePerson;
import com.fpj.trendeater.board.model.vo.Board;
import com.fpj.trendeater.board.model.vo.BoardQnA;
import com.fpj.trendeater.board.model.vo.EventBoard;


@Service("bSerivce")
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDAO bDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	// 리뷰게시판 상세보기
	@Override
	public Product selectPrBoard(int pno) {
		return bDAO.selectPrBoard(sqlSession, pno);
	}
	// 리뷰게시판 상세보기
	@Override
	public ArrayList<Image> selectPrImage(int pno) {
		return bDAO.selectPrImage(sqlSession, pno);
	}
	// 시식신청
	@Override
	public int registerApplyTaste(ApplyTastePerson applyPerson) {
		return bDAO.registerApplyTaste(sqlSession, applyPerson);
	}
	//시식신청 중복체크
	@Override
	public int dupCheckApply(HashMap<String, Object> map) {
		return bDAO.dupCheckApply(sqlSession, map);
	}

	
	// 스크랩
	@Override
	public int scrap(HashMap<String, Object> map) {
		return bDAO.scrap(sqlSession, map) ;
	}
	// 스크랩 여부 체크
	@Override
	public int checkScrap(HashMap<String, Object> map) {
		return bDAO.checkScrap(sqlSession, map);
	}
	// 리뷰 평점 점수별 갯수 카운트
	@Override
	public int[] getCountReviewPoint(HashMap<String, Object> countMap) {
		return bDAO.getCountReviewPoint(sqlSession, countMap);
	}



/********************************* notice *********************************/
	
	// Notice 읽기(조회) - 페이징처리1 :총게시물수 가져오기
	@Override
	public int getListCount() {
		return bDAO.getListCount(sqlSession);
	}

	//이용준
	@Override
	public int reviewCount() {
		return bDAO.reviewCount(sqlSession);
	}

	@Override
	public ArrayList<Review> getReviewList(PageInfo pi) {
		return bDAO.getReviewList(sqlSession, pi);
	}

	@Override
	public ArrayList<ReviewImage> getReviewImageList() {
		return bDAO.getReviewImageList(sqlSession);
	}

	@Override
	public int insertReview(Review r) {
		return bDAO.insertReview(sqlSession, r);
	}

	@Override
	public int insertReviewImage(ArrayList<ReviewImage> imageList) {
		return bDAO.insertReviewImage(sqlSession, imageList);
	}

	@Override
	public int reportReview(Report rep) {
		return bDAO.reportReview(sqlSession, rep);
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
	public int deleteBoardQna(int qnaNo) {
		return bDAO.deleteBoardQna(sqlSession, qnaNo);
	}

//	@Override
//	public int deleteBoardQna(BoardQnA b) {
//		return bDAO.deleteBoardQna(sqlSession, b);
//	}

	








/*********************************** admin **********************************/	
	
	@Override
	public Board adminNoticeSelect(Board b) {
		return bDAO.adminNoticeSelect(sqlSession, b);
	}

	@Override
	public ArrayList<BoardQnA> getBoardQnaListAdmin(PageInfo pi) {
		return bDAO.getBoardQnaListAdmin(sqlSession, pi);
	}






/***********************************************************************/	
	
/******************************** Event Management **********************************/	
	
	// EventManagement 읽기(조회) - 페이징처리1 :총게시물수 가져오기
	@Override
	public int getEListCount() {
		return bDAO.getEListCount(sqlSession);
	}
	
	// EventManagement 읽기(조회) - 페이징처리2 : 필요한 게시판 가져오기
	@Override
	public ArrayList<EventBoard> getEBoardList(PageInfo pi) {
		return bDAO.getEBoardList(sqlSession, pi);
	}
	

	
	//좋아요
	// 게시글 좋아요 count
		@Override
		public int likeCount(UserLike li) {
			return bDAO.likeCount(sqlSession, li);
		}
		
		// 게시글 좋아요
		@Override
		public int insertLike(UserLike like) {
			return bDAO.insertLike(sqlSession, like);
		}
		
		// 게시글 좋아요 취소
		@Override
		public int deleteLike(UserLike like) {
			return bDAO.deleteLike(sqlSession, like);
		}
		
		// 게시글 전체 좋아요 count
		@Override
		public ArrayList<UserLike>selectLikeCount(int reviewNo) {
			return bDAO.selectLikeCount(sqlSession, reviewNo);
		}
}
