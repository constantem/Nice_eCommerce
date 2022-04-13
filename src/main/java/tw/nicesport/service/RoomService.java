package tw.nicesport.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.nicesport.model.Room;
import tw.nicesport.model.RoomRepository;

@Service
@Transactional
public class RoomService {

	@Autowired
	private RoomRepository roomDao;
	
	public List<Room> queryAll() {
		return roomDao.findAll();
	}
	
	public Room queryById(String roomNo) {
		Optional<Room> result = roomDao.findById(roomNo);
		
		if(result.isEmpty()) {
			return null;
		}
		
		return result.get();
	}
}
