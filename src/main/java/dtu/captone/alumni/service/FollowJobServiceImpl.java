package dtu.captone.alumni.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dtu.captone.alumni.domain.FollowJob;
import dtu.captone.alumni.respository.FollowJobRespository;

@Service
public class FollowJobServiceImpl implements FollowJobService{
	
	@Autowired
	private FollowJobRespository followJobRespository;

	@Override
	public FollowJob save(FollowJob followJob) {
		// TODO Auto-generated method stub
		return followJobRespository.save(followJob);
		
	}

}
