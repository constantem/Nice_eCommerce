package tw.nicesport.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonFormat;


@Entity
@Table(name="WorkSchedule")
public class WorkSchedule {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="workSchedule_id")
	private Integer workscheduleid;
	
	//要去找Employee 的員工名字
	@Column(name="employee_id")
	private Integer employeeid;
	
	@JsonFormat(pattern = "yyyy/MM/dd", timezone = "GMT+8")
	@Temporal(TemporalType.TIMESTAMP) // 年 月 日 十分秒
	@Column(name="workDate")
	private Date workdate;
	
	@Column(name="year")
	private String year;
	
	@Column(name="month")
	private String month;
	
	@Column(name="day")
	private String day;

	//要去找work 的班別種類
	@Column(name="work_id")
	private String workid;
	
	
	public WorkSchedule() {
	}


	public Integer getWorkscheduleid() {
		return workscheduleid;
	}


	public void setWorkscheduleid(Integer workscheduleid) {
		this.workscheduleid = workscheduleid;
	}


	public Integer getEmployeeid() {
		return employeeid;
	}


	public void setEmployeeid(Integer employeeid) {
		this.employeeid = employeeid;
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


	public String getWorkid() {
		return workid;
	}


	public void setWorkid(String workid) {
		this.workid = workid;
	}


	@Override
	public String toString() {
		return "WorkSchedule [workscheduleid=" + workscheduleid + ", employeeid=" + employeeid + ", workdate="
				+ workdate + ", year=" + year + ", month=" + month + ", day=" + day + ", workid=" + workid + "]";
	}



	
}
