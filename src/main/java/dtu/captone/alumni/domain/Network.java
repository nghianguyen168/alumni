package dtu.captone.alumni.domain;

import java.io.Serializable;
import java.sql.Timestamp;

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
import lombok.NoArgsConstructor;

@Entity
@Table(name = "network")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Network  implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@ManyToOne
	@JoinColumn(name = "member_id",referencedColumnName = "id",updatable = false)
	private Member member = new Member();

	@ManyToOne
	@JoinColumn(name = "friend_id",referencedColumnName = "id",updatable = false)
	private Member friend = new Member();
	
	@Column(name = "status")
	@NotNull
	private int status;
	
	@Column(name="sendAt")
	private Timestamp sendAt;

}
