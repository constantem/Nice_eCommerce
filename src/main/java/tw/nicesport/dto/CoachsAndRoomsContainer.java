package tw.nicesport.dto;

import java.util.List;

import tw.nicesport.model.Coach;
import tw.nicesport.model.Room;

public class CoachsAndRoomsContainer {
	
	private List<Coach> coachs;
	
	private List<Room> rooms;
	
	public List<Coach> getCoachs() {
		return coachs;
	}
	public void setCoachs(List<Coach> coachs) {
		this.coachs = coachs;
	}
	public List<Room> getRooms() {
		return rooms;
	}
	public void setRooms(List<Room> rooms) {
		this.rooms = rooms;
	}

	// toString
	@Override
	public String toString() {
		return "CoachsAndRoomsContainer [coachs=" + coachs + ", rooms=" + rooms + "]";
	}
}
