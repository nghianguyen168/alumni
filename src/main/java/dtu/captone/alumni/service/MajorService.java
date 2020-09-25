package dtu.captone.alumni.service;

import java.util.List;

import dtu.captone.alumni.domain.Major;

public interface MajorService {
	Major save(Major major);
	void delelte(int major_id);
	Major findById(int id);
	List<Major> findAll();
	
}
