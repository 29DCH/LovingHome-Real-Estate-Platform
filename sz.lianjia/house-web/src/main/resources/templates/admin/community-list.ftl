<@admin_common.meta/>
<title>小区列表</title>
<link rel="stylesheet" href="/static/lib/zTree/v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
</head>
<body class="pos-r">
<div>
    <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 小区管理 <span
            class="c-gray en">&gt;</span> 小区列表 <a class="btn btn-success radius r"
                                                  style="line-height:1.6em;margin-top:3px"
                                                  href="javascript:location.replace(location.href);" title="刷新"><i
            class="Hui-iconfont">&#xe68f;</i></a></nav>
    <div class="page-container">
        <div class="cl pd-5 bg-1 bk-gray mt-20"><span class="l"><a href="javascript:;" onclick="datadel()"
                                                                   class="btn btn-danger radius"><i
                class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> <a class="btn btn-primary radius"
                                                              onclick="community_add('添加小区','/admin/admincommunity/add')"
                                                              href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加小区</a></span>
            <span class="r">共有数据：<strong>${(count)!}</strong> 条</span></div>
        <div class="mt-20">
            <table class="table table-border table-bordered table-bg table-hover table-sort">
                <thead>
                <tr class="text-c">
                    <th width="40"><input name="" type="checkbox" value=""></th>
                    <th width="40">ID</th>
                    <th>小区名称</th>
                    <th width="100">城市编码</th>
                    <th width="100">所在城市</th>
                    <th width="100">操作</th>
                </tr>
                </thead>
                <tbody>
                 <#list community as community1>
                 <tr class="text-c va-m">
                     <td><input name="" type="checkbox" value=""></td>
                     <td>${community1.id!}</td>
                     <td>${(community1.name)!}</td>
                     <td>${(community1.cityCode)!}</td>
                     <td>${(community1.cityName)!}</td>
                     <td class="td-manage"><a style="text-decoration:none" class="ml-5"
                                              onClick="community_edit('小区编辑','/admin/admincommunity/toUpdate?id=${community1.id!}')"
                                              href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a> <a
                             style="text-decoration:none" class="ml-5" onClick="community_del(this,${community1.id})"
                             href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
                 </tr>
                 </#list>
                </tbody>
            </table>
        </div>
    </div>
</div>

<@admin_common.footer/>

<script type="text/javascript" src="/static/lib/zTree/v3/js/jquery.ztree.all-3.5.min.js"></script>
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
    /*小区-添加*/
    function community_add(title, url) {
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }

    /*小区-编辑*/
    function community_edit(title, url) {
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }

    /*小区-删除*/
    function community_del(obj, id) {
        layer.confirm('确认要删除吗？', function (index) {
           layer.close(index);
            $.ajax({
                type: 'POST',
                url: '/admin/admincommunity/delete?id=' + id,
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