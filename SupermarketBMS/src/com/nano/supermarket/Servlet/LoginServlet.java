package com.nano.supermarket.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nano.supermarket.database.USOperation;
import com.nano.supermarket.entity.*;
@SuppressWarnings("serial")
public class LoginServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public LoginServlet() {
		super();
	}

	/**
	 * servlet的消亡 
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * servlet的doGet方法
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

	/**
	 * Servlet的doPost方法
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=gbk");
		PrintWriter out = response.getWriter();
		String user="";
		user=request.getParameter("username");
		user=user==null?null:new String(user.getBytes("ISO-8859-1"),"gbk");
		String passWord="";
		passWord=request.getParameter("password");
		List<US> users=USOperation.select();
		int n=0;
		for (int i = 0; i < users.size(); i++) {
			if(user.equals(users.get(i).getUserName())&&passWord.equals(users.get(i).getPassWord())){
				HttpSession session=request.getSession(true);
				session.setAttribute("username", user);
				session.setAttribute("password",passWord );
				RequestDispatcher view =request.getRequestDispatcher("main.jsp");
				view.forward(request, response);
				break;
			}
			else{
				n++;	
			}		
		}

		if(n==users.size()){
//			response.sendRedirect("DisplayError.jsp");
			out.println("<script type=\"text/javascript\">");
			out.println("alert(\"登陆失败！请重新登陆！\");");
			out.println("open(\"index.jsp\",\"_self\");");
			out.println("</script>");
			
		}
	
		out.flush();
		out.close();
	}

	/**
	 * 初始化
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
