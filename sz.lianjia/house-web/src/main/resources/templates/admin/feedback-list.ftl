<@admin_common.meta/>
<title>评论列表</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 评论管理 <span
        class="c-gray en">&gt;</span> 评论列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px"
                                              href="javascript:location.replace(location.href);" title="刷新"><i
        class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <div class="cl pd-5 bg-1 bk-gray mt-20"><span class="l"><a href="javascript:;" onclick="datadel()"
                                                               class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> </span>
        <span class="r">共有数据：<strong>${(count)!}</strong> 条</span></div>
    <div class="mt-20">
        <table class="table table-border table-bordered table-hover table-bg table-sort">
            <thead>
            <tr class="text-c">
                <th width="25"><input type="checkbox" name="" value=""></th>
                <th width="60">ID</th>
                <th width="100">用户名</th>
                <th width="100">时间</th>
                <th>留言内容</th>
                <th width="100">类型</th>
                <th width="100">操作</th>
            </tr>
            </thead>
            <tbody>
                 <#list comments as comment>
                 <tr class="text-c">
                     <td><input type="checkbox" value="1" name=""></td>
                     <td>${comment.id!}</td>
                     <td>${(comment.userName)!}</td>
                     <td>${(comment.createTime)?date}</td>
                     <td>${(comment.content)!}</td>
                     <td> ${(comment.type==1)?string("房产评论", "博客评论")}</td>
                     <td class="td-manage"><a title="删除" href="javascript:;" onclick="comment_del(this,${comment.id!})"
                                              class="ml-5" style="text-decoration:none"><i
                             class="Hui-iconfont">&#xe6e2;</i></a></td>
                 </tr>
                 </#list>
            </tbody>
        </table>
    </div>
</div>

<@admin_common.footer/>

<!--请在下方写此页面业务相关的脚本-->
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

    /*评论-删除*/
    function comment_del(obj, id) {
        layer.confirm('确认要删除吗？', function (index) {
            layer.close(index);
            $.ajax({
                type: 'POST',
                url: '/admin/admincomment/delete?id=' + id,
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