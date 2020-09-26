package dtu.captone.alumni.domain;

import java.io.Serializable;
import java.sql.Timestamp;

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
@Table(name = "comment")
@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class Comment implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@NotNull
	private int id;
	
	@Column(name = "post_id")
	@NotNull
	private int post_id;
	
	@Column(name = "comment")
	@NotNull
	private String comment;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "authorId",referencedColumnName = "id")
	private Member member;
	
	@Column(name = "time_comment")
	@NotNull
	private Timestamp time_comment;
	
	@Column(name = "parent_id")
	@NotNull
	private int parent_id;

}