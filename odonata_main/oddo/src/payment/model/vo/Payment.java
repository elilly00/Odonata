package payment.model.vo;

import java.sql.Date;

public class Payment {

	private int pCode; // 결제 코드
	private String pStatus; // 결제 상태
	private int reservCode; // 예약코드
	private Date pDate; // 결제일
	private Date checkIn;
	private Date checkOut;
	private int price; // 가격
	private String personnel;
	
	
	public Payment() {}


	public Payment(int pCode, String pStatus, int reservCode, Date pDate, Date checkIn, Date checkOut, int price,
			String personnel) {
		super();
		this.pCode = pCode;
		this.pStatus = pStatus;
		this.reservCode = reservCode;
		this.pDate = pDate;
		this.checkIn = checkIn;
		this.checkOut = checkOut;
		this.price = price;
		this.personnel = personnel;
	}


	public int getpCode() {
		return pCode;
	}


	public void setpCode(int pCode) {
		this.pCode = pCode;
	}


	public String getpStatus() {
		return pStatus;
	}


	public void setpStatus(String pStatus) {
		this.pStatus = pStatus;
	}


	public int getReservCode() {
		return reservCode;
	}


	public void setReservCode(int reservCode) {
		this.reservCode = reservCode;
	}


	public Date getpDate() {
		return pDate;
	}


	public void setpDate(Date pDate) {
		this.pDate = pDate;
	}


	public Date getCheckIn() {
		return checkIn;
	}


	public void setCheckIn(Date checkIn) {
		this.checkIn = checkIn;
	}


	public Date getCheckOut() {
		return checkOut;
	}


	public void setCheckOut(Date checkOut) {
		this.checkOut = checkOut;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	public String getPersonnel() {
		return personnel;
	}


	public void setPersonnel(String personnel) {
		this.personnel = personnel;
	}


	@Override
	public String toString() {
		return "Payment [pCode=" + pCode + ", pStatus=" + pStatus + ", reservCode=" + reservCode + ", pDate=" + pDate
				+ ", checkIn=" + checkIn + ", checkOut=" + checkOut + ", price=" + price + ", personnel=" + personnel
				+ "]";
	}


	
	
	
}

