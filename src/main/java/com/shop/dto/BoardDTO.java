package com.shop.dto;

public class BoardDTO {
	private int bno;
	private String btitle;
	private String bcontent;
	private String bwriter;
	private String bregdate;
	private int bviewcnt;
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}

	public String getBwriter() {
		return bwriter;
	}
	public void setBwriter(String bwriter) {
		this.bwriter = bwriter;
	}
	public String getBregdate() {
		return bregdate;
	}
	public void setBregdate(String bregdate) {
		this.bregdate = bregdate;
	}
	public int getBviewcnt() {
		return bviewcnt;
	}
	public void setBviewcnt(int bviewcnt) {
		this.bviewcnt = bviewcnt;
	}
	
	
}
