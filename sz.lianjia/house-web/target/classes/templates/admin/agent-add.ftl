<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="Bookmark" href="/static/assets/img/favicon.ico">
    <link rel="Shortcut Icon" href="/static/assets/img/favicon.ico"/>
    <link rel="stylesheet" type="text/css" href="/static/admin_static/h-ui/css/H-ui.min.css"/>
    <link rel="stylesheet" type="text/css" href="/static/admin_static/h-ui.admin/css/H-ui.admin.css"/>
    <link rel="stylesheet" type="text/css" href="/static/lib/Hui-iconfont/1.0.8/iconfont.css"/>
    <link rel="stylesheet" type="text/css" href="/static/admin_static/h-ui.admin/skin/default/skin.css" id="skin"/>
    <link rel="stylesheet" type="text/css" href="/static/admin_static/h-ui.admin/css/style.css"/>
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
</head>

<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 经纪人管理 <span
        class="c-gray en">&gt;</span> 添加经纪人 <a class="btn btn-success radius r" style="line-height:1.0em;margin-top:-4px"
                                               href="javascript:location.replace(location.href);" title="刷新"><i
        class="Hui-iconfont">&#xe68f;</i></a></nav>

<div class="wrapper">
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-sm-6 col-md-offset-4 col-sm-offset-3">
                <form role="form" method="post" enctype="multipart/form-data" action="/admin/adminAgent/add">
                    <div id="agency">
                        <div class="form-group">
                            <label for="account-agency">选择经纪机构:</label>
                            <select name="agencyId" id="agencyId">
                                <option value="0">请选择经纪机构</option>
                                    <#list agencyList as agency>
                                    <option value="${agency.id}">${agency.name}</option>
                                    </#list>
                            </select>
                        </div><!-- /.form-group -->
                    </div>
                    <hr>
                    <div class="form-group">
                        <label>全名:</label>
                        <input type="text" class="form-control" id="form-create-account-full-name" name="name" required>
                    </div><!-- /.form-group -->
                    <div class="form-group">
                        <label>Email:</label>
                        <input type="text" class="form-control" id="form-create-account-email" name="email" required>
                    </div><!-- /.form-group -->
                    <div class="form-group">
                        <label>手机号:</label>
                        <input type="text" class="form-control" id="form-create-account-phone" name="phone">
                    </div><!-- /.form-group -->
                    <div class="form-group">
                        <label>密码:</label>
                        <input type="password" class="form-control" id="form-create-account-password" name="passwd"
                               required>
                    </div><!-- /.form-group -->
                    <div class="form-group">
                        <label>确认密码:</label>
                        <input type="password" class="form-control" id="form-create-account-confirm-password"
                               name="confirmPasswd" required>
                    </div><!-- /.form-group -->
                    <div class="form-group">
                        <label>自我介绍:</label>
                        <textarea class="form-control" name="aboutme"></textarea>
                    </div>

                    <div class="form-group">
                        <label>用户头像:</label>
                        <input id="file-upload" type="file" class="file" multiple="true" data-show-upload="false"
                               data-show-caption="false" data-show-remove="false" accept="image/jpeg,image/png"
                               data-browse-class="btn btn-default" data-browse-label="Browse Images" name="avatarFile"
                               required>
                        <figure class="note"><strong>Hint:</strong> You can upload all images at once!</figure>
                    </div>

                    <div class="form-group clearfix">
                        <button type="submit" class="btn pull-right btn-default" id="account-submit">注册账号</button>
                    </div><!-- /.form-group -->

                </form>
                <hr>
                <div class="center">
                    <figure class="note"> 我已阅读并同意<a href="terms-conditions.html">用户协议</a></figure>
                </div>
            </div>
        </div><!-- /.row -->
    </div><!-- /.container -->
</div>
</div>
</body>
</html>