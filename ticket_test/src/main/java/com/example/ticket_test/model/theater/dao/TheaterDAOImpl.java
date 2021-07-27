package com.example.ticket_test.model.theater.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.ticket_test.model.theater.dto.TheaterDTO;

@Repository
public class TheaterDAOImpl implements TheaterDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<TheaterDTO> listTheater() {
		return sqlSession.selectList("theater.list");
	}

	@Override
	public TheaterDTO detailTheater(String theater_id) {
		return sqlSession.selectOne("theater.viewTheater", theater_id);
	}

	@Override
	public void insertTheater(TheaterDTO dto) {
		sqlSession.insert("theater.insert", dto);
	}

	@Override
	public void updateTheater(TheaterDTO dto) {
		sqlSession.update("theater.updateTheater", dto);
	}

	@Override
	public void deleteTheater(String theater_id) {
		sqlSession.delete("theater.deleteTheater", theater_id);
	}

}
