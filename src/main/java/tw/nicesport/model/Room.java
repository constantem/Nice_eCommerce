package tw.nicesport.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity @Table(name="Room")
public class Room {
	
	///////////
	// field //
	///////////
	
	// 主鍵
	
	@Id // 沒自動生成
	@Column(name="roomNo")
	private String roomNo;
	
	// 其他欄位
	
	@Column(name="roomName")
	private String roomName;
		
	@Column(name="createdAt") @Transient
	private String createdAt;
	
	@Column(name="modifiedAt")
	private String modifiedAt;

	// DB table FK
	
	@Transient // FK 不做對應
	@Column(name="roomSizeType_id") 
	private Integer roomSizeType_id;
	
	// associated entity
	
	@ManyToOne(
		cascade= {
				CascadeType.PERSIST,
				CascadeType.DETACH,
				CascadeType.MERGE,
				CascadeType.REFRESH
			}
	)
	@JoinColumn(name="roomSizeType_id") // 以此 FK 關聯對面 PK
	private RoomSizeType roomSizeType;
	
	@OneToMany(
		mappedBy="room",
		cascade= {
				CascadeType.PERSIST,
				CascadeType.DETACH,
				CascadeType.MERGE,
				CascadeType.REFRESH
			}
	)
	@JsonIgnore // OneToMany 必加, 或加 EAGER, 不然 courses 為 null, 轉 Json 出錯
	private Set<Course> courses = new HashSet<>();

	///////////
	// 建構子 //
	///////////
	
	public Room() {
	}

	///////////////////
	// getter,setter //
	///////////////////
	
	public String getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(String roomNo) {
		this.roomNo = roomNo;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public Integer getRoomSizeType_id() {
		return roomSizeType_id;
	}

	public void setRoomSizeType_id(Integer roomSizeType_id) {
		this.roomSizeType_id = roomSizeType_id;
	}

	public String getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}

	public String getModifiedAt() {
		return modifiedAt;
	}

	public void setModifiedAt(String modifiedAt) {
		this.modifiedAt = modifiedAt;
	}

	// associated entity 的 getter, setter
	
	public RoomSizeType getRoomSizeType() {
		return roomSizeType;
	}

	public void setRoomSizeType(RoomSizeType roomSizeType) {
		this.roomSizeType = roomSizeType;
	}
	
	public Set<Course> getCourses() {
		return courses;
	}

	public void setCourses(Set<Course> courses) {
		this.courses = courses;
	}
	
	
}
