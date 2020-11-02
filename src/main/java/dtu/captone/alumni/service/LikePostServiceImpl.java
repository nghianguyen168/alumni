package dtu.captone.alumni.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import dtu.captone.alumni.domain.LikePost;
import dtu.captone.alumni.respository.LikePostRespository;

@Service
public class LikePostServiceImpl implements LikePostService{
	
	@Autowired
	private LikePostRespository likePostRespository;

	@Override
	public LikePost save(LikePost likePost) {
		// TODO Auto-generated method stub
		return likePostRespository.save(likePost);
	}

	@Override
	public void deleteById(int id) {
		// TODO Auto-generated method stub
		likePostRespository.deleteById(id);
	}

	@Override
	public LikePost findUserLike(int authorId, int postId) {
		// TODO Auto-generated method stub
		return likePostRespository.findUserLike(authorId, postId);
	}

	@Override
	public Page<LikePost> findAll(Pageable pageable) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<LikePost> findAll(Sort sort) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<LikePost> findByPostId(int postId) {
		// TODO Auto-generated method stub
		return likePostRespository.findByPostId(postId);
	}

}
