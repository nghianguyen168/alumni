package dtu.captone.alumni.domain;

import javax.persistence.*;
import javax.validation.constraints.NotNull;


import java.util.UUID;

@Entity
@Table(name="chatChannel")
public class ChatChannel {

  @Id
  @NotNull
  private String uuid;

  @OneToOne
  @JoinColumn(name = "userIdOne")
  private Member userOne;

  @OneToOne
  @JoinColumn(name = "userIdTwo")
  private Member userTwo;

  public ChatChannel(Member userOne, Member userTwo) {
    this.uuid = UUID.randomUUID().toString();
    this.userOne = userOne;
    this.userTwo = userTwo;
  }

  public ChatChannel() {}

  public void setUserTwo(Member user) {
    this.userTwo = user;
  }

  public void setUserOne(Member user) {
    this.userOne = user;
  }

  public Member getUserOne() {
    return this.userOne;
  }

  public Member getUserTwo() {
    return this.userTwo;
  }

  public String getUuid() {
    return this.uuid;
  }
}