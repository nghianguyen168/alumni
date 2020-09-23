package dtu.captone.alumni.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dtu.captone.alumni.domain.Member;
import dtu.captone.alumni.respository.MemberRespository;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberRespository memberRespository;
	
	@Override
	public void save(Member member) {
		memberRespository.save(member);
		
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
	public List<Member> findAll() {
		// TODO Auto-generated method stub
		return memberRespository.findAll();
	}

	@Override
	public List<Member> getListEnable() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int active(int enable, int id) {
		// TODO Auto-generated method stub
		return 0;
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

}
