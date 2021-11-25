package reserv.model.vo;
// package reserv.model.vo;

import java.sql.Date;

public class Reserv {
	private int v_code; // 예약코드
	private String status; // 예약상태
	private Date check_in; // 체크인
	private Date check_out; // 체크아웃
	private String personnel; // 예약인원
	private int rooms_code; // 숙소코드
	private int user_code; // 사용자 코드
	private int reserv_Price; // 예약 금액
	
	public Reserv() {}

	public Reserv(int v_code, String status, Date check_in, Date check_out, String personnel, int rooms_code,
			int user_code, int reserv_Price) {
		super();
		this.v_code = v_code;
		this.status = status;
		this.check_in = check_in;
		this.check_out = check_out;
		this.personnel = personnel;
		this.rooms_code = rooms_code;
		this.user_code = user_code;
		this.reserv_Price = reserv_Price;
	}

	public int getV_code() {
		return v_code;
	}

	public void setV_code(int v_code) {
		this.v_code = v_code;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getCheck_in() {
		return check_in;
	}

	public void setCheck_in(Date check_in) {
		this.check_in = check_in;
	}

	public Date getCheck_out() {
		return check_out;
	}

	public void setCheck_out(Date check_out) {
		this.check_out = check_out;
	}

	public String getPersonnel() {
		return personnel;
	}

	public void setPersonnel(String personnel) {
		this.personnel = personnel;
	}

	public int getRooms_code() {
		return rooms_code;
	}

	public void setRooms_code(int rooms_code) {
		this.rooms_code = rooms_code;
	}

	public int getUser_code() {
		return user_code;
	}

	public void setUser_code(int user_code) {
		this.user_code = user_code;
	}

	public int getReserv_Price() {
		return reserv_Price;
	}

	public void setReserv_Price(int reserv_Price) {
		this.reserv_Price = reserv_Price;
	}

	@Override
	public String toString() {
		return "Reserv [v_code=" + v_code + ", status=" + status + ", check_in=" + check_in + ", check_out=" + check_out
				+ ", personnel=" + personnel + ", rooms_code=" + rooms_code + ", user_code=" + user_code
				+ ", reserv_Price=" + reserv_Price + "]";
	}

	

	
}