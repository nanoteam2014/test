<%@ page language="java" import="java.util.*" pageEncoding="gbk" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page import="com.nano.supermarket.database.*" %> 
<%@ page import="com.nano.supermarket.entity.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    <title>US�������޸�</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  <script type="text/javascript">
  function check(){
	  var isUpdate=true;
	 //alert(document.getElementById("password").value);
     var opwd=document.getElementById("opwd").value;
     //alert(opwd);
	 if(opwd==""){
	   alert("�����벻��Ϊ�գ�");
	   isUpdate=false;
	  return isUpdate;   
	 }
     if(opwd!=document.getElementById("password").value){
        alert("�������������");
       isUpdate=false;	  return isUpdate;
		 }

	 var pwd =document.getElementById("pwd").value;
	 if(opwd==pwd){
      alert("�������������һ�������������������룡");
      return false;
		 }
	 if(pwd==""){
	 alert("�����벻��Ϊ�գ�");
	 isUpdate=false;	  return isUpdate;
	 }
	 if(pwd.length<5){
	 alert("���벻������5λ");
	 isUpdate=false;	  return isUpdate;
	 }
	  var rpwd=document.getElementById("rpwd").value;
	  if(rpwd!=pwd){
	  alert("�����������벻һ��!");
	  isUpdate=false;	  return isUpdate;
	  }
	  return isUpdate;
	  
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
        //passWord
        String passWord = request.getParameter("passWord"); 
         passWord = passWord==null?null:new String(passWord.getBytes("ISO-8859-1"), "gbk");
        user.setPassWord(passWord);
  
       /**
       *ִ��update���� 
       */
       String update=request.getParameter("update");
       if(update!=null){
    	   if(USOperation.selectPower(session.getAttribute("username").toString()).equals("����Ա")){
    	      if(session.getAttribute("username").equals(userName)){
               if( USOperation.updatePD(user)){
                      out.println("<script type=\"text/javascript\">");
        	          out.println("alert(\"���³ɹ���\");");
        	          out.println("alert(\"�����µ�¼��\")");
        	          out.println("open(\"index.jsp\",\"_parent\");");
        	          out.println("</script>");
              }
              else{
                      out.println("<script type=\"text/javascript\">");
        	          out.println("alert(\"����ʧ�ܣ�\");");
        	          out.println("open(\"User_Manage.jsp\",\"_self\");");
        	          out.println("</script>");
                  }
    	      }
    	      else{
    	    	  if( USOperation.updatePD(user)){
                      out.println("<script type=\"text/javascript\">");
        	          out.println("alert(\"���³ɹ���\");");
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
    	
    }
    	   else{
    		      if( USOperation.updatePD(user)){
                      out.println("<script type=\"text/javascript\">");
        	          out.println("alert(\"���³ɹ���\");");
        	          out.println("alert(\"�����µ�¼��\")");      
        	         out.println("window.open(\"index.jsp\" ,\"_parent\");");
         	          out.println("</script>");
        	
              }
              else{
                      out.println("<script type=\"text/javascript\">");
        	          out.println("alert(\"����ʧ�ܣ�\");");
        	          out.println("open(\"NormalUser_Manage.jsp\",\"_self\");");
        	          out.println("</script>");
                  }	   
    	   }
       }
           /*
		  *����action���ؿؼ���ֵ
		  */
		  pageContext.setAttribute("userId",userId);
		  pageContext.setAttribute("userName",userName);
		  pageContext.setAttribute("sex",sex);
		  pageContext.setAttribute("age",age);
		  pageContext.setAttribute("telphone",telphone)
		  ;pageContext.setAttribute("address",address);
		  pageContext.setAttribute("power",power);
		  pageContext.setAttribute("passWord",passWord);
		  
%>
  <body> 
  <form action="User_Manage_UpdatePD.jsp" onSubmit="return check();">
  <table>
  <tr><td><input type="hidden" name="update" value="${pageScope.update}"></td>
  <td> <input type="hidden" name="userId" value="${pageScope.userId}">
  <input id="password" type="hidden" name="passWord1" value="${pageScope.passWord}">
  <input id="userName" type="hidden" name="userName" value="${pageScope.userName}"></td>
  </tr>
  <tr><td>������</td>
  <td><input id="opwd" type="password" name="oldPassWord" ></td>

  </tr>
   
  <tr><td>������</td>
  <td><input id="pwd" type="password" name="passWord" ></td>
  </tr>

  <tr><td>ȷ������</td>
  <td><input id="rpwd" type="password" name="NewPassWord" ></td>
  </tr>
    
  <tr><td></td>
  <td><input type="submit" name="�ύ" value="�ύ"></td>
  </tr>
  </table>
  </form>  
  </body>
</html>
