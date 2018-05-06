package com.meeting.www.preference.vo;

import java.util.List;

public class PreferAddrVO {

	private int memberId;
	private List<Integer> addrId;

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public List<Integer> getAddrId() {
		return addrId;
	}

	public void setAddrId(List<Integer> addrId) {
		this.addrId = addrId;
	}

}
