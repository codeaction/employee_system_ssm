<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh">
<head>
<base href="${pageContext.request.contextPath}/" />
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>登录页面 - 光年(Light Year Admin)后台管理系统模板</title>
<link rel="icon" href="favicon.ico" type="image/ico">
<meta name="keywords" content="LightYear,光年,后台模板,后台管理系统,光年HTML模板">
<meta name="description" content="LightYear是一个基于Bootstrap v3.3.7的后台管理系统的HTML模板。">
<meta name="author" content="yinqi">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/materialdesignicons.min.css" rel="stylesheet">
<link href="css/animate.css" rel="stylesheet">
<link href="css/style.min.css" rel="stylesheet">
<style>
.lyear-wrapper {
    position: relative;
}
.lyear-login {
    display: flex !important;
    min-height: 100vh;
    align-items: center !important;
    justify-content: center !important;
}
.lyear-login:after{
    content: '';
    min-height: inherit;
    font-size: 0;
}
.login-center {
    background: #fff;
    min-width: 29.25rem;
    padding: 2.14286em 3.57143em;
    border-radius: 3px;
    margin: 2.85714em;
}
.login-header {
    margin-bottom: 1.5rem !important;
}
.login-center .has-feedback.feedback-left .form-control {
    padding-left: 38px;
    padding-right: 12px;
}
.login-center .has-feedback.feedback-left .form-control-feedback {
    left: 0;
    right: auto;
    width: 38px;
    height: 38px;
    line-height: 38px;
    z-index: 4;
    color: #dcdcdc;
}
.login-center .has-feedback.feedback-left.row .form-control-feedback {
    left: 15px;
}
</style>
</head>
  
<body data-theme="dark">
<div class="row lyear-wrapper" style="background-image: url(images/login-bg.jpg); background-size: cover;">
  <div class="lyear-login">
    <div class="login-center">
      <div class="login-header text-center">
        <a href="index.html"> <img alt="light year admin" src="images/logo-sidebar.png"> </a>
      </div>
      <form action="#!" method="post">
        <div class="form-group has-feedback feedback-left">
          <input type="text" placeholder="请输入您的用户名" class="form-control" name="username" id="username" />
          <span class="mdi mdi-account form-control-feedback" aria-hidden="true"></span>
        </div>
        <div class="form-group has-feedback feedback-left">
          <input type="password" placeholder="请输入密码" class="form-control" id="password" name="password" />
          <span class="mdi mdi-lock form-control-feedback" aria-hidden="true"></span>
        </div>
        <div class="form-group has-feedback feedback-left row">
          <div class="col-xs-7">
            <input type="text" id="validateCodeInput" name="captcha" class="form-control" placeholder="验证码">
            <span class="mdi mdi-check-all form-control-feedback" aria-hidden="true"></span>
          </div>
          <div class="col-xs-5">
            <img src="validateCode" class="pull-right" id="validateCode" style="cursor: pointer;" title="点击刷新" alt="captcha">
          </div>
        </div>
        <div class="form-group">
          <label class="lyear-checkbox checkbox-primary m-t-10">
            <input type="checkbox"><span>5天内自动登录</span>
          </label>
        </div>
        <div class="form-group">
          <button id="btnLogin" class="btn btn-block btn-primary" type="button">立即登录</button>
        </div>
      </form>
      <hr>
      <footer class="col-sm-12 text-center">
        <p class="m-b-0">Copyright © 2019 <a href="http://lyear.itshubao.com">IT书包</a>. All right reserved</p>
      </footer>
    </div>
  </div>
</div>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<!--消息提示-->
<script src="js/bootstrap-notify.min.js"></script>
<script type="text/javascript" src="js/lightyear.js"></script>
<script type="text/javascript">
  $(function () {
    $("#validateCode").click(function () {
      $(this).prop("src", "validateCode");
    });
    
    $("#btnLogin").click(function () {
      lightyear.loading('show');
      //发送Ajax请求实现登录
      $.ajax({
        url: "login",
        type: "POST",
        data: {username: $("#username").val(), password: $("#password").val(), validateCode: $("#validateCodeInput").val()},
        dataType: "JSON",
        success: function (resp) {
          lightyear.loading('hide');
          if(resp.code == 10000) { //登录成功
            lightyear.notify('登录成功，页面即将自动跳转~', 'success', 1000, 'mdi mdi-emoticon-happy', 'top', 'center', 'admin/toIndex');
          } else {
            lightyear.notify(resp.msg, 'danger', 1500, 'mdi mdi-emoticon-sad', 'top', 'center');
          }
        }
      });
    });
  })
</script>
</body>
</html>