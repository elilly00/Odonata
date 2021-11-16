package main.user.model.vo;

public class User {
    private int User_code;
    private String User_name;
    private String User_pwd;
    private String User_email;
    private String User_phone;
    private String User_birth;
    private String User_id;
    private String User_type;
    private char Status;
    
    public User() {
    }
    
    public User(int user_code, String user_name, String user_pwd, String user_email, String user_phone,
            String user_birth, String user_id, String user_type, char status) {
        User_code = user_code;
        User_name = user_name;
        User_pwd = user_pwd;
        User_email = user_email;
        User_phone = user_phone;
        User_birth = user_birth;
        User_id = user_id;
        User_type = user_type;
        Status = status;
    }
    
    public int getUser_code() {
        return User_code;
    }
    
    public void setUser_code(int user_code) {
        User_code = user_code;
    }
    
    public String getUser_name() {
        return User_name;
    }
    
    public void setUser_name(String user_name) {
        User_name = user_name;
    }
    
    public String getUser_pwd() {
        return User_pwd;
    }
    
    public void setUser_pwd(String user_pwd) {
        User_pwd = user_pwd;
    }
    
    public String getUser_email() {
        return User_email;
    }
    
    public void setUser_email(String user_email) {
        User_email = user_email;
    }
    
    public String getUser_phone() {
        return User_phone;
    }
    
    public void setUser_phone(String user_phone) {
        User_phone = user_phone;
    }
    
    public String getUser_birth() {
        return User_birth;
    }
    
    public void setUser_birth(String user_birth) {
        User_birth = user_birth;
    }
    
    public String getUser_id() {
        return User_id;
    }
    
    public void setUser_id(String user_id) {
        User_id = user_id;
    }
    
    public String getUser_type() {
        return User_type;
    }
    
    public void setUser_type(String user_type) {
        User_type = user_type;
    }
    
    public char getStatus() {
        return Status;
    }
    
    public void setStatus(char status) {
        Status = status;
    }
    
    @Override
    public String toString() {
        return "User [User_code=" + User_code + ", User_name=" + User_name + ", User_pwd=" + User_pwd + ", User_email="
                + User_email + ", User_phone=" + User_phone + ", User_birth=" + User_birth + ", User_id=" + User_id
                + ", User_type=" + User_type + ", Status=" + Status + "]";
    }
}
