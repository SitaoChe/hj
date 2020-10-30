<%--
  Created by IntelliJ IDEA.
  User: LDJ
  Date: 2020/7/8
  Time: 15:11
  To change this template use File | Settings | File Templates.
--%>


<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>管理员首页</title>
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
    <!-- Counts Section -->

    <!-- Header Section-->
    <section class="dashboard-header section-padding">
        <div class="container-fluid">
            <div class="row d-flex align-items-md-stretch">
                <!-- To Do List-->
                <div class="col-lg-3 col-md-6">
                    <div class="card to-do">
                        <h2 class="display h4">代做清单</h2>
                        <p>添加代做事情，方便记录。</p>
                        <ul class="check-lists list-unstyled">
                            <li class="d-flex align-items-center">
                                <input type="text" placeholder="点击输入代做事务：">
                            </li>
                            <li class="d-flex align-items-center">
                                <input type="checkbox" id="list-1" name="list-1" class="form-control-custom">
                                <label for="list-1">8月23日下午两点会议</label>
                            </li>
                            <li class="d-flex align-items-center">
                                <input type="checkbox" id="list-2" name="list-2" class="form-control-custom">
                                <label for="list-2">8月23日下午两点会议</label>
                            </li>
                            <li class="d-flex align-items-center">
                                <input type="checkbox" id="list-3" name="list-3" class="form-control-custom">
                                <label for="list-3">8月23日下午两点会议 </label>
                            </li>
                            <li class="d-flex align-items-center">
                                <input type="checkbox" id="list-4" name="list-4" class="form-control-custom">
                                <label for="list-4">8月23日下午两点会议</label>
                            </li>
                            <li class="d-flex align-items-center">
                                <input type="checkbox" id="list-5" name="list-5" class="form-control-custom">
                                <label for="list-5">8月23日下午两点会议</label>
                            </li>
                            <li class="d-flex align-items-center">
                                <input type="checkbox" id="list-6" name="list-6" class="form-control-custom">
                                <label for="list-6">8月23日下午两点会议 </label>
                            </li>
                            <li class="d-flex align-items-center">
                                <input type="checkbox" id="list-7" name="list-7" class="form-control-custom">
                                <label for="list-7">8月23日下午两点会议</label>
                            </li>
                            <li class="d-flex align-items-center">
                                <input type="checkbox" id="list-8" name="list-8" class="form-control-custom">
                                <label for="list-8">8月23日下午两点会议</label>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- Pie Chart-->
                <div class="col-lg-3 col-md-6">
                    <div class="card project-progress">
                        <h2 class="display h4">赛事进程</h2>
                        <p> 选择赛事查看进度：
                            <select>
                                <option value="拉丁舞">拉丁舞</option>
                                <option value="拉丁舞">爵士</option>
                                <option value="拉丁舞">民族舞</option>
                            </select>
                        </p>
                        <div class="pie-chart">
                            <canvas id="pieChart" width="300" height="300"> </canvas>
                        </div>
                    </div>
                </div>
                <!-- Line Chart -->
                <div class="col-lg-6 col-md-12 flex-lg-last flex-md-first align-self-baseline">
                    <div class="card sales-report">
                        <h2 class="display h4">参赛单位收入情况</h2>
                        <p> 展示相应参赛单位的收入情况</p>
                        <div class="line-chart">
                            <canvas id="lineCahrt"></canvas>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Statistics Section-->
    <section class="statistics">
        <div class="container-fluid">
            <div class="row d-flex">
                <div class="col-lg-4">
                    <!-- Income-->
                    <div class="card income text-center">
                        <div class="icon"><i class="icon-line-chart"></i></div>
                        <div class="number">126,418</div><strong class="text-primary">所有收入</strong>
                        <p>本月的总收入</p>
                    </div>
                </div>
                <div class="col-lg-4">
                    <!-- Monthly Usage-->
                    <div class="card data-usage">
                        <h2 class="display h4">每月花销</h2>
                        <div class="row d-flex align-items-center">
                            <div class="col-sm-6">
                                <div id="progress-circle" class="d-flex align-items-center justify-content-center"></div>
                            </div>
                            <div class="col-sm-6"><small>目前花费</small><strong class="text-primary">80.56 元</strong><span>每月100元</span></div>
                        </div>
                        <p>每月花销</p>
                    </div>
                </div>
                <div class="col-lg-4">
                    <!-- User Actibity-->
                    <div class="card user-activity">
                        <h2 class="display h4">已报名用户</h2>
                        <div class="number">210</div>
                        <h3 class="h4 display">已报名</h3>
                        <div class="progress">
                            <div role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100" class="progress-bar progress-bar bg-primary"></div>
                        </div>
                        <div class="page-statistics d-flex justify-content-between">
                            <div class="page-statistics-left"><span>已报名</span><strong>230</strong></div>
                            <div class="page-statistics-right"><span>当天新增</span><strong>73</strong></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Updates Section -->
    <section class="mt-30px mb-30px">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-4 col-md-12">
                    <!-- Recent Updates Widget          -->
                    <div id="new-updates" class="card updates recent-updated">
                        <div id="updates-header" class="card-header d-flex justify-content-between align-items-center">
                            <h2 class="h5 display"><a data-toggle="collapse" data-parent="#new-updates" href="#updates-box" aria-expanded="true" aria-controls="updates-box">参赛单位发布的通知</a></h2><a data-toggle="collapse" data-parent="#new-updates" href="#updates-box" aria-expanded="true" aria-controls="updates-box"><i class="fa fa-angle-down"></i></a>
                        </div>
                        <div id="updates-box" role="tabpanel" class="collapse show">
                            <ul class="news list-unstyled">
                                <!-- Item-->
                                <li class="d-flex justify-content-between">
                                    <div class="left-col d-flex">
                                        <div class="icon"><i class="icon-rss-feed"></i></div>
                                        <div class="title"><strong>bmd001</strong>
                                            <p>报名即将结束！</p>
                                        </div>
                                    </div>
                                    <div class="right-col text-right">
                                        <div class="update-date">24<span class="month">Jan</span></div>
                                    </div>
                                </li>
                                <!-- Item-->
                                <li class="d-flex justify-content-between">
                                    <div class="left-col d-flex">
                                        <div class="icon"><i class="icon-rss-feed"></i></div>
                                        <div class="title"><strong>bmd002</strong>
                                            <p>拉丁舞报名将在8月23日开始！</p>
                                        </div>
                                    </div>
                                    <div class="right-col text-right">
                                        <div class="update-date">24<span class="month">Jan</span></div>
                                    </div>
                                </li>
                                <!-- Item-->
                            </ul>
                        </div>
                    </div>
                    <!-- Recent Updates Widget End-->
                </div>
                <div class="col-lg-4 col-md-6">
                    <!-- Daily Feed Widget-->
                    <div id="daily-feeds" class="card updates daily-feeds">
                        <div id="feeds-header" class="card-header d-flex justify-content-between align-items-center">
                            <h2 class="h5 display"><a data-toggle="collapse" data-parent="#daily-feeds" href="#feeds-box" aria-expanded="true" aria-controls="feeds-box">每日消息</a></h2>
                            <div class="right-column">
                                <div class="badge badge-primary">10 messages</div><a data-toggle="collapse" data-parent="#daily-feeds" href="#feeds-box" aria-expanded="true" aria-controls="feeds-box"><i class="fa fa-angle-down"></i></a>
                            </div>
                        </div>
                        <div id="feeds-box" role="tabpanel" class="collapse show">
                            <div class="feed-box">
                                <ul class="feed-elements list-unstyled">
                                    <!-- List-->
                                    <li class="clearfix">
                                        <div class="feed d-flex justify-content-between">
                                            <div class="feed-body d-flex justify-content-between"><a href="#" class="feed-profile"><img src="../img/avatar-5.jpg" alt="person" class="img-fluid rounded-circle"></a>
                                                <div class="content"><strong>管理员001</strong><small>解锁拉丁舞 </small>
                                                    <div class="full-date"><small> 2020.7.25-8.00am</small></div>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <!-- List-->
                                    <li class="clearfix">
                                        <div class="feed d-flex justify-content-between">
                                            <div class="feed-body d-flex justify-content-between"><a href="#" class="feed-profile"><img src="../img/avatar-6.jpg" alt="person" class="img-fluid rounded-circle"></a>
                                                <div class="content"><strong>管理员002</strong><small>解锁爵士舞 </small>
                                                    <div class="full-date"><small>Today 5:60 pm - 12.06.2019</small></div>
                                                </div>
                                            </div>
                                            <div class="date"><small>5min ago</small></div>
                                        </div>
                                    </li>
                                    <!-- List-->
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- Daily Feed Widget End-->
                </div>
                <div class="col-lg-4 col-md-6">
                    <!-- Recent Activities Widget      -->
                    <div id="recent-activities-wrapper" class="card updates activities">
                        <div id="activites-header" class="card-header d-flex justify-content-between align-items-center">
                            <h2 class="h5 display"><a data-toggle="collapse" data-parent="#recent-activities-wrapper" href="#activities-box" aria-expanded="true" aria-controls="activities-box">近日行程</a></h2><a data-toggle="collapse" data-parent="#recent-activities-wrapper" href="#activities-box" aria-expanded="true" aria-controls="activities-box"><i class="fa fa-angle-down"></i></a>
                        </div>
                        <div id="activities-box" role="tabpanel" class="collapse show">
                            <ul class="activities list-unstyled">
                                <!-- Item-->
                                <li>
                                    <div class="row">
                                        <div class="col-4 date-holder text-right">
                                            <div class="icon"><i class="icon-clock"></i></div>
                                            <div class="date"> <span>6:00 am</span><span class="text-info">6 hours ago</span></div>
                                        </div>
                                        <div class="col-8 content"><strong>会议</strong>
                                            <p>今天2点开会               </p>
                                        </div>
                                    </div>
                                </li>
                                <!-- Item-->
                                <li>
                                    <div class="row">
                                        <div class="col-4 date-holder text-right">
                                            <div class="icon"><i class="icon-clock"></i></div>
                                            <div class="date"> <span>6:00 am</span><span class="text-info">6 hours ago</span></div>
                                        </div>
                                        <div class="col-8 content"><strong>见客户</strong>
                                            <p>明日5点与川师附小舞蹈老师吃饭               </p>
                                        </div>
                                    </div>
                                </li>
                                <!-- Item-->
                            </ul>
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
<script src="${baseurl}/js/charts-home.js"></script>
<!-- Main File-->
<script src="${baseurl}/js/front.js"></script>
</body>
</html>
