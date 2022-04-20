package tw.nicesport.dto;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonProperty;

public class MemberDto implements Serializable{
	
	private static final long serialVersionUID = 1L;

	public MemberDto() {
	}
	
	@JsonProperty("member")
	private String mem;

	public String getMem() {
		return mem;
	}

	public void setMem(String mem) {
		this.mem = mem;
	}
	

}
