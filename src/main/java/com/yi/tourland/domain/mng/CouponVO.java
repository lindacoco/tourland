package com.yi.tourland.domain.mng;

import java.util.Date;

public class CouponVO {
	private int cno;
	private String cname;
	private Date pdate;
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
	public void setPdate(Date pdate) {
		this.pdate = pdate;
	}
	public Date getEdate() {
		return edate;
	}
	public void setEdate(Date edate) {
		this.edate = edate;
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
