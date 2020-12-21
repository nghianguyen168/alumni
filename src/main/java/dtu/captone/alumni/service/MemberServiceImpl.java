package dtu.captone.alumni.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import dtu.captone.alumni.domain.Member;
import dtu.captone.alumni.respository.MemberRespository;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberRespository memberRespository;
	
	@Override
	public Member save(Member member) {
		return memberRespository.save(member);
		
	}
	

	@Override
	public void delete(Member member) {
		// TODO Auto-generated method stub
		memberRespository.delete(member);
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		memberRespository.deleteById(id);
	}


	@Override
	public int active(int enable, int id) {
		// TODO Auto-generated method stub
		return memberRespository.active(enable, id);
	}

	@Override
	public Member findById(int id) {
		return memberRespository.findById(id);
	}
	

	@Override
	public List<Member> findByName(String member_name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Page<Member> findAll(Pageable page) {
		// TODO Auto-generated method stub
		return memberRespository.findAll(page);
	}


	@Override
	public List<Member> findAll() {
		// TODO Auto-generated method stub
		return memberRespository.findAll();
	}

	@Override
	public Page<Member> getListEnable(Pageable page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Page<Member> findByHomwtown(String hometown, Pageable pageable) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Page<Member> getListByTypeEnable(int type, Pageable pageable) {
		// TODO Auto-generated method stub
		return memberRespository.getListByTypeEnable(1, PageRequest.of(0, 5));
	}

	@Override
	public List<Member> findByMemberType(int member_type) {
		// TODO Auto-generated method stub
		return memberRespository.findByMemberType(member_type);
	}

	@Override
	public List<Member> findAllEnable(int id) {
		// TODO Auto-generated method stub
		return memberRespository.findAllEnable(id);
	}


	@Override
	@Transactional
	public Member update(Member member) {
		// TODO Auto-generated method stub
		return memberRespository.saveAndFlush(member);
	}


	@Override
	public List<Member> saveAll(List<Member> memberlist) {
		// TODO Auto-generated method stub
		return memberRespository.saveAll(memberlist);
	}

	@Override
	public Member findByStudentId(Long studentId) {
		return memberRespository.findByStudentID(studentId);
	}


	@Override
	public List<Member> findByKname(int id) {
		// TODO Auto-generated method stub
		return memberRespository.findByKname(id);
	}

	@Override
	public List<Member> findByMajor(int id) {
		return memberRespository.findByMajor(id);
	}

	@Override
	public List<Member> findByRole(int role_id) {
		return memberRespository.findByRole(role_id);
	}

	@Override
	public List<Member> findByType(int id) {
		return memberRespository.findByType(id);
	}

	@Override
	public List<Member> findByRoleAll(int role_id) {
		return memberRespository.findByRoleAll(role_id);
	}

	@Override
	public List<Member> findByNameSearch(String name,String name2) {
		return memberRespository.findByNameSearch(name,name2);
	}

	@Override
	public Member findByDtuMail(String dtuMail) {
		return memberRespository.findByDtuMail(dtuMail);
	}

}
