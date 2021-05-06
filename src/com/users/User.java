package com.users;

public interface User {
	public String getUserName();
    public String getPassword(); 
    public void setUserName(String username);
    public void setPassword(String password);
    public boolean authenticate(String password);
    public void setFname(String fname);
    public void setLname(String lname);
    public void setemail(String email);
    public void setInstituteId(String instituteId);
    public void generateUsername();
    public void generatePassword();
    public String getFname();
    public String getLname();
    public String getemail();
    public String getInstituteId();
}
