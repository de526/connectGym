package com.jasla.ConnectGym.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardDTO {

	private int boNo;
	private int memNo;
	private String boTitle;
	private String boContent;
	private Date boWritedate;
	private Date boUpdate;
	private char boIssecret;
	private char boDel;
	private int boHit;
}
