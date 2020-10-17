package dtu.captone.alumni.service;

import java.util.List;

import dtu.captone.alumni.domain.Faculty;

public interface FacultyService {
	Faculty save(Faculty Faculty);
	void delelte(int Faculty_id);
	Faculty findById(int id);
	List<Faculty> findAll();
	
}
