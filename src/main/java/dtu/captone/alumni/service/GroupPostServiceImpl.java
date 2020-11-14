package dtu.captone.alumni.service;

import java.util.List;
import java.util.UUID;

import org.apache.velocity.app.event.ReferenceInsertionEventHandler.referenceInsertExecutor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import dtu.captone.alumni.domain.GroupPost;
import dtu.captone.alumni.respository.GroupPostRespository;

@Service
public class GroupPostServiceImpl implements GroupPostService {

	@Autowired
	private GroupPostRespository groupPostRespository;

	@Override
	public GroupPost save(GroupPost group_Post) {
		// TODO Auto-generated method stub
		return groupPostRespository.save(group_Post);
	}

	/*
	 * @Override public void deleteById(Integer id) { // TODO Auto-generated method
	 * stub groupPostRespository.deleteById(id);
	 * 
	 * }
	 */

	@Override
	public GroupPost findById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Page<GroupPost> findAll(Pageable pageable) {
		// TODO Auto-generated method stub
		return groupPostRespository.findAll(pageable);
	}

	@Override
	public List<GroupPost> findAll(Sort sort) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Page<GroupPost> getNewsListEnable(Pageable pageable) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteById(UUID id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<GroupPost> findByGroup(int group_id) {
		// TODO Auto-generated method stub
		return groupPostRespository.findByGroup(group_id);
	}

}
