package dtu.captone.alumni.service;

import java.util.List;

import dtu.captone.alumni.domain.Edu_level;
import dtu.captone.alumni.domain.Trainning_system;

public interface TrainningSystemService {
	
	Trainning_system save(Trainning_system trainning_system);
	List<Trainning_system> findAll();
	void deleteById(int id);
}
