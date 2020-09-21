package dtu.captone.alumni.respository;

import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import dtu.captone.alumni.domain.Event;
import dtu.captone.alumni.domain.Major;

@Repository
public interface EventRespository extends JpaRepository<Event, Integer>,JpaSpecificationExecutor<Event> {
	
	
}
