package com.example.ticket_test.model.movie.dao;

import java.util.List;

import com.example.ticket_test.model.movie.dto.MovieDTO;

public interface MovieDAO {
	List<MovieDTO> listMovie(); //목록
	MovieDTO detailMovie(String movie_id); //영화정보 보기
	void updateMovie(MovieDTO dto); //업데이트
	void deleteMovie(String movie_id); //삭제
	void insertMovie(MovieDTO dto); //추가
	

}
