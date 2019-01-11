<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link type="text/css" rel="stylesheet" href="/static/admin_static/h-ui/css/H-ui.css"/>
<link type="text/css" rel="stylesheet" href="/static/admin_static/h-ui.admin/css/H-ui.admin.css"/>
<link type="text/css" rel="stylesheet" href="font/font-awesome.min.css"/>
<title>修改密码</title>
</head>
<body>
<div class="pd-20">
  <form class="Huiform" id="loginform" action="/admin/adminuser/changepwd?id=${admin.id}" method="post">
    <table class="table table-border table-bordered table-bg">
      <thead>
        <tr>
          <th colspan="2">修改密码</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <th class="text-r" width="30%" style="font-size: 23px;">旧密码：</th>
          <td><input name="oldpassword" id="oldpassword" class="input-text" type="password" autocomplete="off" placeholder="密码" tabindex="1" datatype="*6-16" nullmsg="请输入旧密码！" errormsg="4~16个字符，区分大小写！">
          </td>
        </tr>
        <tr>
          <th class="text-r" style="font-size: 23px;">新密码：</th>
          <td><input name="pwd" id="newpassword" class="input-text" type="password" autocomplete="off" placeholder="设置密码" tabindex="2" datatype="*6-16"  nullmsg="请输入您的新密码！" errormsg="4~16个字符，区分大小写！" >
          </td>
        </tr>
        <tr>
          <th class="text-r" style="font-size: 23px;">再次输入新密码：</th>
          <td><input name="newpassword2" id="newpassword2" class="input-text" type="password" autocomplete="off" placeholder="确认新密码" tabindex="3" datatype="*" recheck="newpassword" nullmsg="请再输入一次新密码！" errormsg="您两次输入的新密码不一致！"> 
          </td>
        </tr>
        <tr>
          <th></th> 
          <td>
            <button type="submit" class="btn btn-success radius" id="admin-password-save" name="admin-password-save"><i class="icon-ok"></i> 确定</button>
          </td>
        </tr>
      </tbody>
    </table>
  </form>
</div>
<script type="text/javascript" src="http://cdn.bootcss.com/jquery/2.1.3/jquery.min.js"></script> 
<script type="text/javascript" src="js/Validform_v5.3.2_min.js"></script> 
<script type="text/javascript" src="layer/layer.min.js"></script> 
<script type="text/javascript" src="/static/admin_static/h-ui/js/H-ui.js"></script>
<script type="text/javascript" src="/static/admin_static/h-ui.admin/js/H-ui.admin.js"></script>
<script type="text/javascript">
$(".Huiform").Validform(); 
</script>
</body>
</html>