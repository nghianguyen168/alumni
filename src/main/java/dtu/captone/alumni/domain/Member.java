package dtu.captone.alumni.domain;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
public class Member  implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@NotNull
	private int id;

	@Column(name = "first_name")
	@NotNull
	private String first_name;

	@Column(name = "last_name")
	@NotNull
	private String last_name;

	@Column(name = "dat_of_birth")
	private Timestamp dat_of_birth;

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
	
	@Column(name = "avatar")
	@NotNull
	private String avatar;
	
	
	@Column(name = "decription")
	private String decription;
	

	@Column(name = "major_id")
	private int major_id;
	
	
	@ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name = "major_id",referencedColumnName = "id",foreignKey = @ForeignKey(name = "FK_t_member_major"),insertable = false,updatable = false)
	private Major major;

	@Column(name = "year_participate")
	@NotNull
	private int year_participate;

	@Column(name = "year_greduate")
	@NotNull
	private int year_greduate;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "trainning_system_id",referencedColumnName = "id",foreignKey = @ForeignKey(name = "FK_t_member_trainning_system"))
	private Trainning_system trainning_system;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "edu_level_id",referencedColumnName = "id",foreignKey = @ForeignKey(name = "FK_t_member_edu_level"))
	private Edu_level edu_level;

}
