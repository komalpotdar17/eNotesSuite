package com.enotes;

public class UserDtls {
	
	private int id;
	private String fullName;
	private String email;
	private String password;
	private String ContactNo;
	private String about;
	private String role;
	private String RegDate;
	
	public UserDtls() {
		super();		
	}

	public UserDtls(String fullName, String email, String password, String contactNo, String about, String role,
			String regDate) {
		super();
		this.fullName = fullName;
		this.email = email;
		this.password = password;
		ContactNo = contactNo;
		this.about = about;
		this.role = role;
		RegDate = regDate;
	}



	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	public String getContactNo() {
		return ContactNo;
	}
	public void setContactNo(String contactNo) {
		this.ContactNo = contactNo;
	}

	public String getAbout() {
		return about;
	}
	public void setAbout(String about) {
		this.about = about;
	}

	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	
	public String getRegDate() {
		return RegDate;
	}
	public void setRegDate(String regDate) {
		RegDate = regDate;
	}
	
	@Override
	public String toString() {
		return "UserDtls [id=" + id + ", fullName=" + fullName + ", email=" + email + ", password=" + password
				+ ", ContactNo=" + ContactNo + ", about=" + about + ", role=" + role + ", RegDate=" + RegDate + "]";
	}
	
}