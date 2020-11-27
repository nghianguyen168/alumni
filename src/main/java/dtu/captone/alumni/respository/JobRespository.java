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

import dtu.captone.alumni.DTOs.JobChart;
import dtu.captone.alumni.domain.Job;




@Repository
public interface JobRespository extends JpaRepository<Job, Integer>{
	
	Job findById(int id);
	
	@Query(value = "SELECT * FROM job WHERE authorId = ? ORDER BY id DESC",nativeQuery = true)
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
	
	@Query(value = "SELECT * FROM job WHERE enable = 1 ORDER BY id DESC",nativeQuery = true)
	List<Job> getJobEnable();
	
	@Query(value = "SELECT j.id,m.major_name AS majorName,count(*) AS count from job AS j inner join major AS m where j.major_id=m.id group by m.id",nativeQuery = true)
	List<JobChart> getJobForChart();
	
	@Query(value = "SELECT * FROM job WHERE enable = 1 AND major_id = ? ORDER BY id DESC ",nativeQuery = true)
	List<Job> getJobListByMajor(int majorId);
	
	@Query(value = "SELECT * FROM job WHERE enable = 1 AND position Like ? OR company_name Like ? ORDER BY id DESC",nativeQuery = true)
	List<Job> getJobListSearch(String position,String company_name);
	
	
	
	/*
	 * @Query(value = "SELECT * FROM job WHERE author_id=?",nativeQuery = true)
	 * List<News> getNewsListByAuthor(int author_id);
	 */
	@Query(value = "SELECT count(id) FROM job WHERE enable =1 ",nativeQuery = true)
    public int sumJobEnable();
	
	@Query(value = "SELECT count(id) FROM job",nativeQuery = true)
    public int sumJob();
	
	@Modifying
	@Query(value = "UPDATE job SET views = views+1 WHERE id=? ",nativeQuery = true)
	@Transactional
	public int updateViews(int id);
	

}
