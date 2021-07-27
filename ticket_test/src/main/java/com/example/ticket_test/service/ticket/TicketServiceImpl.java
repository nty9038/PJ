package com.example.ticket_test.service.ticket;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.ticket_test.model.ticket.dao.TicketDAO;
import com.example.ticket_test.model.ticket.dto.TicketDTO;

@Service
public class TicketServiceImpl implements TicketService {

	@Inject
	TicketDAO ticketDao;
	
	@Override
	public void insertTicket(TicketDTO dto) {
		ticketDao.insertTicket(dto);
	}

	@Override
	public void deleteTicket(String ticket_id) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<TicketDTO> listTicket(String userid) {
		return ticketDao.listTicket(userid);
	}

}
