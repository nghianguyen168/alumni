package dtu.captone.alumni.service;

import java.util.List;

import org.springframework.data.repository.query.Param;

import dtu.captone.alumni.domain.Member;
import dtu.captone.alumni.form.MemberForm;

public interface MemberService {
	void save(Member member);
	void delete(Member member);
	void delete(int id);
	List<Member> findAll();
	List<Member> getListEnable();
	int active(int enable,int id);
	Member findById(int id);
	List<Member> findByName(@Param("member_name") String member_name);
	
}
