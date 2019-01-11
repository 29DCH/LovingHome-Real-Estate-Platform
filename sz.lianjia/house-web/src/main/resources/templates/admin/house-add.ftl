<@admin_common.meta/>
<title>添加房源 - 房源管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 房源管理 <span
        class="c-gray en">&gt;</span> 添加房源 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
                                              href="javascript:location.replace(location.href);" title="刷新"><i
        class="Hui-iconfont">&#xe68f;</i></a></nav>

<article class="page-container">
    <form class="form form-horizontal" id="form-admin-add" action="/admin/adminhouse/add" method="post">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>房源名称：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="name" name="name">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>价格：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" autocomplete="off" value="" placeholder="房价" id="price"
                       name="price">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>类型：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" autocomplete="off" value="" placeholder="类型" id="type"
                       name="type">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>房源评价：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" autocomplete="off" placeholder="房源评价" id="remarks" name="remarks">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>图片：</label>
            <div class="formControls col-xs-8 col-sm-9 skin-minimal">
                <a><img alt="" src=""/></a>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>面积：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="area" name="area">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>地址：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" placeholder="" name="address" id="address">
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

</body>
</html>