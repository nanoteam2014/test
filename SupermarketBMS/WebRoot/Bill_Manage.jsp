<%@ page language="java" import="java.util.*" pageEncoding="gbk" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page import="com.nano.supermarket.entity.*" %>
<%@ page import="com.nano.supermarket.database.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>�˵�����</title>

	<style type="text/css">
	td{ border-color:#999999;
	text-align:center}
	.top{ font-size:28px;
	       color:#666666;
          margin-top:20px;
         }
     .top img{ margin-right:480px;}
     .combine{ background:url(mainimage/combine.jpg) repeat-x;}
     .combine font{ margin-left:50px; color:#FFFFFF;}
	</style>
	<script type="text/javascript">
	function check(){
	var goodsName=document.getElementById("goodsName").value;
	if(goodsName==""){
	alert("��Ʒ���Ʋ���Ϊ�գ�");
	return false;
	}
	return true;
	}
	</script>
  </head>
<!-- �ж��Ƿ��ѵ�¼ -->
<% if( session.getAttribute("username")==null){
           out.println("<script type=\"text/javascript\">");
			out.println("alert(\"����û�е�½�����½��\");");
			out.println("open(\"index.jsp\",\"_self\");");
			out.println("</script>");
			return;
}
%>

  
  <%
  //�õ����ݿ����˵���Ϣ 
  List<Bill> bills=BillOperation.selectBill();
   
   /**
   *�õ�Ҫ��ѯ������ goodsName��isPay
   */
  //goodsName
   String goodsName=request.getParameter("goodsName");
   goodsName=goodsName==null?null:new String(goodsName.getBytes("ISO-8859-1"),"gbk");
  //isPay
   String isPay=request.getParameter("isPay");
   isPay=isPay==null?null:new String (isPay.getBytes("ISO-8859-1"),"gbk");
  
   pageContext.setAttribute("goodsName",goodsName);
   pageContext.setAttribute("isPay",isPay);
   /**
   *��bills��ɾѡ���������� �ģ�����һ��List<Bill> �������շ��������� 
   */
   List< Bill> selectBills=null;
   if(isPay!=null&&goodsName!=null){
	    selectBills=new ArrayList<Bill>();
   int j=0;
   for(int i=0;i<bills.size();i++){
	   if(isPay.equals(bills.get(i).getIsPay())&&goodsName.equals(bills.get(i).getGoodsName())){
	       selectBills.add(j,bills.get(i));
	       j++;
	   }
   }
   if(j==0){
	   out.println("<script type=\"text/javascript\">");
	   out.println("alert(\"��ѯ���󲻴��ڣ������²�ѯ��\");");
	   out.println("open(\"Bill_Manage.jsp\",\"_self\");");
	   out.println("</script>");
	   return;
   }
   }
   else{
	   selectBills=bills;
   }  
   pageContext.setAttribute("selectBills",selectBills);
  %> 
  <body>
  <form  name="combineSelect" action="Bill_Manage.jsp" onSubmit="return check();">
   <div class="combine">
   <table><tr><td>
   <font> ��Ʒ����</font>
   <input id="goodsName" type="text" name="goodsName" value="${pageScope.goodsName}"/></td>
   <td>
   <font>�Ƿ񸶿�</font> <select name="isPay">
    <option value="��" selected>��</option>
    <option value="��">��</option>
    </select>
   </td>
  <td>
<font>
  <input type="submit" name="Submit" value="��ϲ�ѯ" /> </font>
 </td>
 </tr>
 </table>
 </div>
</form>  
  <div class=top>�˵�����<img src="mainimage/jiantou.jpg">
  <a href="Bill_Manage_Update.jsp">��������</a>
  </div>
  <hr>
  <div class=table>
  <table border="5" bordercolor="#2D95D2" cellpadding="0" cellspacing="0">
  <TR>
  <td >�˵����</td>
  <td >��Ʒ����</td>
  <td >��Ʒ����</td>
  <td >���׽��</td>
  <td>�Ƿ񸶿�</td>
  <td>��Ӧ������</td>
  <td>��Ʒ����</td>
  <td>�˵�ʱ��</td>
  <td>����</td>
  </TR>
       <tr>
       <c:forEach var="db_sbms" items="${pageScope.selectBills}">
          <td>${db_sbms.billId}</td>
          <td>${db_sbms.goodsName}</td>
          <td>${db_sbms.goodsNum}</td>
          <td>${db_sbms.money}</td>
          <td>${db_sbms.isPay}</td>
          <td>${db_sbms.supplierName}</td>
          <td>${db_sbms.goodsDescrible}</td>
          <td>${db_sbms.billTime}</td>
          <td>
          <a href="Bill_Manage_Update.jsp?billId=${db_sbms.billId}&&goodsName=${db_sbms.goodsName}&&goodsNum=${db_sbms.goodsNum}&&money=${db_sbms.money}
          &&isPay=${db_sbms.isPay}&&supplierName=${db_sbms.supplierName}&&goodsDescrible=${db_sbms.goodsDescrible}&&billTime=${db_sbms.billTime}" >�޸�</a>
          <a href="Bill_Manage_Update.jsp?action=delete&&billId=${db_sbms.billId}&&goodaName=${db_sbms.goodsName }&&goodsNum=${db_sbms.goodsNum}&&money=${db_sbms.money}
          &&isPay=${db_sbms.isPay}&&supplierName=${db_sbms.supplierName}&&goodsDescrible=${db_sbms.goodsDescrible}&& billTime=${db_sbms.billTime}}" >ɾ��</a>
          </td>
           <tr/>
        </c:forEach>
        </tr>
  </table>
  </div>
  </body>
</html>
