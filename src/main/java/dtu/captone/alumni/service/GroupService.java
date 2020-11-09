package dtu.captone.alumni.service;

import java.util.List;

import javax.persistence.CascadeType;

import org.hibernate.annotations.Cascade;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import dtu.captone.alumni.domain.AlumniGroup;
import dtu.captone.alumni.domain.Job;

public interface GroupService {
	
	AlumniGroup save(AlumniGroup alumni_group);
	
	
	void deleteById(int id);
	
	AlumniGroup findById(int id);
	
	List<AlumniGroup> findAll();
	
	
}
