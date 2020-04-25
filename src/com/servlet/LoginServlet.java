package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.beans.AdminInfo;
import com.dao.AdminDao;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private AdminDao _adminDao=new AdminDao();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String adminName=request.getParameter("adminName");
		String password=request.getParameter("password");
		
		AdminInfo admin=_adminDao.login(adminName,password);
		String state=_adminDao.getState(adminName, password);
		response.setContentType("text/html;charset=utf-8");
		if(admin!=null) {		
			 if("2".equals(state)) {
				response.getWriter().print("2");
			}
			else {
				response.getWriter().print("1");
				  request.setAttribute("adminName","adminName"); 
			}
		}
		else {
			response.getWriter().print("0");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}