package dtu.captone.alumni.respository;

import java.util.List;

import javax.transaction.Transactional;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import dtu.captone.alumni.domain.Job;




@Repository
public interface JobRespository extends JpaRepository<Job, Integer>{
	
	Job findById(int id);
	
	@Query(value = "SELECT * FROM job WHERE authorId = ?",nativeQuery = true)
	List<Job> findByAuthorId(Integer authorId);
	
	@Query(value = "UPDATE job SET enable = ? WHERE id = ? AND authorId=?",nativeQuery = true)
	@Modifying(clearAutomatically=true, flushAutomatically = true)
	@Transactional
	int active(int active,int id,int author_id);
	
	@Query(value = "UPDATE job SET enable = ? WHERE id = ?",nativeQuery = true)
	@Modifying(clearAutomatically=true, flushAutomatically = true)
	@Transactional
	int active(int active,int id);
	
	@Query(value = "SELECT * FROM job WHERE enable = 1",nativeQuery = true)
	Page<Job> getJobListEnable(Pageable pageable);
	
	/*
	 * @Query(value = "SELECT * FROM job WHERE author_id=?",nativeQuery = true)
	 * List<News> getNewsListByAuthor(int author_id);
	 */
	

}
