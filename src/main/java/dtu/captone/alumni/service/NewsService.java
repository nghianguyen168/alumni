package dtu.captone.alumni.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import dtu.captone.alumni.domain.News;

public interface NewsService {
	
	News save(News news);
	
	void deleteById(int id);
	
	News findById(int id);
	
	int active(int enable,int id);
	
	Page<News> findAll(Pageable pageable);
	
	Page<News> getNewsListEnable(Pageable pageable);
}
