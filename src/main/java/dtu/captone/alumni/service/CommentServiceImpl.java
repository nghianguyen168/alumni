package dtu.captone.alumni.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import dtu.captone.alumni.domain.Comment;
import dtu.captone.alumni.respository.CommentRespository;

@Service
public class CommentServiceImpl implements CommentService{
	
	@Autowired
	private CommentRespository commentRespository;
	

	@Override
	public Comment save(Comment comment) {
		// TODO Auto-generated method stub
		return commentRespository.save(comment);
	}

	@Override
	public void deleteById(int id) {
		// TODO Auto-generated method stub
		commentRespository.deleteById(id);
	}

	@Override
	public Page<Comment> findAll(Pageable pageable) {
		// TODO Auto-generated method stub
		return commentRespository.findAll(pageable);
	}

	@Override
	public List<Comment> findAll(Sort sort) {
		// TODO Auto-generated method stub
		return commentRespository.findAll(sort);
	}

	@Override
	public List<Comment> findByAuthorId(int authorId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Comment> findByPostId(int postId) {
		// TODO Auto-generated method stub
		return commentRespository.findByPostId(postId);
	}

}
