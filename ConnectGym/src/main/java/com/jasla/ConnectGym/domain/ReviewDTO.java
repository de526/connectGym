package com.jasla.ConnectGym.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewDTO {

	private int rvNo;
	private int memNo;
	private int trNo;
	private String rvNick;
	private String rvContent;
	private String rvRate;
	private char rvDel;
	private Date rvWritedate;
	private Date rvUpdate;
}
