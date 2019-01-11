<@admin_common.meta/>
<title>添加小区</title>
</head>
<body>
<article class="page-container">
    <form class="form form-horizontal" id="form-city-add" action="">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>小区名：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" placeholder="" id="name" name="name">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>所在城市：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" autocomplete="off" placeholder="输入城市" id="city"
                       name="cityName">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>城市编码：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" autocomplete="off" placeholder="输入城市编码" id="code" name="cityCode">
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

        $("#form-city-add").validate({
            rules: {
                name: {
                    required: true,
                    minlength: 2,
                    maxlength: 16
                }
            },
            onkeyup: false,
            focusCleanup: true,
            success: "valid",
            submitHandler: function (form) {
                $(form).ajaxSubmit({
                    type: 'post',
                    url: "/admin/admincommunity/add",
                    success: function (data) {
                        layer.msg('添加成功!', {icon: 1, time: 1000});
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