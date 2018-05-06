package com.meeting.www.member.controller;


import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.meeting.www.member.constants.Member;
import com.meeting.www.member.service.MemberService;
import com.meeting.www.member.vo.MemberVO;
import com.meeting.www.member.vo.RegistProcess1VO;
import com.meeting.www.member.vo.RegistProcess2VO;
import com.meeting.www.member.vo.RegistProcess3VO;
import com.meeting.www.school.service.SchoolService;
import com.meeting.www.school.vo.CollegeVO;
import com.meeting.www.school.vo.MajorVO;
import com.meeting.www.school.vo.SchoolVO;

@Controller
public class MemberController {
	
	private MemberService memberService;
	private SchoolService schoolService;
	
	public void setSchoolService(SchoolService schoolService) {
		this.schoolService = schoolService;
	}
	
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public ModelAndView viewMember() {
		ModelAndView view = new ModelAndView();
		view.setViewName("main");
		
		return view;
	}
	
	@RequestMapping(value="/member/regist/process1", method = RequestMethod.GET)
	public ModelAndView viewRegistProcess1() {

		ModelAndView view = new ModelAndView();
		
		view.setViewName("member/regist/regist1");
		return view;
	}
	
	@RequestMapping(value="/member/regist/process1", method = RequestMethod.POST)
	public String doRegistProcess1(@ModelAttribute("registForm") @Valid RegistProcess1VO registProcess1VO, Errors errors, HttpSession session) {
		
		if(errors.hasErrors()) {
			return "redirect:/member/regist/process1";
		}
		
		session.setAttribute("registProcess1VO", registProcess1VO);
		
		return "redirect:/member/regist/process2";
	}
	
	@RequestMapping(value="/member/regist/process2", method = RequestMethod.GET)
	public ModelAndView viewRegistProcess2(HttpSession session) {
		
		if(session.getAttribute("registProcess1VO") == null) {
			return new ModelAndView("redirect:/member/regist/process1");
		}
		
		ModelAndView view = new ModelAndView();
		
		Calendar cal = Calendar.getInstance();
		int thisYear = cal.get(Calendar.YEAR);
		view.addObject("thisYear", thisYear);
		
		
		String thisYearStr = thisYear+"";
		
		thisYearStr = thisYearStr.substring(2);
		
		List<SchoolVO> school = new ArrayList<>();
		school = schoolService.readAllShool();
		
		List<MajorVO> major = new ArrayList<>();
		major = schoolService.readAllMajor();
		
		view.setViewName("member/regist/regist2");
		view.addObject("thisYearStr", thisYearStr);
		view.addObject("schoolList", school);
		view.addObject("majorList", major);
		return view;
	}
	
	@RequestMapping(value="/member/regist/process2", method = RequestMethod.POST)
	public String doRegistProcess2(@ModelAttribute("registForm") @Valid RegistProcess2VO registProcess2VO, Errors errors, HttpSession session) {
		
		if(errors.hasErrors()) {
			System.out.println(errors.toString());
			return "redirect:/member/regist/process2";
		}
		
		if(registProcess2VO.getBirthDay().length() < 2) {
			registProcess2VO.setBirthDay(0+registProcess2VO.getBirthDay());
		}
		if(registProcess2VO.getBirthMonth().length() < 2) {
			registProcess2VO.setBirthMonth(0+registProcess2VO.getBirthMonth());
		}
		
		registProcess2VO.setBirthday(registProcess2VO.getBirthYear()+registProcess2VO.getBirthMonth()+registProcess2VO.getBirthDay());
		session.setAttribute("registProcess2VO", registProcess2VO);
		
		return "redirect:/member/regist/process3";
	}
	
	@RequestMapping(value="/member/regist/process3", method = RequestMethod.GET)
	public ModelAndView viewRegistProcess3(HttpSession session) {
		
		if(session.getAttribute("registProcess2VO") == null) {
			return new ModelAndView("redirect:/member/regist/process1");
		}
		
		RegistProcess2VO registProcess2VO = (RegistProcess2VO) session.getAttribute("registProcess2VO");
		String gender = registProcess2VO.getGender();
		
		ModelAndView view = new ModelAndView();
		
		List<CollegeVO> college = schoolService.readAllCollege();
		
		view.setViewName("member/regist/regist3");
		view.addObject("gender", gender);
		view.addObject("collegeList", college);
		return view;
	}
	
	@RequestMapping(value="/member/regist/process3", method = RequestMethod.POST)
	public String doRegistProcess3(@ModelAttribute("registForm") @Valid RegistProcess3VO registProcess3VO, Errors errors, HttpSession session) {
		
		if(errors.hasErrors()) {
			return "redirect:/member/regist/process3";
		}
		
		session.setAttribute("registProcess3VO", registProcess3VO);
		
		return "redirect:/member/regist";
	}
	
	@RequestMapping("/member/regist")
	public String doRegist(HttpSession session) {
		
		if(session.getAttribute("registProcess1VO") == null) {
			return "redirect:/member/regist/process1";
		} else if( session.getAttribute("registProcess2VO") == null) {
			return "redirect:/member/regist/process2";
		} else if ( session.getAttribute("registProcess3VO") == null){
			return "redirect:/member/regist/process3";
		}
		RegistProcess1VO regist1VO = (RegistProcess1VO) session.getAttribute("registProcess1VO");
		RegistProcess2VO regist2VO = (RegistProcess2VO) session.getAttribute("registProcess2VO");
		RegistProcess3VO regist3VO = (RegistProcess3VO) session.getAttribute("registProcess3VO");
		
		MemberVO member = new MemberVO();
		member.setUserId(regist1VO.getUserId());
		member.setPassword(regist1VO.getPassword());
		member.setNickname(regist1VO.getNickname());
		member.setName(regist2VO.getName());
		member.setGender(regist2VO.getGender());
		member.setBirthday(regist2VO.getBirthday());
		member.setAdmissionYear(regist2VO.getAdmissionYear());
		member.setPhoneNumber(regist2VO.getPhoneNumber());
		member.setSchoolId(regist2VO.getSchoolId());
		member.setMajorId(regist2VO.getMajorId());
		member.setLivingAlone(regist2VO.getLivingAlone());
		member.setMilitaryService(regist2VO.getMilitaryService());
		member.setStyleVO(regist2VO.getStyleVO());
		member.setAboutMe(regist2VO.getAboutMe());
		member.setPreferLivingAlone(regist3VO.getPreferLivingAlone());
		member.setPreferAgeStart(regist3VO.getPreferAgeStart());
		member.setPreferAgeEnd(regist3VO.getPreferAgeEnd());
		member.setPreferStyleVO(regist3VO.getPreferStyleVO());
		member.setPreferCollegeVO(regist3VO.getPreferCollegeVO());
		
		if(memberService.createMember(member)) {
			return "redirect:/login";
		}
		
		return "redirect:/member/regist/process3";
	}
	
	@RequestMapping("/api/isExist/userId")
	@ResponseBody
	public Map<String, Object> checkUniqueUserId(@RequestParam String userId) {
		boolean isExist = memberService.readCountUserId(userId);
		MemberVO member = memberService.readMemberSimple(userId);

		Map<String, Object> response = new HashMap<String, Object>();
		response.put("isExist", isExist);
		response.put("member", member);
		
		return response;
	}
	
	@RequestMapping("/api/isExist/nickname")
	@ResponseBody
	public Map<String, Boolean> checkUniqueNickname(@RequestParam String nickname) {
		
		boolean isExist = memberService.readCountNickname(nickname);
		Map<String, Boolean> response = new HashMap<String, Boolean>();
		response.put("isExist", isExist);
		
		return response;
	}
	
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String viewLoginPage(HttpSession session) {
		if(session.getAttribute(Member.USER) != null) {
			return "redirect:/";
		}
		return "member/login";
	}

	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String doLogin(@ModelAttribute("loginForm") MemberVO memberVO, HttpSession session) {

		MemberVO member = memberService.readMember(memberVO);
		
		if( member != null) {
			session.setAttribute(Member.USER, member);
			return "redirect:/";
		}
		return "member/login";
	}
	
	@RequestMapping("/logout")
	public String doLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
