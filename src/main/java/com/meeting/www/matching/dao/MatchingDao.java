package com.meeting.www.matching.dao;

import java.util.List;

import com.meeting.www.matching.vo.MatchingTeamMemberVO;
import com.meeting.www.matching.vo.MatchingTeamVO;
import com.meeting.www.matching.vo.SoloMatchingVO;
import com.meeting.www.matching.vo.TeamMatchingVO;

public interface MatchingDao {
	
	public List<MatchingTeamVO> selectMatchingTeamList(int memberId);
	
	public List<MatchingTeamVO> selectConditionalMatchingTeam(int memberId, String yetYesNo);
	
	public List<MatchingTeamMemberVO> selectMatchingTeamMemberList(int memberId, int matchingTeamId);
	
	public List<String> selectMatchingTeamMemberAcceptList(String teamName);
	
	public List<SoloMatchingVO> selectFemaleSoloMatchingList(int memberId);
	
	public List<SoloMatchingVO> selectMaleSoloMatchingList(int memberId);
	
	public List<MatchingTeamVO> selectTeamByGender(String gender);
	
	public List<TeamMatchingVO> selectTeamMatchingVO(int memberId);
	
	public MatchingTeamVO selectMatchingTeam(String teamName);
	
	public int selectCountByGender(String gender);
	
	public int insertMatchingTeam(MatchingTeamVO matchingTeamVO);
	
	public int insertMatchingTeamMember(MatchingTeamMemberVO matchingTeamMemberVO);
	
	public int updateAcceptInvite(int memberId, String teamName);
	
	public int updateRejectInvite(int memberId, String teamName);
	
	public int updateCancelInvite(int memberId, String teamName);
	
	public int updateMatchingTeamInviteYes(String teamName);
	
	public int updateMatchingTeamInviteNo(String teamName);

}
