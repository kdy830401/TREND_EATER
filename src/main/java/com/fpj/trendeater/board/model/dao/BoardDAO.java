package com.fpj.trendeater.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fpj.trendeater.admin.model.vo.Image;
import com.fpj.trendeater.admin.model.vo.Product;
import com.fpj.trendeater.admin.model.vo.ProductRequest;
import com.fpj.trendeater.board.model.vo.PageInfo;
import com.fpj.trendeater.board.model.vo.Report;
import com.fpj.trendeater.board.model.vo.Review;
import com.fpj.trendeater.board.model.vo.ReviewImage;
import com.fpj.trendeater.board.model.vo.UserLike;

@Repository("bDAO")
public class BoardDAO {

	public Product selectPrBoard(SqlSessionTemplate sqlSession, int pno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("boardMapper.selectPrBoard", pno);
	}

	public ArrayList<Image> selectPrImage(SqlSessionTemplate sqlSession, int pno) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectPrImage", pno);
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
	
	// test5
	
}
