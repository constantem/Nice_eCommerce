package tw.nicesport.dto;

public class UsernameAndPasswordWrapper {

	private String username;
	
	private String password;
	
	private String remember;

	public UsernameAndPasswordWrapper() {
		super();
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRemember() {
		return remember;
	}

	public void setRemember(String remember) {
		this.remember = remember;
	}
	
	
}
