<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
   <%
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";             
%>
<!DOCTYPE html>
<html>
<head>  
<base href="<%=basePath%>">  
    <title></title>   
		<link rel="stylesheet" type="text/css" href="css/edittable.css"  ></link>  
		<link rel="stylesheet" type="text/css" href="css/validate.css"  ></link>  
		<script type="text/javascript"  src="js/jquery-1.8.0.js"></script>

	 <script>
		 function  checkadminName(){
			 var adminName=$("#adminName").val();
		      var result=true;
		      var reg1=/^\w{4,15}$/;
		     if(!reg1.test(adminName)){
		     $("#adminName_msg").html("用户名格式不正确! ").css("color","red");
		      result=false;
		      }else{
		    	  $("#adminName_msg").html("OK").css("color","green");
		      }
		     return result;
		     }
		 
		    function  checkpassword(){
		      var password=$("#password").val();
		      var result=true;
		      var reg2=/^\w{6,20}$/;
		     if(!reg2.test(password)){
		      $("#password_msg").html("密码格式不正确! ").css("color","red");
		      result=false;
		        } 
		     else{
		    	 $("#password_msg").html("OK ").css("color","green");
		     }
		     return result; 
		    }
		   function  pwdconfirm(){
			var password=$("#password").val();
			var pwdconfirm=$("#pwdconfirm").val();
		    var result=true;
		     if(pwdconfirm!=password){
		      $("#pwdconfirm_msg").html("输入的两次密码不一致，请重新输入! ").css("color","red");
		      result=false;
		        } 
		     else{
		    	 $("#pwdconfirm_msg").html("OK").css("color","green"); 
		     }
		     return result;
		    }
		   
		   function checkAll(){
		    var result=true;
		    if(checkadminName()==false)
		     result=false;
		    if(checkpassword()==false)
		     result=false;
		    if(pwdconfirm()==false)
		     result=false
		     if(result==true){
		        return confirm("确定要添加吗");
		      }
		    if(result==false){
		     alert("部分信息错误,请修改!");
		    }
		    return result;
		   }
		   
				   
	$(function(){
		 $("input[type=text],textarea").focus(function(){
			  $(this).addClass("input_focus");
			}).blur(function(){
					$(this).removeClass("input_focus");
			});

		$(".form_btn").hover(function(){
				$(this).css("color","red").css("background","#6FB2DB");
			},
			
			function(){
				$(this).css("color","#295568").css("background","#BAD9E3");
			});	
		
		 $("#adminName").focus(function(){
		        $("#adminName_msg").html("4-15位；只限数字(0-9)和英文(a-z),不区分大小写").css("color","#8FA0AC");
		       }).blur(checkadminName);
		       $("#password").focus(function(){
		        $("#password_msg").html("数字或英文,6-20位").css("color","#8FA0AC");
		       }).blur(checkpassword);
		       $("#pwdconfirm").focus(function(){
		        $("#pwdconfirm_msg").html("请重复输入密码").css("color","#8FA0AC");
		       }).blur(pwdconfirm);
		});		
	</script>

	
  </head>
  
  <body>
     <div class ="div_title">
		 <div class="div_titlename"> <img src="images/san_jiao.gif" ><span>管理员添加</span></div>
	 </div>
				 
	 <form action="AdminServlet.do"  method="get">
	 <input type="hidden" name="flag" value="addAdmin">
		 <table class="edit_table" >
		 		<tr>
		 			 	<td class="td_info">用户账号:</td>	
		 			 	<td class="td_input_short"> 
		 			 		<input type="text" class="txtbox" id="adminName" name="adminName" value="${adminName}" /> 
		 			 	</td>   
		 			 	<td>
		 			 		<label class="validate_info" id="adminName_msg"></label>
		 			 	</td> 
		 		</tr>
		 			<tr>
		 				<td class="td_info">用户密码:</td>	
		 				<td>
		 					<input type="text"  class="txtbox"  name="password"  id="password" value="${password}"  />
		 				</td> 
		 				<td><label  class="validate_info" id="password_msg" ></label></td>	
		 		</tr>
		 			<tr>
		 				<td class="td_info">重复密码:</td>	
		 				<td><input type="text" class="txtbox" id="pwdconfirm" value="${pwdconfirm}" /> 
		 				</td>
		 				<td><label  class="validate_info"  id="pwdconfirm_msg"></label></td>	
		 		</tr>
		 		<tr>
		 			<td class="td_info" id="td_info">备注信息:</td>	
		 			<td><textarea rows="4" cols="27" name="note" class="txtarea">${note}</textarea> </td>	
		 			<td><label></label></td>	
		 		</tr>
		 		<tr>
		 			<td class="td_info"> </td>	
		 			<td> 
		 			<input class="form_btn" type="submit" value="提交" onclick="return checkAll()"/> 
		 			<input type="reset"  class="form_btn" value="重置" /> </td>
		 			<td>
		 				<label id="result_msg" class="result_msg">${msg}</label>
		 			</td>	
		 		</tr>
		</table>
     </form>
  </body>
</html>