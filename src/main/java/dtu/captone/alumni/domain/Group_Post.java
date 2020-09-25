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
@Table(name = "group_post")
@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class Group_Post  implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "title")
	@NotNull
	private String title;
	
	@Column(name = "time_post")
	@NotNull
	private Timestamp time_post;
	
	@Column(name = "media")
	@NotNull
	private String media;
	
	@Column(name = "file")
	@NotNull
	private String file;
	
	@Column(name = "sum_like")
	private int sum_like;
	
	@Column(name = "sum_comment")
	private int sum_comment;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "authorId",referencedColumnName = "id")
	private Member member;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "groupId",referencedColumnName = "id")
	private Alumni_group alumni_group;
}
