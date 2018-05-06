package com.meeting.www.matching.vo;

import java.util.List;

import com.meeting.www.member.vo.MemberVO;

public class MatchingTeamMemberVO {

	private int matchingTeamId;
	private int memberId;
	private List<String> userId;
	private String inviteAccept;
	private String deleteTeamAccept;
	private MemberVO memberVO;

	public int getMatchingTeamId() {
		return matchingTeamId;
	}

	public void setMatchingTeamId(int matchingTeamId) {
		this.matchingTeamId = matchingTeamId;
	}

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public List<String> getUserId() {
		return userId;
	}

	public void setUserId(List<String> userId) {
		this.userId = userId;
	}

	public String getInviteAccept() {
		return inviteAccept;
	}

	public void setInviteAccept(String inviteAccept) {
		this.inviteAccept = inviteAccept;
	}

	public String getDeleteTeamAccept() {
		return deleteTeamAccept;
	}

	public void setDeleteTeamAccept(String deleteTeamAccept) {
		this.deleteTeamAccept = deleteTeamAccept;
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

}
