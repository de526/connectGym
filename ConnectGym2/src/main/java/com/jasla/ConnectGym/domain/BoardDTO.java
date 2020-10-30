package com.jasla.ConnectGym.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardDTO {

	// 게시글 변수
	private int boNo;				// 글 번호
	private int memNo;				// 회원 번호
	private String boTitle;			// 제목
	private String boContent;		// 내용
	private Date boWritedate;		// 작성일
	private Date boUpdate;			// 수정일
	private char boIssecret;		// 비밀글 여부
	private char boDel;				// 삭제 여부
	private int boHit;				// 조회수
	private String boDate;			// 작성일 포맷 변명용 가변수
	

	
}
