package dtu.captone.alumni.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.query.Param;

import dtu.captone.alumni.domain.Member;

public interface MemberService {
	
	Member save(Member member);
	
	List<Member> saveAll(List<Member> memberList);

	Member findByStudentId(Long studentId);
	
	Member update(Member member);
	
	void delete(Member member);
	void delete(int id);
	Page<Member> findAll(Pageable page);
	List<Member> findAll();
	Page<Member> getListEnable(Pageable page);
	int active(int enable,int id);
	Member findById(int id);
	List<Member> findByName(@Param("member_name") String member_name);
	
	List<Member> findByMemberType(int member_type);
	//Tìm kiếm 
	Page<Member> findByHomwtown(String hometown,Pageable pageable);
	
	Page<Member> getListByTypeEnable(int type,Pageable pageable);



	List<Member> findAllEnable(int id);
	
	List<Member> findByKname(int id);

	List<Member> findByMajor(int id);

	List<Member> findByType(int id);

	List<Member> findByRoleAll(int role_id);

	List<Member> findByRole(int role_id);

	List<Member> findByNameSearch(String name,String name2);
}
