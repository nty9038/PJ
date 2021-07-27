package com.example.ticket_test.controller.membership;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.ticket_test.model.member.dto.MemberDTO;
import com.example.ticket_test.model.ticket.dto.TicketDTO;
import com.example.ticket_test.service.member.MemberService;
import com.example.ticket_test.service.ticket.TicketService;

@Controller
@RequestMapping("membership/*")
public class MembershipController {
	
	@Inject
	TicketService ticketService;
	@Inject
	MemberService memberService;
	
	@RequestMapping("membership.do")
	public ModelAndView membership(Model model, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String loginCheck = (String)session.getAttribute("userid");
		model.addAttribute("logo", "images/logo-opacity.png");
		System.out.println(loginCheck);
		if(loginCheck == null) {
			mav.setViewName("home");
			mav.addObject("message", "error");
		}else {
			mav.setViewName("membership/membership");
		}
		return mav;
	}
	
	@RequestMapping("membership/membership_det")
	public String membership_det(Model model) {
		model.addAttribute("logo", "images/logo-opacity.png");
		return "membership/membership_det";
	}

	@RequestMapping("membership/my_page")
	public String my_page(Model model) {
		model.addAttribute("logo", "images/logo-opacity.png");
		return "membership/my_page";
	}

	@RequestMapping("membership/vip")
	public String vip(Model model) {

		return "membership/vip";
	}

	@RequestMapping("membership/point_save")
	public String point_save(Model model) {

		return "membership/point_save";
	}

	@RequestMapping("membership/point_gift")
	public String point_gift(Model model) {

		return "membership/point_gift";
	}

	@RequestMapping("membership/point_use")
	public String point_use(Model model) {

		return "membership/point_use";
	}

	@RequestMapping("membership/menu")
	public String menu(Model model) {

		return "membership/menu";
	}
	
	@RequestMapping("check_ticket.do")
	public String check_ticket(Model model, HttpSession session,
			@ModelAttribute MemberDTO dto,
			@ModelAttribute TicketDTO dto2) {
		dto.setUserid((String) session.getAttribute("userid"));
		model.addAttribute("logo", "images/logo-opacity.png");
		List<TicketDTO> list = ticketService.listTicket(dto.getUserid());
		model.addAttribute("ticket_list",list);
		System.out.println(dto.getUserid());
		return "membership/check_ticket";
	}
	

}
