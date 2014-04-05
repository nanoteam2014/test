package com.nano.supermarket.entity;
/**
 *US类是记录数据库中超市用户信息的
 */
public class US {
	/**
	 * 定义US类的属性
	 */
	private  long  userId;
	private  String  userName;
	private  String  sex;
	private  int  age;
	private  String  telphone;
	private  String  address;
	private  String  power;
	private String passWord;
	
	public long getUserId() {
		return userId;
	}
	public void setUserId(long userId) {
		this.userId = userId;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	/**
	 * set与get方法
	 * 	 */
	
	
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	
	
	public String getTelphone() {
		return telphone;
	}
	public void setTelphone(String telphone) {
		this.telphone = telphone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPower() {
		return power;
	}
	public void setPower(String power) {
		this.power = power;
	}
	
	

}
