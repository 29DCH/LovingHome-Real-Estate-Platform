<@admin_common.meta/>
<title>博客列表</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 博客管理 <span
        class="c-gray en">&gt;</span> 博客列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
                                              href="javascript:location.replace(location.href);" title="刷新"><i
        class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <div class="cl pd-5 bg-1 bk-gray mt-20"><span class="l"><a href="javascript:;" onclick="datadel()"
                                                               class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> <a
            class="btn btn-primary radius" data-title="添加博客" data-href="blog-add.html"
            onclick="blog_add('博客添加','/admin/adminblog/toAdd')" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加博客</a></span>
        <span class="r">共有数据：<strong>${(count)!}</strong> 条</span></div>
    <div class="mt-20">
        <table class="table table-border table-bordered table-bg table-hover table-sort table-responsive">
            <thead>
            <tr class="text-c">
                <th width="25"><input type="checkbox" name="" value=""></th>
                <th width="80">ID</th>
                <th width="100">博客标题</th>
                <th>博客内容</th>
                <th width="120">更新时间</th>
                <th width="120">操作</th>
            </tr>
            </thead>
            <tbody>
            <tr class="text-c">
                <#list ps as ps1>
                    <td><input type="checkbox" value="" name=""></td>
                    <td>${ps1.id!}</td>
                    <td class="text-l"><u class="text-primary">${(ps1.title)!}</u></td>
                    <td>${(ps1.content)!}</td>
                    <td>${(ps1.createTime)?date}</td>
                    <td class="f-14 td-manage"><#--<a style="text-decoration:none" class="ml-5"
                                              onClick="blog_edit('博客编辑','blog-add.html','10001')" href="javascript:;"
                                              title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a>--> <a
                            style="text-decoration:none" class="ml-5" onClick="blog_del(this,${ps1.id!})"
                            href="javascript:;"
                            title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
            </tr>
                </#list>
            </tbody>
        </table>
    </div>
</div>
<@admin_common.footer/>

<script type="text/javascript" src="/static/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="/static/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="/static/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
    $(function(){
        $('.table-sort').dataTable({
            "aaSorting": [[ 1, "asc" ]],//默认第几个排序
            "bStateSave": true,//状态保存
            "aoColumnDefs": [
                {"orderable":false,"aTargets":[1,4]}// 制定列不参与排序
            ]
        });

    });

    /*博客-添加*/
    function blog_add(title, url, w, h) {
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }

    /*博客-编辑*/
    function blog_edit(title, url, w, h) {
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }

    /*博客-删除*/
    function blog_del(obj, id) {
        layer.confirm('确认要删除吗？', function (index) {
            layer.close(index);
            $.ajax({
                type: 'POST',
                url: '/admin/adminblog/delete?id=' + id,
                success: function (data) {
                    $(obj).parents("tr").remove();
                    layer.msg('已删除!', {icon: 1, time: 1000});
                    window.location.reload(true);
                },
                error: function (data) {
                    console.log(data.msg);
                },
            });
        });
    }

</script>
</body>
</html>
