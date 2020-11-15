package dtu.captone.alumni.service;

import java.util.List;

import dtu.captone.alumni.domain.MemberGroup;

public interface MemberGroupService {
	
	MemberGroup save(MemberGroup memberGroup);
	
	
	void deleteById(int id);
	
	MemberGroup findById(int id);
	
	MemberGroup findByMemberIdAndGroupId(int member_id,int group_id);
	
	List<MemberGroup> findByGroup(int group_id);
	
	
}
