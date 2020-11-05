package com.jasla.ConnectGym.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jasla.ConnectGym.dao.BookingDAO;

@Service
public class BookingServiceImpl implements BookingService {
	
	@Autowired
	private BookingDAO dao;
}
