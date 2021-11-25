package msg.model.vo;

import java.sql.Date;

public class Message {

  private int Message_Code;
  private String Message_Title;
  private Date SendTime;
  private Date ReadTime;
  private String Message_Text;
  private String Send_Id;
  private String Receive_Id;
  private char Status;

  public Message() {}

  public Message(
    int message_Code,
    String message_Title,
    Date sendTime,
    Date readTime,
    String message_Text,
    String send_Id,
    String receive_Id,
    char status
  ) {
    Message_Code = message_Code;
    Message_Title = message_Title;
    SendTime = sendTime;
    ReadTime = readTime;
    Message_Text = message_Text;
    Send_Id = send_Id;
    Receive_Id = receive_Id;
    Status = status;
  }

  public int getMessage_Code() {
    return Message_Code;
  }

  public void setMessage_Code(int message_Code) {
    Message_Code = message_Code;
  }

  public String getMessage_Title() {
    return Message_Title;
  }

  public void setMessage_Title(String message_Title) {
    Message_Title = message_Title;
  }

  public Date getSendTime() {
    return SendTime;
  }

  public void setSendTime(Date sendTime) {
    SendTime = sendTime;
  }

  public Date getReadTime() {
    return ReadTime;
  }

  public void setReadTime(Date readTime) {
    ReadTime = readTime;
  }

  public String getMessage_Text() {
    return Message_Text;
  }

  public void setMessage_Text(String message_Text) {
    Message_Text = message_Text;
  }

  public String getSend_Id() {
    return Send_Id;
  }

  public void setSend_Id(String send_Id) {
    Send_Id = send_Id;
  }

  public String getReceive_Id() {
    return Receive_Id;
  }

  public void setReceive_Id(String receive_Id) {
    Receive_Id = receive_Id;
  }

  public char getStatus() {
    return Status;
  }

  public void setStatus(char status) {
    Status = status;
  }

  @Override
  public String toString() {
    return (
      "Message [Message_Code=" +
      Message_Code +
      ", Message_Title=" +
      Message_Title +
      ", SendTime=" +
      SendTime +
      ", ReadTime=" +
      ReadTime +
      ", Message_Text=" +
      Message_Text +
      ", Send_Id=" +
      Send_Id +
      ", Receive_Id=" +
      Receive_Id +
      ", Status=" +
      Status +
      "]"
    );
  }
}
