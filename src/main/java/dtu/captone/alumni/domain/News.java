package dtu.captone.alumni.domain;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "news")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class News {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@NotNull
	private int id;

	@Column(name = "news_name")
	@NotNull
	private String newsName;

	@Column(name = "picture")
	private String picture;

	@Column(name = "decription",columnDefinition="TEXT")
	@NotNull
	private String decription;

	@Column(name = "detail",columnDefinition="TEXT")
	private String detail;
	
	@Column(name = "createAt")
	private Timestamp createAt;

	@Column(name = "enable")
	private int enable;
	
	
	

}
