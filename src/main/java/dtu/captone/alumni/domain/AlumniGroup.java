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

import org.springframework.data.annotation.Persistent;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "alumni_group")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class AlumniGroup  implements Serializable{

	 private static final long serialVersionUID = 1L;
	 
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@NotNull
	private int id;
	
	@Column(name = "group_name")
	@NotNull
	private String groupName;
	
	@Column(name = "group_decription")
	private String groupDecription;
	
	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "create_by",referencedColumnName = "id")
	private Member member;



}
