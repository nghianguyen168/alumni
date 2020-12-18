package dtu.captone.alumni.domain;

import java.io.Serializable;

import javax.persistence.*;
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


	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "member_id",referencedColumnName = "id")
	private Member member = new Member();


	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "friend_id",referencedColumnName = "id")
	private Member friend = new Member();
	
	@Column(name = "status")
	@NotNull
	private int status;

}
