package dtu.captone.alumni.service;

import java.util.List;

import javax.persistence.CascadeType;

import org.hibernate.annotations.Cascade;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import dtu.captone.alumni.domain.Alumni_group;
import dtu.captone.alumni.domain.Job;

public interface GroupService {
	
	Alumni_group save(Alumni_group alumni_group);
	
	
	void deleteById(int id);
	
	Alumni_group findById(int id);
	
	List<Alumni_group> findAll();
	
	
}
