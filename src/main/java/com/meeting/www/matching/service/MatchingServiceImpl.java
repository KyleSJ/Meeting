package com.meeting.www.matching.service;

import java.util.List;

import com.meeting.www.matching.dao.MatchingDao;
import com.meeting.www.matching.vo.MatchingTeamMemberVO;
import com.meeting.www.matching.vo.MatchingTeamVO;
import com.meeting.www.matching.vo.SoloMatchingVO;
import com.meeting.www.matching.vo.TeamMatchingVO;

public class MatchingServiceImpl implements MatchingService{
	
	private MatchingDao matchingDao;
	
	public void setMatchingDao(MatchingDao matchingDao) {
		this.matchingDao = matchingDao;
	}

	@Override
	public List<MatchingTeamVO> readMatchingTeamList(int memberId) {
		return matchingDao.selectMatchingTeamList(memberId);
	}
	
	@Override
	public List<MatchingTeamVO> readConditionalMatchingTeamList(int memberId, String yetYesNo) {
		return matchingDao.selectConditionalMatchingTeam(memberId, yetYesNo);
	}
	
	@Override
	public List<MatchingTeamMemberVO> readMatchingTeamMemberList(int memberId, int matchingTeamId) {
		return matchingDao.selectMatchingTeamMemberList(memberId, matchingTeamId);
	}

	@Override
	public List<SoloMatchingVO> readSoloFemaleMatchingList(int memberId) {
		return matchingDao.selectFemaleSoloMatchingList(memberId);
	}
	
	@Override
	public List<SoloMatchingVO> readSoloMaleMatchingList(int memberId) {
		return matchingDao.selectMaleSoloMatchingList(memberId);
	}
	
	@Override
	public MatchingTeamVO readMatchingTeam(String teamName) {
		return matchingDao.selectMatchingTeam(teamName);
	}
	
	@Override
	public boolean createMatchingTeam(MatchingTeamVO matchingTeamVO) {
		return matchingDao.insertMatchingTeam(matchingTeamVO) > 0
				&& matchingDao.insertMatchingTeamMember(matchingTeamVO.getMatchingTeamMemberVO()) > 0;
	}

	@Override
	public boolean updateAcceptInvite(int memberId, String teamName) {
		return matchingDao.updateAcceptInvite(memberId, teamName) > 0;
	}

	@Override
	public boolean updateRejectInvite(int memberId, String teamName) {
		return matchingDao.updateRejectInvite(memberId, teamName) > 0;
	}

	@Override
	public boolean updateCancelInvite(int memberId, String teamName) {
		return matchingDao.updateCancelInvite(memberId, teamName) > 0;
	}

	@Override
	public boolean updateMatchingTeamInvite(String teamName) {
		List<String> inviteAccept = matchingDao.selectMatchingTeamMemberAcceptList(teamName);
		for( int i=0; i<inviteAccept.size(); i++ ) {
			if( !inviteAccept.get(i).equals("yes") ) {
				return matchingDao.updateMatchingTeamInviteNo(teamName) > 0;
			}
		}
		return matchingDao.updateMatchingTeamInviteYes(teamName) > 0;
	}

	@Override
	public int readCountByGender(String gender) {
		return matchingDao.selectCountByGender(gender);
	}

	@Override
	public List<MatchingTeamVO> readMatchingTeamByGender(String gender) {
		return matchingDao.selectTeamByGender(gender);
	}

	@Override
	public List<TeamMatchingVO> readTeamMatchingVO(int memberId) {
		return matchingDao.selectTeamMatchingVO(memberId);
	}

}
