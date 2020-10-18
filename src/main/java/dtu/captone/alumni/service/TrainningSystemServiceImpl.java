package dtu.captone.alumni.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dtu.captone.alumni.domain.Edu_level;
import dtu.captone.alumni.domain.Trainning_system;
import dtu.captone.alumni.respository.Edu_LevelRespository;
import dtu.captone.alumni.respository.TrainningSystemRespository;

@Service
public class TrainningSystemServiceImpl implements TrainningSystemService {
	
	@Autowired
	private TrainningSystemRespository trainningSystemServiceImpl;

	@Override
	public Trainning_system save(Trainning_system trainning_system) {
		// TODO Auto-generated method stub
		return trainningSystemServiceImpl.save(trainning_system);
	}

	@Override
	public List<Trainning_system> findAll() {
		// TODO Auto-generated method stub
		return trainningSystemServiceImpl.findAll();
	}

	@Override
	public void deleteById(int id) {
		// TODO Auto-generated method stub
		 trainningSystemServiceImpl.deleteById(id);
	}

	@Override
	public Trainning_system findById(int id) {
		// TODO Auto-generated method stub
		return trainningSystemServiceImpl.findById(id);
	}
	
	

}
