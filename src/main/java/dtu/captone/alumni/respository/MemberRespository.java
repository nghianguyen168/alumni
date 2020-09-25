package dtu.captone.alumni.respository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import dtu.captone.alumni.domain.Member;

@Repository
public interface MemberRespository extends JpaRepository<Member, Integer>{
	
	Member findById(int id);
	Page<Member> findByHometown(String hometown,Pageable pageable);
	
	@Query(value = "SELECT * FROM member WHERE enable = 1",nativeQuery = true)
	Page<Member> getListEnable(Pageable page);
	
	@Query(value = "SELECT * FROM member WHERE member_type_id = ? AND enable = 1",nativeQuery = true)
	Page<Member> getListByTypeEnable(int type,Pageable page);
	
	@Query(value = "SELECT * FROM member WHERE member_type_id = ? ",nativeQuery = true)
	Page<Member> getListByType(int type,Pageable page);
	
	
}
