package tw.nicesport.service;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
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
	
	public Page<Course> queryAllByPage(
			int pageNum, int pageSize, String sortDirection, String sortedField) {
		
		// 1-based 轉 0-based
		int pageNumZeroBased = pageNum-1;
		
		// 頁碼預設 >= 0
		if(pageNumZeroBased < 0) {
			pageNumZeroBased = 0;
		}
		
		// 每頁筆數預設 >= 1
		if (pageSize < 1) {
			pageSize = 1;
		}
		
		// 預設為降序
		Sort.Direction direction = Sort.Direction.DESC;
		if(sortDirection.equals("ASC")) {
			direction = Sort.Direction.ASC;
		} 
		
		// 預設以 createdAt 排序
		String property = "createdAt";
		try {
			Class<?> cls = Class.forName("tw.nicesport.model.Course");
			Field[] fieldList = cls.getDeclaredFields();
			for(Field field : fieldList) {
				if(field.getName().equals(sortedField)) {
					property = sortedField; // 存在才用
					break;
				}
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		Pageable pageable = PageRequest.of(pageNumZeroBased, pageSize, direction, property);
		return courseDao.findAll(pageable);
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
	
	public Course update(Course course) {
		// 更新 course entity
		return courseDao.save(course);
	}
	
	public void deleteById(Integer id) {
		courseDao.deleteById(id);
	}
}
