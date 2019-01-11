<@admin_common.meta/>
<title>管理员列表</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 管理员管理 <span
        class="c-gray en">&gt;</span> 管理员列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
                                               href="javascript:location.replace(location.href);" title="刷新"><i
        class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <div class="cl pd-5 bg-1 bk-gray mt-20"><span class="l"><a href="javascript:;" onclick="datadel()"
                                                               class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> <a
            href="javascript:;" onclick="admin_add('添加管理员','/admin/adminuser/toAdd','800','500')"
            class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加管理员</a></span> <span
            class="r">共有数据：<strong>${(count)!}</strong> 条</span></div>
    <table class="table table-sort table-border table-bordered table-bg">
        <thead>
        <tr>
            <th scope="col" colspan="9">管理员列表</th>
        </tr>
        <tr class="text-c">
            <th width="25"><input type="checkbox" name="qx" id="qx"></th>
            <th width="60">ID</th>
            <th width="200">登录名</th>
            <th width="200">手机</th>
            <th width="180">邮箱</th>
            <th>头像</th>
            <th width="200">备注</th>
            <th width="150">加入时间</th>
            <th width="100">操作</th>
        </tr>
        </thead>
        <tbody>
        <#list admin as admin1>
        <tr class="text-c">
            <td><input type="checkbox" value="${admin1.id}" name="ps"></td>
            <td>${admin1.id}</td>
            <td>${(admin1.name)!}</td>
            <td>${(admin1.phone)!}</td>
            <td>${(admin1.email)!}</td>
            <td><img alt="" src="${(admin1.img)!}"/></td>
            <td>${(admin1.des)!}</td>
            <td>${(admin1.time)!}</td>
            <td class="td-manage"><a title="编辑" href="javascript:;"
                                     onclick="admin_edit('管理员编辑','/admin/adminuser/toUpdate?id=${admin1.id}',${admin1.id},'800','500')"
                                     class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>
                <a style="text-decoration:none" class="ml-5"
                   onClick="change_admin_password('修改密码','/admin/adminuser/toChangepwd?id=${admin1.id}',${admin1.id},'700','270')"
                   href="javascript:;" title="修改密码"><i class="Hui-iconfont">&#xe63f;</i></a><a title="删除"
                                                                                               href="javascript:;"
                                                                                               onclick="admin_del(this,${admin1.id})"
                                                                                               class="ml-5"
                                                                                               style="text-decoration:none"><i
                        class="Hui-iconfont">&#xe6e2;</i></a></td>
        </tr>
        </#list>
        </tbody>
    </table>
</div>

<@admin_common.footer/>

<script type="text/javascript" src="/static/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="/static/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="/static/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
    $(function () {
        $('.table-sort').dataTable({
            "aaSorting": [[1, "asc"]],//默认第几个排序
            "bStateSave": true,//状态保存
            "aoColumnDefs": [
                {"orderable": false, "aTargets": [1, 4]}// 制定列不参与排序
            ]
        });

    });

    /*管理员-增加*/
    function admin_add(title, url, w, h) {
        layer_show(title, url, w, h);
    }

    /*管理员-删除*/
    function admin_del(obj, id) {
        layer.confirm('确认要删除吗？', function (index) {
            layer.close(index);
            $.ajax({
                type: 'POST',
                url: '/admin/adminuser/delete?id=' + id,
                success: function (data) {
                    $(obj).parents("tr").remove();
                    layer.msg('已删除!', {icon: 1, time: 500});
                    window.location.reload(true);
                },
                error: function (data) {
                    console.log(data.msg);
                },
            });
        });
    }

    /*管理员-编辑*/
    function admin_edit(title, url, id, w, h) {
        layer_show(title, url, w, h);
    }

    /*密码-修改*/
    function change_admin_password(title, url, id, w, h) {
        layer_show(title, url, w, h);
    }

    function datadel() {
        if ($('#qx').attr('checked')) {
            $("[name='ps']").attr("checked", 'true');
        }
        $('input[name="ps"]:checked').each(function () {
            admin_del(obj, $(this).val());
        });
    }

    var adminname = document.getElementById("search-admin").value;
    $("button").click(function () {
        $.ajax({
            url: "/admin/adminuser/search?name=" + adminname, success: function (data) {
                location.replace(location);
            }
        });
    });
</script>
</body>
</html>