package com.example.dto;

import org.apache.ibatis.type.Alias;

@Alias("FileDTO")
public class FileDTO {
	private int FILE_NO;
	private int SEQ_NO;
	private String fileName; //원본 파일 이름
	private String saveFileName; //저장된 파일 이름
	private String saveFilePath; //파일 경로
	private String TB_TYPE;
	public int getFILE_NO() {
		return FILE_NO;
	}
	public void setFILE_NO(int fILE_NO) {
		FILE_NO = fILE_NO;
	}
	public int getSEQ_NO() {
		return SEQ_NO;
	}
	public void setSEQ_NO(int sEQ_NO) {
		SEQ_NO = sEQ_NO;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getSaveFileName() {
		return saveFileName;
	}
	public void setSaveFileName(String saveFileName) {
		this.saveFileName = saveFileName;
	}
	public String getSaveFilePath() {
		return saveFilePath;
	}
	public void setSaveFilePath(String saveFilePath) {
		this.saveFilePath = saveFilePath;
	}
	public String getTB_TYPE() {
		return TB_TYPE;
	}
	public void setTB_TYPE(String tB_TYPE) {
		TB_TYPE = tB_TYPE;
	}
	


}