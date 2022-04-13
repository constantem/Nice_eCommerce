package tw.nicesport.dto;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonProperty;

public class EmployeeDto implements Serializable {

	private static final long serialVersionUID = 1L;

	public EmployeeDto() {
	}
	
	@JsonProperty("employee")
	private String emp;

	public String getEmp() {
		return emp;
	}

	public void setEmp(String emp) {
		this.emp = emp;
	}
	
}
