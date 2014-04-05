package com.nano.supermarket.entity;
/**
 * Supplier类是记录数据库中供应商信息的
 * @author Administrator
 *
 */
public class Supplier {
	/**
	 * 定义属性
	 */
	private  Long supplierId;
	private  String supplierName;
	private  String supplierDescrible;
	public String getSupplierDescrible() {
		return supplierDescrible;
	}
	public void setSupplierDescrible(String supplierDescrible) {
		this.supplierDescrible = supplierDescrible;
	}
	private  String linkMan;
	private  String telphone;
	private  String address;
	/**
	 * set 与get方法
	 */


	public String getSupplierName() {
		return supplierName;
	}
	public Long getSupplierId() {
		return supplierId;
	}
	public void setSupplierId(Long supplierId) {
		this.supplierId = supplierId;
	}
	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}

	public String getLinkMan() {
		return linkMan;
	}
	public void setLinkMan(String linkMan) {
		this.linkMan = linkMan;
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
	

}
