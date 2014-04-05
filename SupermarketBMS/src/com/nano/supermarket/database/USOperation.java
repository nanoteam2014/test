package com.nano.supermarket.database;

import java.util.List;

import com.nano.supermarket.entity.US;

public class USOperation {
private DBOperation dbo;

public DBOperation getDbo() {
	return dbo;
}

public void setDbo(DBOperation dbo) {
	this.dbo = dbo;
}
/**
 * 初始化数据库的基本信息
 * @return
 */
private DBOperation getDB(){
	DBOperation dbo1=new DBOperation();
//	/System.out.println("-----------------------xxxxxxxxx------------------------");
	dbo1.setDriver("oracle.jdbc.driver.OracleDriver");
	dbo1.setUrl("jdbc:oracle:thin:@localhost:1521:orcl");
	dbo1.setUser("supermarket");
	dbo1.setPassWord("123456");
	return dbo1;
}
/**
 * 对表US进行查询
 * @return
 */
public static List<US> select(){
	USOperation uso=new USOperation();
	uso.dbo=uso.getDB();
	return uso.dbo.selectUS();
}
/**
 * 对表US进行insert操作
 */
public static boolean insert(US user){
	USOperation uso=new USOperation();
	uso.dbo=uso.getDB();
	return uso.dbo.insertUS(user);
}
/**
 * 对表Us 进行Update操作
 */
public static boolean update(US user){
	USOperation uso=new USOperation();
	uso.dbo=uso.getDB();
	return uso.dbo.updateUS(user);
}
/**
 * 对US的密码进行Update的操作
 */

public static boolean updatePD(US user){
	USOperation uso=new USOperation();
	uso.dbo=uso.getDB();
	
	return uso.dbo.updatePassWord(user);
}
/**
 * 对US进行delete操作
 */
public static boolean delete( US user){
	USOperation uso=new USOperation();
	uso.dbo=uso.getDB();
	return uso.dbo.deleteUS(user);
}
/**
 * 用户权限的查询
 */
public static String selectPower(String usName){
	USOperation uso=new USOperation();
	uso.dbo=uso.getDB();
	return uso.dbo.selectPower(usName);
}
//public static void main(String[] args) {
//	List<US> users=USOperation.select();
//	for (int i = 0; i < users.size(); i++) {
//		System.out.println(selectPower(users.get(i).getUserName()));
//
//	}
//}



}
