package com.jasla.ConnectGym.domain;

import lombok.Data;

@Data
public class PagingDTO {
	// 페이징 처리 변수
	private int nowPage;			// 현재 페이지
	private int startPage;			// 시작 페이지
	private int endPage;			// 끝 페이지
	private int total;				// 게시글 총 갯수
	private int cntPerPage;			// 페이지당 게시글 갯수
	private int lastPage;			// 마지막 페이지
	private int start;				// SQL 쿼리에 쓸 start
	private int end;				// SQL 쿼리에 쓸 end
	
	public PagingDTO() {
	}
	
	public PagingDTO(int total, int nowPage, int cntPerPage ) {
		setNowPage(nowPage);
		setCntPerPage(cntPerPage);
		setTotal(total);
		calcLastPage(getTotal(), getCntPerPage());
		calcStartEndPage(getNowPage(), getCntPerPage());
		calcStartEnd(getNowPage(), getCntPerPage());
	}
		
	// 제일 마지막 페이지 계산
	public void calcLastPage(int total, int cntPerPage) {
		setLastPage((int)Math.ceil((double)total / (double)cntPerPage));
	}
	
	// 시작, 끝 페이지 계산
	public void calcStartEndPage(int nowPage, int cntPage) {
		
		setEndPage(((int)Math.ceil((double)nowPage / (double)cntPage)) * cntPage);
		if(getLastPage() < getEndPage()) {
			setEndPage(getLastPage());
		}
		setStartPage(getEndPage() - cntPage + 1);
		if(getStartPage() < 1) {
			setStartPage(1);
		}
	}
	
	// DB 쿼리에서 사용할 start, end 값 계산
	public void calcStartEnd(int nowPage, int cntPerPage) {
		setEnd(nowPage * cntPerPage);
		setStart(getEnd() - cntPerPage + 1);
	}

	@Override
	public String toString() {
		return "PagingDTO [nowPage=" + nowPage + ", startPage=" + startPage + ", endPage=" + endPage + ", total="
				+ total + ", cntPerPage=" + cntPerPage + ", lastPage=" + lastPage + ", start=" + start + ", end=" + end
				+ "]";
	}
	
	
	
}
