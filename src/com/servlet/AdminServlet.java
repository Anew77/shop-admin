package com.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.beans.AdminInfo;
import com.beans.MenuInfo;
import com.dao.AdminDao;
import com.dao.MenuDao;


@WebServlet("/AdminServlet.do")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AdminDao _adminDao=new AdminDao();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String flag=request.getParameter("flag");
		if("addAdmin".equals(flag)) {
			addAdmin(request, response);
		}
		if("getAdminList".equals(flag)) {
			getAdminList(request, response);
		}
		if("delAdmin".equals(flag)) {
			delAdmin(request, response);
		}
	}
	
//�����û�	
protected void addAdmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String adminName=request.getParameter("adminName");
	String password=request.getParameter("password");
	String note=request.getParameter("note");
	
	AdminInfo admin=new AdminInfo();
	admin.setAdminName(adminName);
	admin.setPassword(password);
	admin.setNote(note);
	admin.setState("1");//Ĭ��Ϊ1����
	//admin.setEditDate(editDate);  �������������ݿ�����ʱ���
	//admin.setRoleId(0);  Ĭ��û�н�ɫ
	
	int result=_adminDao.addAdmin(admin);
	if(result==1) {
		request.setAttribute("msg", "�û����ӳɹ�");
		request.setAttribute("adminName", adminName);
		request.setAttribute("password", password);
		request.setAttribute("pwdconfirm",password);
		request.setAttribute("note", note);
		request.getRequestDispatcher("/admin/admin_add.jsp").forward(request,response);
		return;
	}else {
		request.setAttribute("msg", "�û�����ʧ��");
		request.getRequestDispatcher("/admin/admin_add.jsp").forward(request,response);
		return;
	}
}
	
//�õ������û�����
	protected  List<AdminInfo> getAdminList(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException  {
		  List<AdminInfo> adminList=new ArrayList<AdminInfo>();
		  AdminDao admin=new AdminDao();
		  adminList=admin.getAdminList();
		  String state=admin.getState();
		  HttpSession session = request.getSession();
		  session.setAttribute("adminList", adminList);
		  session.setAttribute("state", state);
		  request.getRequestDispatcher("/admin/admin_manage.jsp").forward(request,response);
		  return adminList;
	}
//ɾ���û�(���û�state�ó�0)	
	protected int delAdmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 request.setCharacterEncoding("UTF-8");
		String adminName=request.getParameter("adminName");
		MenuDao menudao=new MenuDao();
		AdminInfo admin=new AdminInfo();
		admin.setAdminName(adminName);
		int result=menudao.delAdmin(adminName);
		return result;
	}	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
}