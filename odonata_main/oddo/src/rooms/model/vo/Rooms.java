package rooms.model.vo;

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
    private String Amenity;
    private String Rooms_Desc;
    private Date Rooms_RegDate;
    private String Status;
    private int User_code;
    private String Rooms_name;
    
    public Rooms() {
    }
    
    public Rooms(int rooms_Code, String rooms_Host, String rooms_Type, String rooms_Addr, String rooms_Price,
            String rooms_Personnel, String rooms_RoomCnt, String rooms_ToiletCnt, String amenity, String rooms_Desc,
            Date rooms_RegDate, String status, int user_code, String rooms_name) {
        Rooms_Code = rooms_Code;
        Rooms_Host = rooms_Host;
        Rooms_Type = rooms_Type;
        Rooms_Addr = rooms_Addr;
        Rooms_Price = rooms_Price;
        Rooms_Personnel = rooms_Personnel;
        Rooms_RoomCnt = rooms_RoomCnt;
        Rooms_ToiletCnt = rooms_ToiletCnt;
        Amenity = amenity;
        Rooms_Desc = rooms_Desc;
        Rooms_RegDate = rooms_RegDate;
        Status = status;
        User_code = user_code;
        Rooms_name = rooms_name;
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
    
    public String getStatus() {
        return Status;
    }
    
    public void setStatus(String status) {
        Status = status;
    }
    
    public int getUser_code() {
        return User_code;
    }
    
    public void setUser_code(int user_code) {
        User_code = user_code;
    }
    
    public String getRooms_name() {
        return Rooms_name;
    }
    
    public void setRooms_name(String rooms_name) {
        Rooms_name = rooms_name;
    }
    
    @Override
    public String toString() {
        return "Rooms [Rooms_Code=" + Rooms_Code + ", Rooms_Host=" + Rooms_Host + ", Rooms_Type=" + Rooms_Type
                + ", Rooms_Addr=" + Rooms_Addr + ", Rooms_Price=" + Rooms_Price + ", Rooms_Personnel=" + Rooms_Personnel
                + ", Rooms_RoomCnt=" + Rooms_RoomCnt + ", Rooms_ToiletCnt=" + Rooms_ToiletCnt + ", Amenity=" + Amenity
                + ", Rooms_Desc=" + Rooms_Desc + ", Rooms_RegDate=" + Rooms_RegDate + ", Status=" + Status
                + ", User_code=" + User_code + ", Rooms_name=" + Rooms_name + ", getRooms_Code()=" + getRooms_Code()
                + ", getRooms_Host()=" + getRooms_Host() + ", getRooms_Type()=" + getRooms_Type() + ", getRooms_Addr()="
                + getRooms_Addr() + ", getRooms_Price()=" + getRooms_Price() + ", getRooms_Personnel()="
                + getRooms_Personnel() + ", getRooms_RoomCnt()=" + getRooms_RoomCnt() + ", getRooms_ToiletCnt()="
                + getRooms_ToiletCnt() + ", getAmenity()=" + getAmenity() + ", getRooms_Desc()=" + getRooms_Desc()
                + ", getRooms_RegDate()=" + getRooms_RegDate() + ", getStatus()=" + getStatus() + ", getUser_code()="
                + getUser_code() + ", getRooms_name()=" + getRooms_name() + ", getClass()=" + getClass()
                + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
    }
}