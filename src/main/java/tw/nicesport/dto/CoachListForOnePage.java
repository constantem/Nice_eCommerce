package tw.nicesport.dto;

import java.util.List;

import tw.nicesport.model.Coach;

public class CoachListForOnePage {
	private List<Coach> coachs;
	private int totalPages;
	
	public CoachListForOnePage() {
		super();
	}

	public List<Coach> getCoachs() {
		return coachs;
	}
	public void setCoachs(List<Coach> coachs) {
		this.coachs = coachs;
	}
	public int getTotalPages() {
		return totalPages;
	}
	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}
}
