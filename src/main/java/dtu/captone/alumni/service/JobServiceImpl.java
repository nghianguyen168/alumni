package dtu.captone.alumni.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import dtu.captone.alumni.domain.Job;
import dtu.captone.alumni.respository.JobRespository;

@Service
public class JobServiceImpl implements JobService {

	@Autowired
	private JobRespository jobRespository;
	
	@Override
	public Job save(Job Job) {
		
		return jobRespository.save(Job);
	}

	@Override
	public void deleteById(int id) {
		jobRespository.deleteById(id);
		
	}
	@Override
	public Job findById(int id) {
		// TODO Auto-generated method stub
		return jobRespository.findById(id);
	}

	@Override
	public int active(int enable, int id,int author_id) {
		return jobRespository.active(enable, id, author_id);
	}

	@Override
	public Page<Job> findAll(Pageable pageable) {
		// TODO Auto-generated method stub
		return jobRespository.findAll(pageable);
	}

	@Override
	public Page<Job> getJobListEnable(Pageable pageable) {
		// TODO Auto-generated method stub
		return jobRespository.getJobListEnable(pageable);
	}

	@Override
	public List<Job> findByAuthorId(int author_id) {
		// TODO Auto-generated method stub
		return jobRespository.findByAuthorId(author_id);
	}

	@Override
	public List<Job> findAll(Sort sort) {
		// TODO Auto-generated method stub
		return jobRespository.findAll(sort);
	}

	@Override
	public int active(int enable, int id) {
		// TODO Auto-generated method stub
		return jobRespository.active(enable, id);
	}
}
