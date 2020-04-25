<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";             
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="cr" uri="http://java.sun.com/jstl/core_rt" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
 <head>
 <base href="<%=basePath%>"> 
    <title></title>

	<script type="text/javascript" src="js/jquery-1.8.0.js"></script> 
	<script type="text/javascript">
		$(function(){
			$("#ch_checkall,#top_ch_checkall").click(function(){
				if(this.checked){
					$("input[name=ck_id]").attr("checked","checked");
				}else{
					$("input[name=ck_id]").removeAttr("checked");
				}		
			});
					
			$("table tr").mouseover(function(){
				$(this).css("background","#D3EAEF");
				$(this).siblings().css("background","white");
			});
		});
	</script>
	<script>
		function subForm(pageIndex)
		{
		    //pageIndex 不传入,表示,是点击"转到"按钮的时候触发的
		    if(pageIndex){
		    	window.location.href="${pageContext.request.contextPath}/AdminServlet.do?flag=manage&pageIndex="+pageIndex;
		    }
		    else{
		        window.location.href="${pageContext.request.contextPath}/AdminServlet.do?flag=manage&pageIndex="+document.getElementById("pageIndex").value;
		    }	
		}
		
		//点击上方的删除按钮,进行多项删除
		function delMuti(){
			//判断用户至少选了一项
			if($("input[name=ck_id]:checked").size()==0){
				alert("请至少选一项!");
			}
			else{
				if(confirm('确定要删除所选项吗')){
					form1.submit();
				}
				
			}
		}
		
		//点周删除按钮,删除单个管理员,先用ajax 验证删除的是不是自已,如果不是,再发请求删除
		//用ajax进行验证的目的是为了保证不回发,不会将当前的pageIndex刷回到第一页
		function del(id){
			if(confirm('确定要删除吗')){
				var currentAdminId='${admin.id}';  //取到Session中的 admin 的 id
				if(currentAdminId==''){
					alert("当前用户的session已失效!请重新登录");
					window.top.location.href = "${pageContext.request.contextPath}/login.jsp";
				}
				else{
					if(currentAdminId==id){
						alert("不能删除自已!");
					}
					else{
						window.location.href="${pageContext.request.contextPath}/AdminServlet.do?flag=del&id="+id;
					}
				}
			}
		}
		
		//给某个账号进行锁定或解除锁定
		//因为加锁或解锁,都不需要改变pageIndex,所以把pageIndex也传上去,便于服务端返回pageIndex指定页面的数据
		//lockFlag 值为1 表示锁定,值为0表示解锁
		function lock(id, isLock,pageIndex){
			
			var msg="";
			if(isLock==true){
				msg="确定要锁定该账号吗 ?";
			}
			else{
				msg="确定将该账号解锁吗 ?";
			}
			
			
			if(confirm(msg)){
				window.location.href="${pageContext.request.contextPath}/AdminServlet.do?&lockFlag="
				+lockFlag+"&flag=lock&id="+id+"&pageIndex="+pageIndex;
			}
		}
		
		window.onload=function(){
			$.ajax({
				url:"AdminServlet.do",
				 type:"post",
				 data:{},
				 success:function(data){
					 
				 }
			});
		}
		
		
	</script>
	<link rel="stylesheet" type="text/css" href="css/maintable.css" ></link>

  </head>
  
  <body>

	<div class ="div_title">
			<div class="div_titlename"> <img src="images/san_jiao.gif" ><span>管理人员基本信息列表</span></div>
			<div class="div_titleoper">
				<input type="checkbox" id="top_ch_checkall"/> 全选 <a href="admin_add.jsp"> <img src="images/add.gif"/>添加 </a> <a href="javascript:void(0)"><img src="images/del.gif"/>删除</a> </div>
	 </div>
	 
	 <form action="AdminServlet.do" name="form1">
	
	 <table class="main_table" >
	       <tr>
	 				<th><input type="checkbox" id="ch_checkall" /></th>	<th>账号</th> 	<th>状态</th>	<th>备注</th>  <th>最后更新日期</th> 	<th>操作</th>
	 		</tr>
	 		<c:forEach var="admin" items="${adminList}">
	 		<tr>
	 				<td>
	 					<input type="checkbox" name="ck_id" value="${admin.id}" /> 
	 				</td>
	 				<td>${admin.adminName}</td>	
	 				<td>
	 				<c:choose>
	 				  <c:when test="${admin.state==2}">已锁定</c:when>
	 				</c:choose>
	 				</td>	
	 				
	 				<td> <a title="${admin.note}">${admin.note}</a> </td>	
	 				
	 				<td><fmt:formatDate value="${admin.editDate}"  pattern="yyyy-MM-dd hh:mm"></fmt:formatDate></td>	
	 				<td>
		 				<c:if test="${admin.state=='2'}">
		 				  <a href="javascript:lock(${admin.id },false,${pageInfo.pageIndex })">解锁&nbsp;&nbsp;|</a>
		 				</c:if>
                       <c:if test="${admin.state=='1'}">
		 				  <a href="javascript:lock(${admin.id },true,${pageInfo.pageIndex })">锁定&nbsp;&nbsp;|</a>
		 				  <a href="${pageContext.request.contextPath }/AdminServlet.do?flag=searchforupdate&id=${admin.id}">修改&nbsp;&nbsp;|</a>
		 				</c:if>
		 				
		 				<a href="javascript:del(${admin.id })">删除</a>
	 				</td>
	 		</tr>
	 
	 	</c:forEach>
	</table>
	</form>
	<div class="div_page" >
		  <div class="div_page_left">    共有 <label>4</label> 条记录，当前第 <label>1</label> 页，共 <label>1</label> 页	</div>		
		  <div class="div_page_right" > 	 
		  			 首页
	  	 			 上一页
		  			 下一页 
	  	 		   尾页

		  	  <button onclick="javascript:void(0)">转到</button>
		  	 <input type="text" name="pageIndex" id="pageIndex" value="1" /> 页
		  	
		   </div>
			
	</div>

  </body>
</html>