package dtu.captone.alumni.domain;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "edu_level")
@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class Edu_level implements Serializable{
	
	 private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "edu_level_id")
	@NotNull
	private int edu_level_id; 
	
	@Column(name = "edu_level_code")
	@NotNull
	private String edu_level_code;
	
	@Column(name = "edu_level_name")
	@NotNull
	private String edu_level_name;
}
