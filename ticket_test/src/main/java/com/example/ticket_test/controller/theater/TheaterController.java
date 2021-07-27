package com.example.ticket_test.controller.theater;

import java.io.File;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.ticket_test.model.theater.dto.TheaterDTO;
import com.example.ticket_test.service.theater.TheaterService;

@Controller
@RequestMapping("theater/*")
public class TheaterController {
	
	@Inject
	TheaterService theaterService;
	
	@RequestMapping("theater.do") //전체
	public String theater(Model model) {
		model.addAttribute("logo", "images/logo-opacity.png");
		return "theater/theater";
	}
	
	@RequestMapping("theater2.do") //강남
	public String theater2(Model model) {
		model.addAttribute("logo", "images/logo-opacity.png");
		return "theater/theater2";
	}
	
	@RequestMapping("theater3.do") //고양 
	public String theater3(Model model) {
		model.addAttribute("logo", "images/logo-opacity.png");
		return "theater/theater3";
	}
	
	@RequestMapping("theater4.do") //부평
	public String theater4(Model model) {
		model.addAttribute("logo", "images/logo-opacity.png");
		return "theater/theater4";
	}

	@RequestMapping("theater5.do") //속초 
	public String theater5(Model model) {
		model.addAttribute("logo", "images/logo-opacity.png");
		return "theater/theater5";
	}
	
	@RequestMapping("theater6.do") //논산 
	public String theater6(Model model) {
		model.addAttribute("logo", "images/logo-opacity.png");
		return "theater/theater6";
	}
	
	@RequestMapping("theater7.do") //김해
	public String theater7(Model model) {
		model.addAttribute("logo", "images/logo-opacity.png");
		return "theater/theater7";
	}
	
	@RequestMapping("theater8.do") //군산
	public String theater8(Model model) {
		model.addAttribute("logo", "images/logo-opacity.png");
		return "theater/theater8";
	}
	
	@RequestMapping("special.do") //특별관
	public String special(Model model) {
		model.addAttribute("logo", "images/logo-opacity.png");
		return "theater/special";
	}
	
	@RequestMapping("dx.do") //4dx
	public String dx(Model model) {
		model.addAttribute("logo", "images/logo-opacity.png");
		return "theater/dx";
	}
	
	@RequestMapping("dxs.do") //4dxs
	public String dxs(Model model) {
		model.addAttribute("logo", "images/logo-opacity.png");
		return "theater/dxs";
	}
	
	@RequestMapping("imax.do") //imax
	public String imax(Model model) {
		model.addAttribute("logo", "images/logo-opacity.png");
		return "theater/imax";
	}
	
	@RequestMapping("gold.do") //gold
	public String gold(Model model) {
		model.addAttribute("logo", "images/logo-opacity.png");
		return "theater/gold";
	}
	
	@RequestMapping("sky.do") //sky
	public String sky(Model model) {
		model.addAttribute("logo", "images/logo-opacity.png");
		return "theater/sky";
	}
	
	@RequestMapping("sound.do") //sound
	public String sound(Model model) {
		model.addAttribute("logo", "images/logo-opacity.png");
		return "theater/sound";
	}
	
	@RequestMapping("insert.do")
	public String insert(@ModelAttribute TheaterDTO dto) {
		System.out.println("영화관등록 호출");
		String filename = "-";
		if(!dto.getFile().isEmpty()) {
			filename = dto.getFile().getOriginalFilename();
			try {
				String path = "C:\\work\\.metadata\\.plugins\\org.eclipse.wst.server.core"
						+ "\\tmp0\\wtpwebapps\\ticket_test\\WEB-INF\\views\\images\\";
				System.out.println(path+filename);
				new File(path).mkdir();
				dto.getFile().transferTo(new File(path+filename));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		dto.setImg(filename);
		System.out.println(dto.getTheater_name());
		System.out.println(dto.getAuditorium());
		System.out.println(dto.getSeat());
		System.out.println(dto.getAddress());
		System.out.println(dto.getAddress2());
		System.out.println(dto.getPhone());
		System.out.println(dto.getImg());
		theaterService.insertTheater(dto);
		System.out.println("영화관등록 성공");
		return "redirect:/admin/insert_theater.do";
	}
	
	@RequestMapping("view.do")
	public String view(@RequestParam String theater_id, Model model) {
		model.addAttribute("logo", "images/logo-opacity.png");
		model.addAttribute("dto", theaterService.detailTheater(theater_id));
		return "theater/view";
	}
	
	@RequestMapping("update.do")
	public String update(TheaterDTO dto) {
		theaterService.updateTheater(dto);
		return "redirect:/admin/insert_theater.do";
	}
	
	@RequestMapping("delete.do")
	public String delete(String theater_id) {
		theaterService.deleteTheater(theater_id);
		return "redirect:/admin/insert_theater.do";
	}
	
}
