<%@ page language="java" import="java.util.*" pageEncoding="gbk" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page import="com.nano.supermarket.entity.*" %>
<%@ page import="com.nano.supermarket.database.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>��Ӧ�̹���</title>
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
	alert("��Ӧ�����Ʋ���Ϊ�գ�");
	return false;
	}
	var supplierDescrible=document.getElementById("supplierDescrible").value;
	if(supplierDescrible==""){
	alert("��Ӧ����������Ϊ�գ�");
	return false;
	}
	return true;
	}
	</script>
  <!-- �ж��Ƿ��ѵ�¼ -->
<% if( session.getAttribute("username")==null){
           out.println("<script type=\"text/javascript\">");
			out.println("alert(\"����û�е�½�����½��\");");
			out.println("open(\"index.jsp\",\"_self\");");
			out.println("</script>");
			return;
}

%>
  </head>

<%
//����û����޴�Ȩ�� 
     if(!USOperation.selectPower(session.getAttribute("username").toString()).equals("����Ա")){
    	   out.println("<script type=\"text/javascript\">");
    	   out.println("alert(\"����Ȩ�˲���\")");
    	   out.println("open(\"main_1.jsp\",\"_self\");");
    	   out.println("</script>");
    	   return;
    	  
     }

%>
  
  <%//�����ݿ��еõ���Ӧ�̵�����  
      List<Supplier> suppliers=SupplierOperation.select();
      /*
      *�õ���Ҫ��ѯ������ 
      */
      String supplierName=request.getParameter("supplierName");
      supplierName=supplierName==null?null:new String (supplierName.getBytes("ISO-8859-1"),"gbk");
      pageContext.setAttribute("supplierName",supplierName);
      String supplierDescrible=request.getParameter("supplierDescrible");
      supplierDescrible=supplierDescrible==null?null:new String (supplierDescrible.getBytes("ISO-8859-1"),"gbk");
      pageContext.setAttribute("supplierDescrible",supplierDescrible);
      /**
      *������ϲ�ѯ������ ��Ϣ
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
	   out.println("alert(\"��ѯ���󲻴��ڣ������²�ѯ��\");");
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
   <font> ��Ӧ������</font>
   <input id="supplierName" type="text" name="supplierName" value="${pageScope.supplierName}"/></td>
   <td>
   <font>��Ӧ������</font> 
   <input id="supplierDescrible" type="text" name="supplierDescrible" value="${pageScope.supplierDescrible}"/>
   </td>
  <td>
<font>
  <input type="submit" name="Submit" value="��ϲ�ѯ" /> </font>
 </td>
 </tr>
 </table>
 </div>
</form> 
  <div class=top>��Ӧ�̹���<img src="mainimage/jiantou.jpg">
  <a href="Supplier_Manage_Update.jsp">��������</a>

  </div>
  <hr>
  <div class=table>
  <table border="5" bordercolor="#2D95D2" cellpadding="0" cellspacing="0">
  <TR>
  <td >���</td>
  <td >��Ӧ������</td>
  <td >��Ӧ������</td>
  <td>��ϵ��</td>
  <td>�绰</td>
  <td>��ַ</td>
  <td>����</td>
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
          <a href="Supplier_Manage_Update.jsp?supplierId=${db_supplier.supplierId}&&supplierName=${db_supplier.supplierName}&&supplierDescrible=${db_supplier.supplierDescrible}&&linkMan=${db_supplier.linkMan}&&telphone=${db_supplier.telphone}&&address=${db_supplier.address}">�޸�</a>
          <a href="Supplier_Manage_Update.jsp?action=delete&&supplierId=${db_supplier.supplierId}&&supplierName=${db_supplier.supplierName}&&supplierDescrible=${db_supplier.supplierDescrible}&&linkMan=${db_supplier.linkMan}&&telphone=${db_supplier.telphone}&&address=${db_supplier.address}" >ɾ��</a>
          </td>
           <tr/>
        </c:forEach>       
        </tr>    
  </table>
  </div>
  </body>
</html>
