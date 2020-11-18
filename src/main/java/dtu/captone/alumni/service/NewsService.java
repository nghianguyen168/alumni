package dtu.captone.alumni.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import dtu.captone.alumni.domain.News;

public interface NewsService {
	
	News save(News news);
	
	void deleteById(int id);
	
	News findById(int id);
	
	int active(int enable,int id);
	
	Page<News> findAll(Pageable pageable);
	List<News> findAll(Sort sort);
	

	
	Page<News> getNewsListEnable(Pageable pageable);
	
	List<News> findNewsNew(int id);
	
	List<News> findNewsList();
}
