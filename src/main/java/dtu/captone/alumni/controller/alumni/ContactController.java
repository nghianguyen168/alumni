package dtu.captone.alumni.controller.alumni;

import dtu.captone.alumni.domain.Contact;
import dtu.captone.alumni.service.ContactService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.sql.Timestamp;
import java.time.LocalDateTime;

@Controller
public class ContactController {

    @Autowired
    private ContactService contactService;

    @PostMapping("/contact")
    public @ResponseBody String submitContact(@RequestParam("contactName") String contactName,@RequestParam("email") String email,@RequestParam("message") String message){
        Contact contact = new Contact(0,contactName,email,message,Timestamp.valueOf(LocalDateTime.now()));
        Contact contactSave = contactService.save(contact);
        if(contactSave!=null)
            return "ok";
        return  "";
    }
}
