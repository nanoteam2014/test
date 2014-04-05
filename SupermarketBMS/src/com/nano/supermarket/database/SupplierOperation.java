package com.nano.supermarket.database;

import java.util.ArrayList;
import java.util.List;

import com.nano.supermarket.entity.Supplier;

public class SupplierOperation {
	private DBOperation dbo;

	public DBOperation getDbo() {
		return dbo;
	}

	public void setDbo(DBOperation dbo) {
		this.dbo = dbo;
	}
	/**
	 * 定义数据库的基本信息
	 * @return
	 */
	private   DBOperation getDB(){
		DBOperation dbo1=new DBOperation();
		dbo1.setDriver("oracle.jdbc.driver.OracleDriver");
		dbo1.setUrl("jdbc:oracle:thin:@localhost:1521:orcl");
		dbo1.setUser("supermarket");
		dbo1.setPassWord("123456");
		return dbo1;
	}
	/**
	 * select操作
	 */
	public static List<Supplier> select(){
		List<Supplier> suppliers=new ArrayList<Supplier>();
		SupplierOperation so=new SupplierOperation();
		so.dbo=so.getDB();
		suppliers=so.dbo.selectSupplier();
		return suppliers;
	}
	/**
	 * update的操作
	 */
	public static boolean update(Supplier s){
		Boolean isUpdate=null;
		SupplierOperation so=new SupplierOperation();
		so.dbo=so.getDB();
		isUpdate=so.dbo.updateSupplier(s);
		return isUpdate;
	}
	/**
	 * insert 的操作
	 */
	public static boolean insert(Supplier s){
		Boolean isInsert=null;
		SupplierOperation so=new SupplierOperation();
		so.dbo=so.getDB();
		isInsert=so.dbo.inseertSupplier(s);
		return isInsert;
	}
	/**
	 * delete 的操作
	 */
	
	public static boolean delete(Supplier s){
		Boolean isDelete=null;
		SupplierOperation so=new SupplierOperation();
		so.dbo=so.getDB();
		isDelete=so.dbo.deleteSupplier(s);
		return isDelete;
	}
//	public static void main(String[] args) {
//		List<Supplier> suppliers= SupplierOperation.select();
//		for (int i = 0; i < suppliers.size(); i++) {
//			System.out.println(suppliers.get(i).getTelphone());
//			
//		}
//	}
}
