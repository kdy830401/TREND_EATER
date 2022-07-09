package com.fpj.trendeater.board.model.service;

import java.util.ArrayList;

import com.fpj.trendeater.admin.model.vo.Image;
import com.fpj.trendeater.admin.model.vo.Product;
import com.fpj.trendeater.board.model.vo.PageInfo;
import com.fpj.trendeater.board.model.vo.Report;
import com.fpj.trendeater.board.model.vo.Review;
import com.fpj.trendeater.board.model.vo.ReviewImage;
import com.fpj.trendeater.board.model.vo.UserLike;

public interface BoardService {

	Product selectPrBoard(int pno);

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


}
