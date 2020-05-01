package com.yi.tourland.domain.mng;

import java.util.Date;

public class AirplaneVO {
	private int no;
	private String ano;
	private String dlocation;
	private String rlocation;
	private Date ddate;
	private Date rdate;
	private int ldiv;
	private int capacity;
	private String seat;
	private int price;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getAno() {
		return ano;
	}
	public void setAno(String ano) {
		this.ano = ano;
	}
	public String getDlocation() {
		return dlocation;
	}
	public void setDlocation(String dlocation) {
		this.dlocation = dlocation;
	}
	public String getRlocation() {
		return rlocation;
	}
	public void setRlocation(String rlocation) {
		this.rlocation = rlocation;
	}
	public Date getDdate() {
		return ddate;
	}
	public void setDdate(Date ddate) {
		this.ddate = ddate;
	}
	public Date getRdate() {
		return rdate;
	}
	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}
	public int getLdiv() {
		return ldiv;
	}
	public void setLdiv(int ldiv) {
		this.ldiv = ldiv;
	}
	public int getCapacity() {
		return capacity;
	}
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
	public String getSeat() {
		return seat;
	}
	public void setSeat(String seat) {
		this.seat = seat;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	@Override
	public String toString() {
		return "AirplaneVO [no=" + no + ", ano=" + ano + ", dlocation=" + dlocation + ", rlocation=" + rlocation
				+ ", ddate=" + ddate + ", rdate=" + rdate + ", ldiv=" + ldiv + ", capacity=" + capacity + ", seat="
				+ seat + ", price=" + price + "]";
	} 
	
	
}
