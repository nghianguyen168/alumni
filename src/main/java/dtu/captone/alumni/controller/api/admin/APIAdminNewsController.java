package dtu.captone.alumni.controller.api.admin;

import java.util.HashMap;

import org.apache.http.HttpStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import dtu.captone.alumni.domain.News;
import dtu.captone.alumni.model.ResponseAPI;
import dtu.captone.alumni.service.NewsService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;


@RestController
@RequestMapping("/api/admin/news")
@Api(value = "api.news",description = "News API")
public class APIAdminNewsController {
	
	@Autowired
	private NewsService newsService;
	
	@RequestMapping(value = "/index", method = RequestMethod.POST)
	@ApiOperation(value = "My news list", response = Object.class)
	public ResponseAPI newsList(@RequestBody News news) {
		Page<News> newsList = newsService.findAll(PageRequest.of(0, 10));
		HashMap<String, Object> data = new HashMap<String, Object>();
		data.put("news", newsList.getContent());
		data.put("totalPage", newsList.getTotalPages());
		return new ResponseAPI(HttpStatus.SC_OK, null, data);
	}
	

}
