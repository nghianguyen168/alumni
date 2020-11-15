package dtu.captone.alumni.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dtu.captone.alumni.domain.MemberGroup;
import dtu.captone.alumni.respository.MemberGroupRespository;

@Service
public class MemberGroupServiceImpl implements MemberGroupService {
	
	@Autowired
	private MemberGroupRespository memberGroupRespository;

	@Override
	public MemberGroup save(MemberGroup memberGroup) {
		// TODO Auto-generated method stub
		return memberGroupRespository.save(memberGroup);
	}

	@Override
	public void deleteById(int id) {
		// TODO Auto-generated method stub
		memberGroupRespository.deleteById(id);
		
	}

	@Override
	public MemberGroup findById(int id) {
		// TODO Auto-generated method stub
		return memberGroupRespository.findById(id);
	}

	@Override
	public MemberGroup findByMemberIdAndGroupId(int member_id, int group_id) {
		// TODO Auto-generated method stub
		return memberGroupRespository.findByAuthorIdAndGroupId(member_id, group_id);
	}

	@Override
	public List<MemberGroup> findByGroup(int group_id) {
		// TODO Auto-generated method stub
		return memberGroupRespository.findByGroup(group_id);
	}

}
