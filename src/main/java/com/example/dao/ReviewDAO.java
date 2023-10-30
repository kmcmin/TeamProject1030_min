package com.example.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.dto.FileDTO;
import com.example.dto.ReviewDTO;

@Repository
public class ReviewDAO {
	
	@Autowired
	SqlSessionTemplate session;

	public int inquireAdd(ReviewDTO dto) {
		int n=session.insert("inquireAdd",dto);
		return n;
	}

	public int reviewAdd(ReviewDTO dto) {
		int n=session.insert("reviewAdd",dto);
		return n;
	}


	public int addFile(FileDTO fdto) {
		int n=session.insert("addFile",fdto);
		return n;
	}

	public int selReviewNo(HashMap<String, String> map) {
		int reviewNo=session.selectOne("selReviewNo",map);
		return reviewNo;
	}

	public List<ReviewDTO> reviews(String gCode) {
		List<ReviewDTO> list=session.selectList("reviews",gCode);
		return list;
	}

	public List<ReviewDTO> selectRe(String gCode) {
		List<ReviewDTO> reviews=session.selectList("selectRe",gCode);
		return reviews;
	}

	public List<FileDTO> selFile(int reNo) {
		List<FileDTO> files=session.selectList("selFile",reNo);
		return files;
	}

}
