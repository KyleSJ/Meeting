package com.meeting.www.preference.service;

import com.meeting.www.preference.dao.PreferDao;

public class PreferServiceImpl implements PreferService {
	
	private PreferDao preferDao;
	
	public void setPreferDao(PreferDao preferDao) {
		this.preferDao = preferDao;
	}

}
