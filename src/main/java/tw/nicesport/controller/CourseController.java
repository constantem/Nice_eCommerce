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
import tw.nicesport.util.RandomUtils;

@Controller
public class CourseController {
	
	@Autowired
	private CourseService courseService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	ServletContext servletContext; 
	
	@RequestMapping("/course/form")
	public String showCourseForm(Model model) {
		model.addAttribute( "course", new Course() );
		CoachsAndRoomsContainer crContainer = courseService.getAllCoachAndRoom();
		model.addAttribute( "coachs", crContainer.getCoachs() );
		model.addAttribute( "rooms", crContainer.getRooms() );
		model.addAttribute( "activeLi", "courseForm" );
		return "course/course-form";
	}
	
	// 前端用 ajax, 新增成功則彈出 sweat alert
	@RequestMapping("/course/create")
	@ResponseBody
	public String courseCreated(
			@Valid @ModelAttribute("course") Course course,
			BindingResult br,
			@RequestParam("pictureFile") MultipartFile pictureFile) throws IOException {
		
		// MultipartFile 轉 bytes, 若 fileName 為 null 或空, 則 bytes 為 null
		byte[] bytes = multipartFileToBytes(pictureFile);
		course.setPicture(bytes);
		
		if(br.hasErrors()) {
			// 客製化 validator
			return "驗證不通過";
		}
		
		// course 中放入 coach, room, 並將 course 做 insert
		Coach coach = courseService.getCoach(course.getCoachId());
		Room room = courseService.getRoom(course.getRoomNo());
		course.setCoach(coach);
		course.setRoom(room);
		boolean status = courseService.createOneCourse(course);
		
		if(status) {
			return "新增成功";
		} else {
			return "新增失敗";
		}
	}
	
	// fileName 沒有則回傳 null
	private byte[] multipartFileToBytes(
			MultipartFile multipartFile) throws IOException {
		
		// 檔名
		String fileName = multipartFile.getOriginalFilename();
		System.out.println("fileName===>"+fileName);
		
		// 檔名為空
		if(fileName == null || fileName.trim().isEmpty()) {
			return null;
		}
		
		// 從檔案變串流
		InputStream inStream = multipartFile.getInputStream();
		
		// 從串流變 bytes
		byte[] bytes = new byte[inStream.available()]; // 空的 bytes
		inStream.read(bytes); // 從串流讀進 bytes
		inStream.close();
		
		return bytes;
	}
	
	private String toBase64(byte[] bytes) {
		return Base64.getEncoder().encodeToString(bytes);
	}
	
	private String upLoadImageAsTempFile(
			@RequestParam("profileFile") MultipartFile profileFile) throws IllegalStateException, IOException {
		
		// 檔名
		String fileName = profileFile.getOriginalFilename();
		System.out.println("fileName===>"+fileName);
		
		// 暫存檔路徑
		String tempSavedPath = 
				servletContext.getRealPath("/") 
				+ "resources/courseImg/" + fileName;
		
		// 串流變暫存檔
		File tempSavedFile = new File(tempSavedPath);
		profileFile.transferTo(tempSavedFile);
		System.out.println("savedFile===>"+tempSavedFile);
		
		return fileName;
	}
	
	@RequestMapping("/course/autoinput")
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
			courseNameArray[   RandomUtils.getRandomIndex(courseNameArray.length)   ]
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
	
	// 基本上被下面的 Page 取代
//	@RequestMapping("/course/show/all")
//	public String showAllCourse(Model model) {		
//		List<Course> courses = courseService.queryAll();
//		model.addAttribute("courses", courses);
//		model.addAttribute("activeLi", "courseList");
//		return "course/show-all-courses";
//	}
	
	@RequestMapping("/course/show/all")
	public String showAllCourseByPage(
			Model model,
			@RequestParam(name="pageNumber",defaultValue="1") Integer pageNum,
			@RequestParam(name="pageSize",defaultValue="10") Integer pageSize,
			@RequestParam(name="direction",defaultValue="DESC") String direction,
			@RequestParam(name="property",defaultValue="createdAt") String property) {
	
		// 查詢
		Page<Course> coursesForOnePage = courseService.queryAllByPage(pageNum, pageSize, direction, property);

		// Page 取出 List
		List<Course> courses = coursesForOnePage.getContent();
		
		// 每個 POJO 將 bytes 轉 base64 String
		for(Course course : courses) {
			
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
	
	// 後台
	@RequestMapping("/course/show/{id}")
	public String showOneCourse(
			@PathVariable("id") Integer id,
			Model model) {		
		// POJO
		Course course = courseService.queryById(id);
		// 將 bytes 轉 base64 String
			
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
	
	// 前台轉跳 course detail
	@RequestMapping("/course/detail/{id}")
	public String detailCourseJsp(
		@PathVariable(name="id") Integer id,
		Model model) {		
		model.addAttribute("id",id);
		return "course/detail-a-course-front";
	}
	
	// 前台 course detail (用 Ajax) 
	@RequestMapping("/course/detail/data")
	@ResponseBody
	public Course detailCourseJson(@RequestBody Integer id) {		
		return courseService.queryById(id);
	}

	@RequestMapping("/course/update/{id}")
	public String updateOneCourse(
			@RequestParam("pictureFile") MultipartFile pictureFile,
			@PathVariable("id") Integer id,
			@Valid @ModelAttribute("course") Course course,
			BindingResult br,
			Model model) throws IOException {	

		// MultipartFile 轉 bytes, 若 fileName 為 null 或空, 則 bytes 為 null
		byte[] bytes = multipartFileToBytes(pictureFile);
		
		// 若 bytesBase64 為 null, 則才考慮新檔
		if( course.getPictureBase64()==null || course.getPictureBase64().trim().isEmpty() ) {
			course.setPicture(bytes);
		
		// 若 bytesBase64 有值, 則用就檔
		} else {
			
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
		boolean status = courseService.updateOne(course);
		
		if(status) {
			model.addAttribute("course", course);
//			return "course/show-a-course";
			return "redirect:/course/show/"+id;
		}

		return "course/update-failure";
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
	
	// 前端課程
	@RequestMapping("/course/list/all")
	public String showAllCoursesInFront(Model model) {		
		List<Course> courses = courseService.queryAll();
		model.addAttribute("courses", courses);
		return "course/list-all-courses-front";
	}
	
}
