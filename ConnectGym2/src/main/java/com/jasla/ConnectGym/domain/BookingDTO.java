package com.jasla.ConnectGym.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BookingDTO {

	private int bookNo;
	private int memNo;
	private int trNo;
	private Date bookDate;
	private Date bookUpDate;
	private String bookContent;
}
