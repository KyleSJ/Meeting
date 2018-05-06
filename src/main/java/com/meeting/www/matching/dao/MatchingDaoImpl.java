package com.meeting.www.matching.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.meeting.www.matching.vo.MatchingTeamMemberVO;
import com.meeting.www.matching.vo.MatchingTeamVO;
import com.meeting.www.matching.vo.SoloMatchingVO;
import com.meeting.www.matching.vo.TeamMatchingVO;

public class MatchingDaoImpl extends SqlSessionDaoSupport implements MatchingDao{

	@Override
	public List<MatchingTeamVO> selectMatchingTeamList(int memberId) {
		return getSqlSession().selectList("MatchingDao.selectMatchingTeamList", memberId);
	}

	@Override
	public List<MatchingTeamVO> selectConditionalMatchingTeam(int memberId, String yetYesNo) {
		Map<String, Object> param = new HashMap<>();
		param.put("memberId", memberId);
		param.put("yetYesNo", yetYesNo);
		return getSqlSession().selectList("MatchingDao.selectConditonalMatchingTeam", param);
	}
	
	@Override
	public List<MatchingTeamMemberVO> selectMatchingTeamMemberList(int memberId, int matchingTeamId) {
		Map<String, Object> param = new HashMap<>();
		param.put("memberId", memberId);
		param.put("matchingTeamId", matchingTeamId);
		return getSqlSession().selectList("MatchingDao.selectMatchingTeamMemberList", param);
	}
	
	@Override
	public List<String> selectMatchingTeamMemberAcceptList(String teamName) {
		return getSqlSession().selectList("MatchingDao.selectMatchingTeamMemberAcceptList", teamName);
	}
	
	@Override
	public List<SoloMatchingVO> selectFemaleSoloMatchingList(int memberId) {
		return getSqlSession().selectList("MatchingDao.selectFemaleSoloMatchingList", memberId);
	}
	
	@Override
	public List<SoloMatchingVO> selectMaleSoloMatchingList(int memberId) {
		return getSqlSession().selectList("MatchingDao.selectMaleSoloMatchingList", memberId);
	}
	
	@Override
	public MatchingTeamVO selectMatchingTeam(String teamName) {
		return getSqlSession().selectOne("MatchingDao.selectMatchingTeam", teamName);
	}
	
	@Override
	public int insertMatchingTeam(MatchingTeamVO matchingTeamVO) {
		return getSqlSession().insert("MatchingDao.insertMatchingTeam", matchingTeamVO);
	}
	
	@Override
	public int insertMatchingTeamMember(MatchingTeamMemberVO matchingTeamMemberVO) {
		int result = 0;
		for(int i=0; i<matchingTeamMemberVO.getUserId().size(); i++) {
			String userId = matchingTeamMemberVO.getUserId().get(i);
			result += getSqlSession().insert("MatchingDao.insertMatchingTeamMember", userId); 
		}
		return result;
	}
	
	@Override
	public int updateAcceptInvite(int memberId, String teamName) {
		Map<String, Object> param = new HashMap<>();
		param.put("memberId", memberId);
		param.put("teamName", teamName);
		return getSqlSession().update("MatchingDao.updateAcceptInvite", param);
	}

	@Override
	public int updateRejectInvite(int memberId, String teamName) {
		Map<String, Object> param = new HashMap<>();
		param.put("memberId", memberId);
		param.put("teamName", teamName);
		return getSqlSession().update("MatchingDao.updateRejectInvite", param);
	}

	@Override
	public int updateCancelInvite(int memberId, String teamName) {
		Map<String, Object> param = new HashMap<>();
		param.put("memberId", memberId);
		param.put("teamName", teamName);
		return getSqlSession().update("MatchingDao.updateCancelInvite", param);
	}

	@Override
	public int updateMatchingTeamInviteYes(String teamName) {
		return getSqlSession().update("MatchingDao.updateMatchingTeamInviteYes", teamName);
	}

	@Override
	public int updateMatchingTeamInviteNo(String teamName) {
		return getSqlSession().update("MatchingDao.updateMatchingTeamInviteNo", teamName);
	}

	@Override
	public int selectCountByGender(String gender) {
		return getSqlSession().selectOne("MatchingDao.selectCountByGender", gender);
	}

	@Override
	public List<MatchingTeamVO> selectTeamByGender(String gender) {
		return getSqlSession().selectList("MatchingDao.selectTeamByGender", gender);
	}

	@Override
	public List<TeamMatchingVO> selectTeamMatchingVO(int memberId) {
		return getSqlSession().selectList("MatchingDao.selectTeamMatchingVO", memberId);
	}
}
