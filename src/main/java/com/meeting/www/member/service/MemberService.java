package com.meeting.www.member.service;

import java.util.List;

import com.meeting.www.member.vo.MemberVO;

public interface MemberService {
	
	public boolean createMember(MemberVO memberVO);
	
	public MemberVO readMember(MemberVO memberVO);
	
	public MemberVO readPartner(int partnerMemberId);
	
	public MemberVO readMemberSimple(String userId);
	
	public int readCountByGender(String gender);
	
	public boolean readCountUserId(String userId);
	
	public boolean readCountNickname(String nickname);
	
	public List<MemberVO> readRecommendId(String startWith, String gender);
	
	public List<MemberVO> readMemberByGender(String gender);

}
