package com.yi.tourland.domain.mng;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class HotelVO {
	private int no; // 호텔번호 .기본키
	private String hname; // 호텔이름
	private String haddr; // 호텔의 주소
	private Date checkin; // 체크인날짜
	private Date checkout; // 체크아웃날짜
	private int capacity; // 허용인원수
	private int price; // 룸 가격
	private int roomcapacity; // 허용객실의숫자
	private String roomtype; // 객실타입
	private String ldiv; // 장소구분
	private int bookedup; // 객실체크여부
	
	public HotelVO() {
		//기본생성자
	}
	public HotelVO(int no, String hname, String haddr, Date checkin, Date checkout, int capacity, int price,
			int roomcapacity, String roomtype, String ldiv, int bookedup) {
		super();
		this.no = no;
		this.hname = hname;
		this.haddr = haddr;
		this.checkin = checkin;
		this.checkout = checkout;
		this.capacity = capacity;
		this.price = price;
		this.roomcapacity = roomcapacity;
		this.roomtype = roomtype;
		this.ldiv = ldiv;
		this.bookedup = bookedup;
	}
		//밑으로 get, set, toString
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getHname() {
		return hname;
	}

	public void setHname(String hname) {
		this.hname = hname;
	}

	public String getHaddr() {
		return haddr;
	}

	public void setHaddr(String haddr) {
		this.haddr = haddr;
	}

	public Date getCheckin() {
		return checkin;
	}

	public void setCheckin(String checkin) throws ParseException {
		this.checkin = new SimpleDateFormat("yyyy-MM-dd").parse(checkin);
	}

	public Date getCheckout() {
		return checkout;
	}

	public void setCheckout(String checkout) throws ParseException {
		this.checkout =new SimpleDateFormat("yyyy-MM-dd").parse(checkout);
	}

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getRoomcapacity() {
		return roomcapacity;
	}

	public void setRoomcapacity(int roomcapacity) {
		this.roomcapacity = roomcapacity;
	}

	public String getRoomtype() {
		return roomtype;
	}

	public void setRoomtype(String roomtype) {
		this.roomtype = roomtype;
	}

	public String getLdiv() {
		return ldiv;
	}

	public void setLdiv(String ldiv) {
		this.ldiv = ldiv;
	}

	public int getBookedup() {
		return bookedup;
	}


	public void setBookedup(int bookedup) {
		this.bookedup = bookedup;
	}


	@Override
	public String toString() {
		return "HotelVO [no=" + no + ", hname=" + hname + ", haddr=" + haddr + ", checkin=" + checkin + ", checkout="
				+ checkout + ", capacity=" + capacity + ", price=" + price + ", roomcapacity=" + roomcapacity
				+ ", roomtype=" + roomtype + ", ldiv=" + ldiv + ", bookedup=" + bookedup+ "]";
	}

}
