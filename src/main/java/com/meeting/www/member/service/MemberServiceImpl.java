package com.meeting.www.member.service;

import java.util.List;

import com.meeting.www.member.dao.MemberDao;
import com.meeting.www.member.vo.MemberVO;
import com.meeting.www.preference.dao.PreferDao;
import com.meeting.www.util.SHA256Util;

public class MemberServiceImpl implements MemberService {
	
	private MemberDao memberDao;
	private PreferDao preferDao;
	
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	
	public void setPreferDao(PreferDao preferDao) {
		this.preferDao = preferDao;
	}

	@Override
	public boolean createMember(MemberVO memberVO) {
		
		String salt = SHA256Util.generateSalt();
		memberVO.setSalt(salt);
		
		String password = memberVO.getPassword();
		password = SHA256Util.getEncrypt(password, salt);
		memberVO.setPassword(password);
		
		return	memberDao.insertMember(memberVO) > 0 &&
				memberDao.insertStyle(memberVO.getStyleVO()) >0 &&
				//preferDao.insertPreferAddr(memberVO.getPreferAddrVO()) > 0 &&
				preferDao.insertPreferCollege(memberVO.getPreferCollegeVO()) > 0 && 
				preferDao.insertPreferStyle(memberVO.getPreferStyleVO()) > 0 ;
		
		
	}

	@Override
	public MemberVO readMember(MemberVO memberVO) {
		
		String salt = memberDao.selectSalt(memberVO.getUserId());
		if( salt == null ) {
			salt = "";
		}
		
		String password = memberVO.getPassword();
		password = SHA256Util.getEncrypt(password, salt);
		memberVO.setPassword(password);
		
		return memberDao.selectOne(memberVO);
	}

	@Override
	public boolean readCountUserId(String userId) {
		return memberDao.selectCountUserId(userId) > 0;
	}

	@Override
	public boolean readCountNickname(String nickname) {
		return memberDao.slelectCountNickname(nickname) > 0;
	}

	@Override
	public List<MemberVO> readRecommendId(String startWith, String gender) {
		return memberDao.selectRecommendId(startWith, gender);
	}

	@Override
	public List<MemberVO> readMemberByGender(String gender) {
		return memberDao.selectMemberByGender(gender);
	}

	@Override
	public MemberVO readPartner(int partnerMemberId) {
		return memberDao.selectPartner(partnerMemberId);
	}

	@Override
	public MemberVO readMemberSimple(String userId) {
		return memberDao.selectMemberSimple(userId);
	}

	@Override
	public int readCountByGender(String gender) {
		return memberDao.selectCountByGender(gender);
	}

}
