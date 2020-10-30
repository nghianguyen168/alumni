package dtu.captone.alumni.service;

import java.util.List;
import java.util.UUID;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import dtu.captone.alumni.domain.Group_Post;

public interface GroupPostService {
	
	Group_Post save(Group_Post group_Post);
	
	void deleteById(UUID id);
	
	Group_Post findById(Integer id);
	
	/* int active(int enable,int id); */
	
	Page<Group_Post> findAll(Pageable pageable);
	List<Group_Post> findAll(Sort sort);
	

	
	Page<Group_Post> getNewsListEnable(Pageable pageable);
}
