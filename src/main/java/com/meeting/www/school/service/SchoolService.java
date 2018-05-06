package com.meeting.www.school.service;

import java.util.List;

import com.meeting.www.school.vo.CollegeVO;
import com.meeting.www.school.vo.MajorVO;
import com.meeting.www.school.vo.SchoolVO;

public interface SchoolService {

	public List<SchoolVO> readAllShool();
	
	public List<CollegeVO> readAllCollege();
	
	public List<MajorVO> readAllMajor();
	
}
