package com.example.ticket_test.service.theater;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.ticket_test.model.theater.dao.TheaterDAO;
import com.example.ticket_test.model.theater.dto.TheaterDTO;

@Service
public class TheaterServiceImpl implements TheaterService {

	@Inject
	TheaterDAO theaterDao;
	
	@Override
	public List<TheaterDTO> listTheater() {
		return theaterDao.listTheater();
	}

	@Override
	public TheaterDTO detailTheater(String theater_id) {
		return theaterDao.detailTheater(theater_id);
	}

	@Override
	public void insertTheater(TheaterDTO dto) {
		theaterDao.insertTheater(dto);
	}

	@Override
	public void updateTheater(TheaterDTO dto) {
		theaterDao.updateTheater(dto);
	}

	@Override
	public void deleteTheater(String theater_id) {
		theaterDao.deleteTheater(theater_id);
	}

}
