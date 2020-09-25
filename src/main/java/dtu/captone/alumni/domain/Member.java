package dtu.captone.alumni.domain;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

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
@JsonIgnoreProperties({"hibernateLazyInitializer","handler"})
public class Member  implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(name = "first_name")
	@NotNull
	private String first_name;

	@Column(name = "last_name")
	@NotNull
	private String last_name;
	
	@Column(name = "dtu_mail")
	@NotNull
	private String dtu_mail;
	
	@Column(name = "password")
	@NotNull
	private String password;

	@Column(name = "dat_of_birth")
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
	
	@Column(name = "avatar")
	@NotNull
	private String avatar;
	
	
	@Column(name = "decription")
	private String decription;
	
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "major_id",referencedColumnName = "id")
	private Major major;

	@Column(name = "year_participate")
	@NotNull
	private int year_participate;

	@Column(name = "year_greduate")
	@NotNull
	private int year_greduate;

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "trainning_system_id",referencedColumnName = "id",foreignKey = @ForeignKey(name = "FK_t_member_trainning_system"))
	private Trainning_system trainning_system;

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "edu_level_id",referencedColumnName = "id",foreignKey = @ForeignKey(name = "FK_t_member_edu_level"))
	private Edu_level edu_level;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "member_type_id",referencedColumnName = "id")
	private Member_type member_type;
	
	@Column(name = "enable")
	@NotNull
	private int enable;


}
