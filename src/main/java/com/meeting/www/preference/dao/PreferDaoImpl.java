package com.meeting.www.preference.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.meeting.www.preference.vo.PreferAddrVO;
import com.meeting.www.preference.vo.PreferCollegeVO;
import com.meeting.www.preference.vo.PreferStyleVO;

public class PreferDaoImpl extends SqlSessionDaoSupport implements PreferDao {

	@Override
	public int insertPreferStyle(PreferStyleVO preferStyleVO) {
		int result = 0;
		for (int i = 0; i < preferStyleVO.getStyleId().size(); i++) {
			result += getSqlSession().insert("PreferDao.insertPreferStyle", preferStyleVO.getStyleId().get(i));
		}
		return result;
	}

	@Override
	public int insertPreferAddr(PreferAddrVO preferAddrVO) {
		int result = 0;
		for (int i = 0; i < preferAddrVO.getAddrId().size(); i++) {
			result += getSqlSession().insert("PreferDao.insertPreferAddr", preferAddrVO.getAddrId().get(i));
		}
		return result;
	}

	@Override
	public int insertPreferCollege(PreferCollegeVO preferCollegeVO) {
		int result = 0;
		for (int i = 0; i < preferCollegeVO.getCollegeId().size(); i++) {
			result += getSqlSession().insert("PreferDao.insertPreferCollege", preferCollegeVO.getCollegeId().get(i));
		}
		return result;
	}

}
