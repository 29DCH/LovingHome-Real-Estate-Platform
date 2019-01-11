<@admin_common.meta/>
<title>修改用户信息</title>
</head>
<body>
<article class="page-container">
    <form action="" method="post" class="form form-horizontal" id="form-member-add">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>用户名：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${(user.name)!}" placeholder="" id="name" name="name">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>头像：</label>
            <div class="formControls col-xs-8 col-sm-9 skin-minimal">
                <a><img alt="" style="width: 100px;height: 100px" src="${(user.avatar)!}"/></a>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>手机：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${(user.phone)!}" placeholder="" id="mobile" name="mobile">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>邮箱：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="${(user.email)!}" placeholder="@" name="email" id="email">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">个人介绍：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <textarea name="beizhu" cols="" rows="" class="textarea" placeholder="说点什么...最少输入6个字符"
                          onKeyUp="$.Huitextarealength(this,100)">${(user.aboutme)!}</textarea>
                <p class="textarea-numberbar"><em class="textarea-length">0</em>/100</p>
            </div>
        </div>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                <input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
            </div>
        </div>
    </form>
</article>

<@admin_common.footer/>

<script type="text/javascript" src="/static/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="/static/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="/static/lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="/static/lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript">
    $(function () {
        $('.skin-minimal input').iCheck({
            checkboxClass: 'icheckbox-blue',
            radioClass: 'iradio-blue',
            increaseArea: '20%'
        });

        $("#form-member-add").validate({
            rules: {
                name: {
                    required: true,
                    minlength: 1,
                    maxlength: 16
                },
                phone: {
                    required: true,
                    isPhone: true,
                },
                email: {
                    required: true,
                    email: true,
                },
                aboutme: {
                    required: true,
                },
            },
            onkeyup: false,
            focusCleanup: true,
            success: "valid",
            submitHandler: function (form) {
                $(form).ajaxSubmit({
                    type: 'post',
                    url: "/admin/user/update?id=${user.id}",
                    success: function (data) {
                        layer.msg('修改成功!', {icon: 1, time: 1000});
                    },
                    error: function (XmlHttpRequest, textStatus, errorThrown) {
                        layer.msg('error!', {icon: 1, time: 1000});
                    }
                });
                var index = parent.layer.getFrameIndex(window.name);
                parent.$('.btn-refresh').click();
                parent.layer.close(index);
            }
        });
    });
</script>
</body>
</html>