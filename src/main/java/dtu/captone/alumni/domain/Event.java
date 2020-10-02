package dtu.captone.alumni.domain;

import java.io.Serializable;
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
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "event")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Event   implements Serializable{
	
	 private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@NotNull
	private int id;
	
	@Column(name = "event_name")
	@NotNull
	private String event_name;
	
	@Column(name = "decription")
	@NotNull
	private String decription;
	
	@Column(name = "time_start")
	@NotNull
	private String time_start;
	
	@Column(name = "time_end")
	@NotNull
	private String time_end;
	
	@Column(name = "place")
	@NotNull
	private String place;
	
	@Column(name = "enable")
	private int enable;
	
	
}
