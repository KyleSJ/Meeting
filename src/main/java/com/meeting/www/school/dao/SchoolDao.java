package com.meeting.www.school.dao;

import java.util.List;

import com.meeting.www.school.vo.CollegeVO;
import com.meeting.www.school.vo.MajorVO;
import com.meeting.www.school.vo.SchoolVO;

public interface SchoolDao {

	public List<SchoolVO> selectAllSchool();
	
	public List<CollegeVO> selectAllCollege();
	
	public List<MajorVO> selectAllMajor();
	
}
