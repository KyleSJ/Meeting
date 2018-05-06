package com.meeting.www.school.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.meeting.www.school.vo.CollegeVO;
import com.meeting.www.school.vo.MajorVO;
import com.meeting.www.school.vo.SchoolVO;

public class SchoolDaoImpl extends SqlSessionDaoSupport implements SchoolDao{

	@Override
	public List<SchoolVO> selectAllSchool() {
		return getSqlSession().selectList("schoolDao.selectAllSchool");
	}

	@Override
	public List<CollegeVO> selectAllCollege() {
		return getSqlSession().selectList("schoolDao.selectAllCollege");
	}

	@Override
	public List<MajorVO> selectAllMajor() {
		return getSqlSession().selectList("schoolDao.selectAllMajor");
	}

}
