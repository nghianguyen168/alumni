package dtu.captone.alumni.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dtu.captone.alumni.domain.Kname;
import dtu.captone.alumni.respository.KNameRespository;


@Service
public class KnameServiceImpl implements KnameService{

	@Autowired
	private KNameRespository kNameRespository;
	
	
	@Override
	public Kname save(Kname Kname) {
		// TODO Auto-generated method stub
		return kNameRespository.save(Kname);
	}

	@Override
	public void delelte(int Kname_id) {
		// TODO Auto-generated method stub\
		kNameRespository.deleteById(Kname_id);
		
	}

	@Override
	public Kname findById(int id) {
		// TODO Auto-generated method stub
		return kNameRespository.findById(id);
	}

	@Override
	public List<Kname> findAll() {
		// TODO Auto-generated method stub
		return kNameRespository.findAll();
	}
	
	

}
