package com.meeting.www.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.meeting.www.member.vo.MemberVO;
import com.meeting.www.member.vo.StyleVO;

public class MemberDaoImpl extends SqlSessionDaoSupport implements MemberDao {

	@Override
	public int insertMember(MemberVO memberVO) {
		return getSqlSession().insert("MemberDao.insertMember", memberVO);
	}

	@Override
	public MemberVO selectOne(MemberVO memberVO) {
		return getSqlSession().selectOne("MemberDao.selectOne", memberVO);
	}

	@Override
	public int insertStyle(StyleVO styleVO) {
		int result = 0;
		for (int i = 0; i < styleVO.getStyleId().size(); i++) {
			result += getSqlSession().insert("MemberDao.insertStyle", styleVO.getStyleId().get(i));
		}
		return result;
	}

	@Override
	public int selectCountUserId(String userId) {
		return getSqlSession().selectOne("MemberDao.selectCountUserId", userId);
	}

	@Override
	public int slelectCountNickname(String nickname) {
		return getSqlSession().selectOne("MemberDao.slelectCountNickname", nickname);
	}

	@Override
	public String selectSalt(String userId) {
		return getSqlSession().selectOne("MemberDao.selectSalt", userId);
	}

	@Override
	public List<MemberVO> selectRecommendId(String startWith, String gender) {
		Map<String, String> param= new HashMap<>();
		param.put("startWith", startWith);
		param.put("gender", gender);
		
		return getSqlSession().selectList("MemberDao.selectRecommendId", param);
	}

	@Override
	public List<MemberVO> selectMemberByGender(String gender) {
		return getSqlSession().selectList("MemberDao.selectMemberByGender", gender);
	}

	@Override
	public MemberVO selectPartner(int partnerMemberId) {
		return getSqlSession().selectOne("MemberDao.selectPartner", partnerMemberId);
	}

	@Override
	public MemberVO selectMemberSimple(String userId) {
		return getSqlSession().selectOne("MemberDao.selectMemberSimple", userId);
	}

	@Override
	public int selectCountByGender(String gender) {
		return getSqlSession().selectOne("MemberDao.selectCountByGender", gender);
	}

}
