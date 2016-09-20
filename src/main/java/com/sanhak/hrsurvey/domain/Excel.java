package com.sanhak.hrsurvey.domain;

import java.util.Date;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class Excel {

	private String Serial_No;
	private String BR_No;
	private String Hire_Type;
	private String ERBP;
	private Date NewHire_Date;
	private String Hire_Manager_Name;
	private String Hire_Manager_Band;
	private String HM_ID;
	private String New_Hire_Name;
	private String New_Hire_Band;
	private String New_Hire_ID;
	private String Recruiter_Name;
	private String Recruiter_Band;
	private String Recruiter_ID;

	private CommonsMultipartFile file = null;

	public String getSerial_No() {
		return Serial_No;
	}

	public void setSerial_No(String serial_No) {
		Serial_No = serial_No;
	}

	public String getBR_No() {
		return BR_No;
	}

	public void setBR_No(String bR_No) {
		BR_No = bR_No;
	}

	public String getHire_Type() {
		return Hire_Type;
	}

	public void setHire_Type(String hire_Type) {
		Hire_Type = hire_Type;
	}

	public String getERBP() {
		return ERBP;
	}

	public void setERBP(String eRBP) {
		ERBP = eRBP;
	}

	public Date getNewHire_Date() {
		return NewHire_Date;
	}

	public void setNewHire_Date(Date newHire_Date) {
		NewHire_Date = newHire_Date;
	}

	public String getHire_Manager_Name() {
		return Hire_Manager_Name;
	}

	public void setHire_Manager_Name(String hire_Manager_Name) {
		Hire_Manager_Name = hire_Manager_Name;
	}

	public String getHire_Manager_Band() {
		return Hire_Manager_Band;
	}

	public void setHire_Manager_Band(String hire_Manager_Band) {
		Hire_Manager_Band = hire_Manager_Band;
	}

	public String getHM_ID() {
		return HM_ID;
	}

	public void setHM_ID(String hM_ID) {
		HM_ID = hM_ID;
	}

	public String getNew_Hire_Name() {
		return New_Hire_Name;
	}

	public void setNew_Hire_Name(String new_Hire_Name) {
		New_Hire_Name = new_Hire_Name;
	}

	public String getNew_Hire_Band() {
		return New_Hire_Band;
	}

	public void setNew_Hire_Band(String new_Hire_Band) {
		New_Hire_Band = new_Hire_Band;
	}

	public String getNew_Hire_ID() {
		return New_Hire_ID;
	}

	public void setNew_Hire_ID(String new_Hire_ID) {
		New_Hire_ID = new_Hire_ID;
	}

	public String getRecruiter_Name() {
		return Recruiter_Name;
	}

	public void setRecruiter_Name(String recruiter_Name) {
		Recruiter_Name = recruiter_Name;
	}

	public String getRecruiter_Band() {
		return Recruiter_Band;
	}

	public void setRecruiter_Band(String recruiter_Band) {
		Recruiter_Band = recruiter_Band;
	}

	public String getRecruiter_ID() {
		return Recruiter_ID;
	}

	public void setRecruiter_ID(String recruiter_ID) {
		Recruiter_ID = recruiter_ID;
	}

	public CommonsMultipartFile getFile() {
		return file;
	}

	public void setFile(CommonsMultipartFile file) {
		this.file = file;
	}

	public Excel() {
	}

	public Excel(String serial_No, String bR_No, String hire_Type, String eRBP, Date newHire_Date,
			String hire_Manager_Name, String hire_Manager_Band, String hM_ID, String new_Hire_Name,
			String new_Hire_Band, String new_Hire_ID, String recruiter_Name, String recruiter_Band,
			String recruiter_ID) {
		super();
		Serial_No = serial_No;
		BR_No = bR_No;
		Hire_Type = hire_Type;
		ERBP = eRBP;
		NewHire_Date = newHire_Date;
		Hire_Manager_Name = hire_Manager_Name;
		Hire_Manager_Band = hire_Manager_Band;
		HM_ID = hM_ID;
		New_Hire_Name = new_Hire_Name;
		New_Hire_Band = new_Hire_Band;
		New_Hire_ID = new_Hire_ID;
		Recruiter_Name = recruiter_Name;
		Recruiter_Band = recruiter_Band;
		Recruiter_ID = recruiter_ID;
	}
}