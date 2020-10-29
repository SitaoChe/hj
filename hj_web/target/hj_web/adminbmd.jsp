<%--
  Created by IntelliJ IDEA.
  User: LDJ
  Date: 2020/7/8
  Time: 15:21
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>普管参赛单位</title>
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
                    <div class="navbar-header"><a id="toggle-btn" href="#" class="menu-btn"><i class="icon-bars"></i></a><a href="adminIndex.do" class="navbar-brand">
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
                <li class="breadcrumb-item active">参赛单位列表</li>
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
                            <span><strong>参赛单位</strong><h5 style="color:red;">(删除参赛单位将删除该参赛单位下所有选手)</h5></span>
                            <a href="adminBmdToAdd.do" class="btn btn-outline-success btn-sm">添加参赛单位</a>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-hover table-bordered">
                                    <thead>
                                    <tr>
<%--                                        <th>选择</th>--%>
                                        <th>账号</th>
<%--                                        <th>密码</th>--%>
                                        <th>代表队</th>
                                        <th>姓名</th>
<%--                                        <th>身份证</th>--%>
                                        <th>所属区域</th>
                                        <th>电话</th>
                                        <th>联系人</th>
                                        <th>电话</th>
                                        <th>地址</th>
                                        <th>人数</th>
                                        <th>人次</th>
                                        <th>金额</th>
                                        <th>审核状态</th>
                                        <th>操作</th>

                                    </tr>
                                    </thead>

                                    <tbody>
                                    <c:forEach items="${pageInfo.list}" var="bmd">
                                    <tr>
<%--                                        <td scope="row"><input type="checkbox"></td>--%>
                                        <td>${bmd.bmdAccount}</td>
<%--                                        <td>${bmd.bmdPwd}</td>--%>
                                        <td>${bmd.team}</td>
                                        <td>${bmd.name}</td>
<%--                                        <td>${bmd.idCard}</td>--%>
                                        <td>${bmd.address}</td>
                                        <td>${bmd.phone}</td>
                                        <td>${bmd.bmdContact}</td>
                                        <td>${bmd.bmdPhone}</td>
                                        <td>${bmd.bmdMessage}</td>
                                        <td>${bmd.perNumber}</td>
                                        <td>${bmd.perOrder}</td>
                                        <td>${bmd.money}</td>
                                        <td>${bmd.status}</td>
                                        <td>
                                            <a href="adminBmdToEdit.do?bmdid=${bmd.bmdId}" class="btn btn-outline-success btn-sm">编辑</a>
                                            <a href="adminBmdRemove.do?bmdid=${bmd.bmdId}" class="btn btn-outline-danger btn-sm">删除</a>
                                        </td>
                                    </tr>
                                    </c:forEach>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <td colspan="8"> </td>
<%--                                            <td> </td>--%>
<%--                                            <td> </td>--%>
<%--                                            <td> </td>--%>
<%--                                            <td> </td>--%>
<%--                                            <td> </td>--%>
<%--                                            <td> </td>--%>
<%--                                            <td> </td>--%>
                                            <td>总人数:${allcountpernum}</td>
                                            <td>总人次:${allcountperorder}</td>
                                            <td>总金额:${allMoney}</td>
                                            <td colspan="2"> </td>
<%--                                            <td> </td>--%>
<%--                                            <td> </td>--%>
                                        </tr>
                                    </tfoot>
                                </table>
                                <!---------------上下页、首尾页设置-------------------------------->
                                <ul class="pagination">
                                    <c:if test="${pageInfo.hasPreviousPage}"><li class="page-item">
                                        <a class="page-link" href="adminBmd.do?pageNum=1">首页</a></li>
                                    </c:if>
                                    <c:if test="${pageInfo.hasPreviousPage}"><li class="page-item">
                                        <a class="page-link" href="adminBmd.do?pageNum=${pageInfo.prePage}">上一页</a></li>
                                    </c:if>
                                    <c:forEach items="${pageInfo.navigatepageNums}" var="items">
                                        <c:choose>
                                            <c:when test="${items == pageInfo.pageNum}">
                                                <li class="page-item"><a style="color:red" class="page-link" href="adminBmd.do?pageNum=${items}">${items}</a></li>
                                            </c:when>
                                            <c:otherwise>
                                                <li class="page-item"><a class="page-link" href="adminBmd.do?pageNum=${items}">${items}</a></li>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                    <c:if test="${pageInfo.hasNextPage}"><li class="page-item">
                                        <a class="page-link" href="adminBmd.do?pageNum=${pageInfo.nextPage}">下一页</a></li>
                                    </c:if>
                                    <c:if test="${pageInfo.hasNextPage}"><li class="page-item" >
                                        <a class="page-link" href="adminBmd.do?pageNum=${pageInfo.pages}">尾页</a></li>
                                    </c:if>
                                </ul>
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
</body>
</html>
