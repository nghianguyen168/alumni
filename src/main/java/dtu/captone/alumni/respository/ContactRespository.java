package dtu.captone.alumni.respository;

import dtu.captone.alumni.domain.Contact;
import dtu.captone.alumni.domain.Major;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ContactRespository extends JpaRepository<Contact, Integer>,JpaSpecificationExecutor<Major> {

}
