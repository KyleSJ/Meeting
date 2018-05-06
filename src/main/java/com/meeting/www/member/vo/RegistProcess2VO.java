package com.meeting.www.member.vo;

import javax.validation.constraints.NotEmpty;

public class RegistProcess2VO {

	@NotEmpty
	private String name;
	@NotEmpty
	private String gender;
	private String birthday;
	@NotEmpty
	private String birthYear;
	@NotEmpty
	private String birthMonth;
	@NotEmpty
	private String birthDay;
	private int admissionYear;
	@NotEmpty
	private String phoneNumber;

	//	TODO addStr을 addId로 변경하
	private String addStr;
	private int addId;
	private int schoolId;
	private int majorId;
	@NotEmpty
	private String livingAlone;
	@NotEmpty
	private String militaryService;
	private StyleVO styleVO;
	@NotEmpty
	private String aboutMe;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getBirthYear() {
		return birthYear;
	}

	public void setBirthYear(String birthYear) {
		this.birthYear = birthYear;
	}

	public String getBirthMonth() {
		return birthMonth;
	}

	public void setBirthMonth(String birthMonth) {
		this.birthMonth = birthMonth;
	}

	public String getBirthDay() {
		return birthDay;
	}

	public void setBirthDay(String birthDay) {
		this.birthDay = birthDay;
	}

	public int getAdmissionYear() {
		return admissionYear;
	}

	public void setAdmissionYear(int admissionYear) {
		this.admissionYear = admissionYear;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getAddStr() {
		return addStr;
	}

	public void setAddStr(String addStr) {
		this.addStr = addStr;
	}

	public int getAddId() {
		return addId;
	}

	public void setAddId(int addId) {
		this.addId = addId;
	}

	public int getSchoolId() {
		return schoolId;
	}

	public void setSchoolId(int schoolId) {
		this.schoolId = schoolId;
	}

	public int getMajorId() {
		return majorId;
	}

	public void setMajorId(int majorId) {
		this.majorId = majorId;
	}

	public String getLivingAlone() {
		return livingAlone;
	}

	public void setLivingAlone(String livingAlone) {
		this.livingAlone = livingAlone;
	}

	public String getMilitaryService() {
		return militaryService;
	}

	public void setMilitaryService(String militaryService) {
		this.militaryService = militaryService;
	}

	public StyleVO getStyleVO() {
		return styleVO;
	}

	public void setStyleVO(StyleVO styleVO) {
		this.styleVO = styleVO;
	}

	public String getAboutMe() {
		return aboutMe;
	}

	public void setAboutMe(String aboutMe) {
		this.aboutMe = aboutMe;
	}

}
