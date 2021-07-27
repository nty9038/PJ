package com.example.ticket_test.model.ticket.dao;

import java.util.List;

import com.example.ticket_test.model.ticket.dto.TicketDTO;

public interface TicketDAO {
	void insertTicket(TicketDTO dto);
	void deleteTicket(String ticket_id);
	List<TicketDTO> listTicket(String userid);

}
