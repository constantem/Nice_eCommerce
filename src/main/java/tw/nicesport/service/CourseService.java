package tw.nicesport.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.nicesport.dto.CoachsAndRoomsContainer;
import tw.nicesport.model.Coach;
import tw.nicesport.model.CoachRepository;
import tw.nicesport.model.Course;
import tw.nicesport.model.CourseRepository;
import tw.nicesport.model.Room;
import tw.nicesport.model.RoomRepository;

@Service
@Transactional
public class CourseService {

	@Autowired
	private CourseRepository courseDao;
	
	@Autowired
	private CoachRepository coachDao;
	
	@Autowired
	private RoomRepository roomDao;
	
	public boolean createOneCourse(Course course) {
		Course courseResult = courseDao.save(course);
		
		if(courseResult!=null) {
			return true;
		}
		
		return false;
	}
	
	public Course queryById(Integer id) {
		Optional<Course> result = courseDao.findById(id);
		
		if(result.isEmpty()) {
			return null;
		}
		
		return result.get();
	}
	
	public List<Course> queryAll() {
		return courseDao.findAll();
	}
	
	public CoachsAndRoomsContainer getAllCoachAndRoom() {
		
		List<Coach> coachs = coachDao.findAll();
		List<Room> rooms = roomDao.findAll();
		CoachsAndRoomsContainer container = new CoachsAndRoomsContainer();
		container.setCoachs(coachs);
		container.setRooms(rooms);
		
		return container;
	}
	
	public Coach getCoach(Integer id) {
		Optional<Coach> result = coachDao.findById(id);
		if(result.isEmpty()) {
			return null;
		}
		return result.get();
	}
	
	public Room getRoom(String roomNo) {
		Optional<Room> result = roomDao.findById(roomNo);
		if(result.isEmpty()) {
			return null;
		}
		return result.get();
	}
	
	public boolean updateOne(Course course) {
		// 更新 course entity
		Course courseResult = courseDao.save(course);
		
		if(courseResult!=null) {
			return true;
		} else {
			return false;
		}
	}
	
	public void deleteById(Integer id) {
		courseDao.deleteById(id);
	}
}
