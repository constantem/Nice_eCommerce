package tw.nicesport.model;

import java.util.HashSet;
import java.util.Set;

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

@Entity @Table
public class Room {
	
	@Id // 沒自動生成
	@Column
	private String roomNo;
	
	@Column
	private String roomName;
	
	@Column @Transient // FK 不做對應
	private Integer roomSizeType_id;
	
	@Column @Transient
	private String createdAt;
	
	@Column
	private String modifiedAt;

	// 以上為欄位, 以下為其他 entity
	@ManyToOne @JoinColumn(name="roomSizeType_id") // 以此 FK 關聯對面 PK
	private RoomSizeType roomSizeType;
	
	@OneToMany(mappedBy="room")
	@JsonIgnore // OneToMany 必加, 或加 EAGER, 不然 courses 為 null, 轉 Json 出錯
	private Set<Course> courses = new HashSet<>();

	// 建構子
	
	public Room() {
	}

	// getter, setter
	
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

	// 對側 entity 的 getter, setter
	
	public RoomSizeType getRoomSizeType() {
		return roomSizeType;
	}

	public void setRoomSizeType(RoomSizeType roomSizeType) {
		this.roomSizeType = roomSizeType;
	}
	
//	public Set<Course> getCourses() {
//		return courses;
//	}
//
//	public void setCourses(Set<Course> courses) {
//		this.courses = courses;
//	}
	
	
}
