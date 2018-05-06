package com.meeting.www.matching.vo;

public class TeamMatchingVO {

	private int teamMatchingId;
	private MatchingTeamVO fMatchingTeamVO;
	private MatchingTeamVO mMatchingTeamVO;
	private int matchingNOP;

	public int getTeamMatchingId() {
		return teamMatchingId;
	}

	public void setTeamMatchingId(int teamMatchingId) {
		this.teamMatchingId = teamMatchingId;
	}

	public MatchingTeamVO getfMatchingTeamVO() {
		return fMatchingTeamVO;
	}

	public void setfMatchingTeamVO(MatchingTeamVO fMatchingTeamVO) {
		this.fMatchingTeamVO = fMatchingTeamVO;
	}

	public MatchingTeamVO getmMatchingTeamVO() {
		return mMatchingTeamVO;
	}

	public void setmMatchingTeamVO(MatchingTeamVO mMatchingTeamVO) {
		this.mMatchingTeamVO = mMatchingTeamVO;
	}

	public int getMatchingNOP() {
		return matchingNOP;
	}

	public void setMatchingNOP(int matchingNOP) {
		this.matchingNOP = matchingNOP;
	}

}
