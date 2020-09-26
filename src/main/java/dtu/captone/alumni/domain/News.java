package dtu.captone.alumni.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.br.CPF;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "news")
@Data
@AllArgsConstructor
@NoArgsConstructor

@EqualsAndHashCode(callSuper=false)
public class News {
	private static final  long serialVersionUID=1L;
	
	@Id
	@Column(name = "id")
	 @GeneratedValue(strategy = GenerationType.IDENTITY)
	@NotNull
	private int id;
	
	@Column(name = "news_name")
	@NotNull
	private String news_name;
	
	@Column(name = "picture")
	@NotNull
	private String picture;
	
	@Column(name = "decription")
	@NotNull
	private String decription;
	
	@Column(name = "detail")
	private String detail;
	
	@Column(name = "enable")
	private int enable;
	

}