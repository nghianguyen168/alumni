package dtu.captone.alumni.controller.alumni;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

import javax.servlet.annotation.MultipartConfig;
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

import dtu.captone.alumni.domain.AlumniGroup;
import dtu.captone.alumni.domain.Comment;
import dtu.captone.alumni.domain.GroupPost;
import dtu.captone.alumni.domain.LikePost;
import dtu.captone.alumni.domain.MemberGroup;
import dtu.captone.alumni.security.UserInfoHandler;
import dtu.captone.alumni.service.CommentService;
import dtu.captone.alumni.service.GroupPostService;
import dtu.captone.alumni.service.GroupService;
import dtu.captone.alumni.service.LikePostService;
import dtu.captone.alumni.service.MemberGroupService;
import dtu.captone.alumni.service.MemberService;
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
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MemberGroupService memberGroupService;
	

	
	@ModelAttribute
	public void sendObjectService(Model model) {
		model.addAttribute("commentService", commentService);
		model.addAttribute("likePostService", likePostService);
		model.addAttribute("memberGroupService", memberGroupService);
	}

	@GetMapping("/index/{id}")
	public String community(@PathVariable(required = false, name = "id") Integer groupId, Model model,
			HttpSession session) {
		if (isUserLogin(session) == null) {
			return "redirect:/user/login";
		} else {
			if (groupId == null) {
				groupId = 0;
			}
			
			List<GroupPost> groupPostList = groupPostService.findByGroup(groupId);
			AlumniGroup alumni_group = groupService.findById(groupId);
			model.addAttribute("groupPostList", groupPostList);
			model.addAttribute("alumni_group", alumni_group);
			return "public.community";
		}

	}

	@PostMapping("/add/{id}")
	public String addPost(@PathVariable int id, @RequestParam("title") String title,
		
			@RequestParam(name = "media", required = false) List<MultipartFile> media,@RequestParam(name="file-dinh-kem",required=false) MultipartFile fileDinhKem,
			HttpServletRequest servletRequest, HttpSession session) throws IllegalStateException, IOException {
		if (isUserLogin(session) == null) {
			return "redirect:/login";
		} else {
			
			String mediaNames="";
			String nameFile ="";
			if (media != null && media.size() > 0) {
				for (MultipartFile multipartFile : media) {

					  String fileName1 = multipartFile.getOriginalFilename();
					  if(!"".equals(fileName1)) {
						  mediaNames = mediaNames + "|"+fileName1;
					  }
					
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
			if(!"".equals(fileDinhKem.getOriginalFilename())) {
				 nameFile = FileUtil.upload(fileDinhKem, servletRequest);
				System.out.println(nameFile);
			} 
			GroupPost group_Post = new GroupPost(0, title, Timestamp.valueOf(LocalDateTime.now()), mediaNames, nameFile, isUserLogin(session), groupService.findById(id));
			GroupPost group_PostAdd = groupPostService.save(group_Post);
			
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
	
	
	@GetMapping("/group")
	public String group(Model model,HttpSession session) {
		if (isUserLogin(session) == null) {
			return "redirect:/user/login";
		} else {
		List<AlumniGroup> groupList = groupService.findAll();
		model.addAttribute("groupList", groupList);
		return "public.group.index";
	}
	}
	@PostMapping("/group/join/{id}")
	public @ResponseBody String joinGroup(@PathVariable int id,HttpSession session) {
		MemberGroup memberGroup = new MemberGroup(0, memberService.findById(isUserLogin(session).getId()), groupService.findById(id));
		MemberGroup memberGroupJoin = memberGroupService.save(memberGroup);
		if(memberGroupJoin!=null)
			return "ok";
		return null;
	}
	
	@GetMapping("/group/member/{id}")
	public String memberGroup(@PathVariable int id,Model model) {
		List<MemberGroup> memberListByGroup = memberGroupService.findByGroup(id);
		System.out.println(memberListByGroup.size());
		model.addAttribute("memberListByGroup", memberListByGroup);
		return "public.group.member";
	}
	
	@GetMapping("/chat")
	public String chat() {
		return "public.community.chat";
	}
}

