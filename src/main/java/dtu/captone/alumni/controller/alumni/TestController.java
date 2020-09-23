package dtu.captone.alumni.controller.alumni;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dtu.captone.alumni.domain.Major;
import dtu.captone.alumni.domain.Member;
import dtu.captone.alumni.service.MajorServiceImpl;
import dtu.captone.alumni.service.MemberService;

@Controller
public class TestController {

	@Autowired
	private MajorServiceImpl majorServiceImpl;
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/test")
	public String test() {
		Major major= new Major(3, "gfdg", "gdgd");
		Major major2 = majorServiceImpl.save(major);
		return "demo";
	}
	@GetMapping("/major")
	public @ResponseBody List<Major> tetsmajor() {
		return majorServiceImpl.findAll();
	}
	
	@GetMapping("delmajor")
	public @ResponseBody Major delMajor() {
		majorServiceImpl.delelte(1);
		return null;
	}
	
	@GetMapping("/member/add")
	public String addMember() {
		
		Member member = new Member(2, "Nguyễn", "Long", new Timestamp(System.currentTimeMillis()), "QB", "Male", "1", "DN", "a@gmail.com", "0968997331", "f.jpg", "hihi", 
				2,null, 2017, 2021, null , null);
		memberService.save(member);
		return "demo";
	}
	
	@GetMapping("/member/get")
	public @ResponseBody Member getMember() {
		return memberService.findById(2);
	}

}
