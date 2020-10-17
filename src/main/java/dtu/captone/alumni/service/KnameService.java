package dtu.captone.alumni.service;

import java.util.List;

import dtu.captone.alumni.domain.Kname;

public interface KnameService {
	Kname save(Kname Kname);
	void delelte(int Kname_id);
	Kname findById(int id);
	List<Kname> findAll();
	
}
