package dtu.captone.alumni.respository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import dtu.captone.alumni.domain.Edu_level;


@Repository
public interface Edu_LevelRespository  extends JpaRepository<Edu_level, Integer>{
	
}
