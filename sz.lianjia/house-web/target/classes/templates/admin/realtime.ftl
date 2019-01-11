<@admin_common.meta/>
<title>系统在线人数实时统计图</title>
<script type="text/javascript" src="/static/lib/jquery/1.9.1/jquery.js"></script>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 统计管理 <span
        class="c-gray en">&gt;</span> 系统在线人数实时统计图 <a class="btn btn-success radius r"
                                                     style="line-height:1.6em;margin-top:3px"
                                                     href="javascript:location.replace(location.href);" title="刷新"><i
        class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <div class="f-14 c-error">系统在线人数实时统计图</div>
    <div id="container" style="min-width:400px;height:400px"></div>
</div>
<@admin_common.footer/>

<script type="text/javascript" src="/static/lib/hcharts/Highcharts/5.0.6/js/highcharts.js"></script>
<script type="text/javascript" src="/static/lib/hcharts/Highcharts/5.0.6/js/modules/exporting.js"></script>
<script type="text/javascript" src="/static/lib/hcharts/Highcharts/5.0.6/js/highcharts-3d.js"></script>
<script type="text/javascript">
    $(function () {
        Highcharts.setOptions({
            global: {
                useUTC: false
            }
        });

        function activeLastPointToolip(chart) {
            var points = chart.series[0].points;
            chart.tooltip.refresh(points[points.length - 1]);
        }

        $.ajax({
            url: '/admin/statistics/realtime/onlinecount',
            type: 'get',
            dataType: 'json',
            success: function (data) {
                var chart = Highcharts.chart('container', {
                    chart: {
                        type: 'spline',
                        marginRight: 10,
                        events: {
                            load: function () {
                                var series = this.series[0],
                                        chart = this;
                                activeLastPointToolip(chart);
                                setInterval(function () {
                                    var x = (new Date()).getTime(), // 当前时间
                                            y = data;
                                    series.addPoint([x, y], true, true);
                                    activeLastPointToolip(chart);
                                }, 1000);
                            }
                        }
                    },
                    title: {
                        text: '系统在线人数实时统计图'
                    },
                    xAxis: {
                        type: 'datetime',
                        tickPixelInterval: 150
                    },
                    yAxis: {
                        title: {
                            text: null
                        }
                    },
                    tooltip: {
                        formatter: function () {
                            return '<b>' + this.series.name + '</b><br/>' +
                                    Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) + '<br/>' +
                                    Highcharts.numberFormat(this.y, 2);
                        }
                    },
                    legend: {
                        enabled: false
                    },
                    series: [{
                        name: '在线人数',
                        data: (function () {
                            var data1 = [],
                                    time = (new Date()).getTime(),
                                    i;
                            for (i = -19; i <= 0; i += 1) {
                                data1.push({
                                    x: time + i * 1000,
                                    y: data
                                });
                            }
                            return data1;
                        }())
                    }]
                });
            }
        })
    });


</script>
</body>
</html>