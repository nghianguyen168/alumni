package dtu.captone.alumni.domain;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import dtu.captone.alumni.model.Auditable;
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
public class Job  implements Serializable{
	
	 private static final long serialVersionUID = 1L;
	 
	 @Id
	 @Column(name = "job_id")
	 @NotNull
	 private int job_id;
	 
	 @Column(name = "position")
	 @NotNull
	 private String position;
	 
	 @Column(name = "company_name")
	 @NotNull
	 private String company_name;
	 
	 @Column(name = "salary")
	 @NotNull
	 private String salary;
	 
	 @Column(name = "location")
	 @NotNull
	 private String location;
	 
	 @Column(name = "posted_on")
	 @NotNull
	 private String posted_on;
	 
	 @Column(name = "deadline_apply")
	 @NotNull
	 private Date deadline_apply;
	 
	 @Column(name = "decription")
	 private String decription;
	 
	 @Column(name = "enable")
		private int enable;

}
