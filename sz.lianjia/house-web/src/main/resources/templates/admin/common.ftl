<#macro meta>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="Bookmark" href="/static/assets/img/favicon.ico">
    <link rel="Shortcut Icon" href="/static/assets/img/favicon.ico"/>
    <!--[if lt IE 9]>
    <script type="text/javascript" src="/static/lib/html5shiv.js"></script>
    <script type="text/javascript" src="/static/lib/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="/static/admin_static/h-ui/css/H-ui.min.css"/>
    <link rel="stylesheet" type="text/css" href="/static/admin_static/h-ui.admin/css/H-ui.admin.css"/>
    <link rel="stylesheet" type="text/css" href="/static/lib/Hui-iconfont/1.0.8/iconfont.css"/>
    <link rel="stylesheet" type="text/css" href="/static/admin_static/h-ui.admin/skin/default/skin.css" id="skin"/>
    <link rel="stylesheet" type="text/css" href="/static/admin_static/h-ui.admin/css/style.css"/>
    <!--[if IE 6]>
    <script type="text/javascript" src="/static/lib/DD_belatedPNG_0.0.8a-min.js"></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
</head>
</html>
</#macro>

<#macro header>
<header class="navbar-wrapper">
    <div class="navbar navbar-fixed-top">
        <div class="container-fluid cl">
            <span class="logo navbar-slogan f-l mr-10 hidden-xs">恋家房产销售平台后台管理系统</span>
            <a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:;">&#xe667;</a>
            <nav class="nav navbar-nav">
                <ul class="cl">
                    <li class="dropDown dropDown_hover"><a href="javascript:;" class="dropDown_A"><i
                            class="Hui-iconfont">&#xe600;</i> 选项 <i class="Hui-iconfont">&#xe6d5;</i></a>
                        <ul class="dropDown-menu menu radius box-shadow">
                            <li><a href="javascript:;" onclick="member_add('用户管理','/admin/user/list','','510')"><i
                                    class="Hui-iconfont">&#xe60d;</i> 用户管理</a></li>
                            <li><a href="javascript:;" onclick="admin_add('添加管理员','/admin/adminuser/toAdd')"><i
                                    class="Hui-iconfont">&#xe60d;</i> 添加管理员</a></li>
                            <li><a href="javascript:;" onclick="blog_add('添加博客','/admin/adminblog/toAdd')"><i
                                    class="Hui-iconfont">&#xe616;</i> 添加博客</a></li>
                            <li><a href="javascript:;" onclick="house_add('添加房源','/admin/adminhouse/toAdd')"><i
                                    class="Hui-iconfont">&#xe616;</i> 添加房源</a></li>
                            <li><a href="javascript:;" onclick="comment_add('评论管理','/admin/admincomment/list')"><i
                                    class="Hui-iconfont">&#xe616;</i> 评论管理</a></li>
                            <li><a href="javascript:;" onclick="blog_add('添加小区','/admin/admincommunity/toAdd')"><i
                                    class="Hui-iconfont">&#xe616;</i> 添加小区</a></li>
                            <li><a href="javascript:;" onclick="blog_add('添加经纪人','/admin/adminAgent/toAdd')"><i
                                    class="Hui-iconfont">&#xe620;</i> 添加经纪人</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
            <nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
                <ul class="cl">
                    <li>超级管理员</li>
                    <li class="dropDown dropDown_hover">
                        <a href="#" class="dropDown_A">${(loginAdmin.name)!}<i class="Hui-iconfont">&#xe6d5;</i></a>
                        <ul class="dropDown-menu menu radius box-shadow">
                            <li><a href="javascript:;" onClick="myselfinfo()">个人信息</a></li>
                            <li><a href="/admin/login">切换账户</a></li>
                            <li><a href="/admin/logout">退出</a></li>
                        </ul>
                    </li>
                    <li id="Hui-msg"><a href="https://mail.163.com/" title="消息"><span
                            class="badge badge-danger">1</span><i
                            class="Hui-iconfont" style="font-size:18px">&#xe68a;</i></a></li>
                    <li id="Hui-skin" class="dropDown right dropDown_hover"><a href="javascript:;" class="dropDown_A"
                                                                               title="换肤"><i class="Hui-iconfont"
                                                                                             style="font-size:18px">&#xe62a;</i></a>
                        <ul class="dropDown-menu menu radius box-shadow">
                            <li><a href="javascript:;" data-val="default" title="默认（黑色）">默认(黑色)</a></li>
                            <li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a></li>
                            <li><a href="javascript:;" data-val="green" title="绿色">绿色</a></li>
                            <li><a href="javascript:;" data-val="red" title="红色">红色</a></li>
                            <li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a></li>
                            <li><a href="javascript:;" data-val="orange" title="橙色">橙色</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</header>
<script type="text/javascript">
    /*个人信息*/
    function myselfinfo() {
        layer.open({
            type: 1,
            area: ['300px', '200px'],
            fix: false, //不固定
            maxmin: true,
            shade: 0.4,
            title: '查看信息',
            content: '<div>ID: ${(loginAdmin.id)!} </br>电话: ${(loginAdmin.phone)!} </br>邮箱: ${(loginAdmin.email)!} </br>备注: ${(loginAdmin.des)!} </br>创建时间: ${(loginAdmin.time)!} </div>'
        });
    }

    /*博客-添加*/
    function blog_add(title, url) {
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }

    /*房源-添加*/
    function house_add(title, url) {
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }

    /*评论-管理*/
    function comment_add(title, url) {
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }

    /*用户-添加*/
    function member_add(title, url, w, h) {
        layer_show(title, url, w, h);
    }

    /*管理员-添加*/
    function admin_add(title, url, w, h) {
        layer_show(title, url, w, h);
    }

</script>
</#macro>

<#macro menu>
<aside class="Hui-aside">
    <div class="menu_dropdown bk_2">
        <dl id="menu-use">
            <dt><i class="Hui-iconfont">&#xe616;</i> 用户管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a data-href="/admin/user/list" data-title="查看用户列表" href="javascript:void(0)">查看用户列表</a></li>
                </ul>
            </dd>
        </dl>
        </dl>
        <dl id="menu-admin">
            <dt><i class="Hui-iconfont">&#xe62d;</i> 管理员管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a data-href="/admin/adminuser/toAdd" data-title="添加管理员" href="javascript:void(0)">添加管理员</a>
                    </li>
                    <li><a data-href="/admin/adminuser/list" data-title="管理员列表" href="javascript:void(0)">管理员列表</a></li>
                </ul>
            </dd>
        </dl>
        <dl id="menu-article">
            <dt><i class="Hui-iconfont">&#xe616;</i> 博客管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a data-href="/admin/adminblog/toAdd" data-title="添加博客" href="javascript:void(0)">添加博客</a></li>
                    <li><a data-href="/admin/adminblog/list" data-title="查看博客列表" href="javascript:void(0)">查看博客列表</a>
                    </li>
                </ul>
            </dd>
        </dl>
        <dl id="menu-product">
            <dt><i class="Hui-iconfont">&#xe620;</i> 房源管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a data-href="/admin/adminhouse/toAdd" data-title="增加房源" href="javascript:void(0)">增加房源</a></li>
                    <li><a data-href="/admin/adminhouse/list" data-title="房源列表" href="javascript:void(0)">房源列表</a></li>
                </ul>
            </dd>
        </dl>
        <dl id="menu-comments">
            <dt><i class="Hui-iconfont">&#xe622;</i> 评论管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a data-href="/admin/admincomment/list" data-title="评论列表" href="javascript:void(0)">评论列表</a>
                    </li>
                </ul>
            </dd>
        </dl>
        <dl id="menu-member">
            <dt><i class="Hui-iconfont">&#xe60d;</i> 小区信息管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
            <dd>
                <ul>
                    <li><a data-href="/admin/admincommunity/toAdd" data-title="增加小区" href="javascript:;">增加小区</a></li>
                    <li><a data-href="/admin/admincommunity/list" data-title="小区列表" href="javascript:;">小区列表</a></li>
                </ul>
            </dd>
            <dl id="menu-picture">
                <dt><i class="Hui-iconfont">&#xe613;</i> 经纪人管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
                </dt>
                <dd>
                    <ul>
                        <li><a data-href="/admin/adminAgent/toAdd" data-title="添加经纪人"
                               href="javascript:void(0)">添加经纪人</a></li>
                        <li><a data-href="/admin/adminAgent/list" data-title="经纪人列表" href="javascript:void(0)">经纪人列表</a>
                        </li>
                    </ul>
                </dd>
            </dl>
            <dl id="menu-tongji">
                <dt><i class="Hui-iconfont">&#xe61a;</i> 系统统计<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
                </dt>
                <dd>
                    <ul>
                        <li><a data-href="/admin/statistics/realtime" data-title="系统在线人数实时统计图"
                               href="javascript:void(0)">系统在线人数实时统计图</a></li>
                        <li><a data-href="/admin/statistics/rating" data-title="房源评分饼状图" href="javascript:void(0)">房源评分饼状图</a>
                        </li>
                        <li><a data-href="/admin/statistics/price" data-title="房价3D柱状图" href="javascript:void(0)">房价3D柱状图</a>
                        </li>
                        <li><a data-href="/admin/statistics/hot" data-title="房产热度3D南丁格尔玫瑰图" href="javascript:void(0)">房产热度玫瑰图</a>
                        </li>
                        <li><a data-href="/admin/statistics/TreeMap" data-title="小区房产关系树图" href="javascript:void(0)">小区房产关系树图</a>
                        </li>
                        <li><a data-href="/admin/statistics/NationalMap" data-title="房源分布全国地图"
                               href="javascript:void(0)">房源分布全国地图</a></li>
                        <li><a data-href="/admin/statistics/export" data-title="导入导出数据"
                               href="javascript:void(0)">导入导出数据</a></li>
                    </ul>
                </dd>
            </dl>
    </div>
</aside>
<div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a>
</div>
</#macro>

<#macro footer>
<script type="text/javascript" src="/static/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="/static/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="/static/admin_static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="/static/admin_static/h-ui.admin/js/H-ui.admin.js"></script>
</#macro>

<#macro style>
 <script>!function (d, s, id) {
     var js, fjs = d.getElementsByTagName(s)[0];
     if (!d.getElementById(id)) {
         js = d.createElement(s);
         js.id = id;
         js.src = "//platform.twitter.com/widgets.js";
         fjs.parentNode.insertBefore(js, fjs);
     }
 }(document, "script", "twitter-wjs");</script>
    </div>
    <div class="cover">
        <div class="innie">
            <svg class="twitter-logo" height="10" viewBox="0 0 400 400" width="10" xmlns="http://www.w3.org/2000/svg">
                <path fill="white"
                      d="M153.6 301.6c94.3 0 145.9-78.2 145.9-145.9 0-2.2 0-4.4-.1-6.6 10-7.2 18.7-16.3 25.6-26.6-9.2 4.1-19.1 6.8-29.5 8.1 10.6-6.3 18.7-16.4 22.6-28.4-9.9 5.9-20.9 10.1-32.6 12.4-9.4-10-22.7-16.2-37.4-16.2-28.3 0-51.3 23-51.3 51.3 0 4 .5 7.9 1.3 11.7-42.6-2.1-80.4-22.6-105.7-53.6-4.4 7.6-6.9 16.4-6.9 25.8 0 17.8 9.1 33.5 22.8 42.7-8.4-.3-16.3-2.6-23.2-6.4v.7c0 24.8 17.7 45.6 41.1 50.3-4.3 1.2-8.8 1.8-13.5 1.8-3.3 0-6.5-.3-9.6-.9 6.5 20.4 25.5 35.2 47.9 35.6-17.6 13.8-39.7 22-63.7 22-4.1 0-8.2-.2-12.2-.7 22.6 14.4 49.6 22.9 78.5 22.9"></path>
            </svg>
        </div>
        <div class="spine"></div>
        <div class="outie">
            <svg class="twitter-logo" height="10" viewBox="0 0 400 400" width="10" xmlns="http://www.w3.org/2000/svg">
                <path fill="white"
                      d="M153.6 301.6c94.3 0 145.9-78.2 145.9-145.9 0-2.2 0-4.4-.1-6.6 10-7.2 18.7-16.3 25.6-26.6-9.2 4.1-19.1 6.8-29.5 8.1 10.6-6.3 18.7-16.4 22.6-28.4-9.9 5.9-20.9 10.1-32.6 12.4-9.4-10-22.7-16.2-37.4-16.2-28.3 0-51.3 23-51.3 51.3 0 4 .5 7.9 1.3 11.7-42.6-2.1-80.4-22.6-105.7-53.6-4.4 7.6-6.9 16.4-6.9 25.8 0 17.8 9.1 33.5 22.8 42.7-8.4-.3-16.3-2.6-23.2-6.4v.7c0 24.8 17.7 45.6 41.1 50.3-4.3 1.2-8.8 1.8-13.5 1.8-3.3 0-6.5-.3-9.6-.9 6.5 20.4 25.5 35.2 47.9 35.6-17.6 13.8-39.7 22-63.7 22-4.1 0-8.2-.2-12.2-.7 22.6 14.4 49.6 22.9 78.5 22.9"></path>
            </svg>
        </div>
    </div>
    <div class="shadow"></div>
</#macro>