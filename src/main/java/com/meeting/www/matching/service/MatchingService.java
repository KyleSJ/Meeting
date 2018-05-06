package com.meeting.www.matching.service;

import java.util.List;

import com.meeting.www.matching.vo.MatchingTeamMemberVO;
import com.meeting.www.matching.vo.MatchingTeamVO;
import com.meeting.www.matching.vo.SoloMatchingVO;
import com.meeting.www.matching.vo.TeamMatchingVO;

public interface MatchingService {
	
	public List<MatchingTeamVO> readMatchingTeamList(int memberId);
	
	public List<MatchingTeamVO> readConditionalMatchingTeamList(int memberId, String yetYesNo);
	
	public List<MatchingTeamMemberVO> readMatchingTeamMemberList(int memberId, int matchingTeamId);
	
	public List<SoloMatchingVO> readSoloFemaleMatchingList(int memberId);
	
	public List<SoloMatchingVO> readSoloMaleMatchingList(int memberId);
	
	public List<MatchingTeamVO> readMatchingTeamByGender(String gender);
	
	public List<TeamMatchingVO> readTeamMatchingVO(int memberId);
	
	public MatchingTeamVO readMatchingTeam(String teamName);
	
	public boolean createMatchingTeam(MatchingTeamVO matchingTeamVO);
	
	public int readCountByGender(String gender);

	public boolean updateAcceptInvite(int memberId, String teamName);
	
	public boolean updateRejectInvite(int memberId, String teamName);
	
	public boolean updateCancelInvite(int memberId, String teamName);
	
	public boolean updateMatchingTeamInvite(String teamName);
	

}
