package tw.nicesport.controller;

import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import tw.nicesport.dto.CourseDto;
import tw.nicesport.model.Coach;
import tw.nicesport.model.Course;
import tw.nicesport.service.CoachService;
import tw.nicesport.service.CourseBookingService;
import tw.nicesport.service.CourseService;

@RestController // REST 寫法
public class CourseApi {

	@Autowired
	private CourseService courseService;
	
	@Autowired
	private CourseBookingService courseBookingService;
	
	// 查詢全部(整併 by member id 功能)
	@GetMapping("/api/course")
	public List<CourseDto> findAll() {

		// 正常查找 course list
		List<Course> courses = courseService.queryAll();
				
		List<CourseDto> courseDtoList = toCourseDto(courses);

		return courseDtoList;
	}
	
	// 查詢全部(整併 by member id 功能)
	@GetMapping("/api/course/member/{memberId}")
	public List<CourseDto> findAllByMemberId(@PathVariable(name="memberId",required=false) Integer memberId) {

		// 正常查找 course list
		List<Course> courses = courseService.queryAll();
				
		// 找此 member 報名的課程
		List<Integer> courseIdListByThisMember;
		if(memberId!=null) {
			courseIdListByThisMember = courseBookingService.findCourseListRegisteredByGivenMember(memberId);
		} else {
			courseIdListByThisMember = null;
		}
		System.out.println("courseIdListByThisMember");
		System.out.println(courseIdListByThisMember);
		
		List<CourseDto> courseDtoList = toCourseDto(courses);

		for(CourseDto courseDto : courseDtoList) {
			courseDto.setIsRegisteredByThisMember(false);
			if(
					courseIdListByThisMember.contains( courseDto.getCourseId() )
				) {
				courseDto.setIsRegisteredByThisMember(true);
			}
		}
		
		return courseDtoList;
	}
	
	@GetMapping("/api/course/name/{courseName}")
	public List<CourseDto> findByName(@PathVariable(name="courseName",required=false) String courseName) {

		// 正常查找 course list by course name
		String courseNameTrim = courseName.trim();
		List<Course> courses = courseService.findByCourseNameContaining(courseNameTrim);
		System.out.println(courses);
		List<CourseDto> courseDtoList = toCourseDto(courses);
		return courseDtoList;
	}
	
	// 查詢全部(整併 by member id 功能)
	@GetMapping("/api/course/member/{memberId}/name/{courseName}")
	public List<CourseDto> findAllByMemberId(
			@PathVariable(name="memberId",required=false) Integer memberId,
			@PathVariable(name="courseName",required=false) String courseName) {

		// 正常查找 course list
		String courseNameTrim = courseName.trim();
		List<Course> courses = courseService.findByCourseNameContaining(courseNameTrim);
				
		// 找此 member 報名的課程
		List<Integer> courseIdListByThisMember;
		if(memberId!=null) {
			courseIdListByThisMember = courseBookingService.findCourseListRegisteredByGivenMember(memberId);
		} else {
			courseIdListByThisMember = null;
		}
		System.out.println("courseIdListByThisMember");
		System.out.println(courseIdListByThisMember);
		
		List<CourseDto> courseDtoList = toCourseDto(courses);

		for(CourseDto courseDto : courseDtoList) {
			courseDto.setIsRegisteredByThisMember(false);
			if(
					courseIdListByThisMember.contains( courseDto.getCourseId() )
				) {
				courseDto.setIsRegisteredByThisMember(true);
			}
		}
		
		return courseDtoList;
	}
	
	private List<CourseDto> toCourseDto(List<Course> courses) {
		// 轉 dto
		List<CourseDto> courseDtoList = new ArrayList<>();
		for(Course course : courses) {
			CourseDto courseDto = new CourseDto();
			// course id
			courseDto.setCourseId( course.getId() );
			// course name
			courseDto.setCourseName( course.getCourseName() );
			// coach id
			courseDto.setCoachId( course.getCoach().getId() );
			// coach full name
			courseDto.setCoachFullName(
					Objects.toString( course.getCoach().getLastName() , "")
					+
					Objects.toString( course.getCoach().getFirstName() , "")
			);
			// room no
			courseDto.setRoomNo( course.getRoom().getRoomNo() );
			// room name
			courseDto.setRoomName( course.getRoom().getRoomName() );
			// course description
			courseDto.setCourseDescription( course.getCourseDescription() );
			// course start date
			courseDto.setCourseStartDate( course.getCourseStartDate() );
			// courseClassAmount
			courseDto.setCourseClassAmount( course.getCourseClassAmount() );
			// coursePeriod
			courseDto.setCoursePeriod( course.getCoursePeriod() );
			// coursePrice
			courseDto.setCoursePrice( course.getCoursePrice() );
			// course remaining places
			courseDto.setCourseRemainingPlaces( course.getRemainingPlaces() );
			///////////////轉base64開始///////////////
			// 課程圖片
			if(course.getPicture()==null) { // null 不轉
				courseDto.setCoursePictureBase64(null);
			} else { // 有圖才轉
				courseDto.setCoursePictureBase64(
					Base64.getEncoder().encodeToString( course.getPicture() ) 
				);
			}
			// 教練照片
			if(course.getCoach().getProfile()==null) { // null 不轉
				courseDto.setCoachProfileBase64(null);
			} else { // 有圖才轉
				courseDto.setCoachProfileBase64(
					Base64.getEncoder().encodeToString( course.getCoach().getProfile() ) 
				);
			}
			///////////////轉base64結束/////////////////
			
			courseDtoList.add(courseDto);
		}
		
		return courseDtoList;
	}
}
