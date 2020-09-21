package dtu.captone.alumni.domain;

import java.io.Serializable;

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
@Table(name = "major")
@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class Major  implements Serializable{
	
	 private static final long serialVersionUID = 1L;
	 
	 @Id
	 @Column(name = "major_id")
	 @NotNull
	 private int major_id;
	 
	 @Column(name = "major_code")
	 @NotNull
	 private String major_code;
	 
	 @Column(name = "major_name")
	 @NotNull
	 private String major_name;

}
