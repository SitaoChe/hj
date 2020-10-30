<%--
  Created by IntelliJ IDEA.
  User: LDJ
  Date: 2020/7/8
  Time: 21:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>参赛单位修改</title>
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
    <script type="text/javascript" src="${baseurl}/js/jquery-1.8.3.min.js"></script>
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
</head>
<body>
<!-- Side Navbar -->
<nav class="side-navbar">
    <div class="side-navbar-wrapper">
        <!-- Sidebar Header    -->
        <div class="sidenav-header d-flex align-items-center justify-content-center">
            <!-- User Info-->
            <div class="sidenav-header-inner text-center"><img src="${baseurl}/img/logo.png" alt="person" class="img-fluid rounded-circle">
                <h2 class="h5">参赛单位</h2><span>泓吉文化有限公司</span>
            </div>
            <!-- Small Brand information, appears on minimized sidebar-->
            <div class="sidenav-header-logo"><a href="bmdIndex.do" class="brand-small text-center"> <strong>泓</strong><strong class="text-primary">吉</strong></a></div>
        </div>
        <!-- Sidebar Navigation Menus-->
        <div class="main-menu">
            <h5 class="sidenav-heading">菜单</h5>
            <ul id="side-main-menu" class="side-menu list-unstyled">
                <li><a href="bmdIndex.do"> <i class="icon-home"></i>首页</a></li>
                <li><a href="bmdXg.do"> <i class="icon-form"></i>参赛单位修改</a></li>
                <li><a href="bmdSsb.do"> <i class="fa fa-bar-chart"></i>赛事表</a></li>
                <li><a href="bmdXsb.do"> <i class="icon-grid"></i>选手表</a></li>
            </ul>
        </div>
    </div>
</nav>
<div class="page">
    <!-- navbar-->
    <header class="header">
        <nav class="navbar">
            <div class="container-fluid">
                <div class="navbar-holder d-flex align-items-center justify-content-between">
                    <div class="navbar-header"><a id="toggle-btn" href="#" class="menu-btn"><i class="icon-bars"> </i></a><a href="bmdIndex.do" class="navbar-brand">
                        <div class="brand-text d-none d-md-inline-block"><span>泓吉报名系统</span><strong class="text-primary">参赛单位</strong></div></a></div>
                    <ul class="nav-menu list-unstyled d-flex flex-md-row align-items-md-center">
                        <!-- Notifications dropdown-->

                        <!-- Messages dropdown-->

                        <!-- Languages dropdown    -->

                        <!-- Log out-->
                        <li class="nav-item"><a href="bmdLoginOut.do" class="nav-link logout"> <span class="d-none d-sm-inline-block">登出</span><i class="fa fa-sign-out"></i></a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>
    <!-- Breadcrumb-->
    <div class="breadcrumb-holder">
        <div class="container-fluid">
            <ul class="breadcrumb">
                <li class="breadcrumb-item"><a href="bmdIndex.do">首页</a></li>
                <li class="breadcrumb-item active">参赛单位修改</li>
            </ul>
        </div>
    </div>
    <section>
        <div class="container-fluid">
            <!-- Page Header-->
            <div class="row">
                <div class="col-lg-6">
                    <div class="card">
                        <div class="card-header d-flex align-items-center">
                            <h4>参赛单位修改</h4>
                        </div>
                        <div class="card-body">
                            <form action="bmdXxXg.do" method="post" name="bmdXxXg" class="form-horizontal">
                                <input type="hidden" value="${OBJBMD.bmdId}" name="bmdid">
                                <input type="hidden" value="${OBJBMD.bmdAccount}" name="bmdaccount">
                                <input type="hidden" value="${OBJBMD.name}" name="name">
                                <input type="hidden" value="${OBJBMD.idCard}" name="idcard">
                                <input type="hidden" value="${OBJBMD.address}" name="address">
                                <input type="hidden" value="${OBJBMD.phone}" name="phone">
                                <input type="hidden" value="${OBJBMD.adminId}" name="adminid">
                                <input type="hidden" value="${OBJBMD.team}" name="team">
                                <div class="form-group row">
                                    <label class="col-sm-3">参赛单位账号</label>
                                    <div class="col-sm-7">
                                        <label class="col-sm-7">${OBJBMD.bmdAccount}</label>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-3">参赛单位密码</label>
                                    <div class="col-sm-7">
                                        <input type="text" value="${OBJBMD.bmdPwd}" name="bmdpwd" class="form-control form-control-success">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-3">代表队名</label>
                                    <div class="col-sm-7">
                                        <label class="col-sm-7">${OBJBMD.team}</label>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-3">参赛单位联系人</label>
                                    <div class="col-sm-7">
                                        <input type="text" value="${OBJBMD.bmdContact}" name="bmdcontact" class="form-control form-control-success">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-3">联系电话</label>
                                    <div class="col-sm-7">
                                        <input type="text" id="phone" onblur="isphone()" value="${OBJBMD.bmdPhone}" name="bmdphone" class="form-control form-control-success">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-3">参赛单位地址</label>
                                    <div class="col-sm-7">
                                        <input type="text" value="${OBJBMD.bmdAddress}" name="bmdaddress" class="form-control form-control-success">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-3">参赛单位通知</label>
                                    <div class="col-sm-7">
                                        <input type="text" value="${OBJBMD.bmdMessage}" name="bmdmessage" class="form-control form-control-success">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-7 offset-sm-3">
                                        <a href="javascript:bmdXxXg.submit();"><input type="submit" value="提交修改" class="btn btn-primary"></a>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </section>
    <footer class="main-footer">
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-6">
                    <p>版权所有 &copy; 2020.四川师范大学计算机软件研究所.联系电话：028-83229883</p>
                </div>
                <div class="col-sm-6 text-right">


                </div>
            </div>
        </div>
    </footer>
</div>
<!-- JavaScript files-->
<script>
    function isidcard() {
        /*首先得到输入的手机号码*/
        $('#messageIdcard').text('');
        var idcard = $('#idcard').val();
        $('#idcard').after('<p id="messageIdcard"></p>');
        $('#messageIdcard').text(getMessage(idcard));

        /*用于检验手机号码*/
        function getMessage(idcard){
            var message = "";
            var myreg = /^[1-9]\d{5}(18|19|20|(3\d))\d{2}((0[1-9])|(1[0-2]))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/;

            if (idcard == ''|| idcard == undefined) {
                message = "身份证不能为空！";
            } else if (idcard.length != 18) {
                message = "请输入正确的身份证位数！";
            } else if (!myreg.test(idcard)) {
                message = "请输入有效的身份证号码！";
            } else {
                message ="输入格式正确！"
            }
            return message;
        }
    }

    function isphone() {
        /*首先得到输入的手机号码*/
        $('#messagePhone').text('');
        var phone = $('#phone').val();
        $('#phone').after('<p id="messagePhone"></p>');
        $('#messagePhone').text(getMessage(phone));

        /*用于检验手机号码*/
        function getMessage(phone){
            var message = "";
            var myreg = /^(((13[0-9]{1})|(15[0-9]{1})||(17[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
            if (phone == ''|| phone == undefined) {
                message = "手机号码不能为空！";
            } else if (phone.length != 11) {
                message = "请输入正确的手机位数！";
            } else if (!myreg.test(phone)) {
                message = "请输入有效的手机号码！";
            }else {
                message = "输入格式正确！"
            }
            return message;
        }
    }
</script>
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
