package dtu.captone.alumni.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import dtu.captone.alumni.domain.Event;
import dtu.captone.alumni.domain.News;

public interface EventService {
	
	Event save(Event event);
	
	void deleteById(int id);
	
	Event findById(int id);
	
	int active(int enable,int id);
	
	Page<Event> findAll(Pageable pageable);
	
	List<Event> findAll(Sort sort);
	
	Page<Event> getNewsListEnable(Pageable pageable);
	
	List<Event> findCommingSoon(int id);

	List<Event> findByMonth(int month);
}
