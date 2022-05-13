package tw.nicesport.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.nicesport.model.CourseBooking;
import tw.nicesport.model.CourseBookingRepository;
import tw.nicesport.model.Member;
import tw.nicesport.model.MemberRepository;

@Service
@Transactional
public class CourseBookingService {

	@Autowired
	private CourseBookingRepository courseBookingDao;
	
	@Autowired
	private MemberRepository memberDao;
	
	// 新增
	public CourseBooking insert(CourseBooking courseBooking) {
		return courseBookingDao.save(courseBooking);
	}
	
	// 更新
	public void update(CourseBooking courseBooking) {
		courseBookingDao.save(courseBooking);
	}
	
	public List<CourseBooking> findAll() {
		return courseBookingDao.findAll();
	}
	
	public CourseBooking findById(Integer id) {
		
		Optional<CourseBooking> courseBookingOpt = courseBookingDao.findById(id);
		
		if(courseBookingOpt.isEmpty()) {
			return null;
		}
		
		return courseBookingOpt.get();
	}
	
	// 教練刪除一個
	public void deleteOne(Integer id) {
		courseBookingDao.deleteById(id);
	}
	
	public List<Integer> findCourseListRegisteredByGivenMember(Integer memberId) {
		Optional<Member> memberOpt = memberDao.findById(memberId);
		if(memberOpt.isEmpty()) {
			return new ArrayList<>();
		}
		Member member = memberOpt.get();
		List<CourseBooking> courseBookingList = member.getCourseBookingList();
		List<Integer> courseIdListByGivenMember = new ArrayList<>();
		for(CourseBooking courseBooking : courseBookingList) {
			courseIdListByGivenMember.add(courseBooking.getCourse().getId());
		}
		return courseIdListByGivenMember;
	}
	
}
