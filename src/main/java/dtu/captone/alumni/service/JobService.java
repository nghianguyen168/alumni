package dtu.captone.alumni.service;

import java.util.List;

import javax.persistence.CascadeType;

import org.hibernate.annotations.Cascade;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import dtu.captone.alumni.domain.Job;

public interface JobService {
	
	Job save(Job Job);
	
	
	void deleteById(int id);
	
	Job findById(int id);
	
	int active(int enable,int id,int author_id);
	int active(int enable,int id);
	
	Page<Job> findAll(Pageable pageable);
	
	List<Job> findAll(Sort sort);
	
	Page<Job> getJobListEnable(Pageable pageable);
	
	List<Job> findByAuthorId(int authorId);
}
