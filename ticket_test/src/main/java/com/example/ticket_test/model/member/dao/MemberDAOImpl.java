package com.example.ticket_test.model.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.ticket_test.model.member.dto.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public boolean loginCheck(MemberDTO dto) {
		System.out.println("로그인 dao 호출");
		String name = sqlSession.selectOne("member.login_check", dto);
		System.out.println("로그인 dao 리턴");
		return (name==null) ? false : true; //name==null이 참이면 false
	}

	@Override
	public MemberDTO viewMember(String userid) {
		return sqlSession.selectOne("member.viewMember", userid);
	}

	@Override
	public List<MemberDTO> list() {
		return sqlSession.selectList("member.list");
	}

	@Override
	public void insertMember(MemberDTO dto) {
		sqlSession.insert("member.insert", dto);

	}

	@Override
	public boolean checkPw(String userid, String passwd) {
		boolean result = false;
		Map<String,String> map = new HashMap<>();
		map.put("userid", userid);
		map.put("passwd", passwd);
		int count = sqlSession.selectOne("member.checkPw", map);
		if(count == 1) result = true;
		System.out.println(count);
		return result;
	}

	@Override
	public void updateMember(MemberDTO dto) {
		sqlSession.update("member.updateMember", dto);
	}

	@Override
	public void deleteMember(String userid) {
		sqlSession.delete("member.deleteMember", userid);
	}


}
