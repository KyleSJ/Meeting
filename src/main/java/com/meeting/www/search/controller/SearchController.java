package com.meeting.www.search.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.meeting.www.matching.service.MatchingService;
import com.meeting.www.matching.vo.MatchingTeamVO;
import com.meeting.www.member.service.MemberService;
import com.meeting.www.member.vo.MemberVO;

@Controller
public class SearchController {
	
	private MemberService memberService;
	private MatchingService matchingService;
	
	public void setMatchingService(MatchingService matchingService) {
		this.matchingService = matchingService;
	}
	
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@RequestMapping("/search/male")
	public ModelAndView viewSearchMale() {
		ModelAndView view = new ModelAndView();
		view.setViewName("member/searchMale");
		
		List<MemberVO> member = memberService.readMemberByGender("M");		
		view.addObject("member", member);
		
		int maleCount = memberService.readCountByGender("M");
		view.addObject("maleCount", maleCount);
		int femaleCount = memberService.readCountByGender("F");
		view.addObject("femaleCount", femaleCount);
		int maleTeamCount = matchingService.readCountByGender("M");
		view.addObject("maleTeamCount", maleTeamCount);
		int femaleTeamCount = matchingService.readCountByGender("F");
		view.addObject("femaleTeamCount", femaleTeamCount);
		
		return view;
	}
	
	@RequestMapping("/search/female")
	public ModelAndView viewSearchFemale() {
		ModelAndView view = new ModelAndView();
		view.setViewName("member/searchFemale");
		
		List<MemberVO> member = memberService.readMemberByGender("F");
		view.addObject("member", member);
		
		int femaleCount = memberService.readCountByGender("F");
		view.addObject("femaleCount", femaleCount);
		int maleCount = memberService.readCountByGender("M");
		view.addObject("maleCount", maleCount);
		int maleTeamCount = matchingService.readCountByGender("M");
		view.addObject("maleTeamCount", maleTeamCount);
		int femaleTeamCount = matchingService.readCountByGender("F");
		view.addObject("femaleTeamCount", femaleTeamCount);
		
		return view;
	}
	
	@RequestMapping("/search/femaleTeam")
	public ModelAndView viewSearchFemaleTeam() {
		ModelAndView view = new ModelAndView();
		view.setViewName("member/searchFemaleTeam");
		
		List<MatchingTeamVO> matchingTeam = matchingService.readMatchingTeamByGender("F");
		view.addObject("matchingTeam", matchingTeam);
		
		int femaleCount = memberService.readCountByGender("F");
		view.addObject("femaleCount", femaleCount);
		int maleCount = memberService.readCountByGender("M");
		view.addObject("maleCount", maleCount);
		int maleTeamCount = matchingService.readCountByGender("M");
		view.addObject("maleTeamCount", maleTeamCount);
		int femaleTeamCount = matchingService.readCountByGender("F");
		view.addObject("femaleTeamCount", femaleTeamCount);
		
		return view;
	}
	
	@RequestMapping("/search/maleTeam")
	public ModelAndView viewSearchMaleTeam() {
		ModelAndView view = new ModelAndView();
		view.setViewName("member/searchMaleTeam");
		
		List<MatchingTeamVO> matchingTeam = matchingService.readMatchingTeamByGender("M");
		view.addObject("matchingTeam", matchingTeam);
		
		int femaleCount = memberService.readCountByGender("F");
		view.addObject("femaleCount", femaleCount);
		int maleCount = memberService.readCountByGender("M");
		view.addObject("maleCount", maleCount);
		int maleTeamCount = matchingService.readCountByGender("M");
		view.addObject("maleTeamCount", maleTeamCount);
		int femaleTeamCount = matchingService.readCountByGender("F");
		view.addObject("femaleTeamCount", femaleTeamCount);
		
		return view;
	}

}
