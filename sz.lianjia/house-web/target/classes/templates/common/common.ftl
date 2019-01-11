<#macro header>
<html lang="en-US">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="ThemeStarz">
    <link rel="Shortcut Icon" href="/static/assets/img/favicon.ico"/>

    <link href='http://fonts.googleapis.com/css?family=Roboto:300,400,700' rel='stylesheet' type='text/css'>
    <link href="/static/assets/fonts/font-awesome.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="/static/assets/bootstrap/css/bootstrap.css" type="text/css">
    <link rel="stylesheet" href="/static/assets/css/bootstrap-select.min.css" type="text/css">
    <link rel="stylesheet" href="/static/assets/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="/static/assets/css/jquery.slider.min.css" type="text/css">
    <link rel="stylesheet" href="/static/assets/css/owl.carousel.css" type="text/css">
    <link rel="stylesheet" href="/static/assets/css/style.css" type="text/css">
    <link rel="stylesheet" href="/static/assets/css/owl.transitions.css" type="text/css">
    <link rel="stylesheet" href="/static/assets/css/fileinput.min.css" type="text/css">

    <link rel="stylesheet" href="/static/assets/css/toastr.css" type="text/css">

    <title>恋家网</title>
</head>
</#macro>

<#macro footer>
   <footer id="page-footer">
       <div class="inner">
           <aside id="footer-main">
               <div class="container">
                   <div class="row">

                       <div class="col-md-6 col-sm-6">
                           <article>
                               <h3>关于我们</h3>
                               <p>
                                   恋家网集房源信息搜索、产品研发、大数据处理、服务标准建立为一体的以数据驱动的全价值链房产服务平台。目前，恋家网线上房源已覆盖北京、上海、广州、深圳、天津、成都、青岛、重庆、大连等36个地区。在房产交易服务领域，恋家网旨在通过“链接人与服务”不断提高服务效率、提升服务体验，为用户提供更安全、更便捷、更舒心的综合房产服务，致力于实现推动行业进步，让房屋交易不再困难的企业愿景。
                               </p>
                               <hr>
                           </article>
                       </div><!-- /.col-sm-3 -->
                       <div class="col-md-3 col-sm-3">
                           <article>
                               <h3>联系方式</h3>
                               <address>
                                   <strong>公司地址</strong><br>
                                   深圳市南山区<br>
                                   晴天大厦A座29层
                               </address>
                               010-88888888<br>
                               <a href="#">lianjia@ljq.com</a>
                           </article>
                       </div><!-- /.col-sm-3 -->
                       <div class="col-md-3 col-sm-3">
                           <article>
                               <h3>常用链接</h3>
                               <ul class="list-unstyled list-links">
                                   <li><a href="/index">搜索房源</a></li>
                                   <li><a href="/accounts/register">登录/注册</a></li>
                                   <li><a href="/blog/list">博客</a></li>
                               </ul>
                           </article>
                       </div>
                   </div><!-- /.row -->
               </div><!-- /.container -->
           </aside><!-- /#footer-main -->
           <aside id="footer-thumbnails" class="footer-thumbnails"></aside><!-- /#footer-thumbnails -->
           <aside id="footer-copyright">
               <div class="container">
                   <span>Copyright © 2019. All Rights Reserved.</span>
                   <span class="pull-right"><a href="#page-top" class="roll">Go to top</a></span>
               </div>
           </aside>
       </div><!-- /.inner -->
   </footer>
</#macro>

<#macro js>
<script type="text/javascript" src="/static/assets/js/jquery-2.1.0.min.js"></script>
<script type="text/javascript" src="/static/assets/js/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="/static/assets/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/static/assets/js/smoothscroll.js"></script>

<script type="text/javascript" src="/static/assets/js/owl.carousel.min.js"></script>
<script type="text/javascript" src="/static/assets/js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="/static/assets/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="/static/assets/js/jquery.placeholder.js"></script>
<script type="text/javascript" src="/static/assets/js/icheck.min.js"></script>
<script type="text/javascript" src="/static/assets/js/jquery.vanillabox-0.1.5.min.js"></script>
<script type="text/javascript" src="/static/assets/js/retina-1.1.0.min.js"></script>
<script type="text/javascript" src="/static/assets/js/jquery.raty.min.js"></script>
<script type="text/javascript" src="/static/assets/js/jquery.magnific-popup.min.js"></script>
<script type="text/javascript" src="/static/assets/js/jshashtable-2.1_src.js"></script>
<script type="text/javascript" src="/static/assets/js/jquery.numberformatter-1.2.3.js"></script>
<script type="text/javascript" src="/static/assets/js/tmpl.js"></script>
<script type="text/javascript" src="/static/assets/js/jquery.dependClass-0.1.js"></script>
<script type="text/javascript" src="/static/assets/js/draggable-0.1.js"></script>
<script type="text/javascript" src="/static/assets/js/jquery.slider.js"></script>
<script type="text/javascript" src="/static/assets/js/jquery.fitvids.js"></script>
<script type="text/javascript" src="/static/assets/js/fileinput.min.js"></script>
<script type="text/javascript" src="/static/assets/js/custom-map.js"></script>
<script type="text/javascript" src="/static/assets/js/custom.js"></script>
<script type="text/javascript" src="/static/assets/js/toastr.js"></script>
<script type="text/javascript" src="/static/common/common.js"></script>

</#macro>

<#macro hot>
<aside id="featured-properties">
    <header><h3>热门房产</h3></header>
    <#list recomHouses as house>
    <div class="property small">
        <a href="/house/detail?id=${house.id}">
            <div class="property-image">
                <img alt="" src="${(house.firstImg)!}" style="width: 100px;height: 75px">
            </div>
        </a>
        <div class="info">
            <a href="/house/detail?id=${house.id}"><h4>${(house.name)!}</h4></a>
            <figure>${(house.address)!} </figure>
            <div class="tag price">￥${(house.price)!} 万</div>
        </div>
    </div><!-- /.property -->
    </#list>
</aside><!-- /#featured-properties -->
</#macro>

<#macro search>
<aside id="edit-search">
    <header><h3>Search Properties</h3></header>
    <form role="form" id="_searchForm" class="form-search" method="post" action="/house/list">

        <div class="form-group">
            <input type="text" class="form-control" id="search-box-property-id" value="${(vo.name)!}" name="name"
                   placeholder="输入要搜索的小区名">
        </div>
        <div class="form-group">
            <select name="type">
                <option value="1">类型</option>
                <option value="1" <#if (vo.type)?? && (vo.type)==1> selected </#if> >售卖</option>
                <option value="2" <#if (vo.type)?? && (vo.type)==2> selected </#if> >出租</option>
            </select>
        </div><!-- /.form-group -->
        <input type="text" value="${(vo.sort)!}" name=sort hidden="true">

        <div class="form-group">
            <button type="submit" class="btn btn-default">搜索</button>
        </div><!-- /.form-group -->
    </form><!-- /#form-map -->
</aside><!-- /#edit-search -->
</#macro>


<#macro nav>
 <div class="navigation">
     <div class="secondary-navigation">
         <div class="container">
             <div class="contact">

             </div>
             <div class="user-area">
                 <div class="actions">
                    <#if (loginUser.name)??>
                        <a href="/accounts/profile" class="promoted">Hello,${(loginUser.name)!}</a>
                          <#if (loginUser.email)?? && (loginUser.email) == "jgcs12345@163.com">
                          <a href="/agency/create" class="promoted">创建经纪机构</a>
                          </#if>
                        <a href="/accounts/logout" class="promoted">退出</a>
                    <#else>
                        <a href="/accounts/register" class="promoted"><strong>Register</strong></a>
                        <a href="/accounts/signin">Sign In</a>
                    </#if>
                 </div>
                 <div class="language-bar">
                     <a href="/accounts/profile" class="active"><img alt="" style="width:20px;height:20px"
                                                                     src="${(loginUser.avatar)!}"/></a>
                 </div>
             </div>
         </div>
     </div>
     <div class="container">
         <header class="navbar" id="top" role="banner">
             <div class="navbar-header">
                 <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".bs-navbar-collapse">
                     <span class="sr-only">Toggle navigation</span>
                     <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                 </button>
                 <div class="navbar-brand nav" id="brand">
                     <a href="/"><img src="/static/assets/img/logo.png" style="width:90px;height:60px" alt="brand"></a>
                     <span style="color: green;font-size: 16px;">连接每一个家的故事</span>
                 </div>
             </div>
             <nav class="collapse navbar-collapse bs-navbar-collapse navbar-right" role="navigation">
                 <ul class="nav navbar-nav">
                     <li><a href="/index">首页</a></li>
                     <li class="has-child"><a href="/house/list">房产</a>
                         <ul class="child-navigation">
                             <li><a href="/house/list?type=1">售房</a></li>
                             <li><a href="/house/list?type=2">租房</a></li>
                         </ul>
                     </li>
                     <li class="has-child"><a href="#">经纪人</a>
                         <ul class="child-navigation">
                             <li><a href="/agency/agentList">经纪人列表</a></li>
                             <li><a href="/agency/list">经纪机构列表</a></li>
                         </ul>
                     </li>
                     <li><a href="/blog/list">房产百科</a></li>
                     <li><a href="https://sz.lianjia.com/ditu/">地图找房</a></li>
                 </ul>
             </nav><!-- /.navbar collapse-->
             <div class="add-your-property">
                 <a href="/house/toAdd" class="btn btn-default"><i class="fa fa-plus"></i><span class="text">添加房源</span></a>
             </div>
         </header><!-- /.navbar -->
     </div><!-- /.container -->
 </div>
</#macro>

<#macro paging pagination>
        <ul class="pagination">
           <#list pagination.pages as page>
               <#if pagination.pageNum==page>
                    <li class="active"><a href="#">${page}</a></li>
               <#else>
                    <li><a href="javascript:void(0)" onclick="nextPage(${page},${pagination.pageSize})">${page}</a></li>
               </#if>
           </#list>
        </ul><!-- /.pagination-->
</#macro>