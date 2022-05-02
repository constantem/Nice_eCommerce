package tw.nicesport.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="scheduleType")
public class ScheduleType {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="work_id")
	private Integer workid;
	
	@Column(name="schedule")
	private String schedule;
	
	public ScheduleType() {
	}

	public Integer getWorkid() {
		return workid;
	}

	public void setWorkid(Integer workid) {
		this.workid = workid;
	}

	public String getSchedule() {
		return schedule;
	}

	public void setSchedule(String schedule) {
		this.schedule = schedule;
	}

	@Override
	public String toString() {
		return "ScheduleType [workid=" + workid + ", schedule=" + schedule + "]";
	}
	
}
