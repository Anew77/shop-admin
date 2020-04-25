<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>   
    <title></title>
		<link rel="stylesheet" type="text/css" href="css/login.css" ></link>
  </head>
  <script type="text/javascript" src="js/jquery-1.8.0.js"></script>
  <script>
    $(function(){
    	$("#btn_img").click(function(){
    		var adminName=$("#adminName").val();
    		var password=$("#password").val();
    		
    		if(adminName==""){
    			alert("用户名不能为空");
    			return false;		
    		}
    		if(password==""){
    			alert("密码不能为空");
    			return false;
    		}
    		
    		$.ajax({
    			url:"LoginServlet",
    		    type:"post",
    		    data:{adminName:adminName,password:password,flag:"login"},
    		    success:function(data){
    		    	if("0"==data){
    		    		alert("用户名或密码错误!");   		    		
    		    		return false;
    		    	}
    		       if("2"==data){
    		    		alert("此用户已被管理员锁定!");  		    		
 		    		   return false;
    		    	}
    		    	if("1"==data) {
    		    		window.location.href="main.html";
    		    	}
    		    	
    		    }
    		});
    	}); 
    });
  </script>
  <body>
 	     <div id="div_center">
 	     
 				<div id="div_inputbox">
 					<input type="text" id="adminName"  />
 					<input type="password" id="password" />
 					<input type="hidden" id="state" />
 				</div>
 				<input id="btn_img" type="image" src="images/bg_login_btn.jpg" />
 	 	 </div>
  </body>
</html>