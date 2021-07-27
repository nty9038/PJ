package com.example.ticket_test.service.member;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.example.ticket_test.model.member.dto.MemberDTO;

public interface MemberService {
	public boolean loginCheck(MemberDTO dto, HttpSession session); //로그인 검증
	public MemberDTO viewMember(String userid);
	public List<MemberDTO> list(); //회원목록
	public void insertMember(MemberDTO dto); //회원가입
	public boolean checkPw(String userid, String passwd);//비번체크
	public void updateMember(MemberDTO dto); //회원정보 수정
	public void deleteMember(String userid); //회원탈퇴
	public void logout(HttpSession session);//로그아웃
	//아이디 찾기
	//비번찾기

}
