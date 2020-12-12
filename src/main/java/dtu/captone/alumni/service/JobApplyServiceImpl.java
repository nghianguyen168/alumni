package dtu.captone.alumni.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import dtu.captone.alumni.domain.JobApply;
import dtu.captone.alumni.respository.JobApplyRespository;

@Service
public class JobApplyServiceImpl implements JobApplyService{
	
	@Autowired
	private JobApplyRespository jobApplyRespository;

	@Override
	@Transactional
	public JobApply save(JobApply jobApply) {
		// TODO Auto-generated method stub
		return jobApplyRespository.save(jobApply);
	}

	@Override
	public Page<JobApply> findAll(Pageable pageable) {
		// TODO Auto-generated method stub
		return jobApplyRespository.findAll(pageable);
	}

	@Override
	public List<JobApply> findAll(Sort sort) {
		// TODO Auto-generated method stub
		return jobApplyRespository.findAll(sort);
	}

	@Override
	public void deleteByJob_id(int id) {
		 jobApplyRespository.deleteByJob_Id(id);
		
	}

	@Override
	public void deleteByMemberId(int id) {
		jobApplyRespository.deleteByMemberId(id);
	}

	@Override
	public List<JobApply> findByJob(Integer id,int offset, int limit) {
		// TODO Auto-generated method stub
		return jobApplyRespository.findByJob(id,offset,limit);
	}

	@Override
	public int updateCheckStatus(int id) {
		// TODO Auto-generated method stub
		return jobApplyRespository.updateCheckStatus(id);
	}

	@Override
	public int sumJobApply(int id) {
		// TODO Auto-generated method stub
		return jobApplyRespository.sumJobApply(id);
	}

	@Override
	public int sumJobApplyByMonth(int month) {
		return jobApplyRespository.sumJobApplyByMonth(month);
	}

	@Override
	public List<JobApply> findJobApply(int id) {
		// TODO Auto-generated method stub
		return jobApplyRespository.findJobApply(id);
	}

	@Override
	public int updateCheckOneStatus(int id) {
		// TODO Auto-generated method stub
		return jobApplyRespository.updateCheckOneStatus(id);
	}

	@Override
	public List<JobApply> findByJob(Integer id) {
		// TODO Auto-generated method stub
		return jobApplyRespository.findByJob(id);
	}


}
