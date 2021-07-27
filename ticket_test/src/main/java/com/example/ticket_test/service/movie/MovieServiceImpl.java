package com.example.ticket_test.service.movie;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.ticket_test.model.movie.dao.MovieDAO;
import com.example.ticket_test.model.movie.dto.MovieDTO;

@Service
public class MovieServiceImpl implements MovieService {

	@Inject
	MovieDAO movieDao;
	
	@Override
	public List<MovieDTO> listMovie() {
		return movieDao.listMovie();
	}

	@Override
	public MovieDTO detailMovie(String movie_id) {
		return movieDao.detailMovie(movie_id);
	}

	@Override
	public void updateMovie(MovieDTO dto ) {
		movieDao.updateMovie(dto);
	}

	@Override
	public void deleteMovie(String movie_id) {
		movieDao.deleteMovie(movie_id);
	}

	@Override
	public void insertMovie(MovieDTO dto) {
		movieDao.insertMovie(dto);
	}

}
