<%@ page language="java" import="java.util.*" pageEncoding="gbk" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page import="com.nano.supermarket.entity.*" %>
<%@ page import="com.nano.supermarket.database.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
    <title>�û���Ĺ���</title>
    
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
        .top img{ margin-right:480px;}
     .combine{ background:url(mainimage/combine.jpg) repeat-x;}
     .combine font{ margin-left:50px; color:#FFFFFF;}
	</style>
	<script type="text/javascript">
	function check(){
	var userName=document.getElementById("userName").value;
	if(userName==""){
	alert("�û�������Ϊ�գ�");
	return false;
	}
	return true;
	}
	</script>
  </head>
  <!--����û��Ƿ��Ѿ���¼ -->
<% if( session.getAttribute("username")==null){
           out.println("<script type=\"text/javascript\">");
			out.println("alert(\"����û�е�½�����½��\");");
			out.println("open(\"index.jsp\",\"_self\");");
			out.println("</script>");
			return;
}
%>

  
  <% 
  List<US> users=USOperation.select();
   /**
   *�õ�Ҫ��ѯ������userName
   */
  String userName=request.getParameter("userName");
   userName=userName==null?null:new String(userName.getBytes("ISO-8859-1"),"gbk");
   pageContext.setAttribute("userName",userName);

   /**
   *��bills��ɾѡ���������� �ģ�����һ��List<Bill> �������շ��������� 
   */
   List< US> selectUS=null;
  if(userName!=null){
	   selectUS=new ArrayList<US>();
  int j=0;
   for(int i=0;i<users.size();i++){
	   if(userName.equals(users.get(i).getUserName())){
	       selectUS.add(j,users.get(i));
	       j++;
	   }
  }
   if(j==0){
	   out.println("<script type=\"text/javascript\">");
	   out.println("alert(\"��ѯ���󲻴��ڣ������²�ѯ��\");");
	   out.println("open(\"User_Manage.jsp\",\"_self\");");
	   out.println("</script>");
	   return;
   }
   }
   else{
	   selectUS=users;
  }  
   pageContext.setAttribute("selectUS",selectUS);
  %>
  
  <body>
    <form  name="combineSelect" action="User_Manage.jsp" onSubmit="return check();">
   <div class="combine">
   <table><tr><td>
   <font> �û���</font>
   <input id="userName" type="text" name="userName" value="${pageScope.userName}"/></td>
  <td>
<font>
  <input type="submit" name="Submit" value="��ϲ�ѯ" /> </font>
 </td>
 </tr>
 </table>
 </div>
</form> 
  <div class=top>�û�����<img src="mainimage/jiantou.jpg">
  <a href="User_Manage_Insert.jsp">��������</a>

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
  <td>����</td>
  </TR>
       <tr>
       <c:forEach var="db_user" items="${pageScope.selectUS}">
          <td>${db_user.userId}</td>
          <td>${db_user.userName}</td>
          <td>${db_user.sex}</td>
          <td>${db_user.age}</td>
          <td>${db_user.telphone}</td>
          <td>${db_user.address}</td>
          <td>${db_user.power}</td>
          <td>${db_user.passWord}</td>
          <td>
          <a href="User_Manage_UpdateAndDelete.jsp?userId=${db_user.userId}&&userName=${db_user.userName}&&sex=${db_user.sex}&&age=${db_user.age}&&telphone=${db_user.telphone}&&address=${db_user.address}&&power=${db_user.power}" >�޸�</a>
          <a href="User_Manage_UpdateAndDelete.jsp?action=delete&&userId=${db_user.userId}&&userName=${db_user.userName}&&sex=${db_user.sex}&&age=${db_user.age}&&telphone=${db_user.telphone}&&address=${db_user.address}&&power=${db_user.power}" >ɾ��</a>
          <a href="User_Manage_UpdatePD.jsp?userId=${db_user.userId}&&passWord=${db_user.passWord}&&userName=${db_user.userName}">�޸�����</a>
          </td>
           <tr/>
        </c:forEach> 
        </tr>
        
  </table>
  </div>
  </body>
</html>
