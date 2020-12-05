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

import dtu.captone.alumni.domain.News;

@Repository
public interface NewsRespository extends JpaRepository<News, Integer>{
	News findById(int id);
	
	
	@Modifying
	@Transactional
	@Query(value = "UPDATE news SET enable = ? WHERE id = ?",nativeQuery = true)
	int active(int active,int id);
	
	
	@Query(value = "SELECT * FROM news WHERE enable = 1",nativeQuery = true)
	Page<News> getNewsListEnable(Pageable pageable);
	
	@Query(value = "SELECT * FROM news WHERE id<>? AND enable=1 ORDER BY id DESC LIMIT 5",nativeQuery = true)
	List<News> findNewsNew(int id);
	
	@Query(value = "SELECT * FROM news WHERE enable=1 ORDER BY id DESC LIMIT 10",nativeQuery = true)
	List<News> findNewsList();

	@Query(value = "SELECT * FROM news WHERE enable = 1 AND MONTH(createAt)=?",nativeQuery = true)
	List<News> findByMonth(int month);
	
}
