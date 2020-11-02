package dtu.captone.alumni.controller.alumni;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDate;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import dtu.captone.alumni.domain.Alumni_group;
import dtu.captone.alumni.domain.Comment;
import dtu.captone.alumni.domain.Group_Post;
import dtu.captone.alumni.domain.LikePost;
import dtu.captone.alumni.security.UserInfoHandler;
import dtu.captone.alumni.service.CommentService;
import dtu.captone.alumni.service.GroupPostService;
import dtu.captone.alumni.service.GroupService;
import dtu.captone.alumni.service.LikePostService;
import dtu.captone.alumni.utils.FileUtil;

@Controller
@RequestMapping("/community")
public class PublicCommunityController extends UserInfoHandler {

	@Autowired
	private GroupService groupService;

	@Autowired
	private GroupPostService groupPostService;
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private  LikePostService likePostService;
	
	@ModelAttribute
	public void sendObjectService(Model model) {
		model.addAttribute("commentService", commentService);
		model.addAttribute("likePostService", likePostService);
	}

	@GetMapping("/index/{id}")
	public String community(@PathVariable(required = false, name = "id") Integer groupId, Model model,
			HttpSession session) {
		if (isUserLogin(session) == null) {
			return "redirect:/login";
		} else {
			if (groupId == null) {
				groupId = 0;
			}
			Page<Group_Post> groupPostPage = groupPostService
					.findAll(PageRequest.of(0, 100, Sort.by("id").descending()));
			List<Group_Post> groupPostList = groupPostPage.getContent();
			Alumni_group alumni_group = groupService.findById(groupId);
			model.addAttribute("groupPostList", groupPostList);
			model.addAttribute("alumni_group", alumni_group);
			return "public.community";
		}

	}

	@PostMapping("/add/{id}")
	public String addPost(@PathVariable int id, @RequestParam("title") String title,
			@RequestParam("file") MultipartFile fileDinhKem,
			@RequestParam(name = "media", required = false) List<MultipartFile> media,
			HttpServletRequest servletRequest, HttpSession session) throws IllegalStateException, IOException {
		if (isUserLogin(session) == null) {
			return "redirect:/login";
		} else {
			List<MultipartFile> files = media;
			String mediaNames = "";
			if (media != null && media.size() > 0) {
				for (MultipartFile multipartFile : files) {

					  String fileName1 = multipartFile.getOriginalFilename();
					  mediaNames = mediaNames + "|"+fileName1;
		                File imageFile = new File(servletRequest.getServletContext().getRealPath("/uploads"), fileName1);
		                System.out.println(imageFile);
		                try
		                {
		                    multipartFile.transferTo(imageFile);
		                } catch (IOException e) 
		                {
		                    e.printStackTrace();
		                }
				}
			}
			Group_Post group_Post = new Group_Post(0, title, Timestamp.valueOf(LocalDateTime.now()), mediaNames, "", 0,
					0, isUserLogin(session), groupService.findById(id));
			Group_Post group_PostAdd = groupPostService.save(group_Post);

			return "redirect:/community/index/" + id;
		}

	}
	
	@PostMapping("/comment/{id}")
	public @ResponseBody String commnunityComment(@PathVariable("id") int id,@RequestParam("comment") String comment,HttpSession session) {
		Comment commentObj = new Comment(0, id, comment, isUserLogin(session), Timestamp.valueOf(LocalDateTime.now()), 0);
		Comment commentAdd = commentService.save(commentObj);
		if(commentAdd!=null) 
			return "comment ok";
		return null;
	}
	
	@PostMapping("/rep-comment/{pid}/{cid}")
	public @ResponseBody String replyComment(@PathVariable int pid,@PathVariable int cid,@RequestParam("comment") String comment,HttpSession session) {
		Comment commentObj = new Comment(0, pid, comment, isUserLogin(session), Timestamp.valueOf(LocalDateTime.now()), cid);
		Comment commentAdd = commentService.save(commentObj);
		if(commentAdd!=null) 
			return "comment ok";
		return null;
	}
	
	@PostMapping("/like-post/{pid}")
	public @ResponseBody String likePost(@PathVariable int pid,@RequestParam("img") String img,HttpSession session) {
		System.out.println(img);
		if("/resources/templates/public/love_deactive.png".equals(img)) {
			LikePost likePost = new LikePost(0, pid, isUserLogin(session), Timestamp.valueOf(LocalDateTime.now()));
			LikePost likePostAdd  = likePostService.save(likePost);
			if(likePostAdd!=null) 
				return "ok";
			return null;
		} else {
			likePostService.deleteById(likePostService.findUserLike(isUserLogin(session).getId(), pid).getId());
			return "ok";
		}
		
	}
}

