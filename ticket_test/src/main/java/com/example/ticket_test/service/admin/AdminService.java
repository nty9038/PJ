package com.example.ticket_test.service.admin;

import javax.servlet.http.HttpSession;

import com.example.ticket_test.model.member.dto.MemberDTO;

public interface AdminService {
	public boolean loginCheck(MemberDTO dto, HttpSession session);

}
