package dtu.captone.alumni.domain;

import java.io.Serializable;

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
@Table(name = "trainning_system")
@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class Trainning_system  implements Serializable{
	
	 private static final long serialVersionUID = 1L;
	 
	 @Id
	 @Column(name = "trainning_system_id")
	 @NotNull
	 private int trainning_system_id;
	 
	 @Column(name = "code")
	 @NotNull
	 private String code;
	 
	 @Column(name = "training_system_name")
	 @NotNull
	 private String training_system_name;
	 

}
