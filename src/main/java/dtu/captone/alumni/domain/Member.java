package dtu.captone.alumni.domain;

import java.io.Serializable;
import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "member")
@Data
@AllArgsConstructor
@NoArgsConstructor
@JsonIgnoreProperties({"hibernateLazyInitializer","handler"})
public class Member implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(name = "first_name")
	@NotNull
	private String firstName;

	@Column(name = "last_name")
	@NotNull
	private String lastName;
	
	@Column(name = "dtuMail")
	@NotNull
	private String dtuMail;
	
	@Column(name = "password")
	@NotNull
	private String password;

	@Column(name = "dat_of_birth")
	private Date dateOfBirth;
	

	@Column(name = "country")
	@NotNull
	private String country;

	@Column(name = "province")
	@NotNull
	private String hometown;

	@Column(name = "gender")
	@NotNull
	private String gender;

	@Column(name = "marital_status")
	private String maritalStatus;

	@Column(name = "address_now")
	@NotNull
	private String addressNow;
	
	@Column(name = "position_job")
	private String positionJob;
	
	@Column(name = "company")
	private String company;
	
	@Column(name = "salary")
	private String salary;
	
	@Column(name = "time_start_job")
	private Date timeStartJob;
	
	
	@Column(name = "work_at")
	private String workAt;

	@Column(name = "email")
	private String email;

	@Column(name = "phone")
	private String phone;
	
	@Column(name = "avatar")
	private String avatar;
	
	@Column(name = "token")
	private String token;
	
	
	@Column(name = "decription")
	private String decription;
	
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "major_id",referencedColumnName = "id")
	private Major major = new Major();
	
	@ManyToOne(cascade = CascadeType.MERGE, fetch = FetchType.EAGER)
	@JoinColumn(name = "faculty_id",referencedColumnName = "id")
	private Faculty faculty = new Faculty();
	
	

	@ManyToOne(cascade = CascadeType.MERGE, fetch = FetchType.EAGER)
	@JoinColumn(name = "kname_id",referencedColumnName = "id")
	private Kname kn=new Kname();

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "trainning_system_id",referencedColumnName = "id",foreignKey = @ForeignKey(name = "FK_t_member_trainning_system"))
	private Trainning_system trainning_system = new Trainning_system();

	
	@ManyToOne(cascade = CascadeType.MERGE, fetch = FetchType.EAGER)
	@JoinColumn(name = "member_type_id",referencedColumnName = "id")
	private MemberType memberType = new MemberType();
	
	@Column(name = "enable")
	@NotNull
	private int enable;
	

	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name = "member_role", joinColumns = @JoinColumn(name = "member_id"), inverseJoinColumns = @JoinColumn(name = "role_id"))
	private Set<Role> roles = new HashSet<Role>();

	public Set<Role> getRoles() {
		return roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

	public void addRole(Role role) {
		this.roles.add(role);
	}

	public void removeRole(Role role) {
		this.roles.remove(role);
	}

	public Member(Integer id) {
		super();
		this.id = id;
	}

	

}
