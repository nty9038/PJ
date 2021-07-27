package com.example.ticket_test.model.member.dto;

import java.util.Date;

public class MemberDTO {
	private String userid;
	private String passwd;
	private String name;
	private String email;
	private Date join_date;
	private String zipcode;
	private String addr1;
	private String addr2;
	private String user_grade;
	//getter, setter, toString, 생성자
	public String getUser_grade() {
		return user_grade;
	}
	public void setUser_grade(String user_grade) {
		this.user_grade = user_grade;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	@Override
	public String toString() {
		return "MemberDTO [userid=" + userid + ", passwd=" + passwd + ", name=" + name + ", email=" + email
				+ ", join_date=" + join_date + ", zipcode=" + zipcode + ", addr1=" + addr1 + ", addr2=" + addr2
				+ ", user_grade=" + user_grade + "]";
	}
	public MemberDTO() {
		
	}
	

}
