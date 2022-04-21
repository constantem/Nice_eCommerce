package tw.nicesport.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import tw.nicesport.dto.CoachsAndRoomsContainer;
import tw.nicesport.model.Coach;
import tw.nicesport.model.Course;
import tw.nicesport.model.Room;
import tw.nicesport.service.CourseService;
import tw.nicesport.util.randomUtils;

@Controller
@RequestMapping("/course") // controller 根 URL
public class CourseController {
	
	@Autowired
	private CourseService courseService;
	
	@RequestMapping("/form")
	public String showCourseForm(Model model) {
		model.addAttribute( "course", new Course() );
		CoachsAndRoomsContainer crContainer = courseService.getAllCoachAndRoom();
		model.addAttribute( "coachs", crContainer.getCoachs() );
		model.addAttribute( "rooms", crContainer.getRooms() );
		return "course/course-form";
	}
	
	@RequestMapping("/create")
	@ResponseBody
	public String courseCreated(
			@Valid @ModelAttribute("course") Course course,
			BindingResult br) {
		
		// 開發階段測試:
		System.out.println(course.getCourseStartDate().toString());
		
		if(br.hasErrors()) {
			// 客製化 validator
			return "驗證不通過";
		}
		
		Coach coach = courseService.getCoach(course.getCoach_id());
		Room room = courseService.getRoom(course.getRoomNo());
		course.setCoach(coach);
		course.setRoom(room);
		
		boolean status = courseService.createOneCourse(course);
		
		if(status) {
			return "新增成功";
		}
		
		return "新增失敗";
	}
	
	@RequestMapping("/autoinput")
	@ResponseBody
	public Map<String,String> autoinput() throws JsonProcessingException {
		
		// 各屬性的各種候選值
		String[] courseNameArray = new String[]{
			"舒活瑜珈","療癒瑜珈","階梯有氧","重力彈跳","空中瑜珈","皮拉提斯","ZUMBA","海邊健走","瑜珈抗力球"
		};
		
		int[] courseClassAmountArray = new int[]{
			10,12,20,24
		};

		CoachsAndRoomsContainer crContainer = courseService.getAllCoachAndRoom();
		List<Coach> coachs = crContainer.getCoachs();
		List<Room> rooms = crContainer.getRooms();
		
		int[] coursePriceArray = new int[]{20000,24000,30000,36000};
		
		// 亂數出值
		Course courseForAutoInput = new Course();
		
		courseForAutoInput.setCourseName(
			courseNameArray[   randomUtils.getRandomIndex(courseNameArray.length)   ]
		);
		
		courseForAutoInput.setCourseStartDate(
				randomUtils.getRandomDate(2020, 2022)
		);
		
		courseForAutoInput.setCourseClassAmount(
				courseClassAmountArray[   randomUtils.getRandomIndex(courseClassAmountArray.length)   ]
		);
		
		Coach coachForAutoInput = coachs.get(randomUtils.getRandomIndex(coachs.size()));
		
		Room roomForAutoInput = rooms.get(randomUtils.getRandomIndex(rooms.size()));
		
		courseForAutoInput.setCoursePrice(
				coursePriceArray[   randomUtils.getRandomIndex(coursePriceArray.length)   ]
		);
		
		// 轉 JSON string
		ObjectMapper mapper = new ObjectMapper();
		String courseJsonStr = mapper.writeValueAsString(courseForAutoInput);
		String coachJsonStr = mapper.writeValueAsString(coachForAutoInput);
		String roomJsonStr = mapper.writeValueAsString(roomForAutoInput);
		
		// 三對 key-value, 後轉 JSON string
		Map<String,String> mapForAutoInput = new HashMap<>();
		mapForAutoInput.put("course", courseJsonStr);
		mapForAutoInput.put("coach", coachJsonStr);
		mapForAutoInput.put("room", roomJsonStr);
		String mapJsonStr = mapper.writeValueAsString(mapForAutoInput);
		
		return mapForAutoInput;
	}
	
	@RequestMapping("/show/all")
	public String showAllCourse(Model model) {		
		List<Course> courses = courseService.queryAll();
		model.addAttribute("courses", courses);
		return "course/show-all-courses";
	}
	
	@RequestMapping("/show/{course_id}")
	public String showOneCourse(
			@PathVariable("course_id") Integer id,
			Model model) {		
		Course course = courseService.queryById(id);
		model.addAttribute("course", course);
		CoachsAndRoomsContainer crContainer = courseService.getAllCoachAndRoom();
		model.addAttribute( "coachs", crContainer.getCoachs() );
		model.addAttribute( "rooms", crContainer.getRooms() );
		return "course/show-a-course";
	}
	
	// 前台轉跳 course detail
	@RequestMapping("/detail/{id}")
	public String detailCourseJsp(
		@PathVariable(name="id") Integer id,
		Model model) {		
		model.addAttribute("id",id);
		return "course/detail-a-course-front";
	}
	
	// 前台 course detail (用 Ajax)
	@RequestMapping("/detail/data")
	@ResponseBody
	public Course detailCourseJson(@RequestBody Integer id) {		
		return courseService.queryById(id);
	}

	@RequestMapping("/update/{course_id}")
	public String updateOneCourse(
			@PathVariable("course_id") Integer id,
			@Valid @ModelAttribute("course") Course course,
			BindingResult br,
			Model model) {	

		if(br.hasErrors()) {
			model.addAttribute("course", course);
			CoachsAndRoomsContainer crContainer = courseService.getAllCoachAndRoom();
			model.addAttribute( "coachs", crContainer.getCoachs() );
			model.addAttribute( "rooms", crContainer.getRooms() );
//			return "forward:/show/"+id;
			return "course/show-a-course";
		}
		
		Coach coach = courseService.getCoach(course.getCoach_id());
		Room room = courseService.getRoom(course.getRoomNo());
		course.setCoach(coach);
		course.setRoom(room);
		boolean status = courseService.updateOne(course);
		
		if(status) {
			model.addAttribute("course", course);
//			return "course/show-a-course";
			return "redirect:/course/show/"+id;
		}

		return "course/update-failure";
	}
	
	@RequestMapping("/delete/{course_id}")
	public String deleteOneCourse(
			@PathVariable("course_id") Integer id,
			Model model) {		
		courseService.deleteById(id);
		
		List<Course> courses = courseService.queryAll();
		model.addAttribute("courses", courses);
		return "course/show-all-courses";
	}
	
	// 前端課程
	@RequestMapping("/list/all")
	public String showAllCourseInFront(Model model) {		
		List<Course> courses = courseService.queryAll();
		model.addAttribute("courses", courses);
		return "course/list-all-courses-front";
	}
}
