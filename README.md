# LoveHome-Real-Estate-Platform

### 我的JavaWeb毕设项目(前台部分模仿链家网，后台用了H-ui框架。其中可能涉及一些链家网、H-ui等相关的信息，在这里说明，本项目仅供交流学习，不得用于商业传播等）


基于springboot+MyBatis+FreeMarker+redis+nginx等技术的JavaWeb项目------恋家房产平台


先简单放几张项目的图,视频演示放到repo里面去了。



前台首页：


![image](https://github.com/29DCH/LovingHome-Real-Estate-Platform/blob/master/img/11.png)


房产列表：


![image](https://github.com/29DCH/LovingHome-Real-Estate-Platform/blob/master/img/2.png)



房产详情页面：


![image](https://github.com/29DCH/LovingHome-Real-Estate-Platform/blob/master/img/10.png)


最新推荐：


![image](https://github.com/29DCH/LovingHome-Real-Estate-Platform/blob/master/img/12.png)



最热推荐：


![image](https://github.com/29DCH/LovingHome-Real-Estate-Platform/blob/master/img/14.png)



评价打分：


![image](https://github.com/29DCH/LovingHome-Real-Estate-Platform/blob/master/img/13.png)


博客列表：


![image](https://github.com/29DCH/LovingHome-Real-Estate-Platform/blob/master/img/9.png)


后台管理：


![image](https://github.com/29DCH/LovingHome-Real-Estate-Platform/blob/master/img/1.png)



房源评分饼状图：


![image](https://github.com/29DCH/LovingHome-Real-Estate-Platform/blob/master/img/3.png)


房价3D柱状图：


![image](https://github.com/29DCH/LovingHome-Real-Estate-Platform/blob/master/img/4.png)


小区房产关系树图：


![image](https://github.com/29DCH/LovingHome-Real-Estate-Platform/blob/master/img/5.png)


房源分布全国地图：


![image](https://github.com/29DCH/LovingHome-Real-Estate-Platform/blob/master/img/6.png)


房产热度南丁格尔图：


![image](https://github.com/29DCH/LovingHome-Real-Estate-Platform/blob/master/img/7.png)


系统在线人数实时统计图：


![image](https://github.com/29DCH/LovingHome-Real-Estate-Platform/blob/master/img/8.png)




技术如下，功能的话见项目内文档


Spring+SpringMvc+MyBatis框架


Redis缓存(Jedis客户端+连接池)实时热门数据统计


Spring Mail + Spring Task完成异步发送激活链接，邮件发送，验证


Jquery


BootStrap


Ajax


springBoot


Guava Cache(java工具类集的基础库,注册key的绑定)


Druid(监控目的的数据库连接池),配置文件里面加密数据库密码


Freemarker:基于Java的生成html的模板引擎，用来前后端交互

Nginx:反向代理服务器,Nginx搭建支持用户头像等静态资源的访问

Spring Admin(外部监控)、Spring Actuator(内部监控平台)

Mysql

图片服务器

SpringBoot CORS实现跨域

Echarts、HighCharts图表展示

poi报表导入导出

HttpSessionListener监听器统计系统当前在线人数




部署的话挺简单的，导入数据库，修改一下配置文件中的相关信息(我把数据库信息加密了，需要自行修改)，再把nginx和redis简单配置一下，启动起来，项目就能正常运转了，有问题可以联系我。
