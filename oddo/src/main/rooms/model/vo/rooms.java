package main.rooms.model.vo;

import java.sql.Date;

public class Rooms {
    private int Rooms_Code;
    private String Rooms_Host;
    private String Rooms_Type;
    private String Rooms_Addr;
    private String Rooms_Price;
    private String Rooms_Personnel;
    private String Rooms_RoomCnt;
    private String Rooms_ToiletCnt;
    private String Rooms_DogAvail;
    private String Amenity;	// ���ǽü�
    private String Rooms_Desc;
    private Date Rooms_RegDate;
    private int User_code;
    private String Status;

    public Rooms() {}

	public Rooms(int rooms_Code, String rooms_Host, String rooms_Type, String rooms_Addr, String rooms_Price,
			String rooms_Personnel, String rooms_RoomCnt, String rooms_ToiletCnt, String rooms_DogAvail, String amenity,
			String rooms_Desc, Date rooms_RegDate, int user_code, String status) {
		super();
		Rooms_Code = rooms_Code;
		Rooms_Host = rooms_Host;
		Rooms_Type = rooms_Type;
		Rooms_Addr = rooms_Addr;
		Rooms_Price = rooms_Price;
		Rooms_Personnel = rooms_Personnel;
		Rooms_RoomCnt = rooms_RoomCnt;
		Rooms_ToiletCnt = rooms_ToiletCnt;
		Rooms_DogAvail = rooms_DogAvail;
		Amenity = amenity;
		Rooms_Desc = rooms_Desc;
		Rooms_RegDate = rooms_RegDate;
		User_code = user_code;
		Status = status;
	}

	public int getRooms_Code() {
		return Rooms_Code;
	}

	public void setRooms_Code(int rooms_Code) {
		Rooms_Code = rooms_Code;
	}

	public String getRooms_Host() {
		return Rooms_Host;
	}

	public void setRooms_Host(String rooms_Host) {
		Rooms_Host = rooms_Host;
	}

	public String getRooms_Type() {
		return Rooms_Type;
	}

	public void setRooms_Type(String rooms_Type) {
		Rooms_Type = rooms_Type;
	}

	public String getRooms_Addr() {
		return Rooms_Addr;
	}

	public void setRooms_Addr(String rooms_Addr) {
		Rooms_Addr = rooms_Addr;
	}

	public String getRooms_Price() {
		return Rooms_Price;
	}

	public void setRooms_Price(String rooms_Price) {
		Rooms_Price = rooms_Price;
	}

	public String getRooms_Personnel() {
		return Rooms_Personnel;
	}

	public void setRooms_Personnel(String rooms_Personnel) {
		Rooms_Personnel = rooms_Personnel;
	}

	public String getRooms_RoomCnt() {
		return Rooms_RoomCnt;
	}

	public void setRooms_RoomCnt(String rooms_RoomCnt) {
		Rooms_RoomCnt = rooms_RoomCnt;
	}

	public String getRooms_ToiletCnt() {
		return Rooms_ToiletCnt;
	}

	public void setRooms_ToiletCnt(String rooms_ToiletCnt) {
		Rooms_ToiletCnt = rooms_ToiletCnt;
	}

	public String getRooms_DogAvail() {
		return Rooms_DogAvail;
	}

	public void setRooms_DogAvail(String rooms_DogAvail) {
		Rooms_DogAvail = rooms_DogAvail;
	}

	public String getAmenity() {
		return Amenity;
	}

	public void setAmenity(String amenity) {
		Amenity = amenity;
	}

	public String getRooms_Desc() {
		return Rooms_Desc;
	}

	public void setRooms_Desc(String rooms_Desc) {
		Rooms_Desc = rooms_Desc;
	}

	public Date getRooms_RegDate() {
		return Rooms_RegDate;
	}

	public void setRooms_RegDate(Date rooms_RegDate) {
		Rooms_RegDate = rooms_RegDate;
	}

	public int getUser_code() {
		return User_code;
	}

	public void setUser_code(int user_code) {
		User_code = user_code;
	}

	public String getStatus() {
		return Status;
	}

	public void setStatus(String status) {
		Status = status;
	}

	@Override
	public String toString() {
		return "Rooms [Rooms_Code=" + Rooms_Code + ", Rooms_Host=" + Rooms_Host + ", Rooms_Type=" + Rooms_Type
				+ ", Rooms_Addr=" + Rooms_Addr + ", Rooms_Price=" + Rooms_Price + ", Rooms_Personnel=" + Rooms_Personnel
				+ ", Rooms_RoomCnt=" + Rooms_RoomCnt + ", Rooms_ToiletCnt=" + Rooms_ToiletCnt + ", Rooms_DogAvail="
				+ Rooms_DogAvail + ", Amenity=" + Amenity + ", Rooms_Desc=" + Rooms_Desc + ", Rooms_RegDate="
				+ Rooms_RegDate + ", User_code=" + User_code + ", Status=" + Status + "]";
	}

	
}
