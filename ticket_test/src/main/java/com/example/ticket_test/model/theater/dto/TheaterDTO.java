package com.example.ticket_test.model.theater.dto;

import org.springframework.web.multipart.MultipartFile;

public class TheaterDTO {
	private String theater_id;
	private String theater_name;
	private String auditorium;
	private String seat;
	private String address;
	private String address2;
	private String phone;
	private String img;
	private MultipartFile file;
	//setter,getter,toString,생성자
	public String getTheater_id() {
		return theater_id;
	}
	public void setTheater_id(String theater_id) {
		this.theater_id = theater_id;
	}
	public String getTheater_name() {
		return theater_name;
	}
	public void setTheater_name(String theater_name) {
		this.theater_name = theater_name;
	}
	public String getAuditorium() {
		return auditorium;
	}
	public void setAuditorium(String auditorium) {
		this.auditorium = auditorium;
	}
	public String getSeat() {
		return seat;
	}
	public void setSeat(String seat) {
		this.seat = seat;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	@Override
	public String toString() {
		return "TheaterDTO [theater_id=" + theater_id + ", theater_name=" + theater_name + ", auditorium=" + auditorium
				+ ", seat=" + seat + ", address=" + address + ", address2=" + address2 + ", phone=" + phone + ", img="
				+ img + ", file=" + file + "]";
	}
	

}
