package dtu.captone.alumni.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import dtu.captone.alumni.DTOs.JobChart;
import dtu.captone.alumni.domain.Job;
import dtu.captone.alumni.respository.JobRespository;

@Service
public class JobServiceImpl implements JobService {

	@Autowired
	private JobRespository jobRespository;
	
	@Override
	@Transactional
	public Job save(Job job) {
		return jobRespository.save(job);
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

	@Override
	public int sumJobEnable() {
		// TODO Auto-generated method stub
		return jobRespository.sumJobEnable();
	}

	@Override
	public List<Job> getJobListEnable() {
		// TODO Auto-generated method stub
		return jobRespository.getJobEnable();
				}

	@Override
	public List<Job> getJobListByMajor(int majorId) {
		// TODO Auto-generated method stub
		return jobRespository.getJobListByMajor(majorId);
		
	}

	@Override
	public int updateViews(int id) {
		// TODO Auto-generated method stub
		return jobRespository.updateViews(id);
	}

	@Override
	public List<Job> getJobListSearch(String position, String companyName) {
		// TODO Auto-generated method stub
		return jobRespository.getJobListSearch(position, companyName);
	}

	@Override
	public List<JobChart> getJobForChart() {
		// TODO Auto-generated method stub
		return jobRespository.getJobForChart();
	}

	@Override
	public List<Job> getListByMonth(int month) {
		// TODO Auto-generated method stub
		return jobRespository.getJobListByMonth(month);
	}

	@Override
	public List<Job> getJobListByMonthAndMajor(int month, int major_id) {
		return jobRespository.getJobListByMonthAndMajor(month,major_id);
	}
	@Override
	public List<Job> getJobListBYear(int year, int major_id) {
		return jobRespository.getJobListBYear(year,major_id);
	}
}
