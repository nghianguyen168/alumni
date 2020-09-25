package dtu.captone.alumni.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import dtu.captone.alumni.domain.Event;
import dtu.captone.alumni.domain.News;

public interface EventService {
	
	Event save(Event event);
	
	void deleteById(int id);
	
	Event findById(int id);
	
	int active(int enable,int id);
	
	Page<Event> findAll(Pageable pageable);
	
	Page<Event> getNewsListEnable(Pageable pageable);
}
