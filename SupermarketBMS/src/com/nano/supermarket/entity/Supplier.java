package com.nano.supermarket.entity;
/**
 * Supplier���Ǽ�¼���ݿ��й�Ӧ����Ϣ��
 * @author Administrator
 *
 */
public class Supplier {
	/**
	 * ��������
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
	 * set ��get����
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
