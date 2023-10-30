package com.example.dto;

import java.util.List;

import org.apache.ibatis.type.Alias;

@Alias("ReviewDTO")
public class ReviewDTO {

	//리뷰 내용 ,사진 파일,등록일
	private int REVIEW_NO;//시퀀스 활용할거라 비워놓는것과 같이 설정
	private int user_no;
	private String USER_ID; 
	private String PRODUCT_CODE;
	private String REVIEW_CONTENT; //리뷰 내용
	private String REVIEW_TITLE; //리뷰 제목
	private String REVIEW_REGISTRATION; //등록일
	private String EVAL_GRADE; //별점
	private String SELLER_COMMENT; //판매자 대댓글
	
	private List<FileDTO> filedto; //리뷰 파일들
	
	
	public int getREVIEW_NO() {
		return REVIEW_NO;
	}
	public void setREVIEW_NO(int rEVIEW_NO) {
		REVIEW_NO = rEVIEW_NO;
	}
	public int getUSER_NO() {
		return user_no;
	}
	public void setUSER_NO(int uSER_NO) {
		user_no = uSER_NO;
	}
	public String getUSER_ID() {
		return USER_ID;
	}
	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}

	public String getPRODUCT_CODE() {
		return PRODUCT_CODE;
	}
	public void setPRODUCT_CODE(String pRODUCT_CODE) {
		PRODUCT_CODE = pRODUCT_CODE;
	}
	public String getREVIEW_CONTENT() {
		return REVIEW_CONTENT;
	}
	public void setREVIEW_CONTENT(String rEVIEW_CONTENT) {
		REVIEW_CONTENT = rEVIEW_CONTENT;
	}
	public String getREVIEW_TITLE() {
		return REVIEW_TITLE;
	}
	public void setREVIEW_TITLE(String rEVIEW_TITLE) {
		REVIEW_TITLE = rEVIEW_TITLE;
	}
	public String getREVIEW_REGISTRATION() {
		return REVIEW_REGISTRATION;
	}
	public void setREVIEW_REGISTRATION(String rEVIEW_REGISTRATION) {
		REVIEW_REGISTRATION = rEVIEW_REGISTRATION;
	}
	public String getEVAL_GRADE() {
		return EVAL_GRADE;
	}
	public void setEVAL_GRADE(String eVAL_GRADE) {
		EVAL_GRADE = eVAL_GRADE;
	}
	public String getSELLER_COMMENT() {
		return SELLER_COMMENT;
	}
	public void setSELLER_COMMENT(String sELLER_COMMENT) {
		SELLER_COMMENT = sELLER_COMMENT;
	}
	
	public List<FileDTO> getFiledto() {
		return filedto;
	}
	public void setFiledto(List<FileDTO> filedto) {
		this.filedto = filedto;
	}
	@Override
	public String toString() {
		return "ReviewDTO [REVIEW_NO=" + REVIEW_NO + ", USER_NO=" + user_no + ", USER_ID=" + USER_ID + ", PRODUCT_CODE="
				+ PRODUCT_CODE + ", REVIEW_CONTENT=" + REVIEW_CONTENT + ", REVIEW_TITLE=" + REVIEW_TITLE
				+ ", REVIEW_REGISTRATION=" + REVIEW_REGISTRATION + ", EVAL_GRADE=" + EVAL_GRADE + ", SELLER_COMMENT="
				+ SELLER_COMMENT + ", filedto=" + filedto + "]";
	}

	
}