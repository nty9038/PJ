package com.example.ticket_test.model.ticket.dto;

import java.util.Date;

public class TicketDTO {
	private String ticket_id;
	private String userid;
	private String reserv_id;
	private String theater_name;
	private String view_date;
	private String view_time;
	private String title;
	private String seat;
	private String price;
	private Date reserv_time;
	//getter,setter,toString
	public String getTicket_id() {
		return ticket_id;
	}
	public void setTicket_id(String ticket_id) {
		this.ticket_id = ticket_id;
	}
	public String getUser_id() {
		return userid;
	}
	public void setUser_id(String userid) {
		this.userid = userid;
	}
	public String getReserv_id() {
		return reserv_id;
	}
	public void setReserv_id(String reserv_id) {
		this.reserv_id = reserv_id;
	}
	public String getTheater_name() {
		return theater_name;
	}
	public void setTheater_name(String theater_name) {
		this.theater_name = theater_name;
	}
	public String getView_date() {
		return view_date;
	}
	public void setView_date(String view_date) {
		this.view_date = view_date;
	}
	public String getView_time() {
		return view_time;
	}
	public void setView_time(String view_time) {
		this.view_time = view_time;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSeat() {
		return seat;
	}
	public void setSeat(String seat) {
		this.seat = seat;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public Date getReserv_time() {
		return reserv_time;
	}
	public void setReserv_time(Date reserv_time) {
		this.reserv_time = reserv_time;
	}
	@Override
	public String toString() {
		return "TicketDTO [ticket_id=" + ticket_id + ", userid=" + userid + ", reserv_id=" + reserv_id
				+ ", theater_name=" + theater_name + ", view_date=" + view_date + ", view_time=" + view_time
				+ ", title=" + title + ", seat=" + seat + ", price=" + price + ", reserv_time=" + reserv_time + "]";
	}

}
