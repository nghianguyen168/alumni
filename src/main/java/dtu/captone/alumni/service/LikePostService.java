package dtu.captone.alumni.service;

import java.util.List;
import java.util.UUID;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import dtu.captone.alumni.domain.GroupPost;
import dtu.captone.alumni.domain.LikePost;

public interface LikePostService {
	
	LikePost save(LikePost likePost);
	
	void deleteById(int id);
	
	LikePost findUserLike(int authorId,int postId);
	
	/* int active(int enable,int id); */
	
	Page<LikePost> findAll(Pageable pageable);
	List<LikePost> findAll(Sort sort);
	
	List<LikePost> findByPostId(int postId);
}
