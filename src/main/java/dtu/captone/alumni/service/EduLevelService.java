package dtu.captone.alumni.service;

import java.util.List;

import dtu.captone.alumni.domain.Edu_level;

public interface EduLevelService {
	
	Edu_level save(Edu_level edu_level);
	List<Edu_level> findAll();
	void deleteById(int id);
}
