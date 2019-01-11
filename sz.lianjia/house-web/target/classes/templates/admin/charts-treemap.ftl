<@admin_common.meta/>
<title>小区房产关系树图</title>
<script type="text/javascript" src="/static/lib/echarts/3.4.0/echarts.js"></script>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 统计管理 <span
        class="c-gray en">&gt;</span> 小区房产关系树图 <a class="btn btn-success radius r"
                                                  style="line-height:1.6em;margin-top:3px"
                                                  href="javascript:location.replace(location.href);" title="刷新"><i
        class="Hui-iconfont">&#xe68f;</i></a></nav>
<div id="main" style="width: 1700px;height:800px;"></div>
<script type="text/javascript">
    var myChart = echarts.init(document.getElementById('main'));

    myChart.showLoading();
    myChart.hideLoading();

    myChart.setOption(option = {
        tooltip: {
            trigger: 'item',
            triggerOn: 'mousemove'
        },
        series: [
            {
                type: 'tree',
                data: [
                    {
                        name: "小区房产关系树图",
                        children: [{
                            name: "深圳市",
                            children: [
                                {
                                    name: "万柳书苑",
                                    children: [
                                        {
                                            name: "枫丹丽舍大三居",
                                            value: 300
                                        },
                                        {
                                            name: "橡树湾 全南向 南北通透",
                                            value: 500
                                        },
                                        {
                                            name: "枫丹丽舍大三居",
                                            value: 300
                                        },
                                        {
                                            name: "中央花园大三居",
                                            value: 300
                                        }
                                    ]
                                },
                                {
                                    name: "阳光丽景",
                                    children: [
                                        {
                                            name: "枫丹丽舍大三居",
                                            value: 300
                                        },
                                        {
                                            name: "中央花园大三居",
                                            value: 300
                                        },
                                        {
                                            name: "万柳书苑 180平 南北通透",
                                            value: 800
                                        },
                                        {
                                            name: "中央花园大三居",
                                            value: 300
                                        },
                                        {
                                            name: "橡树湾 全南向 南北通透",
                                            value: 500
                                        }
                                    ]
                                },
                                {
                                    name: "橡树湾",
                                    children: [
                                        {
                                            name: "西山华府 120平",
                                            value: 600
                                        }
                                    ]
                                }
                            ]
                        },]
                    }


                ],

                top: '15%',
                bottom: '14%',

                layout: 'radial',

                symbol: 'emptyCircle',

                symbolSize: 6,

                initialTreeDepth: 3,

                animationDurationUpdate: 750

            }
        ]
    });
</script>
<@admin_common.footer/>
</body>
</html>