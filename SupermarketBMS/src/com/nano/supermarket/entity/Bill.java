package com.nano.supermarket.entity;

import java.sql.Date;

/**
 * Bill类是记录数据库中账单信息的
 * @author Administrator
 *
 */
public class Bill {
	/**
	 * Bill的属性
	 */
	private  Long billId;
	public Long getBillId() {
		return billId;
	}
	public void setBillId(Long billId) {
		this.billId = billId;
	}
	private String goodsName;
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	private int goodsNum;
	private  double money;
	private String isPay;
	private String supplierName;
	private String goodsDescrible;
	private Date billTime;
	/**
	 * get与set方法
	 */
	

	public String getGoodsDescrible() {
		return goodsDescrible;
	}
	public void setGoodsDescrible(String goodsDescrible) {
		this.goodsDescrible = goodsDescrible;
	}

	public int getGoodsNum() {
		return goodsNum;
	}
	public void setGoodsNum(int goodsNum) {
		this.goodsNum = goodsNum;
	}
	public double getMoney() {
		return money;
	}
	public void setMoney(double money) {
		this.money = money;
	}
	public String getIsPay() {
		return isPay;
	}
	public void setIsPay(String isPay) {
		this.isPay = isPay;
	}
	public String getSupplierName() {
		return supplierName;
	}
	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}
	public Date getBillTime() {
		return billTime;
	}
	public void setBillTime(Date billTime) {
		this.billTime = billTime;
	}

	
}
