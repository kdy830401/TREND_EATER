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
import com.fpj.trendeater.admin.model.vo.ProductRequest;
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


@Repository("bDAO")
public class BoardDAO {

	// 리뷰게시판 상세보기
	public Product selectPrBoard(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.selectPrBoard", map);
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
		
//		System.out.println(map);

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
//			System.out.println("arr;"+ arr);
			countMap.put("arr",arr);
			resultArr[i-1] = sqlSession.selectOne("boardMapper.getCountReviewPoint", countMap);
//			System.out.println("result:"+resultArr[i-1]);
		}
		
		return resultArr;
	}



	//이용준
	public int reviewCount(SqlSessionTemplate sqlSession, Integer productNo) {
		return sqlSession.selectOne("boardMapper.reviewCount", productNo);
	}

	public ArrayList<Review> getReviewList(SqlSessionTemplate sqlSession, PageInfo pi, Integer productNo, String value) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("productNo", productNo);
		map.put("value",value);
		return (ArrayList)sqlSession.selectList("boardMapper.getReviewList", map, rowBounds);
	}
	

	public ArrayList<ReviewImage> getReviewImageList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("boardMapper.getReviewImageList");
	}


	public int insertReview(SqlSessionTemplate sqlSession, Review r) {
		return sqlSession.insert("boardMapper.insertReview", r);
	}


	public int insertReviewImage(SqlSessionTemplate sqlSession, ArrayList<ReviewImage> imageList) {
		int imgResult = 0;
		System.out.println(imageList.size());
		
		for(ReviewImage r :  imageList ) {
		imgResult += sqlSession.insert("boardMapper.insertReviewImage", r);
		}
		System.out.println(imgResult);
		return imgResult;
	}
	public int reviewCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.reviewCount");
	}



	public int reportReview(SqlSessionTemplate sqlSession, Report rep) {
		return sqlSession.insert("boardMapper.reportReview", rep);
	}
	
	// 회원의 좋아요 리뷰 리스트 불러오기
	public ArrayList<UserLike> userLikeSelect(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		
		return (ArrayList)sqlSession.selectList("boardMapper.userLikeSelect", map);
	}
	
	public int reviewLike(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		
		int checkCount = sqlSession.selectOne("boardMapper.likeCheck", map);
		int result = 0;
		if( checkCount > 0) {
			result = sqlSession.delete("boardMapper.deleteLike", map);
			if(result > 0) {
				result = 2;
			}
		} else {
			result = sqlSession.delete("boardMapper.insertLike", map);
		}
	
	return result;
	
	}
	
	//특정 회원 리뷰 보기
	public int someReviewCount(SqlSessionTemplate sqlSession, String nickName) {
		return sqlSession.selectOne("boardMapper.someReviewCount", nickName);
	}
//	public ArrayList<Review> someReviewList(SqlSessionTemplate sqlSession, PageInfo pi) {
//		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
//		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
//		return (ArrayList)sqlSession.selectList("boardMapper.someReviewList", null, rowBounds);
//	}
	public ArrayList<Review> someReviewList(SqlSessionTemplate sqlSession, PageInfo pi,String nickName) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.someReviewList", nickName, rowBounds);
	}
	public ArrayList<ReviewImage> someReviewImageList(SqlSessionTemplate sqlSession, ArrayList<Review> reviewList) {
		ArrayList<ReviewImage> reviewImageList = new ArrayList<ReviewImage>();
		for(int i = 0; i < reviewList.size(); i++) {
		ArrayList<ReviewImage> ri = (ArrayList)sqlSession.selectList("boardMapper.someReviewImageList",reviewList.get(i));
		System.out.println("ri : " + ri);
		reviewImageList.addAll(ri);
		}
		
		return reviewImageList;
	}
	
	//===============================이용준=================================================================
	
	




	
	




	

	
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
	public int addReadCount(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.update("boardMapper.addReadCount",b);
	}
	public Board selectBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.selectOne("boardMapper.selectBoard",b);
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
	public int deleteBoardQna(SqlSessionTemplate sqlSession, int qnaNo) {	// delete도 가능.  status='N'으로 변경 
		int a = sqlSession.update("boardMapper.deleteBoardQna",qnaNo);
		System.out.println("dao="+a);
		return sqlSession.update("boardMapper.deleteBoardQna",qnaNo);
	}
//	public int deleteBoardQna(SqlSessionTemplate sqlSession, BoardQnA b) {	// delete도 가능.  status='N'으로 변경 
//		int a = sqlSession.update("boardMapper.deleteBoardQna",b);
//		System.out.println("dao="+a);
//		return sqlSession.update("boardMapper.deleteBoardQna",b);
//	}
	
	
/*********************************** admin **********************************/	
	public Board adminNoticeSelect(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.selectOne("boardMapper.adminNoticeSelect",b);
	}
	public ArrayList<BoardQnA> getBoardQnaListAdmin(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());  // 임포트 RowBounds 
		return (ArrayList)sqlSession.selectList("boardMapper.getBoardQnaListAdmin", null, rowBounds);
	}
	public int adminQnaAnsWrite(SqlSessionTemplate sqlSession, Reply reply) {
		return sqlSession.insert("boardMapper.adminQnaAnsWrite",reply);
	}

	public Reply adminQnaAnsSelect(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.selectOne("boardMapper.adminQnaAnsSelect", r);
	}
	
	public int adminQnaAnsUpdate(SqlSessionTemplate sqlSession, int replyNo) {
		return sqlSession.update("boardMapper.adminQnaAnsUpdate", replyNo);
	}
	
	public int adminQnaAnsDelete(SqlSessionTemplate sqlSession, int replyNo) {
		return sqlSession.update("boardMapper.adminQnaAnsDelete", replyNo);
	}


	

	
	
/*************************** EventBoard   ***************************/ 
	
	
	// EventManageMent 읽기(조회) - 페이징처리1 :총게시물수 가져오기
	public int getEListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.getEListCount");
	}
	
	//페이징처리 2 : 이벤트관리목록 불러오기
	public ArrayList<EventBoard> getEBoardList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.getEBoardList", null, rowBounds);
	}
	public ArrayList<Reply> getQnaReplyListAdmin(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("boardMapper.getQnaReplyListAdmin");
	}

	// 이벤트 게시판 삽입 1 글내용 삽입
	public int insertEBoard(SqlSessionTemplate sqlSession, EventBoard b) {
		
		return sqlSession.insert("boardMapper.insertEBoard", b);
	}
	
	// 이벤트 게시판 삽입2 그림 내용 삽입 
	public int insertEImgList(SqlSessionTemplate sqlSession, ArrayList<Image> imageList) {
		int imgResult = 0;
		for(int i = 0; i < imageList.size(); i ++) {
			 sqlSession.insert("boardMapper.insertEImgList", imageList.get(i));
			 imgResult++;
		}
		return imgResult;
	}
	
	//이벤트 게시판 삽입 3 카테고리 삽입
	public int insertEcategory(SqlSessionTemplate sqlSession, Integer category) {
		
		return sqlSession.insert("boardMapper.insertECategory", category);
	}
	
	//이벤트게시판 1 상세보기시  조회수 증가
	public int addEReadCount(SqlSessionTemplate sqlSession, int eNo) {
		return sqlSession.update("boardMapper.addEReadCount", eNo);
		
	}
	//이벤트게시판 2 상세보기 글내용
	public EventBoard selectEBoard(SqlSessionTemplate sqlSession, int eNo) {
		
		return sqlSession.selectOne("boardMapper.selectEBoard", eNo);
	}
	//이벤트게시판 3 상세보기 그림내용
	public ArrayList<Image> selectEFiles(SqlSessionTemplate sqlSession, int eNo) {
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectEFiles", eNo);
	}
	//이벤트게시판 수정 1 :글내용
	public int updateEBoard(SqlSessionTemplate sqlSession, EventBoard b) {
		return sqlSession.update("boardMapper.updateEBoard", b);
	}
	//이벤트게시판 수정 2: 원본이미지 삭제
	public int deleteEOriginImage(SqlSessionTemplate sqlSession, EventBoard b) {
		return sqlSession.delete("boardMapper.deleteEOriginImage", b);
	}
	//이벤트게시판 수정 3: 새로운 이미지 삽입
	public int reuploadEImage(SqlSessionTemplate sqlSession, ArrayList<Image> imageList) {
		 int imgResult =0; 
		 for(int i = 0; i<imageList.size(); i++) {
		  sqlSession.insert("boardMapper.reuploadEImage", imageList.get(i));
		  imgResult++; 
		  }
		 return imgResult;
		 
	}
	//이벤트게시판 글삭제
	public int eDeleteBoard(SqlSessionTemplate sqlSession, int eno) {
		return sqlSession.update("boardMapper.eDeleteBoard", eno);
	}


	

	//메인에서 최근 5개 이벤트게시판 게시글 가져오기
	public ArrayList<EventBoard> getRecentEboard(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("boardMapper.getRecentEboard");
	}
	//메인 최신글 그림 불러오기
	public ArrayList<Image> getEImgList(SqlSessionTemplate sqlSession, ArrayList<EventBoard> eventB) {
		// TODO Auto-generated method stub
		
		ArrayList<Image> imgList = new ArrayList<>();
		for(int i =0; i < eventB.size(); i++) {
			int boardNo = eventB.get(i).getBoardNo();
			Image img =	sqlSession.selectOne("boardMapper.getEImgList", boardNo);
			imgList.add(img);
		}
		
		return imgList;
	}
	//메인 최신제품 목록 불러오기
	public ArrayList<Product> getNewProucts(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("boardMapper.getNewProucts");
	}
	//메인 최신제품 이미지 불러오기
	public ArrayList<Image> getNewPImages(SqlSessionTemplate sqlSession, ArrayList<Product> pList) {
		ArrayList<Image> imgList = new ArrayList<>();
		for(int i =0; i < pList.size(); i++) {
			int ProductNo = pList.get(i).getProductNo();
			Image img =	sqlSession.selectOne("boardMapper.getNewPImages", ProductNo);
			imgList.add(img);
		}
		
		return imgList;
	}
	//메인 베스트상품 불러오기
	public ArrayList<Product> getbProducts(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("boardMapper.getbProducts");
	}
	//메인 베스트 상품 이미지 불러오기
	public ArrayList<Image> getbImgList(SqlSessionTemplate sqlSession, ArrayList<Product> bProducts) {
		ArrayList<Image> imgList = new ArrayList<>();
		for(int i =0; i < bProducts.size(); i++) {
			int ProductNo = bProducts.get(i).getProductNo();
			Image img =	sqlSession.selectOne("boardMapper.getbImgList", ProductNo);
			imgList.add(img);
		}
		return imgList;
	}
	//메인페이지 좋아요가장 많은 리뷰 내용불러오기
	public ArrayList<Review> getbReview(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("boardMapper.getbReview") ;
	}
	//메인페이지 리뷰이미지 불러오기
	public ArrayList<ReviewImage> getbRImage(SqlSessionTemplate sqlSession, ArrayList<Review> bReview) {
		ArrayList<ReviewImage> imgList = new ArrayList<>();
		for(int i =0; i < bReview.size(); i++) {
			int reviewNo = bReview.get(i).getReviewNo();
			ReviewImage img =	sqlSession.selectOne("boardMapper.getbRImgList", reviewNo);
			imgList.add(img);
		}
		
		return imgList;
	}

	
	
	
	

	
	
	
	
	
	
	
	
}
