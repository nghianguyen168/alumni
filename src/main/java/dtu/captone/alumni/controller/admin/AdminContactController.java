package dtu.captone.alumni.controller.admin;

import dtu.captone.alumni.domain.Contact;
import dtu.captone.alumni.service.ContactService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/admin/contact")
public class AdminContactController {

    @Autowired
    private ContactService contactService;

    @GetMapping("/index")
    public  String indexContact(Model model){
        List<Contact> contactList = contactService.findAll(Sort.by("id").descending());
        model.addAttribute("contactList",contactList);
        return  "admin.contact.index";
    }
}
