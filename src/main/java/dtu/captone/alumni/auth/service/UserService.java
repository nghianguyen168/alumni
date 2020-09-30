package dtu.captone.alumni.auth.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;

import dtu.captone.alumni.domain.Member;

public interface UserService {

    List<Member> findAll();

    Page<Member> getAllData(Specification<Member> spec, Pageable pageable);

    int getAllDataCount(Specification<Member> spec);

    Member findByDtuMail(String mail);
    Member findByDtuMailAndPassword(String mail,String password);

    Member saveAdmin(Member Member);

    Member findById(int id);

    Member save(Member Member);

    Member deleteById(int id);

	Member findByEmail(String email);

    void updateToken(String token, String name);

    Member updateLastUsed(String name);

    Member findByToken(String token);
}
