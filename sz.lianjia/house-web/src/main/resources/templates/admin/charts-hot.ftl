<@admin_common.meta/>
<title>房产热度3D南丁格尔玫瑰图</title>
<script type="text/javascript" src="/static/lib/hcharts/Highcharts/5.0.6/js/highcharts.js"></script>
<script type="text/javascript" src="/static/lib/hcharts/Highcharts/5.0.6/js/modules/exporting.js"></script>
<script type="text/javascript" src="/static/lib/hcharts/Highcharts/5.0.6/js/highcharts-3d.js"></script>
<script type="text/javascript" src="/static/lib/echarts/3.4.0/echarts.js"></script>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 统计管理 <span
        class="c-gray en">&gt;</span> 房产热度3D南丁格尔玫瑰图 <a class="btn btn-success radius r"
                                                       style="line-height:1.6em;margin-top:3px"
                                                       href="javascript:location.replace(location.href);" title="刷新"><i
        class="Hui-iconfont">&#xe68f;</i></a></nav>
<div id="main" style="width: 1700px;height:900px;"></div>
<script type="text/javascript">
    var myChart = echarts.init(document.getElementById('main'));

    option = {
        title : {
            text: '房产热度',
            subtext: '3D南丁格尔玫瑰图',
            x:'center'
        },
        tooltip : {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            x : 'center',
            y : 'bottom',
            data:['rose1','rose2','rose3','rose4','rose5','rose6','rose7','rose8']
        },
        toolbox: {
            show : true,
            feature : {
                mark : {show: true},
                dataView : {show: true, readOnly: false},
                magicType : {
                    show: true,
                    type: ['pie', 'funnel']
                },
                restore : {show: true},
                saveAsImage : {show: true}
            }
        },
        calculable : true,
        series : [
            {
                name:'房源热度',
                type:'pie',
                radius : [30, 110],
                center : ['30%', '50%'],
                roseType : 'radius',
                label: {
                    normal: {
                        show: false
                    },
                    emphasis: {
                        show: true
                    }
                },
                lableLine: {
                    normal: {
                        show: false
                    },
                    emphasis: {
                        show: true
                    }
                },
                data:[
               <#list hotHouses as house>
                    {value:${house.hot},name: '${(house.name)!}'},
               </#list>
                ]
            },
            {
                name:'房源热度',
                type:'pie',
                radius : [30, 110],
                center : ['75%', '50%'],
                roseType : 'area',
                data:[
                     <#list hotHouses as house>
                    {value:${house.hot},name: '${(house.name)!}'},
                     </#list>
                ]
            }
        ]
    };

    myChart.setOption(option);
</script>
<@admin_common.footer/>
</body>
</html>