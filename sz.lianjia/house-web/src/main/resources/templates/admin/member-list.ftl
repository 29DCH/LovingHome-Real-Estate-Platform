<@admin_common.meta/>
<title>用户管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 用户中心 <span
        class="c-gray en">&gt;</span> 用户管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
                                              href="javascript:location.replace(location.href);" title="刷新"><i
        class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <div class="cl pd-5 bg-1 bk-gray mt-20"><span class="l"><a href="javascript:;" onclick="datadel()"
                                                               class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a></span>
        <span class="r">共有数据：<strong>${(count)!}</strong> 条</span></div>
    <div class="mt-20">
        <table class="table table-border table-bordered table-hover table-bg table-sort">
            <thead>
            <tr class="text-c">
                <th width="25"><input type="checkbox" name="" value=""></th>
                <th width="80">ID</th>
                <th width="100">用户名</th>
                <th width="100">头像</th>
                <th width="100">手机</th>
                <th width="150">邮箱</th>
                <th width="">个人介绍</th>
                <th width="130">加入时间</th>
                <th width="70">状态</th>
                <th width="100">操作</th>
            </tr>
            </thead>
            <tbody>
           <#list user as user1>
           <tr class="text-c">
               <td><input type="checkbox" value="1" name=""></td>
               <td>${user1.id}</td>
               <td><u style="cursor:pointer;text-decoration: none;" class="text-primary"
                      onclick="member_show('查看信息','/admin/user/select?id=${user1.id}','360','400')">${(user1.name)!}</u>
               </td>
               <td><img alt="" src="${(user1.avatar)!}" style="width: 100px;height: 100px"/></td>
               <td>${(user1.phone)!}</td>
               <td>${(user1.email)!}</td>
               <td class="text-l">${(user1.aboutme)!}</td>
               <td>${(user1.createTime?date)}</td>
               <td class="td-status"><span
                       class="label label-success radius"> ${(user1.enable==1)?string("激活", "未激活")} </span></td>
               <td class="td-manage"><a title="编辑" href="javascript:;"
                                        onclick="member_edit('编辑','/admin/user/toUpdate?id=${user1.id}','500','510')"
                                        class="ml-5" style="text-decoration:none"><i
                       class="Hui-iconfont">&#xe6df;</i></a> <a style="text-decoration:none" class="ml-5"
                                                                onClick="change_password('修改密码','/admin/user/toChangepwd?id=${user1.id}','600','300')"
                                                                href="javascript:;" title="修改密码"><i
                       class="Hui-iconfont">&#xe63f;</i></a> <a title="删除" href="javascript:;"
                                                                onclick="member_del(this,${user1.id})" class="ml-5"
                                                                style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>
               </td>
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

    $(function () {
        $('.table-sort').dataTable({
            "aaSorting": [[1, "asc"]],//默认第几个排序
            "bStateSave": true,//状态保存
            "aoColumnDefs": [
                {"orderable": false, "aTargets": [1, 4]}// 制定列不参与排序
            ]
        });

    });

    /*用户-查看*/
    function member_show(title, url, w, h) {
        layer_show(title, url, w, h);
    }

    /*用户-编辑*/
    function member_edit(title, url, w, h) {
        layer_show(title, url, w, h);
    }

    /*密码-修改*/
    function change_password(title, url, w, h) {
        layer_show(title, url, w, h);
    }

    /*用户-删除*/
    function member_del(obj, id) {
        layer.confirm('确认要删除吗？', function (index) {
            layer.close(index);
            $.ajax({
                type: 'POST',
                url: '/admin/user/delete?id=' + id,
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