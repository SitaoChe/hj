<%--
  Created by IntelliJ IDEA.
  User: LDJ
  Date: 2020/7/15
  Time: 17:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>报名首页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    <c:set var="baseurl" value="${pageContext.request.contextPath}"></c:set>
    <script type="text/javascript">
        <%--to record pronect Name (contextPath=/jwxt)--%>
        contextPath = "${pageContext.request.contextPath}";
    </script>
    <link rel="stylesheet" href="${baseurl}/assets/css/style.css">
    <link rel="stylesheet" href="${baseurl}/assets/css/responsive.css">
</head>
<body>
<!-- main wrapper -->
<div class="wrapper">
    <!-- header -->
    <header class="header">
        <div class="header-top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-9 col-md-8 col-sm-8 col-xs-12">
                        <div class="header-location"><i class="fa fa-home"></i> <a href="#">成都市武侯区晋阳路184号金雁大厦10楼3号</a></div>
                        <div class="header-email"><i class="fa fa-envelope-o"></i> <a href="mailto:support@email.com">hj@163.com</a></div>
                        <div class="header-phone"><i class="fa fa-phone"></i> <a href="#">028-1111111</a></div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                        <div class="header-social pull-right">
                            <a href="#"><i class="fa fa-qq"></i></a>
                            <a href="#"><i class="fa fa-wechat"></i></a>
                            <a href="#"><i class="fa fa-weibo"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="header-bottom">
            <nav class="navbar navbar-universal navbar-custom">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-3">
                            <div class="logo"><a href="#" class="navbar-brand page-scroll"><img src="${baseurl}/assets/images/logo/logo1.png" alt="logo"></a></div>
                        </div>
                        <div class="col-lg-9">
                            <div class="navbar-header">
                                <button type="button" data-toggle="collapse" data-target=".navbar-main-collapse" class="navbar-toggle"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
                            </div>
                            <div class="collapse navbar-collapse navbar-main-collapse">
                                <ul class="nav navbar-nav navbar-right">
                                    <li><a href="#">体验至上，服务为王。</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </nav>
        </div>
    </header>
    <!-- /header -->
    <!-- parallax -->
    <section class="bg-parallax parallax-window">
        <div class="overlay"></div>
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                    <div class="parallax-text">
                        <h2 class="parallax_t __white">通知公告</h2>
                        <h2 class="parallax_t __green">服务至上，体验为王。</h2>
                        <p>报名比赛将于2020.8.20结束！请选手们把握报名时间！</p>
                    </div>
                </div>
                <!-- planner-->
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 planner">
                    <div class="planner-block">

                        <form action="userraceAdd.do" method="post" name="userraceAdd" class="form-planner form-horizontal">
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                    <div class="form-group">
                                        <label>男选手</label>
                                        <input class="form-control" name="boyname" type="text">
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                                    <div class="form-group">
                                        <label>女选手</label>
                                        <input class="form-control" name="girlname" type="text">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="form-group">
                                        <label>身份证</label>
                                        <input class="form-control" readonly="readonly" value="${USER.userIdCard}" type="text">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="form-group">
                                        <label>比赛项目</label>
                                        <div class="theme-select">
                                            <select name="raceid" class="form-control __plannerSelect" >
                                                <option value="0">请选择比赛项目</option>
                                                <c:forEach items="${raceList}" var="race">
                                                <option value="${race.raceId}">${race.raceName}-(${race.startAge}-${race.endAge}岁)</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
                                    <div class="form-group">
                                        <label>地区</label>
                                        <input class="form-control" readonly="readonly" name="region" value="${USER.region}" type="text">
<%--                                        <div class="theme-select">--%>
<%--                                            <select class="form-control __plannerSelect" >--%>
<%--                                                <option>请选择地区</option>>--%>
<%--                                                <option value=""></option>--%>
<%--                                                <option value=""></option>--%>
<%--                                            </select>--%>
<%--                                        </div>--%>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <div class="planner-check-availability">
                                        <a href="javascript:userraceAdd.submit();" class="btn btn-default">提交报名表</a>
                                    </div>
                                </div>
                            </div>
                        </form>

                    </div>
                </div>
                <!-- /planner-->
            </div>
        </div>
    </section>
    <!-- /parallax -->
    <section class="section">
        <div class="container">
            <div class="title-main"><h2 class="h2">已报名项目<span class="title-secondary">安全. 可靠. 专一.</span></h2></div>
            <div class="row">
                <div class="col-lg-auto">
                    <div class="card">
                        <div class="card-header">
                            <span><strong>已报名项目</strong></span>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-hover table-bordered">
                                    <thead>
                                    <tr>
                                        <th>选择</th>
                                        <th>男选手</th>
                                        <th>女选手</th>
                                        <th>身份证</th>
                                        <th>赛事</th>
                                        <th>背号</th>
                                        <th>分数</th>
                                        <th>缴费状态</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>

                                    <tbody>
                                    <c:forEach items="${USERRACE}" var="userrace">
                                    <tr>
                                        <td scope="row">#</td>
                                        <td>${userrace.user.boyName}</td>
                                        <td>${userrace.user.girlName}</td>
                                        <td>${userrace.user.userIdCard}</td>
                                        <td>${userrace.race.raceName}-(${userrace.race.startAge}-${userrace.race.endAge})</td>
                                        <td>${userrace.userId}</td>
                                        <td>${userrace.grade}</td>
                                        <td>未缴费</td>
                                        <td>
                                            <a href="#" class="btn btn-outline-success btn-sm">缴费</a>
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
</div>
</section>
<!-- chose best rooms -->
<section class="best-room">
    <div class="container">
        <div class="title-main">
            <h2 class="h2">为您提供最好的比赛服务<span class="title-secondary">公司比赛项目展示</span></h2>
        </div>
        <div class="best-room-carousel">
            <ul class="row best-room_ul">
                <li class="col-lg-6 col-md-6 col-sm-6 col-xs-12 best-room_li">
                    <div class="best-room_img">
                        <a href="#"><img src="${baseurl}/assets/images/best-rooms/1.jpg" alt=""></a>
                        <div class="best-room_overlay">
                            <div class="overlay_icn"><a href="#"></a></div>
                        </div>
                    </div>
                    <div class="best-room-info">
                        <div class="best-room_t"><a href="#">2020四川少儿</a>
                            <div class="best-room_desc">
                                2020四川少儿春节大联欢
                            </div>
                            <div class="best-room_price">
                                <!-- <span>$99</span> / two days -->
                            </div>
                        </div>
                </li>
                <li class="col-lg-6 col-md-6 col-sm-12 col-xs-12 best-room_li">
                    <div class="best-room_img">
                        <a href="#"><img src="${baseurl}/assets/images/best-rooms/2.jpg" alt=""></a>
                        <div class="best-room_overlay">
                            <div class="overlay_icn"><a href="#"></a></div>
                        </div>
                    </div>
                    <div class="best-room-info">
                        <div class="best-room_t"><a href="#">2020四川少儿</a></div>
                        <div class="best-room_desc">
                            2020四川少儿春节大联欢
                        </div>
                        <div class="best-room_price">
                            <!-- <span>$129</span> / two days -->
                        </div>
                    </div>
                </li>
                <li class="col-lg-12 col-md-12 col-sm-12 col-xs-12 best-room_li">
                    <div class="best-room_img">
                        <a href="#"><img src="${baseurl}/assets/images/best-rooms/6.jpg" alt=""></a>
                        <div class="best-room_overlay">
                            <div class="overlay_icn"><a href="#"></a></div>
                        </div>
                    </div>
                    <div class="best-room-info">
                        <div class="best-room_t"><a href="#">2020四川少儿春节大联欢</a></div>
                        <div class="best-room_desc">
                            2020四川少儿春节大联欢
                        </div>
                        <div class="best-room_price">
                            <!-- <span>$349</span> / two days -->
                        </div>
                    </div>
                </li>
                <li class="col-lg-12 col-md-12 col-sm-12 col-xs-12 best-room_li">
                    <div class="best-room_img">
                        <a href="#"><img src="${baseurl}/assets/images/best-rooms/4.jpg" alt=""></a>
                        <div class="best-room_overlay">
                            <div class="overlay_icn"><a href="#"></a></div>
                        </div>
                    </div>
                    <div class="best-room-info">
                        <div class="best-room_t"><a href="#">各种比赛</a></div>
                        <div class="best-room_desc">
                            对比赛的描述
                        </div>
                        <div class="best-room_price">
                            <!-- <span>$49</span> / two days -->
                        </div>
                    </div>
                </li>
                <li class="col-lg-12 col-md-12 col-sm-12 col-xs-12 best-room_li">
                    <div class="best-room_img">
                        <a href="#"><img src="${baseurl}/assets/images/best-rooms/5.jpg" alt=""></a>
                        <div class="best-room_overlay">
                            <div class="overlay_icn"><a href="#"></a></div>
                        </div>
                    </div>
                    <div class="best-room-info">
                        <div class="best-room_t"><a href="#">各种各样的比赛</a></div>
                        <div class="best-room_desc">
                            对比赛的描述
                        </div>
                        <div class="best-room_price">
                            <!-- <span>$199</span> / two days -->
                        </div>
                    </div>
                </li>
                <li class="col-lg-12 col-md-12 col-sm-12 col-xs-12 best-room_li">
                    <div class="best-room_img">
                        <a href="#"><img src="${baseurl}/assets/images/best-rooms/3.jpg" alt=""></a>
                        <div class="best-room_overlay">
                            <div class="overlay_icn"><a href="#"></a></div>
                        </div>
                    </div>
                    <div class="best-room-info">
                        <div class="best-room_t"><a href="#">各种各样的比赛</a></div>
                        <div class="best-room_desc">
                            对比赛的描述
                        </div>
                        <div class="best-room_price">
                            <!-- <span>$209</span> / two days -->
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</section>

<!-- /choose best rooms -->
<!-- lux banner parallax -->
<section class="banner bg-parallax2">
    <div class="overlay"></div>
    <div class="banner-parallax">
        <div class="container">
            <div class="text-center">
                <div class="banner-parallax_raiting">
                    <a href="#"><span class="star __selected"></span></a>
                    <a href="#"><span class="star __selected"></span></a>
                    <a href="#"><span class="star __selected"></span></a>
                    <a href="#"><span class="star"></span></a>
                    <a href="#"><span class="star"></span></a>
                </div>
                <h2 class="banner-parallax_t">我们的团队</h2>
                <div class="banner-parallax_price"> 服务至上，体验为王。</div>
                <a href="#" class="btn btn-default">参加我们的比赛。</a>
            </div>
        </div>
    </div>
</section>
<!-- /lux banner parallax -->
<!-- enjoy our services -->
<section class="section">
    <div class="container">
        <div class="title-main"><h2 class="h2">我们的服务<span class="title-secondary">安全. 可靠. 专一.</span></h2></div>
        <div class="row">
            <div class="col-lg-4 col-md-4 col-sm-6">
                <h3 class="service_title"><i class="fa fa-globe"></i> 不同的比赛</h3>
                <p>一段描述</p>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-6">
                <h3 class="service_title"><i class="fa fa-taxi"></i> 服务</h3>
                <p>一段描述</p>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-6">
                <h3 class="service_title"><i class="fa fa-glass"></i> 服务</h3>
                <p>一段描述</p>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-6">
                <h3 class="service_title"><i class="fa fa-life-ring"></i> 服务</h3>
                <p>一段描述</p>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-6">
                <h3 class="service_title"><i class="fa fa-leaf"></i> 服务</h3>
                <p>一段描述</p>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-6">
                <h3 class="service_title"><i class="fa fa-eye"></i> 服务</h3>
                <p>一段描述</p>
            </div>
        </div>
    </div>
</section>
<!-- /enjoy our services -->
<!-- testiomonials -->
<section class="testimonials">
    <div class="container">
        <div class="title-main"><h2 class="h2">一些评论<span class="title-secondary">大家对我们的评论</span></h2></div>
        <div class="owl-carousel">
            <div class="item">
                <div class="testimonials-block_i">
                    <div class="testimonials-block_t">完美的 <span>服务</span></div>
                    <p>一些评论</p>
                </div>
                <div class="testimonials-block_user">
                    <div class="user_img"><img src="${baseurl}/assets/images/testimonials/mike.jpg" alt=""></div>
                    <div class="user_n">LDJ</div>
                </div>
            </div>
            <div class="item">
                <div class="testimonials-block_i">
                    <div class="testimonials-block_t">Thank You Very Much <span>I Am Happy!</span></div>
                    <p>一些评论=</p>
                </div>
                <div class="testimonials-block_user">
                    <div class="user_img"><img src="${baseurl}/assets/images/testimonials/mila.png" alt=""></div>
                    <div class="user_n">LZY</div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- /testiomonials -->
<!-- /main wrapper -->
<!-- footer -->
<footer class="footer">
    <div class="footer-top">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                    <div class="footer-top_logo"><a href="userIndex.do"><img src="${baseurl}/assets/images/logo/logo1.png" alt="Footer logo"></a></div>
                    <div class="footer-top_txt">
                        <p>公司的相关简介</p>
                    </div>
                    <div class="footer-top_address">
                        <div><i class="fa fa-phone"></i> 电话: <span>028-1111111</span></div>
                        <div><i class="fa fa-envelope-o"></i> 邮件: <span><a href="mailto:support@email.com">support@email.com</a></span></div>
                        <div><i class="fa fa-home"></i> 地址: <span>成都市武侯区晋阳路184号金雁大厦10楼3号</span></div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                    <div class="footer-top_rooms">
                        <ul>
                            <li>
                                <div class="rooms_img">
                                    <a href="blog-detail.html"><img src="${baseurl}/assets/images/footer/1.png" alt=""></a>
                                </div>
                                <div class="rooms_info">
                                    <div class="rooms_t"><a href="#">拉丁舞</a></div>
                                    <div class="rooms_props">报名费<span>￥100</span></div>
                                </div>
                            </li>
                            <li>
                                <div class="rooms_img">
                                    <a href="blog-detail.html"><img src="${baseurl}/assets/images/footer/2.png" alt=""></a>
                                </div>
                                <div class="rooms_info">
                                    <div class="rooms_t"><a href="#">爵士舞</a></div>
                                    <div class="rooms_props">报名费<span>￥80</span></div>
                                </div>
                            </li>
                            <li>
                                <div class="rooms_img">
                                    <a href="blog-detail.html"><img src="${baseurl}/assets/images/footer/3.png" alt=""></a>
                                </div>
                                <div class="rooms_info">
                                    <div class="rooms_t"><a href="#">街舞</a></div>
                                    <div class="rooms_props">报名费<span>￥100</span></div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-12 marg-sm-50 col-xs-12">
                    <div class="footer-top_contact_form">
                        <div class="contact_form_t">联系我们</div>
                        <form action="mail.php" method="POST" class="row form-horizontal form-wizzard">
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                <input type="text" name="name" class="form-control" placeholder="姓名">
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                <input type="email" name="email" class="form-control" placeholder="联系方式">
                            </div>
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <textarea rows="6" name="message" class="form-control" placeholder="对公司的意见建议"></textarea>
                            </div>
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-right">
                                <input type="submit" value="发送建议" class="btn btn-default">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-bottom">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                    <div class="footer-bottom_copy">版权所有 &copy; 2020.四川师范大学计算机软件研究所.联系电话：028-83229883</div>
                </div>
            </div>
        </div>
    </div>
</footer>
</div>
<!-- /footer -->
<!-- Scripts -->
<script type="text/javascript" src="${baseurl}/assets/js/jquery.min.js"></script>
<script type="text/javascript" src="${baseurl}/assets/js/tether.min.js"></script>
<script type="text/javascript" src="${baseurl}/assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${baseurl}/assets/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="${baseurl}/assets/js/moment.min.js"></script>
<script type="text/javascript" src="${baseurl}/assets/js/jquery.smartmenus.js"></script>
<script type="text/javascript" src="${baseurl}/assets/js/jquery.parallax.min.js"></script>
<script type="text/javascript" src="${baseurl}/assets/js/jquery.shuffle.min.js"></script>
<script type="text/javascript" src="${baseurl}/assets/js/owl.carousel.min.js"></script>
<script type="text/javascript" src="${baseurl}/assets/js/map.js"></script>
<script type="text/javascript" src="${baseurl}/assets/js/main.js"></script>
<!-- /Scripts -->
</body>
</html>

