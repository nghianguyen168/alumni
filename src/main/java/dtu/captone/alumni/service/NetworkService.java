package dtu.captone.alumni.service;

import java.util.List;

import dtu.captone.alumni.domain.Network;

public interface NetworkService {

	Network save(Network network);
	
	int confirmFriend(int id);
	
	
	List<Network> getNewRequestFriendList(int id);
}
