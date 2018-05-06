package com.meeting.www.member.vo;

import javax.validation.constraints.NotEmpty;

import com.meeting.www.preference.vo.PreferAddrVO;
import com.meeting.www.preference.vo.PreferCollegeVO;
import com.meeting.www.preference.vo.PreferStyleVO;

public class RegistProcess3VO {

	@NotEmpty
	private String preferLivingAlone;
	private int preferAgeStart;
	private int preferAgeEnd;
	private PreferStyleVO preferStyleVO;
	private PreferCollegeVO preferCollegeVO;
	private PreferAddrVO preferAddrVO;

	public String getPreferLivingAlone() {
		return preferLivingAlone;
	}

	public void setPreferLivingAlone(String preferLivingAlone) {
		this.preferLivingAlone = preferLivingAlone;
	}

	public int getPreferAgeStart() {
		return preferAgeStart;
	}

	public void setPreferAgeStart(int preferAgeStart) {
		this.preferAgeStart = preferAgeStart;
	}

	public int getPreferAgeEnd() {
		return preferAgeEnd;
	}

	public void setPreferAgeEnd(int preferAgeEnd) {
		this.preferAgeEnd = preferAgeEnd;
	}

	public PreferStyleVO getPreferStyleVO() {
		return preferStyleVO;
	}

	public void setPreferStyleVO(PreferStyleVO preferStyleVO) {
		this.preferStyleVO = preferStyleVO;
	}

	public PreferCollegeVO getPreferCollegeVO() {
		return preferCollegeVO;
	}

	public void setPreferCollegeVO(PreferCollegeVO preferCollegeVO) {
		this.preferCollegeVO = preferCollegeVO;
	}

	public PreferAddrVO getPreferAddrVO() {
		return preferAddrVO;
	}

	public void setPreferAddrVO(PreferAddrVO preferAddrVO) {
		this.preferAddrVO = preferAddrVO;
	}

}
