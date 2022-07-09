package com.fpj.trendeater.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fpj.trendeater.admin.model.vo.Image;
import com.fpj.trendeater.admin.model.vo.Product;
import com.fpj.trendeater.board.model.dao.BoardDAO;
import com.fpj.trendeater.board.model.vo.PageInfo;
import com.fpj.trendeater.board.model.vo.Report;
import com.fpj.trendeater.board.model.vo.Review;
import com.fpj.trendeater.board.model.vo.ReviewImage;
import com.fpj.trendeater.board.model.vo.UserLike;

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
