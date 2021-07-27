package com.example.ticket_test.model.admin.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.ticket_test.model.member.dto.MemberDTO;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public boolean loginCheck(MemberDTO dto) {
		String name = sqlSession.selectOne("admin.login_check", dto);
		return (name==null) ? false : true;
	}

}
