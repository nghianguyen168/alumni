package dtu.captone.alumni.respository;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import dtu.captone.alumni.domain.Event;
import dtu.captone.alumni.domain.News;

@Repository
public interface EventRespository extends JpaRepository<Event, Integer>,JpaSpecificationExecutor<Event> {

	Event findById(int id);
	
	
	@Query(value = "UPDATE event SET enable = ? AND id = ?",nativeQuery = true)
	@Modifying(clearAutomatically=true, flushAutomatically = true)
	@Transactional
	int active(int active,int id);
	
	
	@Query(value = "SELECT * FROM event WHERE enable = 1",nativeQuery = true)
	Page<Event> getNewsListEnable(Pageable pageable);
	
}
