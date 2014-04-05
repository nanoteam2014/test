package com.nano.supermarket.database;

import java.util.List;

import com.nano.supermarket.entity.Bill;

public class BillOperation {
	/**
	 * ����dbo
	 */
	private DBOperation dbo;
	/**
	 * ���Ե�get��set����
	 * @return
	 */
	public DBOperation getDbo() {
		return dbo;
	}

	public void setDbo(DBOperation dbo) {
		this.dbo = dbo;
	}
	/**
	 * ���ݿ�ĳ�ʼ��
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
	 * ��ѯ����
	 * @return
	 */
	public static List<Bill> selectBill(){
		BillOperation db=new BillOperation();
		db.setDbo(db.getDB());
		return db.dbo.selectBill();	
	}
	/**
	 * ���²���
	 */
	public static boolean isUpdate(Bill bill){
		Boolean update=null;
		BillOperation db=new BillOperation();
		db.setDbo(db.getDB());
		update=db.dbo.updateBill(bill);
		return update;
	}
	/**
	 * �������
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
	 * ɾ������
	 */
	public static boolean isDelete(Bill bill){
		Boolean delete=null;
		BillOperation db=new BillOperation();
		db.setDbo(db.getDB());
		delete=db.dbo.deleteBill(bill);
		return delete;
		
	}


}
