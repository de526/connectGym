package com.jasla.ConnectGym.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CommentDTO {

	private int cmtNo;
	private int boNo;
	private int memNo;
	private String cmtContent;
	private char cmtDel;
	private Date cmtWritedate;
	private Date cmtUpdate;
}
