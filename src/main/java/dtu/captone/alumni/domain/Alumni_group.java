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
@Table(name = "alumni_group")
@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class Alumni_group extends Auditable implements Serializable{
	 private static final long serialVersionUID = 1L;
	 
	@Id
	@Column(name = "id")
	@NotNull
	private int id;
	
	@Column(name = "group_name")
	@NotNull
	private String group_name;
	
	@Column(name = "group_decription")
	@NotNull
	private String group_decription;

}
