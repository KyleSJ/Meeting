package com.meeting.www.school.service;

import java.util.List;

import com.meeting.www.school.dao.SchoolDao;
import com.meeting.www.school.vo.CollegeVO;
import com.meeting.www.school.vo.MajorVO;
import com.meeting.www.school.vo.SchoolVO;

public class SchoolServiceImpl implements SchoolService{
	
	private SchoolDao schoolDao;
	
	public void setSchoolDao(SchoolDao schoolDao) {
		this.schoolDao = schoolDao;
	}

	@Override
	public List<SchoolVO> readAllShool() {
		return schoolDao.selectAllSchool();
	}

	@Override
	public List<CollegeVO> readAllCollege() {
		return schoolDao.selectAllCollege();
	}

	@Override
	public List<MajorVO> readAllMajor() {
		return schoolDao.selectAllMajor();
	}
}
