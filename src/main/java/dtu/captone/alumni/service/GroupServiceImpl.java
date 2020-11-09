package dtu.captone.alumni.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import dtu.captone.alumni.domain.AlumniGroup;
import dtu.captone.alumni.domain.Job;
import dtu.captone.alumni.respository.GroupRespository;

@Service
public class GroupServiceImpl implements GroupService {
	
	@Autowired
	private GroupRespository groupRespository;

	@Override
	public AlumniGroup save(AlumniGroup alumni_group) {
		// TODO Auto-generated method stub
		return groupRespository.save(alumni_group);
	}

	@Override
	public void deleteById(int id) {
		groupRespository.deleteById(id);
		
	}

	@Override
	public AlumniGroup findById(int id) {
		// TODO Auto-generated method stub
		return groupRespository.findById(id);
	}

	@Override
	public List<AlumniGroup> findAll() {
		// TODO Auto-generated method stub
		return groupRespository.findAll();
	}

}
