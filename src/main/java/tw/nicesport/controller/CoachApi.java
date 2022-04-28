package tw.nicesport.controller;

import java.util.List;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import tw.nicesport.model.Coach;
import tw.nicesport.service.CoachService;

@RestController // REST 寫法
@RequestMapping("/api")
public class CoachApi {
	
	private CoachService coachService;
	
	// 新增
	@PostMapping("/coach")
	public void insert(Coach coach) {
		coachService.insert(coach);
	}	

	// 修改一筆
	@PutMapping("/coach")
	public void update(@ModelAttribute("coach") Coach coach) {
		coachService.update(coach);
	}
	
	// 查詢一筆
	@GetMapping("/coach/{id}")
	public Coach findOne(@PathVariable("id") Integer id) {
		return coachService.findById(id);
	}
	
	// 查詢全部
	@GetMapping("/coach")
	public List<Coach> findAll() {
		return coachService.findAll();
	}
	
	// 刪除一筆
	@DeleteMapping("/coach/{id}")
	public void deleteOne(@PathVariable("id") Integer id) {
		coachService.deleteOne(id);
	}
	
}
