<%@ page language="java" import="java.util.*" pageEncoding="gbk" isELIgnored="false"%>
<%@ page import="com.nano.supermarket.entity.US" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page import="com.nano.supermarket.database.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>US���޸���ɾ��</title>    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- javascript���������֤ -->
	<script type="text/javascript">
	function check(){
	var name=document.getElementById("name").value;
	if(name==""){
	alert("�û�������Ϊ�գ������룡");
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
	}
	
	
	</script>
	<!-- �ж��Ƿ��Ѿ���¼�� -->
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
  		//System.out.println(userName);
  		//String userName1 = request.getParameter("userName1"); 	
  		//userName1 = userName1==null?null:new String(userName1.getBytes("ISO-8859-1"), "gbk");
  	 //   if(userName1!=null){	
  	//   	System.out.println(userName1);
  	//    if(userName1.equals(userName)){
  	//		userName=userName1;
  	//		user.setUserName(userName);
  	//	}
  	 //   else {
  	//    	List<US> users=USOperation.select();
 	//		 for( int i=0; i<users.size();i++){
 	//		
 	///			 if(userName1.equals(users.get(i).getUserName())){
 	//				 out.println("<script type=\"text/javascript\">");
    //    			  out.println("alert(\"�û�������� ��\");");
    ///    			  out.println("open(\"User_Manage.jsp\",\"_self\");");
    //    			  out.println("</script>");
    //    			  return;
 	//			 }
 	//		 }
  	//    }
  //	}
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
			out.println("open(\"User_Manage_UpdateAndDelete.jsp\",\"_self\");");
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
           if( USOperation.update(user)){
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
    	   else {
    		   if( USOperation.update(user)){
                   out.println("<script type=\"text/javascript\">");
     	          out.println("alert(\"���³ɹ���\");");
     	          out.println("open(\"NormalUser_Manage.jsp\",\"_self\");");
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
       /**
       * ���action��delete����ɾ������
       */
       String action =request.getParameter("action");
       if(action!=null){
            if(action.equals("delete")){
                if(USOperation.delete(user)){
                 out.println("<script type=\"text/javascript\">");
        	          out.println("alert(\"ɾ���ɹ���\");");
        	          out.println("open(\"User_Manage.jsp\",\"_self\");");
        	          out.println("</script>");
                }   
                else {
                      out.println("<script type=\"text/javascript\">");
        	          out.println("alert(\"ɾ���ɹ���\");");
        	          out.println("open(\"User_Manage.jsp\",\"_self\");");
        	          out.println("</script>");
                }         
            }   
            return;   
        }
  /*
		  *����action���ؿؼ���ֵ
		  */
		  pageContext.setAttribute("update",action);
		  pageContext.setAttribute("userId",userId);
		  pageContext.setAttribute("userName",userName);
		  pageContext.setAttribute("sex",sex);
		  pageContext.setAttribute("age",age);
		  pageContext.setAttribute("telphone",telphone);
		  pageContext.setAttribute("address",address);
		  pageContext.setAttribute("power",power);

        %>


  </head>
  
  <body>
  <form action="User_Manage_UpdateAndDelete.jsp" onSubmit="return check();">
  <table>
  <tr>
  <td><input type="hidden" name="update" value="${pageScope.update}"></td>
  <td> <input type="hidden" name="userId" value="${pageScope.userId}"></td>
  </tr>
  
<tr>
 <!-- <td>�û���:</td>-->
  <td><input id= "name" type="hidden" name="userName" value="${pageScope.userName}"></td>
  </tr>
  <tr>
  <td>�Ա�:</td>
  <td><select name="sex" >
  <% 
  if(sex.equals("��")){
	  out.println("<option selected=\"selected\">��</option>");
	  out.println("<option>Ů</option>");  
  }
  else{
	  out.println("  <option >��</option>");
	  out.println("<option selected=\"selected\">Ů</option>");  
	  
  }
  %>
</select></td>
  </tr>
   <tr>
  <td>����:</td>
  <td><input id ="age" type="text" name="age" value="${pageScope.age}"></td>
  </tr>
   <tr>
  <td>�绰:</td>
  <td><input  id="tel" type="text" name="telphone" value="${pageScope.telphone}"></td>
  </tr>
   <tr>
  <td>��ַ:</td>
  <td><input  id= "address" type="text" name="address" value="${pageScope.address}"></td>
  </tr>

  <% 
    if(session.getAttribute("username").equals("����Ա")){
    out.println("<tr>"); 
    out.println("<td>Ȩ��:</td>");
    out.println("<td>");
    if( power.equals("����Ա")){
    	out.println("<input type=\"radio\" name=\"power\" value=\"${pageScope.power}\" checked=\"checked\">����Ա");
    	out.println("<input type=\"radio\" name=\"power\" value=\"${pageScope.power}\" >��ͨ��Ա");
    }
    else{
    	out.println("<input type=\"radio\" name=\"power\" value=\"${pageScope.power}\" >����Ա");
    	out.println("<input type=\"radio\" name=\"power\" value=\"${pageScope.power}\" checked=\"checked\" >��ͨ��Ա");
    }
    out.println("</td></tr>");
    }
  %>
  <tr><td></td>
  <td><input type="submit" value="�ύ"></td>
  </tr>
  </table>
  </form>
 
  </body>
</html>
