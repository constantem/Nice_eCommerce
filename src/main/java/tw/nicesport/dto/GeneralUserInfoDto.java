package tw.nicesport.dto;

public class GeneralUserInfoDto {
	private String fullName;
	private String imgFileName;
	
	public GeneralUserInfoDto() {
		super();
	}
	
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getImgFileName() {
		return imgFileName;
	}
	public void setImgFileName(String imgFileName) {
		this.imgFileName = imgFileName;
	}
}
