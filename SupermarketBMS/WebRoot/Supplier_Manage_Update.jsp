<%@ page language="java" import="java.util.*" pageEncoding="gbk" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page import="com.nano.supermarket.entity.*"  %>
<%@ page import="com.nano.supermarket.database.*" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>供应商的更新操作</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  <!-- js判断输入是否合法-->
  <script type="text/javascript">
  function check(){
    var supplierName=document.getElementById("supplierName").value;
	if(supplierName==""){
	alert("供应商名称不能为空，请输入！");
	return false;
	}
	var sd=document.getElementById("sd").value;
	if(sd==""){
	alert("供应商描述不能为空，请输入！");
	return false;
	}
	var linkMan =document.getElementById("linkMan").value;
	if(linkMan=="")
	{
	alert("联系人不能为空，请输入！");
	return false;
	}
	for(var i=0;i<linkMan.length;i++){
	var j=linkMan.substring(i,i+1);
	if(isNaN(j)==false){
		alert("联系人中不能包含数字，请重新输入！");
		return false;
		}
	}
	var tel=document.getElementById("tel").value;
	var partten = /^1[3,5]\d{9}$/;

	if(tel==""){
         alert("电话不能为空！");
          return false;
	}
	if(!partten.test(tel)){
      alert("电话输入错误，请重新输入");
	  return false;
}
	var address=document.getElementById("address").value;
	if(address==""){
	alert("地址不能为空！");
	return false;
	}
	return true;
	
  
  }
  
  </script>
  <!-- 判断是否已经登录 -->
  <% if( session.getAttribute("username")==null){
           out.println("<script type=\"text/javascript\">");
			out.println("alert(\"您还没有登陆！请登陆！\");");
			out.println("open(\"index.jsp\",\"_self\");");
			out.println("</script>");
			
}
%>
  <%
  /*
  *初始化对象Supplier
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
  *进行更新操作
  */
  	String update = request.getParameter("update");		
		if(update != null){
			boolean isUpdated = update.equals("insert")?(SupplierOperation.insert(supplier)):(SupplierOperation.update(supplier));
			if(isUpdated){
  				out.println("<script type=\"text/javascript\">");
				out.println("alert(\"更新成功\");");
				out.println("open(\"Supplier_Manage.jsp\",\"_self\");");
				out.println("</script>");
  			}
  			else{
  				out.println("<script type=\"text/javascript\">");
				out.println("alert(\"更新失败！\");");
				out.println("open(\"Supplier_Manage.jsp\",\"_self\");");
				out.println("</script>");
  			}
  			return;
		}
		/*
  		 * 如果action是delete则执行删除
  		 */
		String action = request.getParameter("action");
  		if(action != null){
  			if(action.equals("delete")){  			
	  			if(SupplierOperation.delete(supplier)){
	  				out.println("<script type=\"text/javascript\">");
				    out.println("alert(\"删除成功！\");");
					out.println("open(\"Supplier_Manage.jsp\",\"_self\");");
					out.println("</script>"); 
	  			}
	  			else{
					 out.println("<script type=\"text/javascript\">");
						out.println("alert(\"删除失败！\");");
						out.println("open(\"Supplier_Manage.jsp\",\"_self\");");
						out.println("</script>");
	  			}
	  			return;
	  		}
  		}
  		/*
  		 * 设置update隐藏控件的值
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
		<td>供应商名称:
		</td>
		<td><input id="supplierName" type="text" name="supplierName" value="${pageScope.supplierName}">
		</td></tr>
		<tr><td>
		 供应商描述:</td><td> <textarea id="sd" name="supplierDescrible" >${pageScope.supplierDescrible}</textarea></td></tr> 
		<!--供应商描述:</td><td><input type="text" name="supplierDescrible" value="${pageScope.supplierDescrible}"> </td></tr>  -->
		<tr><td>
		联系人:</td>
		<td><input id="linkMan" type="text" name="linkMan" value="${pageScope.linkMan}"> </td></tr>
		<tr><td>
		电话:</td><td><input id="tel" type="text" name="telphone" value="${pageScope.telphone}"> </td></tr>
        <tr><td>
		地址:</td><td><input id="address" type="text" name="address" value="${pageScope.address}"> </td></tr>
	<tr><td></td><td>
		<input type="submit" value="提交"></td></tr>
		</table>
	</form>
  </body>
</html>
