package reserv.model.vo;

import java.sql.Date;

public class reserv {
	private int v_code;
	private char v_status;
	private Date check_in;
	private Date check_out;
	private int personnel;
	private int rooms_code;
	private int user_code;
	private char status;
	private String room_name;
	
	public reserv() {}

	public reserv(int v_code, char v_status, Date check_in, Date check_out, int personnel, int rooms_code,
			int user_code, char status, String room_name) {
		super();
		this.v_code = v_code;
		this.v_status = v_status;
		this.check_in = check_in;
		this.check_out = check_out;
		this.personnel = personnel;
		this.rooms_code = rooms_code;
		this.user_code = user_code;
		this.status = status;
		this.room_name = room_name;
	}

	public int getV_code() {
		return v_code;
	}

	public void setV_code(int v_code) {
		this.v_code = v_code;
	}

	public char getV_status() {
		return v_status;
	}

	public void setV_status(char v_status) {
		this.v_status = v_status;
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

	public int getPersonnel() {
		return personnel;
	}

	public void setPersonnel(int personnel) {
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

	public char getStatus() {
		return status;
	}

	public void setStatus(char status) {
		this.status = status;
	}

	public String getRoom_name() {
		return room_name;
	}

	public void setRooms_name(String room_name) {
		this.room_name = room_name;
	}

	@Override
	public String toString() {
		return "reserv [v_code=" + v_code + ", v_status=" + v_status + ", check_in=" + check_in + ", check_out="
				+ check_out + ", personnel=" + personnel + ", rooms_code=" + rooms_code + ", user_code=" + user_code
				+ ", status=" + status + ", room_name=" + room_name + "]";
	}
	
	
}