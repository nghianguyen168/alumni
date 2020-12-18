package dtu.captone.alumni.controller.admin;

import dtu.captone.alumni.domain.Contact;
import dtu.captone.alumni.security.UserInfoHandler;
import dtu.captone.alumni.service.ContactService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/admin/contact")
public class AdminContactController extends UserInfoHandler {

    @Autowired
    private ContactService contactService;

    @GetMapping("/index")
    public  String indexContact(Model model, HttpSession session){
        if (isUserLogin(session) == null) {
            return "redirect:/user/login";
        }
        List<Contact> contactList = contactService.findAll(Sort.by("id").descending());
        model.addAttribute("contactList",contactList);
        return  "admin.contact.index";
    }
}
