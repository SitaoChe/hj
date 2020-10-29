<%--
  Created by IntelliJ IDEA.
  User: LDJ
  Date: 2020/7/8
  Time: 15:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>普管编辑参赛单位</title>
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
                <li><a href="adminXsb.do"> <i class="icon-grid"></i>选手表</a></li>
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
                <li class="breadcrumb-item active">参赛单位编辑</li>
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
                            <h4>参赛单位编辑</h4>
                        </div>
                        <div class="card-body">

                            <form class="form-horizontal" action="adminBmdEdit.do" method="post" name="adminBmdEdit" onsubmit="return verify()">
                                <input type="hidden" name="bmdid" value="${OBJBMD.bmdId}">
                                <input type="hidden" name="bmdcontact" value="${OBJBMD.bmdContact}">
                                <input type="hidden" name="bmdphone" value="${OBJBMD.bmdPhone}">
                                <input type="hidden" name="bmdaddress" value="${OBJBMD.bmdAddress}">
                                <input type="hidden" name="bmdmessage" value="${OBJBMD.bmdMessage}">
                                <input type="hidden" name="perNumber" value="${OBJBMD.perNumber}">
                                <input type="hidden" name="perOrder" value="${OBJBMD.perOrder}">
                                <input type="hidden" name="money" value="${OBJBMD.money}">
                                <div class="form-group row">
                                    <label class="col-sm-3">参赛单位账号</label>
                                    <div class="col-sm-7">
                                        <input type="text" required="required" value="${OBJBMD.bmdAccount}" name="bmdaccount" class="form-control form-control-success">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-3">参赛单位密码</label>
                                    <div class="col-sm-7">
                                        <input type="text" required="required" value="${OBJBMD.bmdPwd}" name="bmdpwd" class="form-control form-control-success">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-3">代表队名</label>
                                    <div class="col-sm-7">
                                        <input type="text" required="required" value="${OBJBMD.team}" name="team" class="form-control form-control-success">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-sm-3">姓名</label>
                                    <div class="col-sm-7">
                                        <input type="text" required="required" value="${OBJBMD.name}" name="name" class="form-control form-control-success">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-3">身份证</label>
                                    <div class="col-sm-7">
                                        <input id="idcard" onchange="isidcard()" type="text" value="${OBJBMD.idCard}" name="idcard" class="form-control form-control-success">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-3">地址</label>
                                    <div class="col-sm-7">
                                        <input type="text" required="required" value="${OBJBMD.address}" name="address" class="form-control form-control-success">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-3" >电话</label>
                                    <div class="col-sm-7" >
                                        <input id="phone" onchange="isphone()" type="text" required="required" value="${OBJBMD.phone}" name="phone" class="form-control form-control-success">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-3">审核状态</label>
                                    <div class="col-sm-7">
                                        <select name="status">
                                            <option value="未审核">未审核</option>
                                            <option value="已审核但未缴费">已审核但未缴费</option>
                                            <option value="已审核且已缴费">已审核且已缴费</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <div class="col-sm-7 offset-sm-3">
                                        <a href="javascript:adminBmdEdit.submit();"><input type="submit" value="保存" class="btn btn-primary"></a>
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
    var isidcardNum = 0
    var isphoneNum = 1
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

            // if (idcard == ''|| idcard == undefined) {
            //     message = "身份证不能为空！";
            //     isidcardNum = 0
            // } else
            if(idcard.length == 0){
                isidcardNum = 1
            }
            else if (idcard.length != 18) {
                message = "请输入正确的身份证位数！";
                isidcardNum = 0
            } else if (!myreg.test(idcard)) {
                message = "请输入有效的身份证号码！";
                isidcardNum = 0
            } else {
                message ="输入格式正确！"
                isidcardNum = 1
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
                isphoneNum = 0
            } else if (phone.length != 11) {
                message = "请输入正确的手机位数！";
                isphoneNum = 0
            } else if (!myreg.test(phone)) {
                message = "请输入有效的手机号码！";
                isphoneNum = 0
            }else {
                message = "输入格式正确！"
                isphoneNum = 1
            }
            return message;
        }
    }
    function verify() {
        valid = 1
        var idcard = $('#idcard').val();
        var phone = $('#phone').val();
        if(idcard.length != 0 && !isidcardNum) {alert("身份证号无效，无法提交");valid =0}
        if(!isphoneNum) {
            alert("手机号无效，无法提交");
            valid = 0
        }
        if(!valid) return false;
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
<!-- Main File-->
<script src="../js/front.js"></script>
</body>
</html>
