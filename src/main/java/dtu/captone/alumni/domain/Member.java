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
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "member")
@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class Member extends Auditable implements Serializable{
	
	 private static final long serialVersionUID = 1L;
	 
	 @Id
	 @Column(name = "id")
	 @NotNull
	 private int id;
	 
	 @Column(name = "first_name")
	 @NotNull
	 private String first_name;
	 
	 @Column(name = "last_name")
	 @NotNull
	 private String last_name;
	 
	 @Column(name = "dat_of_birth")
	 @NotNull
	 private Date dat_of_birth;
	 
	 @Column(name = "hometown")
	 @NotNull
	 private String hometown;
	 
	 @Column(name = "gender")
	 @NotNull
	 private String gender;
	 
	 @Column(name = "marital_status")
	 @NotNull
	 private String marital_status;
	 
	 @Column(name = "address_now")
	 @NotNull
	 private String address_now;
	 
	 @Column(name = "email")
	 @NotNull
	 private String email;
	 
	 @Column(name = "phone")
	 @NotNull
	 private String phone;
	 
	 @OneToOne
	 @JoinTable(name = "major",joinColumns = @JoinColumn(name="id"), inverseJoinColumns = @JoinColumn(name = "id"))
	 private Major major;
	 
	 @Column(name = "year_participate")
	 @NotNull
	 private int year_participate;
	 
	 @Column(name = "year_greduate")
	 @NotNull
	 private int year_greduate;
	 
	 @ManyToOne
	 @JoinTable(name = "trainning_system",joinColumns = @JoinColumn(name="id"), inverseJoinColumns = @JoinColumn(name = "id"))
	 private Trainning_system trainning_system;
	 
	 @ManyToOne
	 @JoinTable(name = "edu_level",joinColumns = @JoinColumn(name="id"), inverseJoinColumns = @JoinColumn(name = "id"))
	 private Edu_level edu_level;
}
