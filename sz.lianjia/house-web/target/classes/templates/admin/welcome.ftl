<@admin_common.meta/>
<title>我的桌面</title>
<script type="text/javascript" src="/static/lib/echarts/3.4.0/echarts.js"></script>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 我的桌面 <span
        class="c-gray en"></span>  <a class="btn btn-success radius r"
                                      style="line-height:1.6em;margin-top:3px"
                                      href="javascript:location.replace(location.href);" title="刷新"><i
        class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<p class="f-20 text-success">欢迎使用恋家房产销售平台后台管理系统！</p>
</div>
<div id="main" style="width: 1700px;height:900px;"></div>
<script type="text/javascript">
    var myChart = echarts.init(document.getElementById('main'));

    option = {
        tooltip : {
            formatter: "{a} <br/>{b} : {c}%"
        },
        toolbox: {
            feature: {
                restore: {},
                saveAsImage: {}
            }
        },
        series: [
            {
                name: 'CPU使用率',
                type: 'gauge',
                detail: {formatter:'{value}%'},
                data: [{value: 50, name: 'CPU使用率'}]
            }
        ]
    };

    setInterval(function () {
        option.series[0].data[0].value = (Math.random() * 100).toFixed(2) - 0;
        myChart.setOption(option, true);
    },2000);
</script>
</body>
</html>