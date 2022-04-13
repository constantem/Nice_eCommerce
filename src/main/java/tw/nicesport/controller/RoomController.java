package tw.nicesport.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;

import tw.nicesport.model.Room;
import tw.nicesport.service.RoomService;

@Controller
@RequestMapping("/room")
public class RoomController {

	@Autowired
	private RoomService roomService;
	
	@RequestMapping("/query/all")
	@ResponseBody
	public List<Room> queryAllRoom() throws JsonProcessingException {
		List<Room> rooms = roomService.queryAll();
		return rooms;
	} 
}
