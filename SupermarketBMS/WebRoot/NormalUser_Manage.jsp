<%@ page language="java" import="java.util.*" pageEncoding="gbk" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page import="com.nano.supermarket.entity.*" %>
<%@ page import="com.nano.supermarket.database.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'NormalUser_Manage.jsp' starting page</title>
    
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
	</style>
  </head>
<% if( session.getAttribute("username")==null){
           out.println("<script type=\"text/javascript\">");
			out.println("alert(\"����û�е�½�����½��\");");
			out.println("open(\"index.jsp\",\"_self\");");
			out.println("</script>");
			return;
}
%>

  
  <% List<US> users=USOperation.select();
     US user=null;
     for(int i=0;i<users.size();i++){
       if( users.get(i).getUserName().equals(session.getAttribute("username"))){
       user=users.get(i);
       break;
     }
     }
  
   pageContext.setAttribute("user",user);
  %>
  
  <body>
  <div class=top>�û�����<img src="mainimage/jiantou.jpg">

  </div>
  <hr>
  <div class=table>
  <table border="5" bordercolor="#2D95D2" cellpadding="0" cellspacing="0">
  <TR>
  <td >���</td>
  <td >�û���</td>
  <td> �Ա�</td>
  <td >����</td>
  <td>�绰</td>
  <td>��ַ</td>
  <td>Ȩ��</td>

  <td>����</td>
  </TR>
       <tr>
       
          <td>${user.userId}</td>
          <td>${user.userName}</td>
          <td>${user.sex}</td>
          <td>${user.age}</td>
          <td>${user.telphone}</td>
          <td>${user.address}</td>
          <td>${user.power}</td>
          <td>
          <a href="User_Manage_UpdateAndDelete.jsp?userId=${user.userId}&&userName=${user.userName}&&sex=${user.sex}&&age=${user.age}&&telphone=${user.telphone}&&address=${user.address}&&power=${user.power}" >�޸�</a>
          <a href="User_Manage_UpdatePD.jsp?userId=${user.userId}&&passWord=${user.passWord}">�޸�����</a>
          </td>
 
        </tr>
        
  </table>
  </div>
  </body>
</html>
