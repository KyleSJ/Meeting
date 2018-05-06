package com.meeting.www.matching.vo;

public class MatchingTeamVO {

	private int matchingTeamId;
	private String matchingTeamName;
	private int teamNOP;
	private String invite;
	private String teamGender;
	private MatchingTeamMemberVO matchingTeamMemberVO;
	private int matchingTeamMaster;

	public int getMatchingTeamId() {
		return matchingTeamId;
	}

	public void setMatchingTeamId(int matchingTeamId) {
		this.matchingTeamId = matchingTeamId;
	}

	public String getMatchingTeamName() {
		return matchingTeamName;
	}

	public void setMatchingTeamName(String matchingTeamName) {
		this.matchingTeamName = matchingTeamName;
	}

	public int getTeamNOP() {
		return teamNOP;
	}

	public void setTeamNOP(int teamNOP) {
		this.teamNOP = teamNOP;
	}

	public String getInvite() {
		return invite;
	}

	public void setInvite(String invite) {
		this.invite = invite;
	}

	public String getTeamGender() {
		return teamGender;
	}

	public void setTeamGender(String teamGender) {
		this.teamGender = teamGender;
	}

	public MatchingTeamMemberVO getMatchingTeamMemberVO() {
		return matchingTeamMemberVO;
	}

	public void setMatchingTeamMemberVO(MatchingTeamMemberVO matchingTeamMemberVO) {
		this.matchingTeamMemberVO = matchingTeamMemberVO;
	}

	public int getMatchingTeamMaster() {
		return matchingTeamMaster;
	}

	public void setMatchingTeamMaster(int matchingTeamMaster) {
		this.matchingTeamMaster = matchingTeamMaster;
	}

}
