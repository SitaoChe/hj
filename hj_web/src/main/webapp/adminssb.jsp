<%--
  Created by IntelliJ IDEA.
  User: LDJ
  Date: 2020/7/8
  Time: 15:42
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>普管赛事表</title>
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
                <li class="breadcrumb-item active">赛事表</li>
            </ul>
        </div>
    </div>
    <section>
        <div class="container-fluid">
            <!-- Page Header-->
            <div class="row">
                <div class="col-lg-auto">
                    <div class="card">
                        <div class="card-header">
                            <span><strong>赛事表</strong>(删除赛事将删除该赛事下的所有选手)</span>
                            <a href="adminSsbToAdd.do" class="btn btn-outline-success btn-sm">添加赛事</a>
                            <!--form -->
                            <a href="#" id="J_download" class="btn btn-outline-success btn-sm">赛事excel表导出</a>
                            <!--form -->
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-hover table-bordered">
                                    <thead>
                                    <tr>
                                        <th>选择</th>
                                        <th>组别名称</th>
                                        <th>特色组</th>
                                        <th>舞种</th>
                                        <th>报名时间</th>
                                        <th>报名结束</th>
                                        <th>比赛开始时间</th>
                                        <th>报名费</th>
                                        <th>添加者</th>
                                        <th>锁定状态</th>
                                        <th>操作(锁定后超管可解锁)</th>
                                    </tr>
                                    </thead>

                                    <tbody>
                                    <c:forEach items="${RACELIST}" var="race">
                                    <tr>
                                        <td scope="row"><input type="checkbox"></td>
                                        <td>${race.raceName}(${race.startAge}-${race.endAge}岁)</td>
                                        <td>${race.raceType}</td>
                                        <td>${race.danceType}</td>
                                        <td>${race.startTime}</td>
                                        <td>${race.endTime}</td>
                                        <td>${race.startRace}</td>
                                        <td>${race.money}元</td>
                                        <td>${race.admin.adminAccount}</td>
                                        <td>${race.lockStatus}</td>
                                        <td>
                                            <a href="adminSsbLock.do?raceid=${race.raceId}" class="btn btn-outline-success btn-sm">锁定</a>
                                            <a href="adminSsbToEdit.do?raceid=${race.raceId}" class="btn btn-outline-success btn-sm">编辑</a>
                                            <a href="adminSsbRemove.do?raceid=${race.raceId}" class="btn btn-outline-danger btn-sm">删除</a>
                                        </td>
                                    </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
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
<script>

    var postDownLoadFile = function (options) {
        var config = $.extend(true, { method: 'post' }, options);
        var $iframe = $('<iframe id="down-file-iframe" />');
        var $form = $('<form target="down-file-iframe" method="' + config.method + '" />');
        $form.attr('action', config.url);
        for (var key in config.data) {
            $form.append('<input type="hidden" name="' + key + '" value="' + config.data[key] + '" />');
        }
        $iframe.append($form);
        $(document.body).append($iframe);
        $form[0].submit();
        $iframe.remove();
    }

    //导出
        $("#J_download").on('click',
            function() {
                var param={'adminId':${adminId}};
                postDownLoadFile({
                    url:'excelExport.do',
                    data:param,
                    method:'post'
                });

               if (data.code == 1) {
                    window.open(data.download);
               }else{
                  alert(data.message);
               }
            });



</script>
</body>
</html>
