<@admin_common.meta/>
<title>房价3D柱状图</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 统计管理 <span class="c-gray en">&gt;</span> 3D柱状图 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="f-14 c-error">房价3D柱状图</div>
	<div id="container" style="min-width:900px;height:700px"></div>
</div>
<@admin_common.footer/>

<script type="text/javascript" src="/static/lib/hcharts/Highcharts/5.0.6/js/highcharts.js"></script>
<script type="text/javascript" src="/static/lib/hcharts/Highcharts/5.0.6/js/modules/exporting.js"></script>
<script type="text/javascript" src="/static/lib/hcharts/Highcharts/5.0.6/js/highcharts-3d.js"></script>
<script type="text/javascript">
﻿$(function () {
    var chart = new Highcharts.Chart({
        chart: {
            renderTo: 'container',
            type: 'column',
            margin: 75,
            options3d: {
                enabled: true,
                alpha: 15,
                beta: 15,
                depth: 50,
                viewDistance: 25
            }
        },
        title: {
            text: '房价3D柱状图'
        },
        subtitle: {
            text: '信息来自本网站房源信息库'
        },
        plotOptions: {
            column: {
                depth: 25
            }
        },
        series: [{
            data: [
            <#list house as hs>
                    ${hs.price},
            </#list>
            ]
        }]
    });
    

    $('#R0').on('change', function(){
        chart.options.chart.options3d.alpha = this.value;
        showValues();
        chart.redraw(false);
    });
    $('#R1').on('change', function(){
        chart.options.chart.options3d.beta = this.value;
        showValues();
        chart.redraw(false);
    });

    function showValues() {
        $('#R0-value').html(chart.options.chart.options3d.alpha);
        $('#R1-value').html(chart.options.chart.options3d.beta);
    }
    showValues();
});
</script>
</body>
</html>