package tw.nicesport.model;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "WorkSchedule")
public class WorkSchedule {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "workSchedule_id")
	private Integer workscheduleid;
	
	@JsonFormat(pattern = "yyyy/MM/dd", timezone = "GMT+8")
	@Temporal(TemporalType.TIMESTAMP) // 年 月 日 十分秒
	@Column(name = "workDate")
	private Date workdate;

	@Column(name = "year")
	private String year;

	@Column(name = "month")
	private String month;

	@Column(name = "day")
	private String day;
	
//	@Column(nullable=false)
	@Column(name = "employee_id")
	private String employeeid;
		
	// 要去找work 的班別種類
	@Column(name="work_id")
	private String workid;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "employee_id", insertable=false, updatable=false)
	private Employee employee;// 姓
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "work_id", insertable=false, updatable=false)
	private ScheduleType  scheduleType;

	public WorkSchedule() {
	}
//	public WorkSchedule(String year, String day ,Integer employeeid) {
//		this.year = year;
//		this.day = day;
//		this.employeeid =employeeid;
//	}
	 
	
	public ScheduleType getScheduleType() {
		return scheduleType;
	}

	public void setScheduleType(ScheduleType scheduleType) {
		this.scheduleType = scheduleType;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public Integer getWorkscheduleid() {
		return workscheduleid;
	}

	public void setWorkscheduleid(Integer workscheduleid) {
		this.workscheduleid = workscheduleid;
	}

	public Date getWorkdate() {
		return workdate;
	}

	public void setWorkdate(Date workdate) {
		this.workdate = workdate;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public String getEmployee_id() {
		return employeeid;
	}

	public void setEmployee_id(String employee_id) {
		this.employeeid = employee_id;
	}

	public String getWork_id() {
		return workid;
	}

	public void setWork_id(String work_id) {
		this.workid = work_id;
	}

	@Override
	public String toString() {
		return "WorkSchedule [workscheduleid=" + workscheduleid + ", workdate=" + workdate + ", year=" + year
				+ ", month=" + month + ", day=" + day + ", employee_id=" + employeeid + ", work_id=" + workid
				+ ", employee=" + employee + ", scheduleType=" + scheduleType + "]";
	}
	

	
}
