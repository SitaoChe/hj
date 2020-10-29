<%--
  Created by IntelliJ IDEA.
  User: LDJ
  Date: 2020/7/8
  Time: 16:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>普管选手表打分</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="all,follow">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="../vendor/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="../vendor/font-awesome/css/font-awesome.min.css">
    <!-- Fontastic Custom icon font-->
    <link rel="stylesheet" href="../css/fontastic.css">
    <!-- Google fonts - Roboto -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700">
    <!-- jQuery Circle-->
    <link rel="stylesheet" href="../css/grasp_mobile_progress_circle-1.0.0.min.css">
    <!-- Custom Scrollbar-->
    <link rel="stylesheet" href="../vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.css">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="../css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="../css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="../img/logo.png">
    <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
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
            <div class="sidenav-header-inner text-center"><img src="../img/logo.png" alt="person" class="img-fluid rounded-circle">
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
                <li class="breadcrumb-item active">选手打分</li>
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
                            <h4>选手打分</h4>
                        </div>
                        <div class="card-body">
                            <form action="adminRaceDf.do" method="post" name="adminRaceDf"  class="form-horizontal" onsubmit="return verify()">
                                <div class="form-group row">
                                    <label class="col-sm-3">男选手</label>
                                    <div class="col-sm-7">
                                        <label class="col-sm-7">${OBJUSER.boyName}</label>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-3">女选手</label>
                                    <div class="col-sm-7">
                                        <label class="col-sm-3">${OBJUSER.girlName}</label>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-3">身份证</label>
                                    <div class="col-sm-7">
                                        <label class="col-sm-7">${OBJUSER.userIdCard}</label>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-3">背号</label>
                                    <div class="col-sm-7">
                                        <label class="col-sm-3"> ${OBJUSER.userId} </label>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-3">赛事</label>
                                    <div class="col-sm-7">
                                        <label class="col-sm-7">${OBJUSER.raceProject}</label>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-3">成绩</label>
                                    <div class="col-sm-7">
                                        <input type="hidden" name="userid" value="${OBJUSER.userId}">
                                        <input type="hidden" name="boyname" value="${OBJUSER.boyName}">
                                        <input type="hidden" name="girlname" value="${OBJUSER.girlName}">
                                        <input type="hidden" name="useridcard" value="${OBJUSER.userIdCard}">
                                        <input type="hidden" name="raceproject" value="${OBJUSER.raceProject}">
                                        <input type="hidden" name="region" value="${OBJUSER.region}">
                                        <input type="hidden" name="checkstatus" value="${OBJUSER.checkStatus}">
                                        <input type="hidden" name="adminid" value="${OBJUSER.adminId}">
                                        <input type="hidden" name="bmdid" value="${OBJUSER.bmdId}">
                                        <input type="hidden" name="deletestatus" value="${OBJUSER.deleteStatus}">
                                        <input id="gradeNum" type="text" name="grade" required="required" class="form-control form-control-success" value="${OBJUSER.grade}">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-7 offset-sm-3">
                                        <a href="javascript:adminRaceDf.submit();"><input type="submit" value="提交分数" class="btn btn-primary"></a>
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
        gradenum = $('#gradeNum').val();
        var myreg = /^[+-]?((\d*(\.\d{1,})$)|(\d+$))/;
        $('#gradeNum').after('<p id="messageGradeNum"></p>');
        if(!(myreg.test(gradenum))) {
            $('#messageGradeNum').text("格式错误，请输入分数数值");
            return false;
        }
        if(gradenum == null){
            $('#messageGradeNum').text("分数数值不能为空");
            return false;
        }
        else return true;
    }
</script>
<script src="../vendor/jquery/jquery.min.js"></script>
<script src="../vendor/popper.js/umd/popper.min.js"> </script>
<script src="../vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="../js/grasp_mobile_progress_circle-1.0.0.min.js"></script>
<script src="../vendor/jquery.cookie/jquery.cookie.js"> </script>
<script src="../vendor/chart.js/Chart.min.js"></script>
<script src="../vendor/jquery-validation/jquery.validate.min.js"></script>
<script src="../vendor/malihu-custom-scrollbar-plugin/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript" src="../js/WdatePicker.js" ></script>
<!-- Main File-->
<script src="../js/front.js"></script>
</body>
</html>
