<@admin_common.meta/>
<title>房产列表</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 房源管理 <span
        class="c-gray en">&gt;</span> 房源列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
                                              href="javascript:location.replace(location.href);" title="刷新"><i
        class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <div class="cl pd-5 bg-1 bk-gray mt-20"><span class="l"><a href="javascript:;" onclick="datadel()"
                                                               class="btn btn-danger radius"><i
            class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> <a class="btn btn-primary radius"
                                                          onclick="house_add('添加房源','/admin/adminhouse/toAdd')"
                                                          href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加房源</a></span>
        <span class="r">共有数据：<strong>${(count)!}</strong> 条</span></div>
    <div class="mt-20">
        <table class="table table-border table-bordered table-hover table-bg table-sort">
            <thead>
            <tr class="text-c">
                <th width="40"><input name="" type="checkbox" value=""></th>
                <th width="40">ID</th>
                <th width="60">名称</th>
                <th width="50">价格</th>
                <th>描述</th>
                <th width="100">图片</th>
                <th width="50">创建时间</th>
                <th width="100">操作</th>
            </tr>
            </thead>
            <tbody>
           <#list house as house1>
           <tr class="text-c">
               <td><input name="" type="checkbox" value=""></td>
               <td>${house1.id!}</td>
               <td>${(house1.name)!}</td>
               <td><span class="price">${(house1.price)!}</span> 万元</td>
               <td class="text-l">${(house1.remarks)!}</td>
               <td><img width="100px" height="100px" class="product-thumb" src="${(house1.firstImg)!}"></td>
               <td>${(house1.createTime)?date}</td>
               <td class="td-manage"><a title="编辑" href="javascript:;"
                                        onclick="house_edit('房源编辑','/admin/adminhouse/toAdd')"
                                        class="ml-5" style="text-decoration:none"><i
                       class="Hui-iconfont">&#xe6df;</i></a>
                   <a title="删除" href="javascript:;" onclick="house_del(this,${house1.id})" class="ml-5"
                      style="text-decoration:none"><i
                           class="Hui-iconfont">&#xe6e2;</i></a></td>
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

    /*房源-添加*/
    function house_add(title, url) {
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }

    /*房源-编辑*/
    function house_edit(title, url) {
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }

    /*房源-删除*/
    function house_del(obj, id) {
        layer.confirm('确认要删除吗？', function (index) {
            layer.close(index);
            $.ajax({
                type: 'POST',
                url: '/admin/adminhouse/delete?id=' + id,
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