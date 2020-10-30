<%--
  Created by IntelliJ IDEA.
  User: LDJ
  Date: 2020/7/8
  Time: 15:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>普管编辑赛事</title>
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
                <h2 class="h5">普通管理员</h2><span>泓吉文化有限公司</span>
            </div>
            <!-- Small Brand information, appears on minimized sidebar-->
            <div class="sidenav-header-logo"><a href="adminIndex.do" class="brand-small text-center"> <strong>泓</strong><strong class="text-primary">吉</strong></a></div>
        </div>
        <!-- Sidebar Navigation Menus-->
        <div class="main-menu">
            <h5 class="sidenav-heading">菜单</h5>
            <ul id="side-main-menu" class="side-menu list-unstyled">
                <li><a href="adminIndex.do"> <i class="icon-home"></i>首页</a></li>
                <li><a href="adminYwy.do"> <i class="icon-flask"></i>业务员</a></li>
                <li><a href="adminBmd.do"> <i class="icon-form"></i>参赛单位</a></li>
                <li><a href="adminSsb.do"> <i class="fa fa-bar-chart"></i>赛事表</a></li>
<%--                <li><a href="adminXsb.do"> <i class="icon-grid"></i>选手表</a></li>--%>
                <li><a href="adminRace.do"> <i class="icon-grid"></i>选手比赛表</a></li>
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
                    <div class="navbar-header"><a id="toggle-btn" href="#" class="menu-btn"><i class="icon-bars"> </i></a><a href="adminIndex.do" class="navbar-brand">
                        <div class="brand-text d-none d-md-inline-block"><span>泓吉报名系统</span><strong class="text-primary">普通管理员</strong></div></a></div>
                    <ul class="nav-menu list-unstyled d-flex flex-md-row align-items-md-center">
                        <!-- Notifications dropdown-->

                        <!-- Messages dropdown-->

                        <!-- Languages dropdown    -->

                        <!-- Log out-->
                        <li class="nav-item"><a href="adminLoginOut.do" class="nav-link logout"> <span class="d-none d-sm-inline-block">登出</span><i class="fa fa-sign-out"></i></a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>
    <!-- Breadcrumb-->
    <div class="breadcrumb-holder">
        <div class="container-fluid">
            <ul class="breadcrumb">
                <li class="breadcrumb-item"><a href="adminIndex.do">首页</a></li>
                <li class="breadcrumb-item active">赛事编辑</li>
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
                            <h4>赛事编辑</h4>
                        </div>
                        <div class="card-body">

                            <form action="adminSsbEdit.do" method="post" name="adminSsbEdit" class="form-horizontal" onsubmit="return verify()">
                                <input type="hidden" value="${OBJRACE.raceId}" name="raceid">
                                <input type="hidden" value="${OBJRACE.lockStatus}" name="lockstatus">
                                <input type="hidden" value="${OBJRACE.adminId}" name="adminid">
                                <div class="form-group row">
                                    <label class="col-sm-3">组别名称</label>
                                    <div class="col-sm-7">
                                        <input type="text" required="required" name="racename" value="${OBJRACE.raceName}" placeholder="如：亚洲赛摩登舞" class="form-control form-control-success">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-3">最小年龄</label>
                                    <div class="col-sm-7">
                                        <input type="text" required="required" name="startage" value="${OBJRACE.startAge}"  class="form-control form-control-success"><span id="messageStartAge"></span>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-3">最大年龄</label>
                                    <div class="col-sm-7">
                                        <input type="text" required="required"  name="endage" value="${OBJRACE.endAge}" class="form-control form-control-success"><span id="messageEndAge"></span>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-3">特色组</label>
                                    <div class="col-sm-7">
                                        <input type="text" required="required" name="racetype" value="${OBJRACE.raceType}" class="form-control form-control-success"><span id="messageStartAge"></span>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-3">舞种</label>
                                    <div class="col-sm-7">
                                        <input type="text" required="required" name="dancetype" value="${OBJRACE.danceType}"  class="form-control form-control-success"><span id="messageStartAge"></span>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-3">报名时间</label>
                                    <div class="col-sm-7">
                                        <input type="text"  required="required" name="starttime" value="${OBJRACE.startTime}" class="form-control form-control-success" class="Wdate" onclick="WdatePicker()">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-3">报名结束</label>
                                    <div class="col-sm-7">
                                        <input type="text" required="required" name="endtime" value="${OBJRACE.endTime}" class="form-control form-control-success" class="Wdate" onclick="WdatePicker()">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-3">比赛开始时间</label>
                                    <div class="col-sm-7">
                                        <input type="text" required="required" name="startrace" value="${OBJRACE.startRace}"  class="form-control form-control-success" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',startDate:'%y-%M-%d 00:00:00'})">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-3">报名费</label>
                                    <div class="col-sm-7">
                                        <input type="text" id="gradeNum" required="required" name="money" value="${OBJRACE.money}" class="form-control form-control-success"><span id="messageGradeNum"></span>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-7 offset-sm-3">
                                        <a href="javascript:adminSsbEdit.submit();"><input type="submit" value="保存赛事" class="btn btn-primary"></a>
                                        <a href="javascript:history.go(-1);" class="btn btn-outline-success btn-sm">返回</a>
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

    function verify() {
        var myreg = /^[+-]?((\d*(\.\d{1,})$)|(\d+$))/;

        gradenum = $('#gradeNum').val();
        if(!(myreg.test(gradenum))) {
            $('#messageGradeNum').text("格式错误，请输入数值");
            return false;
        }
        if(gradenum == null){
            $('#messageGradeNum').text("数值不能为空");
            return false;
        }

        // startAge = $('#startAge').val();
        // if(!(myreg.test(startAge))) {
        //     $('#messageStartAge').text("只能输入数值");
        //     return false;
        // }
        // if(startAge == null){
        //     $('#messageStartAge').text("数值不能为空");
        //     return false;
        // }
        //
        // endAge = $('#endAge').val();
        // if(!(myreg.test(endAge))) {
        //     $('#messageEndAge').text("只能输入数值");
        //     return false;
        // }
        // if(endAge == null){
        //     $('#messageEndAge').text("数值不能为空");
        //     return false;
        // }

        else return true;
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
<script src="${baseurl}/My97DatePicker/calendar.js"></script>
<script src="${baseurl}/My97DatePicker/WdatePicker.js"></script>
<script src="${baseurl}/js/front.js"></script>
</body>
</html>
