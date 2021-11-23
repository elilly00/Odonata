package payment.model.vo;

import java.sql.Date;

public class Payment {
//	예약자 이름,
//	예약자 전화번호, 
//	예약자 이메일,
//	숙소 이름,
//	체크인,
//	체크아웃,
//	게스트 수, 
//	결제코드, 
//	결제 상태, 
//	예약 코드 : 미정
    
    private int paymentCode; // 결제 코드
//	private int reservationCode; // 예약 코드 (미정)
    private String pName; //예약자 이름
    private int pTel; //예약자 전화번호
    private String pEmail; // 예약자 이메일
    private String rName; // 숙소 이름
    private Date checkIn; // 체크인 날짜
    private Date checkOut; // 체크아웃 날짜
    private String guestCount; // 게스트
    private Date pDate; // 결제일
    private String pStatus; // 결제 상태
    
    public Payment(int paymentCode, String pName, int pTel, String pEmail, String rName, Date checkIn, Date checkOut,
            String guestCount, Date pDate, String pStatus) {
        super();
        this.paymentCode = paymentCode;
        this.pName = pName;
        this.pTel = pTel;
        this.pEmail = pEmail;
        this.rName = rName;
        this.checkIn = checkIn;
        this.checkOut = checkOut;
        this.guestCount = guestCount;
        this.pDate = pDate;
        this.pStatus = pStatus;
    }
    
    public int getPaymentCode() {
        return paymentCode;
    }
    
    public void setPaymentCode(int paymentCode) {
        this.paymentCode = paymentCode;
    }
    
    public String getpName() {
        return pName;
    }
    
    public void setpName(String pName) {
        this.pName = pName;
    }
    
    public int getpTel() {
        return pTel;
    }
    
    public void setpTel(int pTel) {
        this.pTel = pTel;
    }
    
    public String getpEmail() {
        return pEmail;
    }
    
    public void setpEmail(String pEmail) {
        this.pEmail = pEmail;
    }
    
    public String getrName() {
        return rName;
    }
    
    public void setrName(String rName) {
        this.rName = rName;
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
    
    public String getGuestCount() {
        return guestCount;
    }
    
    public void setGuestCount(String guestCount) {
        this.guestCount = guestCount;
    }
    
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
        return "Payment [paymentCode=" + paymentCode + ", pName=" + pName + ", pTel=" + pTel + ", pEmail=" + pEmail
                + ", rName=" + rName + ", checkIn=" + checkIn + ", checkOut=" + checkOut + ", guestCount=" + guestCount
                + ", pDate=" + pDate + ", pStatus=" + pStatus + "]";
    }
    
}
