<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page import="com.nano.supermarket.database.*" %>
<%@ page import="com.nano.supermarket.entity.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>   
    <title>欢迎您</title>    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/maincss.css" type="text/css" rel="stylesheet" />
</head>
<body>
  
  <% if( session.getAttribute("username")==null){
           out.println("<script type=\"text/javascript\">");
			out.println("alert(\"您还没有登陆！请登陆！\");");
			out.println("open(\"index.jsp\",\"_self\");");
			out.println("</script>");
			return;
}
%>
<div class="top"><font>超市账单管理系统</font><span>欢迎您<% out.println(session.getAttribute("username")) ;%></span></div>
  <table width="100%" height="700" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td width="20%" height="100%" bordercolor="#FFFFFF" valign="top"><ul>
           <li id="left_1"><img src="mainimage/left1.jpg" /><a href="Bill_Manage.jsp"  target="mainFrame">账单管理</a></li>
          <li id="left_2"><img src="mainimage/left2.jpg" /><a href="Supplier_Manage.jsp" target="mainFrame">供应商管理</a></li>
          <li id="left_3"><img  src="mainimage/left3.jpg"/>
          <% 
          if(USOperation.selectPower(session.getAttribute("username").toString()).equals("管理员"))
            out.println("<a href=\"User_Manage.jsp\" target=\"mainFrame\">用户管理</a>");
         else{
         out.println("<a href=\"NormalUser_Manage.jsp\" target=\"mainFrame\" >用户管理</a>");
         }
           %> 
           </li>    
          <li id="left_4"><img src="mainimage/left4.jpg" /><a href="Exit.jsp">退出系统</a></li>
        </ul>
      </td>
	  <td  width="5%">
	  <div class="bar"></div>
	  </td>
      <td width="75%"  valign="top"><iframe src="main_1.jsp"   name="mainFrame" frameborder="0" marginheight="0" marginwidth="0" height="700" width="100%"></iframe></td>
    </tr>
</table>
</body>
</html>