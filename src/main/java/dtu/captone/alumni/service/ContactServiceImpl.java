package dtu.captone.alumni.service;

import dtu.captone.alumni.domain.Contact;
import dtu.captone.alumni.respository.ContactRespository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ContactServiceImpl implements  ContactService{

    @Autowired
    private ContactRespository contactRespository;

    @Override
    public Contact save(Contact contact) {
        return contactRespository.save(contact);
    }

    @Override
    public List<Contact> findAll(Sort sort) {
        return contactRespository.findAll(sort);
    }
}
