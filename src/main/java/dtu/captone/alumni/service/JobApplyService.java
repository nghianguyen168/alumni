package dtu.captone.alumni.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import dtu.captone.alumni.domain.JobApply;

public interface JobApplyService {
	
	JobApply save(JobApply jobApply);
	
	
	/*
	 * void deleteById(int id);
	 * 
	 * Job findById(int id);
	 * 
	 * int active(int enable,int id,int author_id); int active(int enable,int id);
	 */
	
	Page<JobApply> findAll(Pageable pageable);
	
	List<JobApply> findByJob(Integer id,int offset,int limit);
	
	List<JobApply> findAll(Sort sort);
	
	List<JobApply> findJobApply(int id);
	
	void deleteByJob_id(int id);
	
	int updateCheckStatus(int id);
	
	int sumJobApply(int id);
	
	/*
	 * List<Job> getJobListByMajor(int majorId);
	 * 
	 * 
	 * List<Job> findByAuthorId(int authorId);
	 * 
	 * int sumJobEnable();
	 */
}
