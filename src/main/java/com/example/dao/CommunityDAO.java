package com.example.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.dto.CommunityDTO;


@Repository
public class CommunityDAO {
	
	@Autowired
	SqlSessionTemplate session;

	public int commuAdd(CommunityDTO dto) {
		int n=session.insert("commuAdd",dto);
		return n;
	}

	public int commNo(int user_no) {
		int comm_no=session.selectOne("commNo",user_no);
		return comm_no;
	}

	public List<CommunityDTO> commuList() {
		List<CommunityDTO> commus=session.selectList("commuList");
		return commus;
	}

	public int test(String commucontent) {
		int n=session.insert("test",commucontent);
		return n;
	}

	public CommunityDTO oneCommu(Integer COMMU_NO) {
		CommunityDTO onecommu=session.selectOne("oneCommu",COMMU_NO);
		return onecommu;
	}

}
