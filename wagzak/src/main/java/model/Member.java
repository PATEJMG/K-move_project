package model;


public class Member {
	private String id ="";
	private String pw="";
	private String hospital="";
	public Member() {
		
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}
	public void setPw(String pass) {
		this.pw = pass;
	}
	public String getHospital() {
		return hospital;
	}
	public void setHospital(String hospital) {
		this.hospital = hospital;
	}

}

