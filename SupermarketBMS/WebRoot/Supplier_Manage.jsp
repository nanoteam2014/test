<%@ page language="java" import="java.util.*" pageEncoding="gbk" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page import="com.nano.supermarket.entity.*" %>
<%@ page import="com.nano.supermarket.database.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>供应商管理</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
	td{ border-color:#999999;
	text-align:center}
	.top{ font-size:28px;
	       color:#666666;
          margin-top:20px;}
      .top img{margin-right:480px;}
	   .combine{ background:url(mainimage/combine.jpg) repeat-x;}
     .combine font{ margin-left:50px; color:#FFFFFF;}
	</style>
		<script type="text/javascript">
	function check(){
	var supplierName=document.getElementById("supplierName").value;
	if(supplierName==""){
	alert("供应商名称不能为空！");
	return false;
	}
	var supplierDescrible=document.getElementById("supplierDescrible").value;
	if(supplierDescrible==""){
	alert("供应商描述不能为空！");
	return false;
	}
	return true;
	}
	</script>
  <!-- 判断是否已登录 -->
<% if( session.getAttribute("username")==null){
           out.println("<script type=\"text/javascript\">");
			out.println("alert(\"您还没有登陆！请登陆！\");");
			out.println("open(\"index.jsp\",\"_self\");");
			out.println("</script>");
			return;
}

%>
  </head>

<%
//检查用户有无此权限 
     if(!USOperation.selectPower(session.getAttribute("username").toString()).equals("管理员")){
    	   out.println("<script type=\"text/javascript\">");
    	   out.println("alert(\"你无权此操作\")");
    	   out.println("open(\"main_1.jsp\",\"_self\");");
    	   out.println("</script>");
    	   return;
    	  
     }

%>
  
  <%//从数据库中得到供应商的资料  
      List<Supplier> suppliers=SupplierOperation.select();
      /*
      *得到需要查询的条件 
      */
      String supplierName=request.getParameter("supplierName");
      supplierName=supplierName==null?null:new String (supplierName.getBytes("ISO-8859-1"),"gbk");
      pageContext.setAttribute("supplierName",supplierName);
      String supplierDescrible=request.getParameter("supplierDescrible");
      supplierDescrible=supplierDescrible==null?null:new String (supplierDescrible.getBytes("ISO-8859-1"),"gbk");
      pageContext.setAttribute("supplierDescrible",supplierDescrible);
      /**
      *输出符合查询条件的 信息
      */
         List< Supplier> selectSuppliers=null;
      if(supplierName!=null&&supplierDescrible!=null){
	    selectSuppliers=new ArrayList<Supplier>();
      int j=0;
      for(int i=0;i<suppliers.size();i++){
	   if(supplierName.equals(suppliers.get(i).getSupplierName())&&supplierDescrible.equals(suppliers.get(i).getSupplierDescrible())){
	       selectSuppliers.add(j,suppliers.get(i));
	       j++;
	   }
   }
      if(j==0){
	   out.println("<script type=\"text/javascript\">");
	   out.println("alert(\"查询对象不存在，请重新查询！\");");
	   out.println("open(\"Supplier_Manage.jsp\",\"_self\");");
	   out.println("</script>");
	   return;
   }
   }
   else{
	   selectSuppliers=suppliers;
   }  
   pageContext.setAttribute("selectSuppliers",selectSuppliers);

  %>
  
  <body>
    <form  name="combineSelect" action="Supplier_Manage.jsp" onSubmit="return check();">
   <div class="combine">
   <table><tr><td>
   <font> 供应商名称</font>
   <input id="supplierName" type="text" name="supplierName" value="${pageScope.supplierName}"/></td>
   <td>
   <font>供应商描述</font> 
   <input id="supplierDescrible" type="text" name="supplierDescrible" value="${pageScope.supplierDescrible}"/>
   </td>
  <td>
<font>
  <input type="submit" name="Submit" value="组合查询" /> </font>
 </td>
 </tr>
 </table>
 </div>
</form> 
  <div class=top>供应商管理<img src="mainimage/jiantou.jpg">
  <a href="Supplier_Manage_Update.jsp">增加数据</a>

  </div>
  <hr>
  <div class=table>
  <table border="5" bordercolor="#2D95D2" cellpadding="0" cellspacing="0">
  <TR>
  <td >编号</td>
  <td >供应商名称</td>
  <td >供应商描述</td>
  <td>联系人</td>
  <td>电话</td>
  <td>地址</td>
  <td>操作</td>
  </TR>
       <tr>
       <c:forEach var="db_supplier" items="${pageScope.selectSuppliers}">
          <td>${db_supplier.supplierId}</td>
          <td>${db_supplier.supplierName}</td>
          <td>${db_supplier.supplierDescrible}</td>
          <td>${db_supplier.linkMan}</td>
          <td>${db_supplier.telphone}</td>
          <td>${db_supplier.address}</td>
          <td>
          <a href="Supplier_Manage_Update.jsp?supplierId=${db_supplier.supplierId}&&supplierName=${db_supplier.supplierName}&&supplierDescrible=${db_supplier.supplierDescrible}&&linkMan=${db_supplier.linkMan}&&telphone=${db_supplier.telphone}&&address=${db_supplier.address}">修改</a>
          <a href="Supplier_Manage_Update.jsp?action=delete&&supplierId=${db_supplier.supplierId}&&supplierName=${db_supplier.supplierName}&&supplierDescrible=${db_supplier.supplierDescrible}&&linkMan=${db_supplier.linkMan}&&telphone=${db_supplier.telphone}&&address=${db_supplier.address}" >删除</a>
          </td>
           <tr/>
        </c:forEach>       
        </tr>    
  </table>
  </div>
  </body>
</html>
