package dtu.captone.alumni.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dtu.captone.alumni.domain.Edu_level;
import dtu.captone.alumni.respository.Edu_LevelRespository;

@Service
public class EduLevelServiceImpl implements EduLevelService {
	
	@Autowired
	private Edu_LevelRespository edu_LevelRespository;

	@Override
	public Edu_level save(Edu_level edu_level) {
		
		return edu_LevelRespository.save(edu_level);
	}

	@Override
	public List<Edu_level> findAll() {
		// TODO Auto-generated method stub
		return edu_LevelRespository.findAll();
	}

	@Override
	public void deleteById(int id) {
		// TODO Auto-generated method stub
		 edu_LevelRespository.deleteById(id);
	}

}
