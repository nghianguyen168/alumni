package dtu.captone.alumni.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import dtu.captone.alumni.domain.Comment;
import dtu.captone.alumni.domain.Job;

public interface CommentService {
	
	Comment save(Comment comment);
	
	void deleteById(int id);
	
	Page<Comment> findAll(Pageable pageable);
	
	List<Comment> findAll(Sort sort);
	
	List<Comment> findByAuthorId(int authorId);
	
	List<Comment> findByPostId(int postId);
	
	List<Comment> findByParentId(int parentId);
	
	
}
