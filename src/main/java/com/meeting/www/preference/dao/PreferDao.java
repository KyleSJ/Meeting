package com.meeting.www.preference.dao;

import com.meeting.www.preference.vo.PreferAddrVO;
import com.meeting.www.preference.vo.PreferCollegeVO;
import com.meeting.www.preference.vo.PreferStyleVO;

public interface PreferDao {

	public int insertPreferStyle(PreferStyleVO preferStyleVO);

	public int insertPreferAddr(PreferAddrVO preferAddrVO);

	public int insertPreferCollege(PreferCollegeVO preferCollegeVO);

}
