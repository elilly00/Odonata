package payment.model.vo;

import java.sql.Date;

public class Payment {

	private int pCode; // 결제 코드
	private int vCode; // 예약코드
//	private int price; // 가격
	private Date pDate; // 결제일
	private String pStatus; // 결제 상태
	
	public Payment() {}
	
	public Payment(int pCode, int vCode, /*int price,*/ Date pDate, String pStatus) {
		super();
		this.pCode = pCode;
		this.vCode = vCode;
		/*this.price = price;*/
		this.pDate = pDate;
		this.pStatus = pStatus;
	}

	public int getpCode() {
		return pCode;
	}

	public void setpCode(int pCode) {
		this.pCode = pCode;
	}

	public int getvCode() {
		return vCode;
	}

	public void setvCode(int vCode) {
		this.vCode = vCode;
	}

//	public int getPrice() {
//		return price;
//	}
//
//	public void setPrice(int price) {
//		this.price = price;
//	}

	public Date getpDate() {
		return pDate;
	}

	public void setpDate(Date pDate) {
		this.pDate = pDate;
	}

	public String getpStatus() {
		return pStatus;
	}

	public void setpStatus(String pStatus) {
		this.pStatus = pStatus;
	}

	@Override
	public String toString() {
		return "Payment [pCode=" + pCode + ", vCode=" + vCode + ", pDate=" + pDate + ", pStatus=" + pStatus + "]";
	}

//	@Override
//	public String toString() {
//		return "Payment [pCode=" + pCode + ", vCode=" + vCode + ", price=" + price + ", pDate=" + pDate + ", pStatus="
//				+ pStatus + "]";
//	}
	
	
	
	
	
}
