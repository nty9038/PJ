package com.example.ticket_test.service.member;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.example.ticket_test.model.member.dao.MemberDAO;
import com.example.ticket_test.model.member.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	MemberDAO memberDao;
	
	@Override
	public boolean loginCheck(MemberDTO dto, HttpSession session) {
		System.out.println("로그인 서비스 호출");
		boolean result = memberDao.loginCheck(dto);
		if(result) {
			session.setAttribute("userid", dto.getUserid());
			session.setAttribute("name", dto.getName());
		}
		System.out.println("로그인 서비스 리턴");
		System.out.println(dto.getName());
		return result;
	}

	@Override
	public MemberDTO viewMember(String userid) {
		return memberDao.viewMember(userid);
	}

	@Override
	public List<MemberDTO> list() {
		return memberDao.list();
	}

	@Override
	public void insertMember(MemberDTO dto) {
		memberDao.insertMember(dto);

	}

	@Override
	public boolean checkPw(String userid, String passwd) {
		return memberDao.checkPw(userid, passwd);
	}

	@Override
	public void updateMember(MemberDTO dto) {
		memberDao.updateMember(dto);
	}

	@Override
	public void deleteMember(String userid) {
		memberDao.deleteMember(userid);
	}

	@Override
	public void logout(HttpSession session) {
		session.invalidate();		
	}

}
