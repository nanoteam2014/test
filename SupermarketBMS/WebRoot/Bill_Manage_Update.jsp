<%@ page language="java" import="java.util.*" pageEncoding="gbk" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page import="com.nano.supermarket.entity.*" %>
<%@ page import="java.text.*" %>
<%@ page import="com.nano.supermarket.database.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>   
    <title>����BILL</title>    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript">
	function check(){
	var goodsName=document.getElementById("goodsName").value;
	if(goodsName==""){
	alert("��Ʒ���Ʋ���Ϊ�գ�");
	return false;
	}
	var goodsNum=document.getElementById("goodsNum").value;
	if(goodsNum==""){
	alert("��Ʒ��������Ϊ�գ�");
	return false;
	}
	var money=document.getElementById("money").value;
	if(money==""){
	alert("���׽���Ϊ�գ�");
	return false;
	}
	var goodsDescrible=document.getElementById("goodsDescrible").value;
	if(goodsDescrible==""){
	alert("��Ʒ��������Ϊ�գ�");
	return false;
	}
	var billTime=document.getElementById("billTime").value;
	if(billTime==""){
	alert("�˵�ʱ�䲻��Ϊ�գ�");
	return false;
	}
	return true;
	}
	
	
	</script>
	
	
	<% if( session.getAttribute("username")==null){
           out.println("<script type=\"text/javascript\">");
			out.println("alert(\"����û�е�½�����½��\");");
			out.println("open(\"index.jsp\",\"_self\");");
			out.println("</script>");
			return;
}
%>
	  	<%
  		/*
  		 * ��ʼ��һ��Bill����
  		 */ 
  		Bill bill = new Bill();
	  	//BillId
  		String billId = request.getParameter("billId");  	
	  	if( billId!=null && !billId.equals("")){
	  		bill.setBillId(Long.valueOf(billId));		
	  	}   
	  	 //goodsName
  		String goodsName = request.getParameter("goodsName"); 	
  		goodsName = goodsName==null?null:new String(goodsName.getBytes("ISO-8859-1"), "gbk");
  		bill.setGoodsName(goodsName);
	  	//goodsNum
  		String goodsNum = request.getParameter("goodsNum"); 
	  	try{
  		if(goodsNum!=null && !goodsNum.equals("")){
			bill.setGoodsNum(Integer.valueOf(goodsNum));
  		    }
	  	}catch(Exception e){
	  	out.println("<script type=\"text/javascript\">");
			out.println("alert(\"��Ʒ����������� ������������ ��\");");
			out.println("open(\"Bill_Manage_Update.jsp\",\"_self\");");
			out.println("</script>");
	  	}
  	  //money
  		String money=request.getParameter("money");
  	  try{
  		if(money!=null && !money.equals(""))
			bill.setMoney(Double.parseDouble(money));
  	  }catch(Exception e){
  		out.println("<script type=\"text/javascript\">");
		out.println("alert(\"���׽��������� ������������  ��\");");
		out.println("open(\"Bill_Manage_Update.jsp\",\"_self\");");
		out.println("</script>");
		return;
  	  }
  		//isPay
  		String isPay = request.getParameter("isPay"); 
  		 isPay = isPay==null?null:new String(isPay.getBytes("ISO-8859-1"), "gbk");
  		bill.setIsPay(isPay);
  		//supplierName
  		String supplierName = request.getParameter("supplierName"); 
  		 supplierName = supplierName==null?null:new String(supplierName.getBytes("ISO-8859-1"), "gbk");
  		bill.setSupplierName(supplierName);
  		//goodsDescrible
  		String goodsDescrible = request.getParameter("goodsDescrible"); 
         goodsDescrible = goodsDescrible==null?null:new String(goodsDescrible.getBytes("ISO-8859-1"), "gbk");
         bill.setGoodsDescrible(goodsDescrible);
       //System.out.println(goodsDescrible);
  		//billTime
  		String billTime=request.getParameter("billTime");
  		if(billTime!=null && !billTime.equals(""))
  		{
  			SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
  			try{
  				java.util.Date BT=sdf.parse(billTime); 
  				java.sql.Date sqlBillTime=new java.sql.Date(BT.getTime());
  				bill.setBillTime(sqlBillTime);
  			}catch (ParseException e){
  				out.println("<script type=\"text/javascript\">");
				out.println("alert(\"����������� ��\");");
				out.println("open(\"Bill_Manage_Update.jsp\",\"_self\");");
				out.println("</script>");
				return;
  			}
  			
  		}
  		/*
  		 * �鿴��ǰ�����Ƿ����޸Ļ��߲���
  		 */
  		String update = request.getParameter("update");		
		if(update != null){
			boolean isUpdated = update.equals("insert")?(BillOperation.isInsert(bill)):(BillOperation.isUpdate(bill));
			if(isUpdated){
  				out.println("<script type=\"text/javascript\">");
				out.println("alert(\"���³ɹ�\");");
				out.println("open(\"Bill_Manage.jsp\",\"_self\");");
				out.println("</script>");
  			}
  			else{
  				out.println("<script type=\"text/javascript\">");
				out.println("alert(\"����ʧ�ܣ�\");");
				out.println("open(\"Bill_Manage.jsp\",\"_self\");");
				out.println("</script>");
  			}
  			return;
		}
		/*
  		 * ���action��delete��ִ��ɾ��
  		 */
		String action = request.getParameter("action");
  		if(action != null){
  			if(action.equals("delete")){  			
	  			if(BillOperation.isDelete(bill)){
	  				out.println("<script type=\"text/javascript\">");
					out.println("alert(\"ɾ���ɹ���\");");
					out.println("open(\"Bill_Manage.jsp\",\"_self\");");
					out.println("</script>");
  			}
	  			else{
	  				out.println("<script type=\"text/javascript\">");
					out.println("alert(\"ɾ��ʧ�ܣ�\");");
					out.println("open(\"Bill_Manage.jsp\",\"_self\");");
					out.println("</script>");
	  			}
	  			return;
	  		}
  		}
  		
  		/*
  		 * ����update���ؿؼ���ֵ
  		 */
  		action = goodsName==null?"insert":"modify";
  		pageContext.setAttribute("update", action);
  		pageContext.setAttribute("goodsName", goodsName);
  		pageContext.setAttribute("billId", billId);
  		pageContext.setAttribute("money",money);
  		pageContext.setAttribute("isPay",isPay);
  		pageContext.setAttribute("supplierName",supplierName);
  		pageContext.setAttribute("goodsDescrible",goodsDescrible);
  		pageContext.setAttribute("billTime",billTime);
  		pageContext.setAttribute("goodsNum",goodsNum);
  	%>
  </head>
  <body> 
  <form action="Bill_Manage_Update.jsp" onSubmit="return check();">
  <table>
  <tr><td>
		<input type="hidden" name="update" value="${pageScope.update}">	</td><td>
		<input type="hidden" name="billId" value="${pageScope.billId}"></td></tr>
		<tr>
		<td>��Ʒ����:
		</td>
		<td><input id="goodsName" type="text" name="goodsName" value="${pageScope.goodsName}">
		</td></tr>
		<tr><td>
		��Ʒ����:</td>
		<td><input id="goodsNum" type="text" name="goodsNum" value="${pageScope.goodsNum}"> </td></tr>
		<tr><td>
		���׽��:</td><td><input id= "money" type="text" name="money" value="${pageScope.money}"> </td></tr>
		<tr><td>
		�Ƿ񸶿�:</td><td><select name="isPay"  > 
		<%
		if(isPay==null){
			  out.println("<option selected=\"selected\">��</option>");
			  out.println("<option>��</option>");
		}
		else if( isPay.equals("��")){
			  out.println("<option selected=\"selected\">��</option>");
			  out.println("<option>��</option>");
		  }
		 else if(isPay.equals("��")){
			  out.println("<option >��</option>");
			  out.println("<option selected=\"selected\">��</option>");
		  }
		%>
		 </select> </td></tr>
<tr><td>��Ӧ������:</td><td><select name="supplierName">
          <%List<Supplier> suppliers=SupplierOperation.select();
          for(int i =0 ;i<suppliers.size();i++){
        	  if(supplierName==null){
        		  out.println("<option>");
            	  out.println(suppliers.get(i).getSupplierName());
            	  out.println("</option>");
        	  }
        	  else if(supplierName.equals(suppliers.get(i).getSupplierName())){
            	  out.println("<option selected=\"selected\">");
            	  out.println(suppliers.get(i).getSupplierName());
            	  out.println("</option>");
        	  }
              else{
            	  out.println("<option>");
            	  out.println(suppliers.get(i).getSupplierName());
            	  out.println("</option>");
           
              }
          }      
          %>
		 </select></td></tr>
		<tr><td>
		��Ʒ����:</td><td> <textarea  id="goodsDescrible" name="goodsDescrible" >${pageScope.goodsDescrible}</textarea></td></tr>
		<tr><td>
	�˵�ʱ��:</td><td><input id=" billTime" type="text" name="billTime" value="${pageScope.billTime}"> </td></tr>
	
	<tr><td></td><td>
		<input type="submit" value="�ύ"></td></tr>
		</table>
	</form>
	
  </body>
</html>
