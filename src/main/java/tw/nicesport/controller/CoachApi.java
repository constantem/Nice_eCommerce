package tw.nicesport.controller;

import java.io.IOException;
import java.util.Base64;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import tw.nicesport.dto.CoachListForOnePage;
import tw.nicesport.model.Coach;
import tw.nicesport.service.CoachService;
import tw.nicesport.util.BytesUtils;

@RestController // REST 寫法
public class CoachApi {
	
	@Autowired
	private CoachService coachService;
	
	// 新增
	@PostMapping("/api/coach")
	public void insert(Coach coach) {
		coachService.insert(coach);
	}	

	// 修改一筆
	@PutMapping("/api/coach")
	public String update(
			@ModelAttribute("coach") Coach coach,
			@RequestParam("profileFile") MultipartFile file) throws IOException {
		// file 轉 bytes
		byte[] bytes = BytesUtils.multipartFileToBytes(file);
		
		// 若 input file 有值, 則用此新圖
		if( bytes!=null )  {
			coach.setProfile(bytes);
			
		// 若 input file 沒值, 用舊圖
		} else {
			if( !coach.getProfileBase64().isEmpty() ) {
				coach.setProfile( 
						Base64.getDecoder().decode( coach.getProfileBase64() ) 
					);
			} else {
				coach.setProfile(null);
			}
		}
		
		coachService.update(coach);
		return "修改成功";
	}
	
	// 查詢一筆
	@GetMapping("/api/coach/{id}")
	public Coach findOne(@PathVariable("id") Integer id) {
		Coach coach = coachService.findById(id);
		// bytes 轉 base64 String 處理
		if(coach.getProfile()!=null) {
			coach.setProfileBase64(
				Base64.getEncoder().encodeToString( coach.getProfile() )
			);
		}
		return coach;
	}
	
	// 查詢全部
	@GetMapping("/api/coach")
	public List<Coach> findAll() {
		List<Coach> coachs = coachService.findAll();
		for(Coach coach : coachs) {
			// null 不轉
			if(coach.getProfile()==null) {
				coach.setProfileBase64(null);
				continue;
			} 
			// 非 null 才轉
			coach.setProfileBase64(
				Base64.getEncoder().encodeToString( coach.getProfile() )
			);
		}
		return coachs;
	}
	
	// 查詢全部, by page
	@GetMapping("/api/coach/page/{pageNum}")
	public CoachListForOnePage findAllByPageNum(@PathVariable("pageNum") Integer pageNumber) {
		Page<Coach> coachsPage = coachService.findAll(pageNumber);
		List<Coach> coachs = coachsPage.getContent();
		for(Coach coach : coachs) {
			// null 不轉
			if(coach.getProfile()==null) {
				coach.setProfileBase64(null);
				continue;
			} 
			// 非 null 才轉
			coach.setProfileBase64(
				Base64.getEncoder().encodeToString( coach.getProfile() )
			);
		}
		CoachListForOnePage coachListForOnePage = new CoachListForOnePage();
		coachListForOnePage.setCoachs(coachs);
		coachListForOnePage.setTotalPages(coachsPage.getNumber());
		return coachListForOnePage;
	}
	
	// 刪除一筆
	@DeleteMapping("/api/coach/{id}")
	public void deleteOne(@PathVariable("id") Integer id) {
		coachService.deleteOne(id);
	}
	
}
