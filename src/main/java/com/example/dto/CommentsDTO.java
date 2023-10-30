package com.example.dto;

import org.apache.ibatis.type.Alias;

@Alias("CommentsDTO")
public class CommentsDTO {

	private int COMMENTS_NO; //댓글 번호
	private int REPLY_NO; //대댓글 번호
	
	private int COMMU_NO;  //게시글 번호
	private String USER_ID; //작성자
	private String TAGGED_USER; //태그된 유저
	private String COMMENTS_CONTENT; //댓글 내용
	
	private int  COMMENTS_CLASS; //댓글 계층(모댓글0,대댓글1)
	
	private String COMMENTS_REGISTRATION; //댓글 등록일
	private String COMMENTS_STATUS; //댓글 상태
	private String COMMENTS_CORRECTED ; //댓글 수정일
	public int getCOMMENTS_NO() {
		return COMMENTS_NO;
	}
	public void setCOMMENTS_NO(int cOMMENTS_NO) {
		COMMENTS_NO = cOMMENTS_NO;
	}
	public int getREPLY_NO() {
		return REPLY_NO;
	}
	public void setREPLY_NO(int rEPLY_NO) {
		REPLY_NO = rEPLY_NO;
	}
	public int getCOMMU_NO() {
		return COMMU_NO;
	}
	public void setCOMMU_NO(int cOMMU_NO) {
		COMMU_NO = cOMMU_NO;
	}
	public String getUSER_ID() {
		return USER_ID;
	}
	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}
	public String getTAGGED_USER() {
		return TAGGED_USER;
	}
	public void setTAGGED_USER(String tAGGED_USER) {
		TAGGED_USER = tAGGED_USER;
	}
	public String getCOMMENTS_CONTENT() {
		return COMMENTS_CONTENT;
	}
	public void setCOMMENTS_CONTENT(String cOMMENTS_CONTENT) {
		COMMENTS_CONTENT = cOMMENTS_CONTENT;
	}
	public int getCOMMENTS_CLASS() {
		return COMMENTS_CLASS;
	}
	public void setCOMMENTS_CLASS(int cOMMENTS_CLASS) {
		COMMENTS_CLASS = cOMMENTS_CLASS;
	}
	public String getCOMMENTS_REGISTRATION() {
		return COMMENTS_REGISTRATION;
	}
	public void setCOMMENTS_REGISTRATION(String cOMMENTS_REGISTRATION) {
		COMMENTS_REGISTRATION = cOMMENTS_REGISTRATION;
	}
	public String getCOMMENTS_CORRECTED() {
		return COMMENTS_CORRECTED;
	}
	public void setCOMMENTS_CORRECTED(String cOMMENTS_CORRECTED) {
		COMMENTS_CORRECTED = cOMMENTS_CORRECTED;
	}
	@Override
	public String toString() {
		return "CommentsDTO [COMMENTS_NO=" + COMMENTS_NO + ", REPLY_NO=" + REPLY_NO + ", COMMU_NO=" + COMMU_NO
				+ ", USER_ID=" + USER_ID + ", TAGGED_USER=" + TAGGED_USER + ", COMMENTS_CONTENT=" + COMMENTS_CONTENT
				+ ", COMMENTS_CLASS=" + COMMENTS_CLASS + ", COMMENTS_REGISTRATION=" + COMMENTS_REGISTRATION
				+ ", COMMENTS_CORRECTED=" + COMMENTS_CORRECTED + "]";
	}
	public String getCOMMENTS_STATUS() {
		return COMMENTS_STATUS;
	}
	public void setCOMMENTS_STATUS(String cOMMENTS_STATUS) {
		COMMENTS_STATUS = cOMMENTS_STATUS;
	}
	
	
}
