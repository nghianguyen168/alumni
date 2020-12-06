package dtu.captone.alumni.domain;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDateTime;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.Cascade;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "job")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Job implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(name = "position")
	@NotNull
	private String position;

	@Column(name = "company_name")
	@NotNull
	private String companyName;

	@Column(name = "salary")
	@NotNull
	private String salary;

	@Column(name = "location")
	@NotNull
	private String location;

	@Column(name = "posted_on")
	private Timestamp postedOn;
	
	@Column(name = "views")
	private int views;

	@Column(name = "deadline_apply")
	@NotNull
	private Date deadlineApply;

	@Column(name = "decription")
	private String decription;
	
	@ManyToOne(cascade = CascadeType.MERGE, fetch = FetchType.EAGER)
	@JoinColumn(name = "authorId",referencedColumnName = "id")
	private Member member = new Member();
	
	@ManyToOne(cascade = {CascadeType.PERSIST}, fetch = FetchType.EAGER)
	@JoinColumn(name = "major_id",referencedColumnName = "id")
	private Major major=new Major();


	@Column(name = "enable")
	private int enable;
	

	

}
