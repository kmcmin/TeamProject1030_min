package com.example.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.ReviewDAO;
import com.example.dto.FileDTO;
import com.example.dto.ReviewDTO;

@Service("ReviewService")
public class ReviewService {
	@Autowired
	ReviewDAO dao;

	public int inquireAdd(ReviewDTO dto) {
		int n = dao.inquireAdd(dto);
		return n;

	}

	public int reviewAdd(ReviewDTO dto) {
		int n = dao.reviewAdd(dto);
		return n;

	}

	public int selReviewNo(HashMap<String, String> map) {
		int reviewNo = dao.selReviewNo(map);
		return reviewNo;
	}

	public List<ReviewDTO> reviews(String gCode) {
		List<ReviewDTO> list=dao.reviews(gCode);
		return list;
	}

	public List<ReviewDTO> selectRe(String gCode) {
		List<ReviewDTO> reviews=dao.selectRe(gCode);
		return reviews;
	}

	public List<FileDTO> selFile(int reNo) {
		List<FileDTO> files=dao.selFile(reNo);
		return files;
	}


}
