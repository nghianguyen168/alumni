package dtu.captone.alumni.controller.alumni;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import dtu.captone.alumni.domain.Alumni_group;
import dtu.captone.alumni.domain.Group_Post;
import dtu.captone.alumni.security.UserInfoHandler;
import dtu.captone.alumni.service.GroupPostService;
import dtu.captone.alumni.service.GroupService;
import dtu.captone.alumni.utils.FileUtil;

@Controller
@RequestMapping("/community")
public class PublicCommunityController extends UserInfoHandler {

	@Autowired
	private GroupService groupService;
	
	@Autowired
	private GroupPostService groupPostService;

	@GetMapping("/index/{id}")
	public String community(@PathVariable(required = false, name = "id") Integer groupId, Model model,
			HttpSession session) {
		if (isUserLogin(session) == null) {
			return "redirect:/login";
		} else {
			if (groupId == null) {
				groupId = 0;
			}
			
			Page<Group_Post> groupPostPage = groupPostService.findAll(PageRequest.of(0, 100, Sort.by("id").descending()));
			List<Group_Post> groupPostList = groupPostPage.getContent();
			Alumni_group alumni_group = groupService.findById(groupId);
			model.addAttribute("groupPostList", groupPostList);
			model.addAttribute("alumni_group", alumni_group);
			return "public.community";
		}

	}

	@PostMapping("/add/{id}")
	public String addPost(@PathVariable int id,@RequestParam("title") String title,@RequestParam("media") List<MultipartFile> media,HttpServletRequest servletRequest,HttpSession session) throws IllegalStateException, IOException {
		if (isUserLogin(session) == null) {
			return "redirect:/login";
		} else {
			List<MultipartFile> files =media;
	        String fileNames = "";
	        if (files!=null && files.size() > 0) 
	        {
	            for (MultipartFile multipartFile : files) {
	 
	                String fileName1 = FileUtil.upload(multipartFile, servletRequest);
	                if(!"".equals(fileName1) && "".equals(fileNames)) {
	                	  fileNames = fileName1;
	                } else {
	                	fileNames = fileNames + "|"+fileName1;
	                }
					/*
					 * File imageFile = new
					 * File(servletRequest.getServletContext().getRealPath("/uploads"), fileName1);
					 * System.out.println(imageFile); try { multipartFile.transferTo(imageFile); }
					 * catch (IOException e) { e.printStackTrace(); }
					 */
	            }
	        }
	        Group_Post group_Post = new Group_Post(0, title, Timestamp.valueOf(LocalDateTime.now()), fileNames, 0, 0, isUserLogin(session), groupService.findById(id));
	        Group_Post group_PostAdd = groupPostService.save(group_Post);
	        
	        
		
		return "redirect:/community/index/"+id;
		}
		 
	}

}
