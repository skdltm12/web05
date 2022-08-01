package com.shop.dto;

import java.sql.Date;

public class PaymentDTO {
	private int ono;
    private String paytype;
    private String payno;
    private String payplace;
    private int money;
    private Date sdate;    
    private int pid;
    private int amount;
    private String userid;
    private String rname;
    private String tel;
    
    private String addr1;
    private String addr2;
    private String postcode;
    private String transno;
    private String transco;
    private String rstatus;
    private String rdate;
    private String memo;
    private int bscnt;
    private int searchkey1;
    private int searchkey2;
    
    
    
    
	public int getSearchkey1() {
		return searchkey1;
	}
	
	
	public int getSearchkey2() {
		return searchkey2;
	}


	public void setSearchkey2(int searchkey2) {
		this.searchkey2 = searchkey2;
	}


	public void setSearchkey1(int searchkey1) {
		this.searchkey1 = searchkey1;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getOno() {
		return ono;
	}
	public void setOno(int ono) {
		this.ono = ono;
	}
	public String getPaytype() {
		return paytype;
	}
	public void setPaytype(String paytype) {
		this.paytype = paytype;
	}
	public String getPayno() {
		return payno;
	}
	public void setPayno(String payno) {
		this.payno = payno;
	}
	public String getPayplace() {
		return payplace;
	}
	public void setPayplace(String payplace) {
		this.payplace = payplace;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}

	public Date getSdate() {
		return sdate;
	}
	public void setSdate(Date sdate) {
		this.sdate = sdate;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid2) {
		this.pid = pid2;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getTransno() {
		return transno;
	}
	public void setTransno(String transno) {
		this.transno = transno;
	}
	public String getTransco() {
		return transco;
	}
	public void setTransco(String transco) {
		this.transco = transco;
	}
	public String getRstatus() {
		return rstatus;
	}
	public void setRstatus(String rstatus) {
		this.rstatus = rstatus;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public int getBscnt() {
		return bscnt;
	}
	public void setBscnt(int bscnt) {
		this.bscnt = bscnt;
	}
    
	
    
}
