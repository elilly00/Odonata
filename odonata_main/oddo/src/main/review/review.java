package main.review.model.vo;

import java.sql.Date;

public class review {
    private int R_code;
    private String R_content;
    private Date R_update;
    private Date R_modify;
    private int User_code;
    private int Rooms_code;
    private char Status;

    public review() {}

	public review(int r_code, String r_content, Date r_update, Date r_modify, int user_code, int rooms_code,
			char status) {
		super();
		R_code = r_code;
		R_content = r_content;
		R_update = r_update;
		R_modify = r_modify;
		User_code = user_code;
		Rooms_code = rooms_code;
		Status = status;
	}

	public int getR_code() {
		return R_code;
	}

	public void setR_code(int r_code) {
		R_code = r_code;
	}

	public String getR_content() {
		return R_content;
	}

	public void setR_content(String r_content) {
		R_content = r_content;
	}

	public Date getR_update() {
		return R_update;
	}

	public void setR_update(Date r_update) {
		R_update = r_update;
	}

	public Date getR_modify() {
		return R_modify;
	}

	public void setR_modify(Date r_modify) {
		R_modify = r_modify;
	}

	public int getUser_code() {
		return User_code;
	}

	public void setUser_code(int user_code) {
		User_code = user_code;
	}

	public int getRooms_code() {
		return Rooms_code;
	}

	public void setRooms_code(int rooms_code) {
		Rooms_code = rooms_code;
	}

	public char getStatus() {
		return Status;
	}

	public void setStatus(char status) {
		Status = status;
	}

	@Override
	public String toString() {
		return "review [R_code=" + R_code + ", R_content=" + R_content + ", R_update=" + R_update + ", R_modify="
				+ R_modify + ", User_code=" + User_code + ", Rooms_code=" + Rooms_code + ", Status=" + Status + "]";
	}


}