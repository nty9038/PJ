package com.example.ticket_test.controller.ticket;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.ticket_test.model.member.dto.MemberDTO;
import com.example.ticket_test.model.movie.dto.MovieDTO;
import com.example.ticket_test.model.theater.dto.TheaterDTO;
import com.example.ticket_test.model.ticket.dto.TicketDTO;
import com.example.ticket_test.service.movie.MovieService;
import com.example.ticket_test.service.theater.TheaterService;
import com.example.ticket_test.service.ticket.TicketService;

@Controller
@RequestMapping("ticket/*")
public class TicketController {
	
	@Inject
	MovieService movieService;
	@Inject
	TheaterService theaterService;
	@Inject
	TicketService ticketService;
	
	@RequestMapping("ticket.do")
	public String ticket(Model model) {
		model.addAttribute("logo", "images/logo-opacity.png");
		List<MovieDTO> movie_list = movieService.listMovie();
		List<TheaterDTO> theater_list = theaterService.listTheater();
		model.addAttribute("movie_list", movie_list);
		model.addAttribute("theater_list", theater_list);
		return "ticket/ticket";
	}
	
	@RequestMapping("movie_list.do")
	public String movie_list(Model model) {
		List<MovieDTO> list = movieService.listMovie();
		model.addAttribute("movie_list", list);
		System.out.println(list);
		return "ticket/ticket";
	}
	
	
	@RequestMapping("time_table.do")
	public String time_table(Model model) {
		model.addAttribute("logo", "images/logo-opacity.png");
		return "ticket/time_table";
	}
	
	@RequestMapping("ticketing.do")
	public String ticketing(Model model,
			@RequestParam("movie_form") String m,
			@RequestParam("theater_form") String t,
			@RequestParam("date_form") String d,
			@RequestParam("time_form") String s) {
		model.addAttribute("logo", "images/logo-opacity.png");
		model.addAttribute("m", m);
		model.addAttribute("t", t);
		model.addAttribute("d", d);
		model.addAttribute("s", s);
		System.out.println(m);
		System.out.println(t);
		System.out.println(d);
		System.out.println(s);
		return "ticket/seat";
	}
	
	@RequestMapping("popup.do")
	public String popup(Model model, HttpSession session,
			@ModelAttribute TicketDTO dto,
			@ModelAttribute MemberDTO dto2,
			@RequestParam("title") String title,
			@RequestParam("theater_name") String theater_name,
			@RequestParam("view_date") String view_date,
			@RequestParam("view_time") String view_time,
			@RequestParam("seat_form") String seat,
			@RequestParam("amount_form") String price) {
		model.addAttribute("logo", "images/logo-opacity.png");
		model.addAttribute("title", title);
		model.addAttribute("theater_name", theater_name);
		model.addAttribute("view_date", view_date);
		model.addAttribute("view_time", view_time);
		model.addAttribute("seat", seat);
		model.addAttribute("price", price);
		System.out.println(title);
		System.out.println(theater_name);
		System.out.println(view_date);
		System.out.println(view_time);
		System.out.println(seat);
		System.out.println(price);
		dto.setPrice(price);
		dto.setUser_id((String) session.getAttribute("userid"));
		System.out.println(session.getAttribute("userid"));
		System.out.println("dto"+dto2.getUserid());
		System.out.println("dto"+dto.getPrice());
		System.out.println(dto.getSeat());
		System.out.println(dto.getTheater_name());
		System.out.println(dto.getTitle());
		System.out.println(dto.getUser_id());
		System.out.println(dto.getView_date());
		System.out.println(dto.getView_time());
		ticketService.insertTicket(dto);
		return "ticket/popup";
	}
	
	@RequestMapping("kakaopay.do")
	@ResponseBody
	public String kakaopay(Model model,
			@RequestParam("title") String title,
			@RequestParam("amount") String amount) {
		model.addAttribute("title", title);
		model.addAttribute("amount", amount);
		try {
			URL url = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "KakaoAK 02b91e1265321f914d12b811affacfa5");
			conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			conn.setDoInput(true);
			conn.setDoOutput(true);
			String param = "cid=TC0ONETIME&"
					+ "partner_order_id=partner_order_id&"
					+ "partner_user_id=partner_user_id&"
					+ "item_name=티켓&"
					+ "quantity=1&"
					+ "total_amount=14000&"
					+ "tax_free_amount=0&"
					+ "approval_url=http://localhost:8081/ticket_test/membership/check_ticket.do/&"
					+ "cancel_url=http://localhost:8081/ticket_test/ticket/ticket.do/&"
					+ "fail_url=http://localhost:8081/ticket_test/ticket/ticket.do/";
			OutputStream os = conn.getOutputStream();
			DataOutputStream dos = new DataOutputStream(os);
			dos.writeBytes(param);
			dos.close();
			int result = conn.getResponseCode();
			InputStream is;
			if(result == 200) {
				is = conn.getInputStream();
			}else {
				is = conn.getErrorStream();
			}
			InputStreamReader reader = new InputStreamReader(is);
			BufferedReader buffer = new BufferedReader(reader);
			//System.out.println(buffer.readLine());
			System.out.println(result);
			return buffer.readLine();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "home"; 
	}

}
