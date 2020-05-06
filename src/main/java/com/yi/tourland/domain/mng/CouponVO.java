package com.yi.tourland.domain.mng;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class CouponVO {
	private int cno;
	private String cname;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date pdate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date edate;
	private String ccontent;
	private float mrate;
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public Date getPdate() {
		return pdate;
	}
	public void setPdate(String pdate) throws ParseException {
		this.pdate =  new SimpleDateFormat("yyyy-MM-dd").parse(pdate);
	}
	public Date getEdate() {
		return edate;
	}
	public void setEdate(String edate) throws ParseException {
		this.edate =  new SimpleDateFormat("yyyy-MM-dd").parse(edate);
	}
	public String getCcontent() {
		return ccontent;
	}
	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}
	public float getMrate() {
		return mrate;
	}
	public void setMrate(float mrate) {
		this.mrate = mrate;
	}
	@Override
	public String toString() {
		return "CouponVO [cno=" + cno + ", cname=" + cname + ", pdate=" + pdate + ", edate=" + edate + ", ccontent="
				+ ccontent + ", mrate=" + mrate + "]";
	}
	
	
}
