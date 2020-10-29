<%--
  Created by IntelliJ IDEA.
  User: LDJ
  Date: 2020/7/7
  Time: 16:36
  To change this template use File | Settings | File Templates.
--%>


<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>舞蹈报名系统</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    <c:set var="baseurl" value="${pageContext.request.contextPath}"></c:set>
    <script type="text/javascript">
        <%--to record pronect Name (contextPath=/jwxt)--%>
        contextPath = "${pageContext.request.contextPath}";
    </script>
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="${baseurl}/vendor/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="${baseurl}/vendor/font-awesome/css/font-awesome.min.css">
    <!-- Fontastic Custom icon font-->
    <link rel="stylesheet" href="${baseurl}/css/fontastic.css">
    <!-- Google fonts - Roboto -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700">
    <!-- jQuery Circle-->
    <link rel="stylesheet" href="${baseurl}/css/grasp_mobile_progress_circle-1.0.0.min.css">
    <!-- Custom Scrollbar-->
    <link rel="stylesheet" href="${baseurl}/vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.css">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="${baseurl}/css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="${baseurl}/css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="${baseurl}/img/logo.png">
<%--    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>--%>
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="page login-page" >
    <div class="container" class="bg-parallax parallax-window">
        <div class="form-outer text-center d-flex align-items-center">
            <div class="form-inner">
                <div class="logo text-uppercase"><strong class="text-primary">四川泓吉舞蹈报名系统</strong></div>
                <p>欢迎使用四川泓吉文化传媒有限公司舞蹈报名系统 我们以最真诚的态度为您服务</p>
                <p>服务至上，体验为王。</p>
                <form action="${pageContext.request.contextPath}/self/login.do" method="post" class="text-left form-validate" name="loginForm" >
                    <div class="form-group-material">
                        <input id="login-username" required="required" type="text" name="account" data-msg="Please enter your username" class="input-material">
                        <label for="login-username" class="label-material">用户名</label>
                    </div>
                    <div class="form-group-material">
                        <input id="login-password" required="required" type="password" name="password" data-msg="Please enter your password" class="input-material">
                        <label for="login-password" class="label-material">密码</label>
                    </div>
                    <div style="text-align: center">
                        <span style="text-align: center;color: #a5adb4">${errorMsg}</span>
                    </div>
                    <div class="form-group text-center"><a id="login" href="javascript:loginForm.submit();" class="btn btn-primary">登录</a>
                        <!-- This should be submit button but I replaced it with <a> for demo purposes-->
                    </div>
                </form>

            </div>
            <div class="copyrights text-center">
                <p>技术支持：四川师范大学计算机软件研究所  <br>  联系电话：028-83229883</p>
            </div>
        </div>
    </div>
</div>
<!-- JavaScript files-->
<script src="${baseurl}/vendor/jquery/jquery.min.js"></script>
<script src="${baseurl}/vendor/popper.js/umd/popper.min.js"> </script>
<script src="${baseurl}/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="${baseurl}/js/grasp_mobile_progress_circle-1.0.0.min.js"></script>
<script src="${baseurl}/vendor/jquery.cookie/jquery.cookie.js"> </script>
<script src="${baseurl}/vendor/chart.js/Chart.min.js"></script>
<script src="${baseurl}/vendor/jquery-validation/jquery.validate.min.js"></script>
<script src="${baseurl}/vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>
<!-- Main File-->
<script src="${baseurl}/js/front.js"></script>
</body>
</html>
