package dtu.captone.alumni.respository;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
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
	
}
