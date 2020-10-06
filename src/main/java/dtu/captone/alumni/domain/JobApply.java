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
@Table(name = "job_apply")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class JobApply implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name = "cv")
	@NotNull
	private String cv;
	
	@Column(name = "apply_on")
	private Timestamp applyOn;

	
	@ManyToOne(cascade= {CascadeType.ALL}, fetch=FetchType.LAZY)
	@JoinColumn(name = "job_id",referencedColumnName = "id")
	private Job job = new Job();
	

	@ManyToOne(cascade = CascadeType.MERGE, fetch = FetchType.EAGER)
	@JoinColumn(name = "member_id",referencedColumnName = "id")
	private Member member = new Member();
	
	@Column(name = "check_status")
	private int checkStatus;
	

}
