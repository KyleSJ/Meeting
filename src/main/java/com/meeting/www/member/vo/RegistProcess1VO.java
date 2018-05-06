package com.meeting.www.member.vo;

import javax.validation.constraints.NotEmpty;

public class RegistProcess1VO {

	@NotEmpty
	private String userId;
	@NotEmpty
	private String password;
	@NotEmpty
	private String nickname;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

}
