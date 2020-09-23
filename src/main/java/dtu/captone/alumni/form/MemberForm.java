package dtu.captone.alumni.form;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberForm {
	private Integer id;
	private String first_name;
	private String last_name;
	private String hometown;
	private String gender;
	private String marital_status;
	private String adress_now;
	private String email;
	private String phone;
	private String avatar;
	private String decription;
	private int major_id;
	private int year_participate;
	private int year_greduate;
	private int trainning_system_id;
	private int edu_level_id;
}
