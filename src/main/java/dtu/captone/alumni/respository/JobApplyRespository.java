package dtu.captone.alumni.respository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import dtu.captone.alumni.domain.Job;
import dtu.captone.alumni.domain.JobApply;




@Repository
public interface JobApplyRespository extends JpaRepository<JobApply, Integer>{
	
	JobApply findById(int id);
	
	
	@Query(value = "SELECT * FROM job_apply WHERE job_id = ? LIMIT ?,?",nativeQuery = true)
	List<JobApply> findByJob(Integer id,int offset,int limit);
	
	@Query(value = "SELECT * FROM job_apply WHERE member_id=?",nativeQuery = true)
	List<JobApply> findJobApply(int id);
	
	
	@Modifying
	@Query(value = "DELETE FROM job_apply WHERE job_id = ? ",nativeQuery = true)
	@Transactional
	public void deleteByJob_Id(int job_id);
	
	@Modifying
	@Query(value = "UPDATE job_apply SET check_status = 1 WHERE job_id =?",nativeQuery = true)
	@Transactional
	public int updateCheckStatus(int job_id);
	
	@Query(value = "SELECT count(id) FROM job_apply WHERE job_id=?",nativeQuery = true)
    public int sumJobApply(int id);
	
	
	/*
	 * @Query(value = "SELECT * FROM job WHERE authorId = ?",nativeQuery = true)
	 * List<Job> findByAuthorId(Integer authorId);
	 * 
	 * @Query(value =
	 * "UPDATE job SET enable = ? WHERE id = ? AND authorId=?",nativeQuery = true)
	 * 
	 * @Modifying(clearAutomatically=true, flushAutomatically = true)
	 * 
	 * @Transactional int active(int active,int id,int author_id);
	 * 
	 * @Query(value = "UPDATE job SET enable = ? WHERE id = ?",nativeQuery = true)
	 * 
	 * @Modifying(clearAutomatically=true, flushAutomatically = true)
	 * 
	 * @Transactional int active(int active,int id);
	 * 
	 * @Query(value = "SELECT * FROM job WHERE enable = 1",nativeQuery = true)
	 * Page<Job> getJobListEnable(Pageable pageable);
	 * 
	 * @Query(value =
	 * "SELECT * FROM job WHERE enable = 1 ORDER BY id DESC",nativeQuery = true)
	 * List<Job> getJobEnable();
	 * 
	 * @Query(value =
	 * "SELECT * FROM job WHERE enable = 1 AND major_id = ? ORDER BY id DESC "
	 * ,nativeQuery = true) List<Job> getJobListByMajor(int majorId);
	 */
	
	
	/*
	 * @Query(value = "SELECT * FROM job WHERE author_id=?",nativeQuery = true)
	 * List<News> getNewsListByAuthor(int author_id);
	 */
	/*
	 * @Query(value = "SELECT count(id) FROM job WHERE enable =1 ",nativeQuery =
	 * true) public int sumJobEnable();
	 * 
	 * @Query(value = "SELECT count(id) FROM job",nativeQuery = true) public int
	 * sumJob();
	 */
	

}
