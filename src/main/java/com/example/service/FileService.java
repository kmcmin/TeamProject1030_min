package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.FileDAO;
import com.example.dto.FileDTO;

@Service("FileService")
public class FileService {
	@Autowired
	FileDAO dao;
	
	public int addFile(FileDTO fdto) {
		int n = dao.addFile(fdto);
		return n;
	}

	public int commuFileAdd(FileDTO fdto) {
		int n=dao.commuFileAdd(fdto);
		return n;
	}

}
