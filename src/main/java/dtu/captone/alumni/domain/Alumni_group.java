package dtu.captone.alumni.domain;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
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
public class Alumni_group  implements Serializable{
	
	 private static final long serialVersionUID = 1L;
	 
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@NotNull
	private int id;
	
	@Column(name = "group_name")
	@NotNull
	private String group_name;
	
	@Column(name = "group_decription")
	private String group_decription;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "create_by",referencedColumnName = "id")
	private Member member;
	
	@Transient
	private int sum_member;
	

}
