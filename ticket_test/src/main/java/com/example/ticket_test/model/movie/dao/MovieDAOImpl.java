package com.example.ticket_test.model.movie.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.ticket_test.model.movie.dto.MovieDTO;

@Repository
public class MovieDAOImpl implements MovieDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<MovieDTO> listMovie() {
		return sqlSession.selectList("movie.list");
	}

	@Override
	public MovieDTO detailMovie(String movie_id) {
		return sqlSession.selectOne("movie.viewMovie", movie_id);
	}

	@Override
	public void updateMovie(MovieDTO dto) {
		sqlSession.update("movie.updateMovie", dto);
	}

	@Override
	public void deleteMovie(String movie_id) {
		sqlSession.delete("movie.deleteMovie", movie_id);
	}

	@Override
	public void insertMovie(MovieDTO dto) {
		sqlSession.insert("movie.insert", dto);

	}

}
