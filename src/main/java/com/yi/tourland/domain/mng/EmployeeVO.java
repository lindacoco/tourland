package com.yi.tourland.domain.mng;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class EmployeeVO {
	private int empno;
	private String empname;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date empbirth;
	private String emptel;
	private String empaddr;
	private int empauth;
	private String empid;
	private String emppass;
	private int empretired;
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	public String getEmpname() {
		return empname;
	}
	public void setEmpname(String empname) {
		this.empname = empname;
	}
	public Date getEmpbirth() {
		return empbirth;
	}
	public void setEmpbirth(String empbirth) throws ParseException {
		this.empbirth = new SimpleDateFormat("yyyy-MM-dd").parse(empbirth);
	}
	public String getEmptel() {
		return emptel;
	}
	public void setEmptel(String emptel) {
		this.emptel = emptel;
	}
	public String getEmpaddr() {
		return empaddr;
	}
	public void setEmpaddr(String empaddr) {
		this.empaddr = empaddr;
	}
	public int getEmpauth() {
		return empauth;
	}
	public void setEmpauth(int empauth) {
		this.empauth = empauth;
	}
	public String getEmpid() {
		return empid;
	}
	public void setEmpid(String empid) {
		this.empid = empid;
	}
	public String getEmppass() {
		return emppass;
	}
	public void setEmppass(String emppass) {
		this.emppass = emppass;
	}
	public int getEmpretired() {
		return empretired;
	}
	public void setEmpretired(int empretired) {
		this.empretired = empretired;
	}


	@Override
	public String toString() {
		return "EmployeeVO [empno=" + empno + ", empname=" + empname + ", empbirth=" + empbirth + ", emptel=" + emptel
				+ ", empaddr=" + empaddr + ", empauth=" + empauth + ", empid=" + empid + ", emppass=" + emppass
				+ ", empretired=" + empretired + "]";
	}

	


}
