package dtu.captone.alumni.domain;

import javax.persistence.*;
import javax.validation.constraints.NotNull;



import java.util.Date;

@Entity
@Table(name="chatMessage")
public class ChatMessage {
  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
  private long id;

  @OneToOne
  @JoinColumn(name = "authorUserId")
  private Member authorUser;

  @OneToOne
  @JoinColumn(name = "recipientUserId")
  private Member recipientUser;

  @NotNull
  private Date timeSent;

  @NotNull
  private String contents;

  public ChatMessage() {}

  public ChatMessage(Member authorUser, Member recipientUser, String contents) {
    this.authorUser = authorUser;
    this.recipientUser = recipientUser;
    this.contents = contents;
    this.timeSent = new Date();
  }
  
  public long getId() {
    return this.id;
  }
  
  public Member getAuthorUser() {
    return this.authorUser;
  }
  
  public Member getRecipientUser() {
    return this.recipientUser;
  }

  public void setAuthorUser(Member user) {
    this.recipientUser = user;
  }
  
  public void setRecipientUser(Member user) {
    this.authorUser = user;
  }

  public Date getTimeSent() {
    return this.timeSent;
  }
  
  public String getContents() {
    return this.contents;
  }
}