package com.example.ticket_test.controller.admin;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.ticket_test.model.member.dto.MemberDTO;
import com.example.ticket_test.model.movie.dto.MovieDTO;
import com.example.ticket_test.model.theater.dto.TheaterDTO;
import com.example.ticket_test.service.admin.AdminService;
import com.example.ticket_test.service.movie.MovieService;
import com.example.ticket_test.service.theater.TheaterService;

@Controller
@RequestMapping("admin/*")
public class AdminController {
	
	@Inject
	AdminService adminService;
	@Inject
	MovieService movieService;
	@Inject
	TheaterService theaterService;
	
	@RequestMapping("login.do")
	public String login(Model model) {
		System.out.println("login.do 호출");
		model.addAttribute("logo", "images/logo-opacity.png");
		return "admin/login";
	}
	
	@RequestMapping("login_check.do")
	public ModelAndView login_check(Model model, MemberDTO dto, HttpSession session) {
		System.out.println("login_check.do 호출");
		boolean result = adminService.loginCheck(dto, session);
		ModelAndView mav = new ModelAndView();
		model.addAttribute("logo", "images/logo-opacity.png");
		if(result) {
			mav.setViewName("admin/admin");
		} else {
			mav.setViewName("admin/login");
			mav.addObject("message", "error");
		}
		System.out.println(dto.getUserid());
		System.out.println("최종 리턴");
		return mav;
	}
	
	@RequestMapping("logout.do")
	public ModelAndView logout(Model model, HttpSession session, ModelAndView mav) {
		session.invalidate();
		mav.setViewName("home");
		mav.addObject("message", "logout");
		model.addAttribute("logo", "images/logo-opacity.png");
		return mav;
		}
	
	@RequestMapping("insert_movie.do")
	public String insert_movie(Model model) {
		System.out.println("영화등록 페이지 호출");
		model.addAttribute("logo", "images/logo-opacity.png");
		List<MovieDTO> list = movieService.listMovie();
		model.addAttribute("movie_list", list);
		return "movie/insert";
	}
	
	@RequestMapping("insert_theater.do")
	public String insert_theater(Model model) {
		System.out.println("극장등록 페이지 호출");
		model.addAttribute("logo", "images/logo-opacity.png");
		List<TheaterDTO> list = theaterService.listTheater();
		model.addAttribute("theater_list", list);
		return "theater/insert";
	}
	

}
