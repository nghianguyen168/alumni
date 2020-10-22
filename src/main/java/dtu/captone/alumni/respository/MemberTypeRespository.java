package dtu.captone.alumni.respository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import dtu.captone.alumni.domain.Kname;
import dtu.captone.alumni.domain.Major;
import dtu.captone.alumni.domain.MemberType;

@Repository
public interface MemberTypeRespository extends JpaRepository<MemberType, Integer>,JpaSpecificationExecutor<Major> {
	MemberType findById(int id);
	List<MemberType> findAll();
}
