package com.dao;

import java.util.List;
import com.beans.MenuInfo;
import com.jdbc.DBUtil;

public class MenuDao {

   List<MenuInfo> getMenuList(int parentId){ 
	   String sql="select * from adminInfo";
     List<MenuInfo> menuList=DBUtil.getList(sql, MenuInfo.class, parentId);
     return menuList;
     
   }
   
   public int delAdmin(int id) {
	   String sql="update adminInfo set state=0 where id=?";
		return DBUtil.getScalar(sql, id);
   }
   
   
	 
}
