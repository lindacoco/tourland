package com.yi.tourland.domain.mng;

public class CartVO {
	private int cno; // 장바구니에 담긴 상품번호
	private int userno; // 회원테이블과 연결된 유저번호
	private int pno; // 상품테이블과 연결된 상품번호
	private int count; // 장바구니에 담긴 상품 개수
	private int price; // 상품 가격

	
	public CartVO() {
		//기본생성자
	}
	
	
	public CartVO(int cno, int userno, int pno, int count, int price) {
		//다 받는 생성자
		super();
		this.cno = cno;
		this.userno = userno;
		this.pno = pno;
		this.count = count;
		this.price = price;
	}
		//밑으로 get, set, toString

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "CartVO [cno=" + cno + ", userno=" + userno + ", pno=" + pno + ", count=" + count + ", price=" + price
				+ "]";
	}

}
