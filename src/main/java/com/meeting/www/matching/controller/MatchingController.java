package com.meeting.www.matching.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.meeting.www.matching.service.MatchingService;
import com.meeting.www.matching.vo.MatchingTeamMemberVO;
import com.meeting.www.matching.vo.MatchingTeamVO;
import com.meeting.www.matching.vo.SoloMatchingVO;
import com.meeting.www.matching.vo.TeamMatchingVO;
import com.meeting.www.member.constants.Member;
import com.meeting.www.member.service.MemberService;
import com.meeting.www.member.vo.MemberVO;

@Controller
public class MatchingController {
	
	private MatchingService matchingService;
	private MemberService memberService;
	
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	
	public void setMatchingService(MatchingService matchingService) {
		this.matchingService = matchingService;
	}
	
	@RequestMapping("/matching/main")
	public String goLogin() {
		return "redirect:/login";
	}
	
	@RequestMapping("/matching/main/{memberId}")
	public ModelAndView viewMatchingMainPage(@PathVariable int memberId, HttpSession session) {
		
		MemberVO member = (MemberVO) session.getAttribute(Member.USER);
		String gender = member.getGender();
		List<SoloMatchingVO> soloMatching = new ArrayList<>();
		
		if(gender.equals("F")) {
			soloMatching = matchingService.readSoloFemaleMatchingList(memberId);
		}else {
			soloMatching = matchingService.readSoloMaleMatchingList(memberId);
		}
		
		List<MatchingTeamVO> matchingTeam = matchingService.readMatchingTeamList(memberId);
		List<MatchingTeamVO> yetMatchingTeam = matchingService.readConditionalMatchingTeamList(memberId, "yet");
		List<MatchingTeamVO> yesMatchingTeam = matchingService.readConditionalMatchingTeamList(memberId, "yes");
		List<MatchingTeamVO> noMatchingTeam = matchingService.readConditionalMatchingTeamList(memberId, "no");
		//List<TeamMatchingVO> teamMatching = matchingService.readTeamMatchingVO(memberId);
		
		ModelAndView view = new ModelAndView();
		view.setViewName("matching/main");
		view.addObject("soloMatching", soloMatching);
		view.addObject("matchingTeam", matchingTeam);
		view.addObject("yetMatchingTeam", yetMatchingTeam);
		view.addObject("yesMatchingTeam", yesMatchingTeam);
		view.addObject("noMatchingTeam", noMatchingTeam);
		//view.addObject("teamMatching", teamMatching);
		
		return view;
	}
	
	@RequestMapping(value="/matching/registTeam" , method=RequestMethod.GET)
	public String viewRegistTeam() {
		
		
		return "matching/regist";
	}
	
	@RequestMapping(value="/matching/registTeam" , method=RequestMethod.POST)
	public String doRegistTeam(@ModelAttribute("teamRegistForm") MatchingTeamVO matchingTeamVO, HttpSession session) {
		MemberVO member = (MemberVO)session.getAttribute(Member.USER);
		matchingTeamVO.setTeamGender(member.getGender());
		matchingTeamVO.setMatchingTeamMaster(member.getMemberId());
		List<String> userIdList = matchingTeamVO.getMatchingTeamMemberVO().getUserId();
		for(int i=0; i< userIdList.size(); i++) {
			String segment = userIdList.get(i).replaceAll(" ", "").split("[(]")[1];
			String userId = segment.split("[)]")[0];
			userIdList.set(i, userId);
		}
		
		
		if(matchingService.createMatchingTeam(matchingTeamVO)) {
			return "redirect:/matching/main/"+member.getMemberId();
		}
		
		return "redirect:/matching/registTeam";
	}
	
	@RequestMapping("/matching/accept/{teamName}")
	public String doAcceptInvite(@PathVariable String teamName, HttpSession session) {
		MemberVO member = (MemberVO)session.getAttribute(Member.USER);
		int memberId = member.getMemberId();
		
		if(matchingService.updateAcceptInvite(memberId, teamName)) {
			matchingService.updateMatchingTeamInvite(teamName);
			return "redirect:/matching/main/"+memberId;
		}
		
		return "";
	}
	
	@RequestMapping("/matching/reject/{teamName}")
	public String doRejectInvite(@PathVariable String teamName, HttpSession session) {
		MemberVO member = (MemberVO)session.getAttribute(Member.USER);
		int memberId = member.getMemberId();
		
		if(matchingService.updateRejectInvite(memberId, teamName)) {
			matchingService.updateMatchingTeamInvite(teamName);
			return "redirect:/matching/main/"+memberId;
		}
		
		return "";
	}
	
	@RequestMapping("/matching/cancel/{teamName}")
	public String doCancelInvite(@PathVariable String teamName, HttpSession session) {
		MemberVO member = (MemberVO)session.getAttribute(Member.USER);
		int memberId = member.getMemberId();
		
		if(matchingService.updateCancelInvite(memberId, teamName)) {
			matchingService.updateMatchingTeamInvite(teamName);
			return "redirect:/matching/main/"+memberId;
		}
		
		return "";
	}
	
	@RequestMapping("/matching/detail/team/{teamName}")
	public ModelAndView viewDetailTeam(@PathVariable String teamName, HttpSession session) {
		
		MemberVO member = (MemberVO)session.getAttribute(Member.USER);
		MatchingTeamVO matchingTeam = matchingService.readMatchingTeam(teamName);
		int matchingTeamId = matchingTeam.getMatchingTeamId();
		List<MatchingTeamMemberVO> matchingTeamMember = matchingService.readMatchingTeamMemberList(member.getMemberId(), matchingTeamId);
		
		ModelAndView view = new ModelAndView();
		view.setViewName("matching/detail/team");
		view.addObject("matchingTeam", matchingTeam);
		view.addObject("matchingTeamMember", matchingTeamMember);
		return view;
	}
	
	@RequestMapping("/matching/detail/partner/{partnerMemberId}")
	public ModelAndView viewDetailPartner(@PathVariable int partnerMemberId, HttpSession session) {
		
		MemberVO partner = memberService.readPartner(partnerMemberId);
		
		ModelAndView view = new ModelAndView();
		view.setViewName("matching/detail/partner");
		view.addObject("partner", partner);
		return view;
	}
	
	@RequestMapping("/api/recommendId")
	@ResponseBody
	public List<MemberVO> searchRecommendId(HttpServletRequest request) {
		List<MemberVO> response = new ArrayList<>();
		String startWith = request.getParameter("startWith");
		String gender = request.getParameter("gender");
		response = memberService.readRecommendId(startWith, gender);
		
		
		return response;
	}

}
