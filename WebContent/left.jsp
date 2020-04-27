<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
			<script type="text/javascript" src="js/jquery-1.8.0.js"></script>
			<script type="text/javascript" src="js/jquery.easing.js"></script>
			<script type="text/javascript" src="js/jquery.accordion.js"></script>
			
<script type="text/javascript">
	$(function(){
		$('#navigation').accordion({
			active:1,   /* 第三个被激活 */
			header: '.head',
			/*navigation1: false,  */
			event: 'click',
			fillSpace: true,
			animated: 'bounceslide'   /*slide,bounceslide ,bounceslide,easeslide'*/
		});
	});
</script>
			<link rel="stylesheet" type="text/css" href="css/menu.css">

		</head>
		<body>
	
		
		<!-- <form href="AdminServlet.do?flag=manage" method="post"> -->
			 <ul id="navigation">
				<li>
				
					<a class="head">权限管理</a>
					<ul>
						<li>
								<a href="admin/AdminRoleManage.html" target="centerFrame"><img src="images/main_50.gif" /><label>用户权限管理</label></a>
						</li>
					</ul>
				</li>
		
				<li>
					<a class="head">系统管理</a>
					<ul>
						<li>	
								<a href="admin/admin_add.jsp" target="centerFrame"><img src="images/main_52.gif" /><label>用户添加</label></a>
								<a href="admin/admin_manage.jsp" target="centerFrame"><img src="images/main_40.gif" /><label>用户维护</label></a>
						</li>
					</ul>
				</li>
		
				<li>
					<a class="head">分类管理</a>
					<ul>
						<li>
								<a href="goods/BigCateAdd.html" target="centerFrame"><img src="images/main_48.gif" /><label>添加一级分类</label></a>
								<a href="goods/SmallCateAdd.html" target="centerFrame"><img src="images/main_46.gif" /><label>添加二级分类</label></a>
								<a href="goods/CateManage.html" target="centerFrame"><img src="images/main_50.gif" /><label>添加三级分类</label></a>
						</li>
					</ul>
				</li>
		
				<li>
					<a class="head">商品管理</a>
					<ul>
						<li>
								<a href="goods/GoodsAdd.html" target="centerFrame"><img src="images/main_52.gif" /><label> 商品添加</label></a>
								<a href="goods/GoodsManage.html" target="centerFrame"><img src="images/main_40.gif" /><label>商品维护</label></a>
						</li>
					</ul>
				</li>
		
				<li>
					<a class="head">会员管理</a>
					<ul>
						<li>	
								<a href="user/UserManage.html" target="centerFrame"><img src="images/main_46.gif" /><label>会员维护</label></a>
						</li>
					</ul>
				</li>
		
				<li>
					<a class="head">订单管理</a>
					<ul>
						<li>
								<a href="order/OrderManage.html" target="centerFrame"><img src="images/main_48.gif" /><label>订单维护</label></a>
						</li>
					</ul>
				</li>
				
    <li> <a class="head">网站前台</a>
      <ul>
        <li><a href="http://localhost:8080/shop" target="_blank"><img src="images/main_50.gif" /><label>网站前台</label></a></li>
      </ul>
    </li>
  </ul>

		</body>
</html>