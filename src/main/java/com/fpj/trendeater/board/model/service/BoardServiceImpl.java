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

//import com.fpj.trendeater.board.model.vo.PageInfo;
import com.fpj.trendeater.board.model.vo.Report;
import com.fpj.trendeater.board.model.vo.Review;
import com.fpj.trendeater.board.model.vo.ReviewImage;
import com.fpj.trendeater.board.model.vo.UserLike;

import com.fpj.trendeater.board.model.vo.ApplyTastePerson;
import com.fpj.trendeater.board.model.vo.Board;
import com.fpj.trendeater.board.model.vo.BoardQnA;
import com.fpj.trendeater.board.model.vo.EventBoard;
import com.fpj.trendeater.board.model.vo.Reply;

@Service("bSerivce")
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDAO bDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	// 리뷰게시판 상세보기
	@Override
	public Product selectPrBoard(HashMap<String, Object> map) {
		return bDAO.selectPrBoard(sqlSession, map);
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
	public int reviewCount(Integer productNo) {
		return bDAO.reviewCount(sqlSession, productNo);
	}
	


	@Override
	public ArrayList<Review> getReviewList(PageInfo pi, Integer productNo, String value) {
		return bDAO.getReviewList(sqlSession, pi, productNo, value);
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


	@Override
	public ArrayList<UserLike> userLikeSelect(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return bDAO.userLikeSelect(sqlSession,map);
	}
	@Override
	public int reviewLike(HashMap<String, Object> map) {
		return bDAO.reviewLike(sqlSession, map);
	}
	
	



	//특정 회원 리뷰 
	@Override
	public int someReviewCount(String nickName) {
		return bDAO.someReviewCount(sqlSession,nickName);
	}
//	@Override
//	public ArrayList<Review> someReviewList(PageInfo pi) {
//		return bDAO.someReviewList(sqlSession, pi);
//	}
	@Override
	public ArrayList<Review> someReviewList(PageInfo pi, String nickName) {
		return bDAO.someReviewList(sqlSession, pi, nickName);
	}
	@Override
	public ArrayList<ReviewImage> someReviewImageList(ArrayList<Review> reviewList) {
		return bDAO.someReviewImageList(sqlSession, reviewList);
	}

	


	// Notice 읽기(조회) - 페이징처리2 : 필요한 게시판 가져오기
	@Override
	public ArrayList<Board> getBoardList(PageInfo pi) {
		return bDAO.getBoardList(sqlSession, pi);
	}
	
	// Notice 상세보기
   @Override
   @Transactional
   public Board selectBoard(Board b) {
      int result = bDAO.addReadCount(sqlSession, b);

      if(result > 0 ) {
         b = bDAO.selectBoard(sqlSession, b);
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

	// QnA 삭제 
	@Override
	public int deleteBoardQna(int qnaNo) {
		return bDAO.deleteBoardQna(sqlSession, qnaNo);
	}


/*********************************** admin **********************************/	
	
	@Override
	public Board adminNoticeSelect(Board b) {
		return bDAO.adminNoticeSelect(sqlSession, b);
	}

	@Override
	public ArrayList<BoardQnA> getBoardQnaListAdmin(PageInfo pi) {
		return bDAO.getBoardQnaListAdmin(sqlSession, pi);
	}

	@Override
	public int adminQnaAnsWrite(Reply reply) {
		return bDAO.adminQnaAnsWrite(sqlSession, reply);
	}
	@Override
	public ArrayList<Reply> getQnaReplyListAdmin() {
		return bDAO.getQnaReplyListAdmin(sqlSession);
	}
	// 답변 수정 : 수정폼을 위한 데이터 조회
	@Override
	public Reply adminQnaAnsSelect(Reply r) {
		return bDAO.adminQnaAnsSelect(sqlSession, r);
	}
	// 답변 수정
	@Override
	public int adminQnaAnsUpdate(int replyNo) {
		return bDAO.adminQnaAnsUpdate(sqlSession, replyNo);
	}
	// 답변 삭제
	@Override
	public int adminQnaAnsDelete(int replyNo) {
		return bDAO.adminQnaAnsDelete(sqlSession, replyNo);
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


	// 이벤트 게시판 삽입 1 글내용 삽입
	@Override
	public int insertEBoard(EventBoard b) {
		return bDAO.insertEBoard(sqlSession, b);
	}
	
	// 이벤트 게시판 삽입2 그림 내용 삽입 
	@Override
	public int insertEImgList(ArrayList<Image> imageList) {
		return bDAO.insertEImgList(sqlSession, imageList);
	}
	
	//이벤트 게시판 삽입 3 카테고리 삽입
	@Override
	public int insertEcategory(Integer category) {
		return bDAO.insertEcategory(sqlSession, category);
	}
	
	//이벤트게시판 상세보기 1 : 글
	@Override
	public EventBoard selectEBoard(int eNo) {
		//조회수증가 
		int result = bDAO.addEReadCount(sqlSession, eNo);
		EventBoard b = null;
		if(result >0 ) {
			b = bDAO.selectEBoard(sqlSession, eNo);// 글내용 불러오기
		}
		return b;
	}
	
	//이벤트게시판 상세보기 2 : 그림
	@Override
	public ArrayList<Image> selectEFiles(int eNo) {
		return bDAO.selectEFiles(sqlSession, eNo);
	}
	
	//이벤트 게시판 수정하기 1 : 글
	@Override
	public int updateEBoard(EventBoard b) {
		return bDAO.updateEBoard(sqlSession, b);
	}
	
	//이벤트 게시판 수정하기 2: 새로운 이미지 삽입 시 원본이미지 삭제
	@Override
	public int deleteEOriginImage(EventBoard b) {
		return bDAO.deleteEOriginImage(sqlSession, b);
		
	}
	
	// 이벤트게시판 수정하기 3 : 새로운 이미지 삽입
	@Override
	public int reuploadEImage(ArrayList<Image> imageList) {
		return bDAO.reuploadEImage(sqlSession, imageList);
		
	}
	
	//이벤트 게시판 삭제 (Status=N 파일삭제는 안함 )
	@Override
	public int eDeleteBoard(int eno) {
		return bDAO.eDeleteBoard(sqlSession, eno);
	}



/******************************MAIN*****************************************/
	//이벤트게시판 최근 글 불러오기 
	@Override
	public ArrayList<EventBoard> getRecentEboard() {
		return bDAO.getRecentEboard(sqlSession);
	}
	
	//메인 최신글 그림 불러오기
	@Override
	public ArrayList<Image> getEImgList(ArrayList<EventBoard> eventB) {
		return bDAO.getEImgList(sqlSession, eventB);
	}
	
	//메인 최신제품 불러오기
	@Override
	public ArrayList<Product> getNewProducts() {
		return bDAO.getNewProucts(sqlSession);
	}

	//메인 최신제품 이미지 불러오기
	@Override
	public ArrayList<Image> getNewPImages(ArrayList<Product> pList) {
		return bDAO.getNewPImages(sqlSession, pList);
	}
	//메인 베스트상품 불러오기
	@Override
	public ArrayList<Product> getbProducts() {
		return bDAO.getbProducts(sqlSession);
	}
	//메인 베스트상품 이미지 불러오기
	@Override
	public ArrayList<Image> getbImgList(ArrayList<Product> bProducts) {
		return bDAO.getbImgList(sqlSession, bProducts);
	}
	
	//메인페이지 좋아요가장 많은 리뷰 내용불러오기
	@Override
	public ArrayList<Review> getbReview() {
		return bDAO.getbReview(sqlSession);
	}
	//메인페이지 리뷰이미지 불러오기
	@Override
	public ArrayList<ReviewImage> getbRImage(ArrayList<Review> bReview) {
		return bDAO.getbRImage(sqlSession, bReview);
	}
	
	

	
/***********************************************************************/

		
		
		


}
