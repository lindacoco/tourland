package com.yi.tourland.domain.mng;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class AirplaneVO {
	private int no;
	private String ano;
	private String dlocation;
	private String rlocation;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date ddate;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date rdate;
	private int ldiv;
	private int capacity;
	private String seat;
	private int price;
	private int pdiv;
	
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
	public void setDdate(String ddate) throws ParseException {
		this.ddate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(ddate);
	}
	public Date getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) throws ParseException {
		this.rdate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(rdate);
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
	
	
	
	public int getPdiv() {
		return pdiv;
	}
	public void setPdiv(int pdiv) {
		this.pdiv = pdiv;
	}
	
	
	@Override
	public String toString() {
		return "AirplaneVO [no=" + no + ", ano=" + ano + ", dlocation=" + dlocation + ", rlocation=" + rlocation
				+ ", ddate=" + ddate + ", rdate=" + rdate + ", ldiv=" + ldiv + ", capacity=" + capacity + ", seat="
				+ seat + ", price=" + price + ", pdiv=" + pdiv + "]";
	}
	
	
	
}
