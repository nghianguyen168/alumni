package dtu.captone.alumni.service;

import java.util.List;
import java.util.UUID;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import dtu.captone.alumni.domain.GroupPost;

public interface GroupPostService {
	
	GroupPost save(GroupPost group_Post);
	
	void deleteById(UUID id);
	
	GroupPost findById(Integer id);
	
	/* int active(int enable,int id); */
	
	Page<GroupPost> findAll(Pageable pageable);
	List<GroupPost> findAll(Sort sort);
	

	
	Page<GroupPost> getNewsListEnable(Pageable pageable);
}
