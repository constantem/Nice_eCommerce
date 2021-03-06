package tw.nicesport.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import tw.nicesport.dto.CoachsAndRoomsContainer;
import tw.nicesport.model.Coach;
import tw.nicesport.model.Course;
import tw.nicesport.model.CourseBooking;
import tw.nicesport.model.Member;
import tw.nicesport.model.Room;
import tw.nicesport.service.CourseService;
import tw.nicesport.service.MemberService;
import tw.nicesport.util.BytesUtils;
import tw.nicesport.util.RandomUtils;

@Controller
public class CourseBackController {
	
	@Autowired
	private CourseService courseService;
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/staff/course/form")
	public String showCourseForm(Model model) {
		model.addAttribute( "course", new Course() );
		CoachsAndRoomsContainer crContainer = courseService.getAllCoachAndRoom();
		model.addAttribute( "coachs", crContainer.getCoachs() );
		model.addAttribute( "rooms", crContainer.getRooms() );
		model.addAttribute( "activeLi", "courseForm" );
		return "course/course-form";
	}
	
	// ????????? ajax, ????????????????????? sweat alert
	@RequestMapping("/course/create")
	@ResponseBody
	public String courseCreated(
			@Valid @ModelAttribute("course") Course course,
			BindingResult br,
			@RequestParam("pictureFile") MultipartFile pictureFile) throws IOException {
		
		// MultipartFile ??? bytes, ??? fileName ??? null ??????, ??? bytes ??? null
		byte[] bytes = BytesUtils.multipartFileToBytes(pictureFile);
		course.setPicture(bytes);
		
		if(br.hasErrors()) {
			// ????????? validator
			return "???????????????";
		}
		
		// course ????????? coach, room, ?????? course ??? insert
		Coach coach = courseService.getCoach(course.getCoachId());
		Room room = courseService.getRoom(course.getRoomNo());
		course.setCoach(coach);
		course.setRoom(room);
		boolean status = courseService.createOneCourse(course);
		
		if(status) {
			return "????????????";
		} else {
			return "????????????";
		}
	}
	
	@RequestMapping("/course/autoinput")
	@ResponseBody
	public Map<String,String> autoinput() throws JsonProcessingException {
		
		// ???????????????????????????
		String[] courseNameArray = new String[]{
			"????????????","????????????","????????????","????????????","????????????","????????????","ZUMBA","????????????","???????????????"
		};
		
		int[] courseClassAmountArray = new int[]{
			10,12,20,24
		};

		CoachsAndRoomsContainer crContainer = courseService.getAllCoachAndRoom();
		List<Coach> coachs = crContainer.getCoachs();
		List<Room> rooms = crContainer.getRooms();
		
		int[] coursePriceArray = new int[]{20000,24000,30000,36000};
		
		// ????????????
		Course courseForAutoInput = new Course();
		
		courseForAutoInput.setCourseName(
			courseNameArray[   RandomUtils.getRandomIndex(courseNameArray.length)   ]
		);
		
		courseForAutoInput.setCourseDescription(
			"?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????6???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????"
		);
		
		courseForAutoInput.setCourseStartDate(
				RandomUtils.getRandomDate(2020, 2022)
		);
		
		courseForAutoInput.setCourseClassAmount(
				courseClassAmountArray[   RandomUtils.getRandomIndex(courseClassAmountArray.length)   ]
		);
		
		Coach coachForAutoInput = coachs.get(RandomUtils.getRandomIndex(coachs.size()));
		
		Room roomForAutoInput = rooms.get(RandomUtils.getRandomIndex(rooms.size()));
		
		courseForAutoInput.setCoursePrice(
				coursePriceArray[   RandomUtils.getRandomIndex(coursePriceArray.length)   ]
		);
		
		// ??? JSON string
		ObjectMapper mapper = new ObjectMapper();
		String courseJsonStr = mapper.writeValueAsString(courseForAutoInput);
		String coachJsonStr = mapper.writeValueAsString(coachForAutoInput);
		String roomJsonStr = mapper.writeValueAsString(roomForAutoInput);
		
		// ?????? key-value, ?????? JSON string
		Map<String,String> mapForAutoInput = new HashMap<>();
		mapForAutoInput.put("course", courseJsonStr);
		mapForAutoInput.put("coach", coachJsonStr);
		mapForAutoInput.put("room", roomJsonStr);
		String mapJsonStr = mapper.writeValueAsString(mapForAutoInput);
		
		return mapForAutoInput;
	}
	
	// ????????????????????? Page ??????
//	@RequestMapping("/staff/course/show/all")
//	public String showAllCourse(Model model) {		
//		List<Course> courses = courseService.queryAll();
//		model.addAttribute("courses", courses);
//		model.addAttribute("activeLi", "courseList");
//		return "course/show-all-courses";
//	}
	
	@RequestMapping("/staff/course/show/all")
	public String showAllCourseByPage(
			Model model,
			@RequestParam(name="pageNumber",defaultValue="1") Integer pageNum,
			@RequestParam(name="pageSize",defaultValue="10") Integer pageSize,
			@RequestParam(name="direction",defaultValue="DESC") String direction,
			@RequestParam(name="property",defaultValue="createdAt") String property) throws Exception {
		
		// ??????
		Page<Course> coursesForOnePage = courseService.queryAllByPage(pageNum, pageSize, direction, property);

		// Page ?????? List
		List<Course> courses = coursesForOnePage.getContent();
		
		// ?????? POJO ??? bytes ??? base64 String
		for(Course course : courses) {
			// null ??????
			if(course.getPicture()==null) {
				course.setPictureBase64(null);
				continue;
			} 
			
			course.setPictureBase64(
				Base64.getEncoder().encodeToString( course.getPicture() ) 
			);
		}
		
		// model
		model.addAttribute("courses", courses);
		model.addAttribute("totalPages", coursesForOnePage.getTotalPages());
		model.addAttribute("thisPageNumberZeroBased", coursesForOnePage.getNumber());
		model.addAttribute("activeLi", "courseList");
		return "course/show-all-courses";
	}
	
	// ??????????????????
	@RequestMapping("/course/show/{id}")
	public String showOneCourse(
			@PathVariable("id") Integer id,
			Model model) {		
		// POJO
		Course course = courseService.queryById(id);
		// ??? bytes ??? base64 String
			
		if(course.getPicture()==null) {
			course.setPictureBase64(null);
		} else {
			course.setPictureBase64(
				Base64.getEncoder().encodeToString( course.getPicture() ) 
			);
		}

		model.addAttribute("course", course);
		CoachsAndRoomsContainer crContainer = courseService.getAllCoachAndRoom();
		model.addAttribute( "coachs", crContainer.getCoachs() );
		model.addAttribute( "rooms", crContainer.getRooms() );
		return "course/show-a-course";
	}
	
	// ????????????????????????
	@RequestMapping("/course/update/{id}")
	public String updateOneCourse(
			@RequestParam("pictureFile") MultipartFile pictureFile,
			@PathVariable("id") Integer id,
			@Valid @ModelAttribute("course") Course course,
			BindingResult br,
			Model model) throws IOException {	

		// MultipartFile ??? bytes, ??? fileName ??? null ??????, ??? bytes ??? null
		byte[] bytes = BytesUtils.multipartFileToBytes(pictureFile);
		
		// ??? input file ??????, ???????????????
		if( bytes!=null )  {
			course.setPicture(bytes);
			
		// ??? input file ??????, ?????????
		} else {
			if( !course.getPictureBase64().isEmpty() ) {
				course.setPicture( 
						Base64.getDecoder().decode( course.getPictureBase64() ) 
					);
			} else {
				course.setPicture(null);
			}
		}
		
		
		if(br.hasErrors()) {
			model.addAttribute("course", course);
			CoachsAndRoomsContainer crContainer = courseService.getAllCoachAndRoom();
			model.addAttribute( "coachs", crContainer.getCoachs() );
			model.addAttribute( "rooms", crContainer.getRooms() );
//			return "forward:/show/"+id;
			return "course/show-a-course";
		}
		
		Coach coach = courseService.getCoach(course.getCoachId());
		Room room = courseService.getRoom(course.getRoomNo());
		course.setCoach(coach);
		course.setRoom(room);
		courseService.update(course);
		
		model.addAttribute("course", course);
		return "redirect:/course/show/"+id;
	}
	
	@RequestMapping("/course/delete/{id}")
	public String deleteOneCourse(
			@PathVariable("id") Integer id,
			Model model) {		
		courseService.deleteById(id);
		List<Course> courses = courseService.queryAll();
		model.addAttribute("courses", courses);
		return "course/show-all-courses";
	}
	
	@RequestMapping("/course/delete/{id}/ajax")
	@ResponseBody
	public void deleteOneCourseAjax(@PathVariable("id") Integer id) {		
		courseService.deleteById(id);
	}
		
}
