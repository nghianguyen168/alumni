package dtu.captone.alumni.respository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import dtu.captone.alumni.domain.Comment;
import dtu.captone.alumni.domain.Kname;
import dtu.captone.alumni.domain.Major;

@Repository
public interface CommentRespository extends JpaRepository<Comment, Integer>,JpaSpecificationExecutor<Major> {
	List<Comment> findAll();
	List<Comment> findByPostId(int postId);
	List<Comment> findByParentId(int parentId);
	
}
