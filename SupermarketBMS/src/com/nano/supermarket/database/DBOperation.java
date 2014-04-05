package com.nano.supermarket.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.nano.supermarket.entity.*;

/**
 * DBOperation�����������ݿ����
 * @author Administrator
 *
 */
public class DBOperation {
	/**
	 * �޲εĹ��췽��
	 */
	public DBOperation() {
		super();
		// TODO Auto-generated constructor stub
	}
	/**
	 * �����������
	 */
	private String driver=null;//�������ݿ������
	private String url=null;//�������ݿ�����Ҫ��URL
	private String user=null;//�������ݿ�ʱ����Ҫ���û���
	private String passWord=null;//�������ݿ�ʱ����Ҫ������
	/**
	 * ���������Ե�set��get����
	 */
	public String getDriver() {
		return driver;
	}
	public void setDriver(String driver) {
		this.driver = driver;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	/**
	 * ����ʱ����Ҫ�Ĺ���
	 */
	private Connection  conn=null;
	private PreparedStatement ps=null;
	private ResultSet rs=null;
	/**
	 * �������ݿ�
	 */
	public void connectionDB(){
		try {
			//ע������
			Class.forName(driver);
			//�������ݿ������
			conn=DriverManager.getConnection(url,user,passWord);
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
		}
	}
	/**
	 * �ر����ݿ�
	 */
	private void closeDB(){
    	try {
			if(rs!=null){
				rs.close();
				}
			if(ps!=null){
				ps.close();
			}
			if(conn!=null){
				conn.close();
			}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	/**
	 * ���ݿ�Ĳ�ѯ,��ѯUS���е���Ϣ
	 */
	public List<US> selectUS(){
		connectionDB();
		String sql="select userId,userName,sex,age,telphone,address,power,passWord from us";
		List<US> users=new ArrayList<US>();
     	try {
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			US user=null;
			while(rs.next()){
				user=new US();
				user.setUserId(rs.getLong("userId"));
				user.setUserName(rs.getString("userName"));
				user.setSex(rs.getString("sex"));
				user.setAge(rs.getInt("age"));
				user.setTelphone(rs.getString("telphone"));
				user.setAddress(rs.getString("address"));
				user.setPower(rs.getString("power"));
				user.setPassWord(rs.getString("passWord"));
				users.add(user);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			closeDB();
		}
		return users;
	}
	/**
	 * ��US���еĵ��û���Ȩ��
	 */
	public String selectPower(String usName){
		String power=null;
		connectionDB();
		String sql="select power from US where userName=?";
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, usName);
			rs=ps.executeQuery();
			while(rs.next()){
				power=new String();
				power=rs.getString("power");	
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closeDB();
		}
		return power;
	}
	/**
	 * �����ݿ��в�ѯ��bill
	 */
	public List<Bill> selectBill(){
		connectionDB();
		String sql=" select * from bill";
		List<Bill> bills=new ArrayList<Bill>();
		try {
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			Bill bill=null;
			while(rs.next()){
				bill=new Bill();
				bill.setBillId(rs.getLong("billId"));
				bill.setGoodsName(rs.getString("goodsName"));
				bill.setGoodsNum(rs.getInt("goodsNum"));
				bill.setMoney(rs.getDouble("money"));
				bill.setIsPay(rs.getString("isPay"));
				bill.setSupplierName(rs.getString("supplierName"));
				bill.setGoodsDescrible(rs.getString("goodsDescrible"));
				bill.setBillTime(rs.getDate("billtime"));
				bills.add(bill);		
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closeDB();
		}
		return bills;
		
	}
	/**
	 *  �Ա�bill���и��²���
	 *  
	 */
	public boolean updateBill(Bill b){
		connectionDB();
		boolean  isUpdate=false;
		String sql="update bill set goodsName=?,goodsNum=?,money=?,isPay=?,supplierName=?,goodsDescrible=?,billTime=? where billId=?";
		try {
			ps=conn.prepareStatement(sql);
			ps.setLong(8, b.getBillId());
			ps.setString(6, b.getGoodsDescrible());
			ps.setString(1, b.getGoodsName());
			ps.setString(4, b.getIsPay());
			ps.setString(5, b.getSupplierName());
			ps.setDate(7, b.getBillTime());
			ps.setInt(2,b.getGoodsNum());
			ps.setDouble(3, b.getMoney());
			int rows=ps.executeUpdate();
			isUpdate=rows>0?true:false;		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closeDB();
		}
		return isUpdate;
	}
	/**
	 * ��bill��������Ӳ���
	 */
	public boolean insertBill(Bill b){
		connectionDB();
		boolean isUpdate=false;
		SimpleDateFormat df =
				new SimpleDateFormat("yyyyMMddHHmmss");
			String billID = df.format(new Date()).toString();
//System.out.println("+++++++++++++++++++++++++++billID"+billID);
		String sql="insert into bill values(?,?,?,?,?,?,?,?)";
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, billID);
			ps.setString(7, b.getGoodsDescrible());
			ps.setString(2, b.getGoodsName());
			ps.setString(5, b.getIsPay());
			ps.setString(6, b.getSupplierName());
			ps.setDate(8, b.getBillTime());
			ps.setInt(3,b.getGoodsNum());
			ps.setDouble(4, b.getMoney());
			int rows=ps.executeUpdate();
			isUpdate=rows>0?true:false;	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closeDB();
			
		}
		return isUpdate;
	}
	/**
	 * ��bill�����ɾ������
	 * 
	 */
	public boolean deleteBill(Bill b){
		Boolean isDeleted =null;
		connectionDB();
		String sql="delete from bill where billId=?";
		try {
			ps=conn.prepareStatement(sql);
			ps.setLong(1, b.getBillId());
			int rows=ps.executeUpdate();
			isDeleted=rows>0?true:false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closeDB();
		}
		return isDeleted;
	}
	/**
	 * �Ա�Supplier�Ĳ�ѯ
	 */
	public List<Supplier> selectSupplier(){
		connectionDB();
		List <Supplier> suppliers=new ArrayList<Supplier>();
		String sql="select supplierId,supplierName,supplierDescrible,linkman,telphone,address from supplier";
		try {
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			Supplier supplier=null;
			while ( rs.next() ){
				supplier = new Supplier();
				supplier.setSupplierId(rs.getLong("supplierId"));
				supplier.setSupplierName(rs.getString("supplierName"));
				supplier.setSupplierDescrible(rs.getString("supplierDescrible"));
				supplier.setLinkMan(rs.getString("linkMan"));
				supplier.setTelphone(rs.getString("telphone"));
				supplier.setAddress(rs.getString("address"));
				suppliers.add(supplier);
				
			}
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closeDB();
		}
		
		return suppliers;
		
	}
	/**
	 * ��supplier�����update���²���
	 */
	public boolean updateSupplier(Supplier s){
		Boolean isUpdated=null;
		connectionDB();
		String sql=" update supplier set supplierName=?,supplierDescrible=?,linkMan=?,telphone=?,address=? where supplierId=?";
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, s.getSupplierName());
			ps.setString(2, s.getSupplierDescrible());
			ps.setString(3, s.getLinkMan());
			ps.setString(4, s.getTelphone());
			ps.setString(5, s.getAddress());
			ps.setLong(6, s.getSupplierId());
			int rows=ps.executeUpdate();
			isUpdated=rows>0?true:false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return isUpdated;
	}
	/**
	 * �Ա�supplier����insert����
	 */
	public boolean inseertSupplier(Supplier s){
		Boolean isInserted=false;
		connectionDB();
		SimpleDateFormat df =
				new SimpleDateFormat("yyyyMMddHHmmss");
			String supplierID = df.format(new Date()).toString();
//System.out.println("+++++++++++++++++++++++++++supplierID"+supplierID);
		String sql="insert into supplier values(?,?,?,?,?,?)";
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, supplierID);
			ps.setString(2, s.getSupplierName());
			ps.setString(3, s.getSupplierDescrible());
			ps.setString(4,s.getLinkMan());
			ps.setString(5, s.getTelphone());
			ps.setString(6, s.getAddress());
			int rows=ps.executeUpdate();
			isInserted=rows>0?true:false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closeDB();
		}
		return isInserted;
	}
	public boolean deleteSupplier(Supplier s){
		Boolean isDeleted=null;
		connectionDB();
		String sql="delete from supplier where supplierId=?";
		try {
			ps=conn.prepareStatement(sql);
			ps.setLong(1,s.getSupplierId());
			int rows=ps.executeUpdate();
			isDeleted=rows>0?true:false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closeDB();
		}
		
		return isDeleted;
	}
	/**
	 * ��US���insert����
	 */
	
	public  boolean insertUS(US user){
		Boolean isInsert=false;
		connectionDB();
//System.out.println("________________________________");
//System.out.println(user.getUserName());
		SimpleDateFormat df =
				new SimpleDateFormat("yyyyMMddHHmmss");
			String userID = df.format(new Date()).toString();
//System.out.println("+++++++++++++++++++++++++++userID"+userID);
		String sql="insert into US values(?,?,?,?,?,?,?,?)";
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, userID);
			ps.setString(2, user.getUserName());
			ps.setString(3, user.getSex());
			ps.setInt(4, user.getAge());
			ps.setString(5, user.getTelphone());
			ps.setString(6,user.getAddress());
			ps.setString(7,user.getPower());
			ps.setString(8, user.getPassWord());
			int rows=ps.executeUpdate();
			isInsert=rows>0?true:false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closeDB();
		}
		return isInsert;
	}
	/**
	 * ��Us  ���и��²���
	 */
	
	public boolean updateUS(US user){
		Boolean isUpdate=null;
		connectionDB();
		String sql=" update US set userName=?,sex=?,age=?,telphone=?,address=? where userId=?";
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, user.getUserName());
			ps.setString(2, user.getSex());
			ps.setInt(3, user.getAge());
			ps.setString(4, user.getTelphone());
			ps.setString(5,user.getAddress());
			ps.setLong(6, user.getUserId());
			int rows=ps.executeUpdate();
			isUpdate=rows>0?true:false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closeDB();
		}
		return isUpdate;
	}
	/**
	 * ��Us�е��������update
	 */
	public boolean updatePassWord(US user){
		Boolean isUpdatePD=null;
		connectionDB();
		String sql="update US set passWord=? where userId=?";
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1,user.getPassWord());
			ps.setLong(2, user.getUserId());
			int rows=ps.executeUpdate();
			isUpdatePD=rows>0?true:false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closeDB();
		}
		return isUpdatePD;
	}
	/**
	 * ��US�����û���ɾ��
	 */
	public boolean deleteUS(US user){
		Boolean isdelete=null;
		connectionDB();
		String sql="delete US where userId=?";
		try {
			ps=conn.prepareStatement(sql);
			ps.setLong(1, user.getUserId());
			int rows=ps.executeUpdate();
			isdelete=rows>0?true:false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			closeDB();
		}
		return isdelete;
		
	}
}


