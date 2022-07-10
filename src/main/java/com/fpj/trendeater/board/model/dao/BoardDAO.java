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


	//이용준
	public int reviewCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.reviewCount");
	}

	public ArrayList<Review> getReviewList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.getReviewList", null, rowBounds);
	}

	public ArrayList<ReviewImage> getReviewImageList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("boardMapper.getReviewImageList");
	}

	public int insertReview(SqlSessionTemplate sqlSession, Review r) {
		return sqlSession.insert("boardMapper.insertReview", r);
	}


	public int insertReviewImage(SqlSessionTemplate sqlSession, ArrayList<ReviewImage> imageList) {
		int imgResult = 0;
		for(int i = 0; i <imageList.size(); i++) {
			sqlSession.insert("boardMapper.insertReviewImage", imageList.get(i));
			imgResult++;
		}
		return imgResult;
	}

	public int reportReview(SqlSessionTemplate sqlSession, Report rep) {
		return sqlSession.insert("boardMapper.reportReview", rep);
	}
	
	// 좋아요
	// 게시글 좋아요 count
		public int likeCount(SqlSessionTemplate sqlSession, UserLike li) {
			return sqlSession.selectOne("boardMapper.likeCount", li);
		}
		
		// 게시글 좋아요
		public int insertLike(SqlSessionTemplate sqlSession, UserLike like) {
			return sqlSession.insert("boardMapper.insertLike", like);
		}
		
		// 게시글 좋아요 취소
		public int deleteLike(SqlSessionTemplate sqlSession, UserLike like) {
			return sqlSession.delete("boardMapper.deleteLike", like);
		}
		
		// 게시글 전체 좋아요 count
		public ArrayList<UserLike> selectLikeCount(SqlSessionTemplate sqlSession, int reviewNo) {
			return (ArrayList)sqlSession.selectList("boardMapper.selectLikeCount", reviewNo);
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
	public int eDeleteBoard(SqlSessionTemplate sqlSession, int eno) {
		return sqlSession.update("boardMapper.eDeleteBoard", eno);
	}
	
	
	
	
	
}
