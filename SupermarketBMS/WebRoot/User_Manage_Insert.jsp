<%@ page language="java" import="java.util.*" pageEncoding="gbk" isELIgnored="false"%>
<%@ page import="com.nano.supermarket.entity.US" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page import="com.nano.supermarket.database.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>   
    <title>US�Ĳ���</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript">
	function check(){
	var username=document.getElementById("username").value;
	if(username==""){
	alert("�û�������Ϊ�գ�");
	return false;
	}
	var age=parseInt(document.getElementById("age").value);
	if(age<=0 || age>120)
	{ 
	alert("���������������������");
	return false;
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
	var pwd=document.getElementById("pwd").value;
	var rpwd=document.getElementById("rpwd").value;
	if(pwd==""){
	alert("���벻��Ϊ�գ�");
	return false;
	}
	if(pwd.length<5){
		alert("��������Ϊ5λ�����������룡");
		return false;
	}
	if(pwd!=rpwd){
	alert("�����������벻һ�£����������룡");
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
  		 * ��ʼ��һ��US����
  		 */ 
  		US user = new US();
	  	//userId
  		String userId = request.getParameter("userId");  	
	  	if( userId!=null && !userId.equals("")){
	  		user.setUserId(Long.valueOf(userId));		
	  	}   
	  	 //userName
  		String userName = request.getParameter("userName"); 	
  		userName = userName==null?null:new String(userName.getBytes("ISO-8859-1"), "gbk");
  		user.setUserName(userName);
  		//sex
  		String sex = request.getParameter("sex"); 	
  		sex = sex==null?null:new String(sex.getBytes("ISO-8859-1"), "gbk");
  		user.setSex(sex);
  		 System.out.println(sex);
	  	//age
  		String age = request.getParameter("age"); 
	  	try{
  		if(age!=null && !age.equals("")){
			user.setAge(Integer.valueOf(age));
  		    }
	  	}catch(Exception e){
	  	out.println("<script type=\"text/javascript\">");
			out.println("alert(\"����������� ������������ ��\");");
			out.println("open(\"User_Manage_Insert.jsp\",\"_self\");");
			out.println("</script>");
			return;
	  	}
  		//telphone
  		String telphone = request.getParameter("telphone"); 
  		user.setTelphone(telphone);
  		//address
  		String address = request.getParameter("address"); 
  		 address = address==null?null:new String(address.getBytes("ISO-8859-1"), "gbk");
  		user.setAddress(address);
  		//power
  		String power = request.getParameter("power"); 
         power = power==null?null:new String(power.getBytes("ISO-8859-1"), "gbk");
        user.setPower(power);
       // System.out.println(power);
        //passWord
        String passWord = request.getParameter("passWord"); 
         passWord = passWord==null?null:new String(passWord.getBytes("ISO-8859-1"), "gbk");
         user.setPassWord(passWord);
        /**
        *ִ��insert����
        */
  
		 /**
		 *�жϲ�����û����Ƿ��Ѵ��� ��������������ʧ�ܣ�
		 */
		 if(userName!=null){
			 List<US> users=USOperation.select();
			 for( int i=0; i<users.size();i++){
			
				 if(userName.equals(users.get(i).getUserName())){
					 out.println("<script type=\"text/javascript\">");
       			  out.println("alert(\"�û�������� ��\");");
       			  out.println("open(\"User_Manage_Insert.jsp\",\"_self\");");
       			  out.println("</script>");
       		
       			  return;
				 }
			 }
		 }
        String insert=request.getParameter("insert");
        if(insert!=null){
        		 if(USOperation.insert(user)){
        	          out.println("<script type=\"text/javascript\">");
        	          out.println("alert(\"����ɹ���\");");
        	          out.println("open(\"User_Manage.jsp\",\"_self\");");
        	          out.println("</script>");
        	        }
        	        else{
        	          out.println("<script type=\"text/javascript\">");
        			  out.println("alert(\"����ʧ�ܣ�\");");
        			  out.println("open(\"User_Manage.jsp\",\"_self\");");
        			  out.println("</script>");
        			  
        		
        	}
        }
        
   
		  /*
		  *����insert���ؿؼ���ֵ
		  */
		  pageContext.setAttribute("userId",userId);
		  pageContext.setAttribute("userName",userName);
		  pageContext.setAttribute("sex",sex);
		  pageContext.setAttribute("age",age);
		  pageContext.setAttribute("telphone",telphone);
		  pageContext.setAttribute("address",address);
		  pageContext.setAttribute("power",power);
		  pageContext.setAttribute("passWord",passWord);

	
		  
       
         %>
       
  </head>
  
  <body> 
  <form action="User_Manage_Insert.jsp" onSubmit="return check();">
  <table>
  <tr>
  <td><input type="hidden" name="insert" value="${pageScope.insert}"></td>
  <td> <input type="hidden" name="userId" value="${pageScope.userId}"></td>
  </tr>
  <tr>
  <td>�û���:</td>
  <td><input id="username" type="text" name="userName" value="${pageScope.userName}"></td>
  </tr>
  <tr>
  <td>�Ա�:</td>
  <td><select name="sex" >

  <option  value="��">��</option>
  <option  value="Ů">Ů</option></select></td>
  </tr>
   <tr>
  <td>����:</td>
  <td><input id="age" type="text" name="age" value="${pageScope.age}"></td>
  </tr>
   <tr>
  <td>�绰:</td>
  <td><input id="tel" type="text" name="telphone" value="${pageScope.telphone}"></td>
  </tr>
   <tr>
  <td>��ַ:</td>
  <td><input  id="address" type="text" name="address" value="${pageScope.address}"></td>
  </tr>
   <tr>
  <td>Ȩ��:</td>
  <td><input  type="radio" name="power" value="����Ա">����Ա
  <input type="radio" name="power" value="��ͨ��Ա" checked="checked">��ͨ��Ա</td>
  </tr>
   <tr>
  <td>����:</td>
  <td><input id="pwd" type="password" name="passWord" value="${pageScope.passWord}"></td>
  </tr>
   <tr>
  <td>ȷ������:</td>
  <td><input  id="rpwd" type="password" name="passWord1" value="${pageScope.passWord}"></td>
  </tr>
  <tr><td></td>
  <td><input type="submit" value="�ύ"></td>
  </tr>
  </table>
  </form>

  </body>
</html>
