package com.example.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.dto.FileDTO;

@Repository
public class FileDAO {
	
	@Autowired
	SqlSessionTemplate session;

	public int addFile(FileDTO fdto) {
		int n=session.insert("addFile",fdto);
		return n;
	}

	public int commuFileAdd(FileDTO fdto) {
		int n=session.insert("commuFileAdd",fdto);
		return n;
	}

}
