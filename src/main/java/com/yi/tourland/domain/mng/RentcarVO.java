package com.yi.tourland.domain.mng;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class RentcarVO {
	private int no;
	private String cdiv;
	private String cno;
	private Date rentddate;
	private Date returndate;
	private String rentaddr;
	private String returnaddr;
	private int price;
	private int capacity;
	private int insurance;
	private int ldiv;
	private int pdiv;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getCdiv() {
		return cdiv;
	}

	public void setCdiv(String cdiv) {
		this.cdiv = cdiv;
	}

	public String getCno() {
		return cno;
	}

	public void setCno(String cno) {
		this.cno = cno;
	}

	public Date getRentddate() {
		return rentddate;
	}

	public void setRentddate(Date rentddate) {
		this.rentddate = rentddate;
	}

	public Date getReturndate() {
		return returndate;
	}

	public void setReturndate(Date returndate) {
		this.returndate = returndate;
	}

	public String getRentaddr() {
		return rentaddr;
	}

	public void setRentaddr(String rentaddr) {
		this.rentaddr = rentaddr;
	}

	public String getReturnaddr() {
		return returnaddr;
	}

	public void setReturnaddr(String returnaddr) {
		this.returnaddr = returnaddr;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	public int getInsurance() {
		return insurance;
	}

	public void setInsurance(int insurance) {
		this.insurance = insurance;
	}

	public int getLdiv() {
		return ldiv;
	}

	public void setLdiv(int ldiv) {
		this.ldiv = ldiv;
	}

	public int getPdiv() {
		return pdiv;
	}

	public void setPdiv(int pdiv) {
		this.pdiv = pdiv;
	}

	@Override
	public String toString() {
		return "RentcarVO [no=" + no + ", cdiv=" + cdiv + ", cno=" + cno + ", rentddate=" + rentddate + ", returndate="
				+ returndate + ", rentaddr=" + rentaddr + ", returnaddr=" + returnaddr + ", price=" + price
				+ ", capacity=" + capacity + ", insurance=" + insurance + ", ldiv=" + ldiv + ", pdiv=" + pdiv + "]";
	}

}
