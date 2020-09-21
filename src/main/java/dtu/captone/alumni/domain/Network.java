package dtu.captone.alumni.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "job")
@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class Network  implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "network_id")
	@NotNull
	private int network_id;

	@Column(name = "member_id")
	@NotNull
	private Member member_id;

	@Column(name = "friend_id")
	@NotNull
	private Member friend_id;

}
