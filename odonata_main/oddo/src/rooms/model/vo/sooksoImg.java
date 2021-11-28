package rooms.model.vo;

public class sooksoImg {
    private int image_number;
    private String Origin_name;
    private String Change_name;
    private int image_Level;
    private String image_path;
    private int Rooms_Code;
    private String Status;
    
    public sooksoImg() {
    }
    
    public sooksoImg(int image_number, String origin_name, String change_name, int image_Level, String image_path,
            int rooms_Code, String status) {
        super();
        this.image_number = image_number;
        Origin_name = origin_name;
        Change_name = change_name;
        this.image_Level = image_Level;
        this.image_path = image_path;
        Rooms_Code = rooms_Code;
        Status = status;
    }
    
    public int getImage_number() {
        return image_number;
    }
    
    public void setImage_number(int image_number) {
        this.image_number = image_number;
    }
    
    public String getOrigin_name() {
        return Origin_name;
    }
    
    public void setOrigin_name(String origin_name) {
        Origin_name = origin_name;
    }
    
    public String getChange_name() {
        return Change_name;
    }
    
    public void setChange_name(String change_name) {
        Change_name = change_name;
    }
    
    public int getImage_Level() {
        return image_Level;
    }
    
    public void setImage_Level(int image_Level) {
        this.image_Level = image_Level;
    }
    
    public String getImage_path() {
        return image_path;
    }
    
    public void setImage_path(String image_path) {
        this.image_path = image_path;
    }
    
    public int getRooms_Code() {
        return Rooms_Code;
    }
    
    public void setRooms_Code(int rooms_Code) {
        Rooms_Code = rooms_Code;
    }
    
    public String getStatus() {
        return Status;
    }
    
    public void setStatus(String status) {
        Status = status;
    }
    
    @Override
    public String toString() {
        return "sooksoImg [image_number=" + image_number + ", Origin_name=" + Origin_name + ", Change_name="
                + Change_name + ", image_Level=" + image_Level + ", image_path=" + image_path + ", Rooms_Code="
                + Rooms_Code + ", Status=" + Status + "]";
    }
}