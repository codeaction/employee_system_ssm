<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--左侧导航-->
<aside class="lyear-layout-sidebar">
	
	<!-- logo -->
	<div id="logo" class="sidebar-header">
		<a href="index.html"><img src="images/logo-sidebar.png" title="LightYear" alt="LightYear" /></a>
	</div>
	<div class="lyear-layout-sidebar-scroll">
		
		<nav class="sidebar-main">
			<ul class="nav nav-drawer">
				<li class="nav-item active"> <a href="index.html"><i class="mdi mdi-home"></i> 后台首页</a> </li>
				<li class="nav-item nav-item-has-subnav">
					<a href="javascript:void(0)"><i class="mdi mdi-account-box"></i> 员工管理</a>
					<ul class="nav nav-subnav">
						<li> <a href="admin/toEmployee">人员管理</a> </li>
						<li> <a href="admin/toDepartment">部门管理</a> </li>
					</ul>
				</li>
			</ul>
		</nav>
		
		<div class="sidebar-footer">
			<p class="copyright">Copyright &copy; 2019. <a target="_blank" href="http://lyear.itshubao.com">IT书包</a> All rights reserved.</p>
		</div>
	</div>

</aside>
<!--End 左侧导航-->

<!--头部信息-->
<header class="lyear-layout-header">
	
	<nav class="navbar navbar-default">
		<div class="topbar">
			
			<div class="topbar-left">
				<div class="lyear-aside-toggler">
					<span class="lyear-toggler-bar"></span>
					<span class="lyear-toggler-bar"></span>
					<span class="lyear-toggler-bar"></span>
				</div>
				<span class="navbar-page-title"> 后台首页 </span>
			</div>
			
			<ul class="topbar-right">
				<li class="dropdown dropdown-profile">
					<a href="javascript:void(0)" data-toggle="dropdown">
						<span>${sessionScope.admin.username} <span class="caret"></span></span>
					</a>
					<ul class="dropdown-menu dropdown-menu-right">
						<li> <a href="lyear_pages_edit_pwd.html"><i class="mdi mdi-lock-outline"></i> 修改密码</a> </li>
						<li class="divider"></li>
						<li> <a href="logout"><i class="mdi mdi-logout-variant"></i> 退出登录</a> </li>
					</ul>
				</li>
			</ul>
		
		</div>
	</nav>

</header>
<!--End 头部信息-->

