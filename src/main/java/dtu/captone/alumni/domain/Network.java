package dtu.captone.alumni.domain;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "job")
@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class Network extends Auditable implements Serializable{
	
	 private static final long serialVersionUID = 1L;
	 
	 @Id
	 @Column(name = "id")
	 @NotNull
	 private int id;
	 
	 @OneToMany
	 @JoinTable(name = "member",joinColumns = @JoinColumn(name="member_id"), inverseJoinColumns = @JoinColumn(name = "id"))
	 private Member member_id;
	 
	 @ManyToOne
	 @JoinTable(name = "member",joinColumns = @JoinColumn(name="friend_id"), inverseJoinColumns = @JoinColumn(name = "id"))
	 private Member  friend_id;
	 

}
