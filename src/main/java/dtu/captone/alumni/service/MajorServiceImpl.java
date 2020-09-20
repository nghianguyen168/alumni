package dtu.captone.alumni.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dtu.captone.alumni.domain.Major;
import dtu.captone.alumni.respository.MajorRespository;


@Service
public class MajorServiceImpl implements MajorService{
	
	@Autowired
	MajorRespository majorRespository;
	
	@Override
	public Major save(Major major) {
		// TODO Auto-generated method stub
		return majorRespository.save(major);
	}

}
