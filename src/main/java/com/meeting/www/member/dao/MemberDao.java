package com.meeting.www.member.dao;

import java.util.List;

import com.meeting.www.member.vo.MemberVO;
import com.meeting.www.member.vo.StyleVO;

public interface MemberDao {
	
	public int insertMember(MemberVO memberVO);
	
	public int insertStyle(StyleVO styleVO);
	
	public MemberVO selectOne(MemberVO memberVO);
	
	public MemberVO selectPartner(int partnerMemberId);
	
	public MemberVO selectMemberSimple(String userId);
	
	public String selectSalt(String userId);
	
	public int selectCountUserId(String userId);
	
	public int slelectCountNickname(String nickname);
	
	public int selectCountByGender(String gender);
	
	public List<MemberVO> selectRecommendId(String startWith, String gender);
	
	public List<MemberVO> selectMemberByGender(String gender);

}
