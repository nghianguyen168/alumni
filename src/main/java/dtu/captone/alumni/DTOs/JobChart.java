package dtu.captone.alumni.DTOs;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class JobChart {
	private int id;
	private String majorName;
	private int count;
}
