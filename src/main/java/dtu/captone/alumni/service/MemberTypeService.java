package dtu.captone.alumni.service;

import java.util.List;

import dtu.captone.alumni.domain.MemberType;

public interface MemberTypeService {
	MemberType save(MemberType memberType);
	void delelte(int MemberType_id);
	MemberType findById(int id);
	List<MemberType> findAll();
	
}
