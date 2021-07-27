package com.example.ticket_test.controller.movie;

import java.io.File;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.ticket_test.model.movie.dto.MovieDTO;
import com.example.ticket_test.service.movie.MovieService;

@Controller
@RequestMapping("movie/*")
public class MovieController {
	
	@Inject
	MovieService movieService;
	
	@RequestMapping("list.do")
	public ModelAndView list(ModelAndView mav, Model model) {
		mav.addObject("logo", "images/logo-opacity.png");
		mav.setViewName("movie/movie");
		mav.addObject("list", movieService.listMovie());
		return mav;
	}
	
	@RequestMapping("detail.do")
	public ModelAndView detail(@RequestParam String movie_id, ModelAndView mav) {
		//포워딩
		mav.setViewName("movie/detail");
		//데이터
		mav.addObject("dto", movieService.detailMovie(movie_id));
		mav.addObject("logo", "images/logo-opacity.png");
		return mav;
	}
	
	@RequestMapping("insert.do")
	public String insert(@ModelAttribute MovieDTO dto) {
		System.out.println("영화등록 호출");
		String filename = "-";
		if(!dto.getFile1().isEmpty()) {
			filename = dto.getFile1().getOriginalFilename();
			try {
				String path = "C:\\work\\.metadata\\.plugins\\org.eclipse.wst.server.core"
						+ "\\tmp0\\wtpwebapps\\ticket_test\\WEB-INF\\views\\images\\";				
				System.out.println(path+filename);
				new File(path).mkdir();
				dto.getFile1().transferTo(new File(path+filename));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		dto.setImgpath(filename);
		System.out.println(dto.getMovie_id());
		System.out.println(dto.getTitle());
		System.out.println(dto.getDirector());
		System.out.println(dto.getCast());
		System.out.println(dto.getGrade());
		System.out.println(dto.getInfo());
		System.out.println(filename);
		movieService.insertMovie(dto);
		System.out.println("영화등록 성공");
		return "redirect:/admin/insert_movie.do";
	}
	
	@RequestMapping("view.do")
	public String view(@RequestParam String movie_id, Model model) {
		model.addAttribute("dto", movieService.detailMovie(movie_id));
		model.addAttribute("logo", "images/logo-opacity.png");
		return "movie/view";
	}
	
	@RequestMapping("update.do")
	public String update(MovieDTO dto, Model model) {
		System.out.println("update.do 호출");
		movieService.updateMovie(dto);
		System.out.println(dto.getMovie_id());
		System.out.println(dto.getTitle());
		System.out.println(dto.getDirector());
		System.out.println(dto.getCast());
		System.out.println(dto.getGrade());
		System.out.println(dto.getInfo());
		System.out.println(dto.getImgpath());
		System.out.println("업데이트 성공");
		return "redirect:/admin/insert_movie.do";
	}
	
	@RequestMapping("delete.do")
	public String delete(String movie_id, Model model) {
		System.out.println("영화삭제 호출");
		movieService.deleteMovie(movie_id);
		System.out.println("영화삭제 성공");
		return "redirect:/admin/insert_movie.do";
	}

}
