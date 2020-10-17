package dtu.captone.alumni.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dtu.captone.alumni.domain.Faculty;
import dtu.captone.alumni.respository.FacultyRespository;


@Service
public class FacultyServiceImpl implements FacultyService{
	
	@Autowired
	FacultyRespository FacultyRespository;
	
	@Override
	public Faculty save(Faculty Faculty) {
		// TODO Auto-generated method stub
		return FacultyRespository.save(Faculty);
	}

	@Override
	@Transactional
	public void delelte(int Faculty_id) {
		FacultyRespository.deleteById(Faculty_id);
		
	}

	@Override
	public Faculty findById(int id) {
		// TODO Auto-generated method stub
		return FacultyRespository.findById(id);
	}

	@Override
	public List<Faculty> findAll() {
		// TODO Auto-generated method stub
		return FacultyRespository.findAll();
	}
	

}
