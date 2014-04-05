package com.nano.supermarket.database;

import java.util.List;

import com.nano.supermarket.entity.Bill;

public class BillOperation {
	/**
	 * 属性dbo
	 */
	private DBOperation dbo;
	/**
	 * 属性的get与set方法
	 * @return
	 */
	public DBOperation getDbo() {
		return dbo;
	}

	public void setDbo(DBOperation dbo) {
		this.dbo = dbo;
	}
	/**
	 * 数据库的初始化
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
	 * 查询操作
	 * @return
	 */
	public static List<Bill> selectBill(){
		BillOperation db=new BillOperation();
		db.setDbo(db.getDB());
		return db.dbo.selectBill();	
	}
	/**
	 * 更新操作
	 */
	public static boolean isUpdate(Bill bill){
		Boolean update=null;
		BillOperation db=new BillOperation();
		db.setDbo(db.getDB());
		update=db.dbo.updateBill(bill);
		return update;
	}
	/**
	 * 插入操作
	 * @param bill
	 * @return
	 */
	public static boolean isInsert(Bill bill){
		Boolean insert=null;
		BillOperation db=new BillOperation();
		db.setDbo(db.getDB());
		insert=db.dbo.insertBill(bill);
		return insert;
	}
	/**
	 * 删除操作
	 */
	public static boolean isDelete(Bill bill){
		Boolean delete=null;
		BillOperation db=new BillOperation();
		db.setDbo(db.getDB());
		delete=db.dbo.deleteBill(bill);
		return delete;
		
	}


}
