<%@ page language="java" import="java.util.*" pageEncoding="gbk" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page import="com.nano.supermarket.entity.*"  %>
<%@ page import="com.nano.supermarket.database.*" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>��Ӧ�̵ĸ��²���</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  <!-- js�ж������Ƿ�Ϸ�-->
  <script type="text/javascript">
  function check(){
    var supplierName=document.getElementById("supplierName").value;
	if(supplierName==""){
	alert("��Ӧ�����Ʋ���Ϊ�գ������룡");
	return false;
	}
	var sd=document.getElementById("sd").value;
	if(sd==""){
	alert("��Ӧ����������Ϊ�գ������룡");
	return false;
	}
	var linkMan =document.getElementById("linkMan").value;
	if(linkMan=="")
	{
	alert("��ϵ�˲���Ϊ�գ������룡");
	return false;
	}
	for(var i=0;i<linkMan.length;i++){
	var j=linkMan.substring(i,i+1);
	if(isNaN(j)==false){
		alert("��ϵ���в��ܰ������֣����������룡");
		return false;
		}
	}
	var tel=document.getElementById("tel").value;
	var partten = /^1[3,5]\d{9}$/;

	if(tel==""){
         alert("�绰����Ϊ�գ�");
          return false;
	}
	if(!partten.test(tel)){
      alert("�绰�����������������");
	  return false;
}
	var address=document.getElementById("address").value;
	if(address==""){
	alert("��ַ����Ϊ�գ�");
	return false;
	}
	return true;
	
  
  }
  
  </script>
  <!-- �ж��Ƿ��Ѿ���¼ -->
  <% if( session.getAttribute("username")==null){
           out.println("<script type=\"text/javascript\">");
			out.println("alert(\"����û�е�½�����½��\");");
			out.println("open(\"index.jsp\",\"_self\");");
			out.println("</script>");
			
}
%>
  <%
  /*
  *��ʼ������Supplier
  */
  Supplier supplier=new Supplier();
  // supplierId
  String supplierId=request.getParameter("supplierId");
  if( supplierId!=null && !supplierId.equals("")){
  supplier.setSupplierId(Long.valueOf(supplierId));
  }
  System.out.println(supplierId);
  // supplierName
  String supplierName =request.getParameter("supplierName");
  supplierName=supplierName==null?null:new String(supplierName.getBytes("ISO-8859-1"),"gbk");
  supplier.setSupplierName(supplierName);
  // supplierDescrible
  String supplierDescrible=request.getParameter("supplierDescrible");
  supplierDescrible=supplierDescrible==null?null:new String(supplierDescrible.getBytes("ISO-8859-1"),"gbk");
  supplier.setSupplierDescrible(supplierDescrible);

  //linkMan
  String linkMan=request.getParameter("linkMan"); 
  linkMan=linkMan==null?null:new String(linkMan.getBytes("ISO-8859-1"),"gbk");
  supplier.setLinkMan(linkMan);
  //telphone
  String telphone=request.getParameter("telphone");
  telphone=telphone==null?null:new String(telphone.getBytes("ISO-8859-1"),"gbk");
  supplier.setTelphone(telphone);
  //address
  String address= request.getParameter("address");
  address=address==null?null:new String(address.getBytes("ISO-8859-1"),"gbk");
  supplier.setAddress(address);
  
  /**
  *���и��²���
  */
  	String update = request.getParameter("update");		
		if(update != null){
			boolean isUpdated = update.equals("insert")?(SupplierOperation.insert(supplier)):(SupplierOperation.update(supplier));
			if(isUpdated){
  				out.println("<script type=\"text/javascript\">");
				out.println("alert(\"���³ɹ�\");");
				out.println("open(\"Supplier_Manage.jsp\",\"_self\");");
				out.println("</script>");
  			}
  			else{
  				out.println("<script type=\"text/javascript\">");
				out.println("alert(\"����ʧ�ܣ�\");");
				out.println("open(\"Supplier_Manage.jsp\",\"_self\");");
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
	  			if(SupplierOperation.delete(supplier)){
	  				out.println("<script type=\"text/javascript\">");
				    out.println("alert(\"ɾ���ɹ���\");");
					out.println("open(\"Supplier_Manage.jsp\",\"_self\");");
					out.println("</script>"); 
	  			}
	  			else{
					 out.println("<script type=\"text/javascript\">");
						out.println("alert(\"ɾ��ʧ�ܣ�\");");
						out.println("open(\"Supplier_Manage.jsp\",\"_self\");");
						out.println("</script>");
	  			}
	  			return;
	  		}
  		}
  		/*
  		 * ����update���ؿؼ���ֵ
  		 */
  		action = supplierName==null?"insert":"modify";
  		pageContext.setAttribute("update", action);
  		pageContext.setAttribute("supplierName", supplierName);
  		pageContext.setAttribute("supplierId", supplierId);
  		pageContext.setAttribute("linkMan",linkMan);
  		pageContext.setAttribute("telphone",telphone);
  		pageContext.setAttribute("supplierDescrible",supplierDescrible);
  		pageContext.setAttribute("address",address); 
   %>
  <body>
 <form action="Supplier_Manage_Update.jsp"  onSubmit="return check();">
  <table>
  <tr><td>
		<input type="hidden" name="update" value="${pageScope.update}">	</td><td>
		<input type="hidden" name="supplierId" value="${pageScope.supplierId}"></td></tr>
		<tr>
		<td>��Ӧ������:
		</td>
		<td><input id="supplierName" type="text" name="supplierName" value="${pageScope.supplierName}">
		</td></tr>
		<tr><td>
		 ��Ӧ������:</td><td> <textarea id="sd" name="supplierDescrible" >${pageScope.supplierDescrible}</textarea></td></tr> 
		<!--��Ӧ������:</td><td><input type="text" name="supplierDescrible" value="${pageScope.supplierDescrible}"> </td></tr>  -->
		<tr><td>
		��ϵ��:</td>
		<td><input id="linkMan" type="text" name="linkMan" value="${pageScope.linkMan}"> </td></tr>
		<tr><td>
		�绰:</td><td><input id="tel" type="text" name="telphone" value="${pageScope.telphone}"> </td></tr>
        <tr><td>
		��ַ:</td><td><input id="address" type="text" name="address" value="${pageScope.address}"> </td></tr>
	<tr><td></td><td>
		<input type="submit" value="�ύ"></td></tr>
		</table>
	</form>
  </body>
</html>
