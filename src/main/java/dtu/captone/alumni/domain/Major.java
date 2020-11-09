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
import javax.validation.constraints.NotNull;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "major")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Major  implements Serializable{
	
	 private static final long serialVersionUID = 1L;
	 
	 @Id
	 @Column(name = "id")
	 @GeneratedValue(strategy = GenerationType.IDENTITY)
	 @NotNull
	 private int id;
	 
	 @Column(name = "major_code")
	 private String majorCode;	
	 
	 @Column(name = "major_name")
	 private String majorName;
	 
	 @ManyToOne(cascade = CascadeType.ALL)
	 @JoinColumn(name = "faculty_id", referencedColumnName = "id")
	 private Faculty faculty;

}
