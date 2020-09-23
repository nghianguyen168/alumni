package dtu.captone.alumni.respository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import dtu.captone.alumni.domain.Member;

@Repository
public interface MemberRespository extends JpaRepository<Member, Integer>{
	
	Member findById(int id);
}
