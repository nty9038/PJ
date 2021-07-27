package com.example.ticket_test.controller.member;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.ticket_test.model.member.dto.MemberDTO;
import com.example.ticket_test.service.member.MemberService;

@Controller
@RequestMapping("member/*")
public class MemberController {
	
	private static final Logger logger = 
			LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	MemberService memberService;
	
	@RequestMapping("login.do")
	public String login(Model model) {
		System.out.println("login.do 호출");
		model.addAttribute("logo", "images/logo-opacity.png");
		return "member/login";
	}
	
	@RequestMapping("join.do")
	public String join(Model model) {
		System.out.println("join.do 호출");
		model.addAttribute("logo", "images/logo-opacity.png");
		return "member/join";
	}
	
	@RequestMapping("login_check.do")
	public ModelAndView login_check(Model model, MemberDTO dto, HttpSession session) {
		System.out.println("login_check.do 호출");
		boolean result = memberService.loginCheck(dto, session);
		System.out.println(dto.getUserid());
		ModelAndView mav = new ModelAndView();
		model.addAttribute("logo", "images/logo-opacity.png");
		System.out.println("최종 리턴");
		if(result) {
			mav.setViewName("home");
		} else {
			mav.setViewName("member/login");
			mav.addObject("message", "error");
		}
		return mav;
	}
	
	@RequestMapping("logout.do")
	public ModelAndView logout(HttpSession session, ModelAndView mav) {
		memberService.logout(session);
		mav.setViewName("home");
		mav.addObject("message", "logout");
		mav.addObject("logo", "images/logo-opacity.png");
		return mav;
	}
	
	@RequestMapping("insert.do")
	public ModelAndView insert(MemberDTO dto) {
		memberService.insertMember(dto);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/login");
		mav.addObject("message", "welcome");
		return mav;
	}
	
	@RequestMapping("list.do")
	public String list(Model model) {
		List<MemberDTO> list = memberService.list();
		model.addAttribute("list", list);
		model.addAttribute("logo", "images/logo-opacity.png");
		return "admin/list";
	}
	
	@RequestMapping("view.do")
	public String view(@RequestParam String userid, Model model) {
		model.addAttribute("dto", memberService.viewMember(userid));
		model.addAttribute("logo", "images/logo-opacity.png");
		return "member/view";
	}
	
	@RequestMapping("update.do")
	public String update(MemberDTO dto, Model model) {
		boolean result = memberService.checkPw(dto.getUserid(), dto.getPasswd());
		if(result) {
			memberService.updateMember(dto);
			return "redirect:/member/list.do";
		}else {
			model.addAttribute("dto", dto);
			model.addAttribute("join_date",
					memberService.viewMember(dto.getUserid()).getJoin_date());
			model.addAttribute("message", "비밀번호를 확인하세요");
			model.addAttribute("logo", "images/logo-opacity.png");
			return "member/view";
		}
	}
	
	@RequestMapping("delete.do")
	public String delete(String userid, String passwd, Model model) {
		boolean result = memberService.checkPw(userid, passwd);
		if(result) {
			memberService.deleteMember(userid);
			return "redirect:/member/list.do";
		}else {
			model.addAttribute("message","비밀번호를 확인하세요.");
			model.addAttribute("dto", memberService.viewMember(userid));
			return "member/view";
		}
	}
	
	

}
