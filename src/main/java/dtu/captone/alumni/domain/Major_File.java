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
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "major_file")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Major_File  implements Serializable{
	
	 private static final long serialVersionUID = 1L;
	 
	 @Id
	 @Column(name = "id")
	 @GeneratedValue(strategy = GenerationType.IDENTITY)
	 @NotNull
	 private int id;
	 
	 @Column(name = "file_name")
	 @NotNull
	 private String file_name;
	 
	 @OneToOne(cascade = CascadeType.ALL)
	 @JoinColumn(name = "authorId",referencedColumnName = "id")
	 private Member member;
	 
	 @ManyToOne(cascade = CascadeType.ALL)
	 @JoinColumn(name = "jobId",referencedColumnName = "id")
	 private Job job;

}
