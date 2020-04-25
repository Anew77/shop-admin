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
	
//添加用户	
protected void addAdmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String adminName=request.getParameter("adminName");
	String password=request.getParameter("password");
	String note=request.getParameter("note");
	
	AdminInfo admin=new AdminInfo();
	admin.setAdminName(adminName);
	admin.setPassword(password);
	admin.setNote(note);
	admin.setState("1");//默认为1可用
	//admin.setEditDate(editDate);  更新日期在数据库中是时间戳
	//admin.setRoleId(0);  默认没有角色
	
	int result=_adminDao.addAdmin(admin);
	if(result==1) {
		request.setAttribute("msg", "用户添加成功");
		request.setAttribute("adminName", adminName);
		request.setAttribute("password", password);
		request.setAttribute("pwdconfirm",password);
		request.setAttribute("note", note);
		request.getRequestDispatcher("/admin/admin_add.jsp").forward(request,response);
		return;
	}else {
		request.setAttribute("msg", "用户添加失败");
		request.getRequestDispatcher("/admin/admin_add.jsp").forward(request,response);
		return;
	}
}
	
//得到所有用户数据
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
//删除用户(将用户state置成0)	
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
