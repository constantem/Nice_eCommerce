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
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.DynamicInsert;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat; 

@Entity
@Table(name = "PunchCardSystem")
public class PunchCardSystem {
 
//  @Id註釋指定表的主鍵	
	@Id 
	@GeneratedValue(strategy = GenerationType.IDENTITY)
//  @Column註釋定義了將成員屬性對映到關係表中的哪一列和該列的結構資訊
	@Column(name = "punchCardSystemm_id ")
	private Integer punchCardsystemmid ;// 打卡編號

	@Column(name = "punchStatus")
	private String punchstatus;// 打卡狀態 

	@JsonFormat(pattern = "yyyy/MM/dd HH:mm:ss", timezone = "GMT+8")
	@Temporal(TemporalType.TIMESTAMP) // 年 月 日 十分秒
	@Column(name = "punchIn", columnDefinition = "datetime")
	private Date punchin;// 建立日期

	@Temporal(TemporalType.TIMESTAMP)
	@JsonFormat(pattern = "yyyy/MM/dd HH:mm:ss", timezone = "GMT+8")
	@Column(name = "punchOut ", columnDefinition = "datetime")
	private Date punchout;// 修改日期
	
	// 要去找work 的班別種類
	@Column(name="work_id")
	private String workid;
	
	@Column(name = "employee_id")
	private Integer employeeid;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "employee_id", insertable=false, updatable=false)
	private Employee employee;// 姓
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "work_id", insertable=false, updatable=false)
	private ScheduleType  scheduleType;
	
	// AS 資料庫欄位
//	@Column(name ="punchStatusName",insertable=false, updatable=false)
//	private String punchStatusName;

	public PunchCardSystem() {
	}

	@PrePersist // 在轉換到 PrePersist狀態以前去做的  不能寫多個 只能注入一個
	public void onCreate() {
		
		if(punchstatus.equals("in")) {
			punchin = new Date();
			
		}else if (punchstatus.equals("out")) {
			punchout = new Date();
		}
	}
	
//	@PreUpdate // 在轉換到 PrePersist狀態以前去做的  不能寫多個 只能注入一個
//	public void onUpdate() {
//		modifiedAt = new Date();
//		
//		if (hireDate == null) {
//			hireDate = new Date();
//		}
//		if (createdAt == null) {
//			createdAt = new Date();
//		}
//	}
//}
	
	public Integer getPunchCardsystemmid() {
		return punchCardsystemmid;
	}

	public void setPunchCardsystemmid(Integer punchCardsystemmid) {
		this.punchCardsystemmid = punchCardsystemmid;
	}

	public String getPunchstatus() {
		return punchstatus;
	}

	public void setPunchstatus(String punchstatus) {
		this.punchstatus = punchstatus;
	}

	public Date getPunchin() {
		return punchin;
	}

	public void setPunchin(Date punchin) {
		this.punchin = punchin;
	}

	public Date getPunchout() {
		return punchout;
	}

	public void setPunchout(Date punchout) {
		this.punchout = punchout;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	

	public String getWorkid() {
		return workid;
	}

	public void setWorkid(String workid) {
		this.workid = workid;
	}

	public Integer getEmployeeid() {
		return employeeid;
	}

	public void setEmployeeid(Integer employeeid) {
		this.employeeid = employeeid;
	}

	public ScheduleType getScheduleType() {
		return scheduleType;
	}

	public void setScheduleType(ScheduleType scheduleType) {
		this.scheduleType = scheduleType;
	}

//	public String getpunchStatusName() {
//		return punchStatusName;
//	}
//
//	public void setpunchStatusName(String punchStatusName) {
//		this.punchStatusName = punchStatusName;
//	}

	@Override
	public String toString() {
		return "PunchCardSystem [punchCardsystemmid=" + punchCardsystemmid + ", punchstatus=" + punchstatus
				+ ", punchin=" + punchin + ", punchout=" + punchout + ", workid=" + workid + ", employeeid="
				+ employeeid + ", employee=" + employee + ", scheduleType=" + scheduleType ;
	}

	
	
}
