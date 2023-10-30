package com.example.dto;

import org.apache.ibatis.type.Alias;

@Alias("CommunityDTO")
public class CommunityDTO {

	private int COMMU_NO; //번호
	private int user_no;
	private String USER_ID;
	private String COMMU_TITLE; //게시글 제목
	private String COMMU_SUMMER; //게시글 제목
	private String COMMU_REGISTRATION;
	public int getCOMMU_NO() {
		return COMMU_NO;
	}
	public void setCOMMU_NO(int cOMMU_NO) {
		COMMU_NO = cOMMU_NO;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getUSER_ID() {
		return USER_ID;
	}
	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}
	public String getCOMMU_TITLE() {
		return COMMU_TITLE;
	}
	public void setCOMMU_TITLE(String cOMMU_TITLE) {
		COMMU_TITLE = cOMMU_TITLE;
	}
	public String getCOMMU_SUMMER() {
		return COMMU_SUMMER;
	}
	public void setCOMMU_SUMMER(String cOMMU_SUMMER) {
		COMMU_SUMMER = cOMMU_SUMMER;
	}
	public String getCOMMU_REGISTRATION() {
		return COMMU_REGISTRATION;
	}
	public void setCOMMU_REGISTRATION(String cOMMU_REGISTRATION) {
		COMMU_REGISTRATION = cOMMU_REGISTRATION;
	}
	@Override
	public String toString() {
		return "CommunityDTO [COMMU_NO=" + COMMU_NO + ", user_no=" + user_no + ", USER_ID=" + USER_ID + ", COMMU_TITLE="
				+ COMMU_TITLE + ", COMMU_SUMMER=" + COMMU_SUMMER + ", COMMU_REGISTRATION=" + COMMU_REGISTRATION + "]";
	}

	
}
