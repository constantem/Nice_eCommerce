package tw.nicesport.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

//import com.ibm.gpu.Maths;

import tw.nicesport.model.Employee;
import tw.nicesport.model.WorkSchedule;
import tw.nicesport.model.WorkScheduleRepository;
import tw.nicesport.service.WorkScheduleService;

@Controller
public class WorkScheduleController {

	@Autowired
	private WorkScheduleService workscheduleservice;
	
	@Autowired
	private WorkScheduleRepository workschedulerepository;

	@GetMapping("/employee/WorkSchedule")
	public String workSchedule() {
		return "employee/WorkSchedule";
	}

	@GetMapping("/WorkSchedule")
	@ResponseBody
	public List<WorkSchedule> workScheduleDate(@RequestParam(name="year") String year ,@RequestParam(name="month") String month ) {
		
		return workschedulerepository.findDate(year, month);	
	}

//	@PostMapping("/saveAll")
//	@ResponseBody
//	public void WorkScheduleSaveAll( HttpServletRequest request) {
//		 
//		String yrar = request.getParameter("year") ;
//		String month = request.getParameter("month") ;
//		
//		List<WorkSchedule> list = new ArrayList<WorkSchedule>();
//		
//		//因不同工作日需要新增，因此在迴圈外面 設定員工編碼變數,以記錄該日工作日 的員工 是誰
//		int empid=0;
//		
//		//取得前端畫面中 TABLE中 所有INPUT 的 NAME 名稱 EX: employee_id@1 ; work_id@1001_1
//		var ParameterNames =request.getParameterNames();
//		
//		//找尋是否還有下一個input name ; hasMoreElements() >> 傳回的是boolean
//		while(ParameterNames.hasMoreElements()) { 
//			
//			WorkSchedule WorkS = new WorkSchedule();
//			WorkS.setYear(yrar);
//			WorkS.setMonth(month);
//			
//			//取得下一個 input的 name 名稱 EX: employee_id@1 ; work_id@1001_1
//			String Pname = ParameterNames.nextElement();
//			//將取得的 Pname 變數 (此為 input的 name ) 放入 getParameter , 將取的該input 的 value
//			String Pname_value = request.getParameter(Pname);
//			
//			//將input的 name 名稱 用 @ 區分  
//			//EX:  employee_id@1    >>>>  employee_id >> arr_Pname[0] ; 1       >> arr_Pname[1]
//			//EX:  work_id@1001_1   >>>>  work_id     >> arr_Pname[0] ; 1001_1  >> arr_Pname[1]
//			//String[] arr_Pname = Pname.split("@");
//		
//			//取得 ParameterNames 裡面的input name 開頭為 employee_id
//			if (Pname.startsWith("employee_id")) {
//				//因 setEmployee_id 傳入的參數為int,此處先轉型態 ,並記錄起來
//				empid = Integer.parseInt(Pname_value); 
//				};
//				
//				//取得 ParameterNames 裡面的input name 開頭為 work_id	
//			if (Pname.startsWith("work_id")) {
//					//因資料庫 班別有設定FK , 但 班別TABLE裡面 沒有 0 的代碼, 所以此處將0 都先預設為4 ,
//				   //有空可以試試看 將班別TABLE內容增加0代碼 ,在註解此段,看還會不會死掉
//					if(Pname_value.equals("0")) {Pname_value ="4";}
//				
//					WorkS.setWork_id(Pname_value);
//					WorkS.setEmployee_id(empid);
//					
//					//依 _ 區隔，取得日期 work_id@1001_1 >> [work , id@1001 , 1]
//					//寫在此處的原因是因為, employee_id@1 只有2個長度,但我們需要的是 work_id@1001_1 的最後一個 , 
//					//如果要寫在這個if外面 , 可以將前端NAME 取名格式改變 EX:work_id@1_1001(work_id+日期+員工號碼)
//					String tmpday = Pname.split("_")[2]; 
//					//以下兩行為解析
//					//String[] tmpday = Pname.split("_");
//					//String day_ = tmpday[2];
//					
//					
//					WorkS.setDay(tmpday); 
//					
//					//沒加會有紅紅的
//					@SuppressWarnings("deprecation")
//					
//					//將年月日組合,轉成日期型態 ,因為setWorkdate必須帶入型態為日期格式
//					Date wd= new Date(yrar +"/"+ month+"/"+tmpday); //不知道為何DATE會這樣
//					WorkS.setWorkdate(wd);
//					//System.out.println(tmpday); 
//					
//					//每個工作天都要存一筆資料,因此寫在這邊
//					list.add(WorkS); 
//			};	 
//				workscheduleservice.saveSchedule(list);
//				//此法有個問題,就是使用者在按一次確定時,資料會重複		
//		}
//	}
//	

	@PostMapping("/saveAll")
	@ResponseBody
	public ModelAndView workScheduleSaveAll(ModelAndView mav,
			@Valid @ModelAttribute(name = "WorkSchedule") WorkSchedule work, BindingResult br) {
		
		List<WorkSchedule> list = new ArrayList<WorkSchedule>();
		
		// 針對 年月日跟班別處理
		String ArrYear = work.getYear();
		String ArrMonth = work.getMonth();
		
		workschedulerepository.delDate(ArrYear, ArrMonth);
		System.out.println("work123" + work);
		String[] ArrWorkId = work.getWork_id().split(",");
		String[] ArrDay = work.getDay().split(",");
		String[] ArrEmployeeid = work.getEmployee_id().split(",");
		System.out.println("work.getWork_id():"+work.getWork_id());
		int cnt = 0;

		for (int i = 0; i < ArrEmployeeid.length; i++) {
			// 抓員工數量
			System.out.println(ArrEmployeeid.length);
			for (int y = 0; y < ArrDay.length; y++) {
				// 抓天數
				WorkSchedule WorkS = new WorkSchedule();
				// 塞資料
				
				System.out.println("ArrWorkId[i]"+ArrWorkId[i]);
				WorkS.setYear(ArrYear);
				WorkS.setMonth(ArrMonth);
				WorkS.setEmployee_id(ArrEmployeeid[i]);
				WorkS.setDay(ArrDay[y]);
				
//				WorkS.setWorkdate(ArrYear+"-"+ArrMonth+"-"+WorkS.setDay(ArrDay[y]));
				
				WorkS.setWork_id(ArrWorkId[cnt]);
				cnt++;
				
				list.add(WorkS);	
			}
			
			}
		workscheduleservice.saveSchedule(list);
	

		mav.getModel().put("work", work);

		mav.setViewName("employee/WorkSchedule");
		return mav;
	}
	
	@GetMapping("/punchCardFindWork")
	@ResponseBody
	public List<WorkSchedule> punchCardFindWork(
			@RequestParam(name="year") String year ,
			@RequestParam(name="month") String month ,
			@RequestParam(name="day") String day,
			@RequestParam(name="employeeid") String employeeid){
		
		return workschedulerepository.findPunchCard(year,month,day,employeeid);
		
		
	}
}