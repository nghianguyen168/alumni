package dtu.captone.alumni.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import dtu.captone.alumni.domain.Event;
import dtu.captone.alumni.respository.EventRespository;

@Service
public class EventServiceImpl implements EventService {

	@Autowired
	private EventRespository eventRespository;
	
	@Override
	public Event save(Event event) {
		// TODO Auto-generated method stub
		return eventRespository.save(event);
	}

	@Override
	public void deleteById(int id) {
		// TODO Auto-generated method stub
		eventRespository.deleteById(id);
	}

	@Override
	public Event findById(int id) {
		// TODO Auto-generated method stub
		return eventRespository.findById(id);
	}

	@Override
	public int active(int enable, int id) {
		// TODO Auto-generated method stub
		return eventRespository.active(enable, id);
	}

	@Override
	public Page<Event> findAll(Pageable pageable) {
		// TODO Auto-generated method stub
		return eventRespository.findAll(pageable);
	}

	@Override
	public Page<Event> getNewsListEnable(Pageable pageable) {
		// TODO Auto-generated method stub
		return eventRespository.getNewsListEnable(pageable);
	}

	@Override
	public List<Event> findAll(Sort sort) {
		// TODO Auto-generated method stub
		return eventRespository.findAll(sort);
	}

	@Override
	public List<Event> findCommingSoon(int id) {
		// TODO Auto-generated method stub
		return eventRespository.findCommingSoon(id);
	}

}
