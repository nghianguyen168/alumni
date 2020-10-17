package dtu.captone.alumni.respository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import dtu.captone.alumni.domain.Faculty;
import dtu.captone.alumni.domain.Major;

@Repository
public interface FacultyRespository extends JpaRepository<Faculty, Integer>,JpaSpecificationExecutor<Major> {
	Faculty findById(int id);
	List<Faculty> findAll();
}
