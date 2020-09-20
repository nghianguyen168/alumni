package dtu.captone.alumni.controller.alumni;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import dtu.captone.alumni.domain.Major;
import dtu.captone.alumni.service.MajorServiceImpl;

@Controller
public class TestController {

	@Autowired
	private MajorServiceImpl majorServiceImpl;
	
	@GetMapping("/test")
	public String test() {
		Major major= new Major(1, "aaa", "bbb");
		Major major2 = majorServiceImpl.save(major);
		return "demo";
	}
}
