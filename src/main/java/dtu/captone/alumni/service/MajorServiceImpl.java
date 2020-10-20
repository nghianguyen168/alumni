package dtu.captone.alumni.service;

import java.util.List;

import javax.transaction.Transactional;

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

	@Override
	@Transactional
	public void delelte(int major_id) {
		majorRespository.deleteById(major_id);
		
	}

	@Override
	public Major findById(int id) {
		// TODO Auto-generated method stub
		return majorRespository.findById(id);
	}

	@Override
	public List<Major> findAll() {
		// TODO Auto-generated method stub
		return majorRespository.findAll();
	}

	@Override
	public List<Major> saveAll(List<Major> majorList) {
		// TODO Auto-generated method stub
		return majorRespository.saveAll(majorList);
	}
	

}
