package dtu.captone.alumni.service;

import dtu.captone.alumni.DTOs.JobChart;
import dtu.captone.alumni.domain.Contact;
import dtu.captone.alumni.domain.Job;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import java.util.List;

public interface ContactService {
	
	Contact save(Contact contact);

	List<Contact> findAll(Sort sort);
	
}
