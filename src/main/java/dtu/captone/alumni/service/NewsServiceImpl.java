package dtu.captone.alumni.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import dtu.captone.alumni.domain.News;
import dtu.captone.alumni.respository.NewsRespository;

@Service
public class NewsServiceImpl implements NewsService {

	@Autowired
	private NewsRespository newsRespository;
	
	@Override
	public News save(News news) {
		
		return newsRespository.save(news);
	}

	@Override
	public void deleteById(int id) {
		newsRespository.deleteById(id);
		
	}
	@Override
	public News findById(int id) {
		// TODO Auto-generated method stub
		return newsRespository.findById(id);
	}

	@Override
	public int active(int enable, int id) {
		// TODO Auto-generated method stub
		return newsRespository.active(enable, id);
	}

	@Override
	public Page<News> findAll(Pageable pageable) {
		// TODO Auto-generated method stub
		return newsRespository.findAll(pageable);
	}

	@Override
	public Page<News> getNewsListEnable(Pageable pageable) {
		// TODO Auto-generated method stub
		return newsRespository.getNewsListEnable(pageable);
	}
}
