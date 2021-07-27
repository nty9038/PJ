package com.example.ticket_test.service.admin;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.example.ticket_test.model.admin.dao.AdminDAO;
import com.example.ticket_test.model.member.dto.MemberDTO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Inject
	AdminDAO adminDao;

	@Override
	public boolean loginCheck(MemberDTO dto, HttpSession session) {
		boolean result = adminDao.loginCheck(dto);
		if(result) {
			session.setAttribute("userid", dto.getUserid());
			session.setAttribute("name", dto.getName());
		}
		return result;
	}

}
