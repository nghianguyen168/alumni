package dtu.captone.alumni.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dtu.captone.alumni.domain.Kname;
import dtu.captone.alumni.domain.MemberType;
import dtu.captone.alumni.respository.KNameRespository;
import dtu.captone.alumni.respository.MemberTypeRespository;


@Service
public class MemberTypeServiceImpl implements MemberTypeService{

	@Autowired
	private MemberTypeRespository memberTypeRespository;

	@Override
	public MemberType save(MemberType memberType) {
		// TODO Auto-generated method stub
		return memberTypeRespository.save(memberType);
	}

	@Override
	public void delelte(int memberType_id) {
		// TODO Auto-generated method stub
		memberTypeRespository.deleteById(memberType_id);
		
	}

	@Override
	public MemberType findById(int id) {
		// TODO Auto-generated method stub
		return memberTypeRespository.findById(id);
	}

	@Override
	public List<MemberType> findAll() {
		// TODO Auto-generated method stub
		return memberTypeRespository.findAll();
	}
	
	
	
	
	

}
