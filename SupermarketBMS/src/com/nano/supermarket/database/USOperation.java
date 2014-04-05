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
 * ��ʼ�����ݿ�Ļ�����Ϣ
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
 * �Ա�US���в�ѯ
 * @return
 */
public static List<US> select(){
	USOperation uso=new USOperation();
	uso.dbo=uso.getDB();
	return uso.dbo.selectUS();
}
/**
 * �Ա�US����insert����
 */
public static boolean insert(US user){
	USOperation uso=new USOperation();
	uso.dbo=uso.getDB();
	return uso.dbo.insertUS(user);
}
/**
 * �Ա�Us ����Update����
 */
public static boolean update(US user){
	USOperation uso=new USOperation();
	uso.dbo=uso.getDB();
	return uso.dbo.updateUS(user);
}
/**
 * ��US���������Update�Ĳ���
 */

public static boolean updatePD(US user){
	USOperation uso=new USOperation();
	uso.dbo=uso.getDB();
	
	return uso.dbo.updatePassWord(user);
}
/**
 * ��US����delete����
 */
public static boolean delete( US user){
	USOperation uso=new USOperation();
	uso.dbo=uso.getDB();
	return uso.dbo.deleteUS(user);
}
/**
 * �û�Ȩ�޵Ĳ�ѯ
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
