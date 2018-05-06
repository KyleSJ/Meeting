package com.meeting.www.member.vo;

import java.util.List;

public class StyleVO {
		
	private int memberId;
	private List<Integer> styleId;

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public List<Integer> getStyleId() {
		return styleId;
	}

	public void setStyleId(List<Integer> styleId) {
		this.styleId = styleId;
	}

}
