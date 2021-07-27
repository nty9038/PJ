package com.example.ticket_test.model.ticket.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.ticket_test.model.ticket.dto.TicketDTO;

@Repository
public class TicketDAOImpl implements TicketDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public void insertTicket(TicketDTO dto) {
		sqlSession.insert("ticket.insert", dto);
	}

	@Override
	public void deleteTicket(String ticket_id) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<TicketDTO> listTicket(String userid) {
		return sqlSession.selectList("ticket.list", userid);
	}

}
