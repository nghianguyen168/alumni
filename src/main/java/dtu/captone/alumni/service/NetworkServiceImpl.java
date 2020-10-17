package dtu.captone.alumni.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dtu.captone.alumni.domain.Network;
import dtu.captone.alumni.respository.NetworkRespository;

@Service
public class NetworkServiceImpl implements NetworkService{
	
	@Autowired
	private NetworkRespository networkRespository;

	@Override
	@Transactional
	public Network save(Network network) {
		return networkRespository.save(network);
	}

	@Override
	public int confirmFriend(int id) {
		// TODO Auto-generated method stub
		return networkRespository.confirmFriend(id);
	}

	@Override
	public List<Network> getNewRequestFriendList(int id) {
		// TODO Auto-generated method stub
		return networkRespository.getNewRequestFriendList(id);
	}

	@Override
	public int cancelRequest(int id) {
		// TODO Auto-generated method stub
		return networkRespository.cancelRequest(id);
	}
	
	
}
