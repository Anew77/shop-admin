package com.dao;

import java.util.List;

import com.beans.AdminInfo;
import com.beans.MenuInfo;
import com.jdbc.DBUtil;

public class AdminDao {
  public AdminInfo login(String adminName,String password) {
	  String sql="select * from adminInfo where adminName=? and password=?";
	return DBUtil.getSingleObject(sql,AdminInfo.class,adminName,password);
	  
  }
  public String getState(String adminName,String password) {
	  String sql="select state from adminInfo where adminName=? and password=?";
	  return DBUtil.getScalar(sql, adminName,password);
  }

  public String getState() {
	  String sql="select state from adminInfo";
	  return DBUtil.getScalar(sql);
  }
  
public int addAdmin(AdminInfo admin) {
	 String sql="Insert into adminInfo(adminName,password,note,state,roleId) values(?,?,?,?,?)";
	int result=DBUtil.update(sql, admin.getAdminName(),admin.getPassword(),admin.getNote(),admin.getState(),admin.getRoleId());
	return result;
}

public long getAdminCount() {
	String sql="select count(*) from AdminInfo";
	long count =DBUtil.getScalar(sql);
	return count;
}

public List<AdminInfo> getAdminList(){ 
	   String sql="select * from adminInfo";
  List<AdminInfo> AdminList=DBUtil.getList(sql, AdminInfo.class);
  return AdminList;
  
}

}
