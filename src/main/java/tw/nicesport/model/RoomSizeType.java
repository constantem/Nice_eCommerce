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
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity @Table(name="RoomSizeType")
public class RoomSizeType {

	///////////
	// field //
	///////////
	
	// 主鍵
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="roomSizeType_id")
	private Integer roomSizeType_id;
	
	// 其他欄位
	
	@Column(name="name")
	private String name;
	
	@Column(name="roomCapacity")
	private Integer roomCapacity;
	
	@Column(name="createdAt") @Transient
	private String createdAt;
	
	@Column(name="modifiedAt")
	private String modifiedAt;
	
	// associated entity
	
	@OneToMany(
		mappedBy="roomSizeType",
		cascade= {
			CascadeType.PERSIST,
			CascadeType.DETACH,
			CascadeType.MERGE,
			CascadeType.REFRESH
		}
	)
	@JsonIgnore // OneToMany 必加, 或加 EAGER, 不然 courses 為 null, 轉 Json 出錯
	private Set<Room> rooms = new HashSet<>();
	
	///////////
	// 建構子 //
	///////////

	public RoomSizeType() {
	}

	///////////////////
	// getter,setter //
	///////////////////
	
	public Integer getRoomSizeType_id() {
		return roomSizeType_id;
	}

	public void setRoomSizeType_id(Integer roomSizeType_id) {
		this.roomSizeType_id = roomSizeType_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getRoomCapacity() {
		return roomCapacity;
	}

	public void setRoomCapacity(Integer roomCapacity) {
		this.roomCapacity = roomCapacity;
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
	
	public Set<Room> getRooms() {
		return rooms;
	}

	public void setRooms(Set<Room> rooms) {
		this.rooms = rooms;
	}

}
