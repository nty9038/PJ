package com.example.ticket_test.model.movie.dto;

import org.springframework.web.multipart.MultipartFile;

public class MovieDTO {
	private String movie_id;
	private String title;
	private String director;
	private String imgpath;
	private String cast;
	private String grade;
	private String info;
	private MultipartFile file1; 
	
	//getter,setter,toString
	public String getMovie_id() {
		return movie_id;
	}
	public void setMovie_id(String movie_id) {
		this.movie_id = movie_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getImgpath() {
		return imgpath;
	}
	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}
	public String getCast() {
		return cast;
	}
	public void setCast(String cast) {
		this.cast = cast;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public MultipartFile getFile1() {
		return file1;
	}
	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
	}
	@Override
	public String toString() {
		return "MovieDTO [movie_id=" + movie_id + ", title=" + title + ", director=" + director + ", imgpath=" + imgpath
				+ ", cast=" + cast + ", grade=" + grade + ", info=" + info + ", file1=" + file1 + "]";
	}
	

	
}
