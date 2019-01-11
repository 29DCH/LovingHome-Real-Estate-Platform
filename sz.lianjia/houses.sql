/*
Navicat MySQL Data Transfer

Source Server         : zq
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : houses

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2019-01-11 11:55:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pwd` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `des` varchar(255) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('5', '1b2d2628944bfacd2253de4a31bba2f0', 'admin1', '12345678910', '123@163.com', null, '123', '2019-01-03 00:07:29');
INSERT INTO `admin` VALUES ('6', '27912e74b37d0126b83e4ccc44e424e2', 'admin2', '12345678901', '123124214@163.com', null, '哈哈', '2019-01-03 09:02:40');

-- ----------------------------
-- Table structure for agency
-- ----------------------------
DROP TABLE IF EXISTS `agency`;
CREATE TABLE `agency` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '经纪机构名称',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '地址',
  `phone` varchar(255) NOT NULL DEFAULT '' COMMENT '手机',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '电子邮件',
  `about_us` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `mobile` varchar(255) NOT NULL DEFAULT '' COMMENT '电话',
  `web_site` varchar(255) NOT NULL DEFAULT '' COMMENT '网站',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of agency
-- ----------------------------
INSERT INTO `agency` VALUES ('1', '恋家', '恋家地址', '010-1111111', '010@gmail.com', '恋家房产', '12345678910', 'https://sz.lianjia.com/');
INSERT INTO `agency` VALUES ('2', '早点房产', '早点房产地址', '010-2222222', '020@gmail.com', '早点房产', '12345678911', 'https://sz.lianjia.com/');
INSERT INTO `agency` VALUES ('3', '花田', '花田地址', '010-3333333', '030@gmail.com', '花田房产', '12345678912', 'https://sz.lianjia.com/');
INSERT INTO `agency` VALUES ('4', '豪客来', '豪客来地址', '010-4444444', '040@gmail.com', '豪客来房产', '12345678913', 'https://sz.lianjia.com/');
INSERT INTO `agency` VALUES ('5', '链家房产', '链家房产', '010-5555555', '050@163.com', '链家房产', '12345678914', 'https://sz.lianjia.com/');

-- ----------------------------
-- Table structure for agent_msg
-- ----------------------------
DROP TABLE IF EXISTS `agent_msg`;
CREATE TABLE `agent_msg` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `msg` varchar(512) NOT NULL DEFAULT '' COMMENT '消息',
  `create_time` date NOT NULL COMMENT '创建时间',
  `agent_id` bigint(20) NOT NULL COMMENT '经纪人id',
  `house_id` bigint(20) NOT NULL COMMENT '房屋id',
  `user_name` varchar(255) NOT NULL DEFAULT '' COMMENT '用户姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of agent_msg
-- ----------------------------
INSERT INTO `agent_msg` VALUES ('1', '111111', '2019-01-06', '13', '5', 'jgcs12345@163.com');
INSERT INTO `agent_msg` VALUES ('2', 'd', '2019-01-06', '13', '9', '111');
INSERT INTO `agent_msg` VALUES ('3', '1', '2019-01-06', '7', '24', '11');

-- ----------------------------
-- Table structure for blog
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tags` varchar(255) NOT NULL DEFAULT '' COMMENT '标签',
  `content` text NOT NULL COMMENT '内容',
  `create_time` date NOT NULL COMMENT '日期',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `cat` int(11) DEFAULT NULL COMMENT '分类1-准备买房，2-看房/选房，3-签约/定房，4-全款/贷款，5-缴税/过户，6-入住/交接，7-买房风险',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES ('1', 'a,b', '<div class=\"box-l\"><div class=\"m-article nocopy\"><div class=\"hd\"><h1 class=\"title\">深圳租房补贴升级 本科15000硕士25000，可补差额</h1><div class=\"meta\"><div class=\"meta-l\"><span class=\"time\">发布时间：2017-05-19 18:06:53</span><span class=\"author\">作者：路雅雯</span></div><div class=\"meta-r\"><span class=\"source\">来源：<span>链家网原创</span></span></div></div><p class=\"summary\"><span>文章摘要：</span><em>根据深圳去年8月的规定，新引进人才租房和生活补贴实行新标准，比之前标准有大幅度提高，而之前已经申领的，可按新标准补发差额部分。</em></p></div><div class=\"bd\"><!-- <div class=\"wrap-share\"><ul class=\"u-share\"><li class=\"item-1\"><a href=\"javascript:;\" class=\"jiathis_button_weixin\"></a></li><li class=\"item-2\"><a href=\"javascript:;\" class=\"jiathis_button_tsina\"></a></li><li class=\"item-3\"><a href=\"javascript:;\" class=\"jiathis_button_qzone\"></a></li><li class=\"item-4\"><a href=\"javascript:;\" class=\"jiathis_button_tqq\"></a></li></ul></div> --><div class=\"article-detail lj_editor_view\"><p>本科15000元/人、硕士25000元/人、博士30000元/人</p>\r\n<p>白花花的福利，正等着你来领取。根据深圳新近的规定，新引进人才租房和生活补贴实行新标准，比之前标准有大幅度提高，而之前已经申领的，可按新标准补发差额部分。</p>\r\n<p>&nbsp;&nbsp;</p>\r\n<p>2015年1月1日，深圳正式实施《深圳市人才安居办法》，满足条件的人才可申请住房补贴：本科6000元/人、硕士9000元/人、博士12000元/人。据统计，2015年深圳共向近4万名新引进人才发放1.33亿元租房补贴。</p>\r\n<p>&nbsp; &nbsp;&nbsp;</p>\r\n<p>为了招揽人才，留住人才，深圳今年再放大招，2016年3月18日，深圳市委常委会议审议通过《关于促进科技创新的若干措施》、《关于支持企业提升竞争力的若干措施》、《关于促进人才优先发展的若干措施》三大政策。其中，《关于促进人才优先发展的若干措施》之中提出，深圳将提高新引进基础性人才一次性租房和生活补贴：本科15000元/人、硕士25000元/人、博士30000元/人，较之前翻倍还不止。</p>\r\n<p>&nbsp; &nbsp;</p>\r\n<p>根据规定，如符合租房和生活补贴申领条件的新引进人才，即使此前已申领了租房补贴的，在实施办法发布后，可按新标准补发差额部分。同学们可先申请租房补贴，再进行补差。</p>\r\n<p>&nbsp;&nbsp;</p>\r\n<p><strong>申请范围</strong></p>\r\n<p>2015年1月1日后，经市、区人力资源部门(含新区、前海现代服务业合作区，以下简称市、区人力资源部门)<strong>接收的应届毕业生、新招调的在职人才、新引进的归国留学人员符合条件的，可以申请租房补贴</strong>。但机关事业单位在编人员不得申请租房补贴。</p>\r\n<p>&nbsp;&nbsp;</p>\r\n<p>2015年1月1日前已经办理人才引进手续(指取得高等院校毕业生接收函、在职人才招调通知、留学人员报到行政介绍信)并在2015年1月1日后再次申办的人员不属于《办法》规定的新引进人才。</p>\r\n<p><strong>发放条件</strong></p>\r\n<p>(1)学历条件：具有本科以上学历，以办理引进手续时申报的学历为准。</p>\r\n<p>(2)年龄条件：接收的应届毕业生和新引进的归国留学人员无年龄限制。新招调的在职人才应当符合下列年龄条件：本科未满30周岁、硕士未满35周岁、博士未满40周岁。上述年龄条件以调入年度的1月1日为判断时点(即截至引进前一年度12月31日满足年龄要求)。</p>\r\n<p>(3)发放条件：具有本市户籍、未享受过购房优惠政策、未正在租住或获准租住市区两级政府配租的公租房、未享受过政府发放的人才租房补贴。续发时除需满足上述条件外，还需在<strong>引进我市后累计在深缴纳三个月的社会保险</strong>。</p>\r\n<p>&nbsp;</p>\r\n<p><strong>办理时间</strong></p>\r\n<p>工作日(周一至周五)：上午9：00至12：00，下午2：00至5：45。</p>\r\n<p><strong>受理地址</strong></p>\r\n<p>市级受理地址：深圳市福田区深南大道8005号深圳市人才园行政服务大厅19号窗，咨询及投诉电话：88123602。</p>\r\n<p>区级新引进人才：福田区公共人事人才服务中心</p>\r\n<p>电话：82923947</p>\r\n<p>地址：福田区委2011室</p>\r\n<p>&nbsp;&nbsp;</p>\r\n<p>还可进行在线办理</p>\r\n<p></p><p class=\"insert-img\"><img alt=\"\" src=\"https://image1.ljcdn.com/neirong-image/neirong1495188277phpf0Qdqh.png\" srcset=\"https://image1.ljcdn.com/neirong-image/m_fit,w_375/neirong1495188277phpf0Qdqh.png 414w,https://image1.ljcdn.com/neirong-image/m_fit,w_750/neirong1495188277phpf0Qdqh.png 828w, https://image1.ljcdn.com/neirong-image/m_fit,w_1000/neirong1495188277phpf0Qdqh.png 1200w,https://image1.ljcdn.com/neirong-image/m_fit,w_2000/neirong1495188277phpf0Qdqh.png 2400w\" size=\"(max-width: 414px) 414px, (max-width: 828px) 828px, (max-width: 1200px) 1200px\" _src=\"https://image1.ljcdn.com/neirong-image/neirong1495188277phpf0Qdqh.png\" class=\"insert-img-img\"><span class=\"insert-img-img-title\"></span></p><p></p>\r\n<p><a target=\"_blank\" href=\"https://sz12333.gov.cn/szhr_pubtalent/talent_login.jsp\">引进人才租房补贴在线办理</a> （可点击左边链接，在线办理）</p>\r\n<p></p><img style=\"display: none;\" src=\"//dig.lianjia.com/t.gif?r=1547098667000&amp;d=%7B%22pid%22%3A%22page%22%2C%22key%22%3A%22jupiter.lianjia.com%5C%2Finfodetail%5C%2F161356%22%2C%22uuid%22%3A%22jupiter_default_cookie%22%2C%22ssid%22%3A%22jupiter_default_ssid%22%2C%22f%22%3A%22%22%2C%22evt%22%3A%221%2C3%22%7D\"><img style=\"display: none;\" src=\"//dig.lianjia.com/t.gif?r=1547098667000&amp;d=%7B%22pid%22%3A%22lianjiaweb%22%2C%22key%22%3A%22jupiter.lianjia.com%5C%2Finfodetail%5C%2F161356%22%2C%22uuid%22%3A%22b0d4aa40-6fd4-4117-818e-160979238673%22%2C%22ssid%22%3A%225801bd5c-a037-4548-b4a5-791e96a44951%22%2C%22f%22%3A%22https%3A%5C%2F%5C%2Fnews.lianjia.com%5C%2Fsz%5C%2Fbaike%5C%2F%22%2C%22evt%22%3A%221%2C3%22%7D\"></div><div class=\"article-info\"><div class=\"tags\"><a class=\"tag\" href=\"https://news.lianjia.com/sz/baike/tag租房/\" target=\"_blank\">租房</a></div><div class=\"btn-zan\"></div><div class=\"text-zan\"><var class=\"num-zan\" data-count=\"19\">19</var>人赞过</div></div></div></div></div>', '2019-01-10', '深圳租房补贴升级 本科15000硕士25000，可补差额', null);
INSERT INTO `blog` VALUES ('2', 'a,b', '<div class=\"box-l\"><div class=\"m-article nocopy\"><div class=\"hd\"><h1 class=\"title\">怎样申请安居房？保障性住房大攻略</h1><div class=\"meta\"><div class=\"meta-l\"><span class=\"time\">发布时间：2016-10-17 14:34:45</span><span class=\"author\">作者：路雅雯</span></div><div class=\"meta-r\"><span class=\"source\">来源：<span>链家网原创</span></span></div></div><p class=\"summary\"><span>文章摘要：</span><em>安居房是由政府补贴的非盈利性住房，为直接以成本价向中低收入家庭出售而建设的住房。那么除此之外申请安居房，我们需要做些什么？什么样的人可以申请安居房，别担心你让小编为你和盘托出。</em></p></div><div class=\"bd\"><!-- <div class=\"wrap-share\"><ul class=\"u-share\"><li class=\"item-1\"><a href=\"javascript:;\" class=\"jiathis_button_weixin\"></a></li><li class=\"item-2\"><a href=\"javascript:;\" class=\"jiathis_button_tsina\"></a></li><li class=\"item-3\"><a href=\"javascript:;\" class=\"jiathis_button_qzone\"></a></li><li class=\"item-4\"><a href=\"javascript:;\" class=\"jiathis_button_tqq\"></a></li></ul></div> --><div class=\"article-detail lj_editor_view\"><p>安居房是由政府补贴的非盈利性住房，为直接以成本价向中低收入家庭出售而建设的住房。那么除此之外申请安居房，我们需要做些什么？什么样的人可以申请安居房？别担心，下面为你和盘托出。</p>\r\n<p></p><p class=\"insert-img\"><img alt=\"\" src=\"https://image1.ljcdn.com/neirong-image/neirong1509503959phpbLHFE6.png\" srcset=\"https://image1.ljcdn.com/neirong-image/m_fit,w_375/neirong1509503959phpbLHFE6.png 414w,https://image1.ljcdn.com/neirong-image/m_fit,w_750/neirong1509503959phpbLHFE6.png 828w, https://image1.ljcdn.com/neirong-image/m_fit,w_1000/neirong1509503959phpbLHFE6.png 1200w,https://image1.ljcdn.com/neirong-image/m_fit,w_2000/neirong1509503959phpbLHFE6.png 2400w\" size=\"(max-width: 414px) 414px, (max-width: 828px) 828px, (max-width: 1200px) 1200px\" _src=\"https://image1.ljcdn.com/neirong-image/neirong1509503959phpbLHFE6.png\" class=\"insert-img-img\"><span class=\"insert-img-img-title\"></span></p><p></p>\r\n<h3>一、什么是安居房？</h3>\r\n<p>直接以成本价向中低收入家庭出售而建设的住房。</p>\r\n<p><strong>1-3人配售面积：65㎡，4人以上配售面积：85㎡</strong></p>\r\n<p></p><p class=\"insert-img\"><img alt=\"安居房的定义\" src=\"https://image1.ljcdn.com/baikeimg/test1476685814phpITp7yI.jpeg\" _src=\"https://image1.ljcdn.com/baikeimg/test1476685814phpITp7yI.jpeg\" class=\"insert-img-img\"><span class=\"insert-img-img-title\">安居房的定义</span></p><p></p>\r\n<h3>二、什么人可以申请安居房？</h3>\r\n<p><strong>购买安居型商品房应当以家庭为单位申请，申请人的配偶、未成年子女列为共同申请人，并同时符合以下条件：</strong></p>\r\n<p>深圳户籍；</p>\r\n<p>本市医疗保险缴费5年以上；</p>\r\n<p>未享受过购房优惠政策，未拥有任何形式自有主档，5年内未在本市转让过自有住房；</p>\r\n<p>符合国家计划生育政策；</p>\r\n<p>曾有婚史的，离婚前其原配、未成年子女在本市不得有任何形式的自有住房，且离婚日期距申请受理日满5年。</p>\r\n<p></p><p class=\"insert-img\"><img alt=\"&nbsp; &nbsp; &nbsp; &nbsp; 申请条件\" src=\"https://image1.ljcdn.com/baikeimg/test1476685855phpWi3UCL.jpeg\" _src=\"https://image1.ljcdn.com/baikeimg/test1476685855phpWi3UCL.jpeg\" class=\"insert-img-img\"><span class=\"insert-img-img-title\">&nbsp; &nbsp; &nbsp; &nbsp; 申请条件</span></p><p></p>\r\n<h3>三、什么人可以优先申请？</h3>\r\n<p>申请人为年满35周岁的单身居民，且符合前款规定条件，可以个人名义申请购买一居室安居型商品房。</p>\r\n<p></p><p class=\"insert-img\"><img alt=\"&nbsp; &nbsp;优先申请条件\" src=\"https://image1.ljcdn.com/baikeimg/test1476685544phpG6sTNp.jpeg\" _src=\"https://image1.ljcdn.com/baikeimg/test1476685544phpG6sTNp.jpeg\" class=\"insert-img-img\"><span class=\"insert-img-img-title\">&nbsp; &nbsp;优先申请条件</span></p><p></p>\r\n<h3>四、安居房轮候申请流程是什么？</h3>\r\n<p></p><p class=\"insert-img\"><img alt=\"申请流程\" src=\"https://image1.ljcdn.com/baikeimg/test1476685413phpGoe8wY.jpeg\" _src=\"https://image1.ljcdn.com/baikeimg/test1476685413phpGoe8wY.jpeg\" class=\"insert-img-img\"><span class=\"insert-img-img-title\">申请流程</span></p><p></p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p>\r\n<h3>五、售卖安居房需要哪些条件？</h3>\r\n<p>(1)领取安居房房地产证的业主。</p>\r\n<p>(2)征得原产权单位同意后向市房改办申请取得安居房全部产权，并换领市场商品房（红皮）房地产证。</p>\r\n<p></p><p class=\"insert-img\"><img alt=\"&nbsp; &nbsp; &nbsp;售卖安居房的条件\" src=\"https://image1.ljcdn.com/baikeimg/test1476685880phptot3DZ.jpeg\" _src=\"https://image1.ljcdn.com/baikeimg/test1476685880phptot3DZ.jpeg\" class=\"insert-img-img\"><span class=\"insert-img-img-title\">&nbsp; &nbsp; &nbsp;售卖安居房的条件</span></p><p></p>\r\n<p>&nbsp;</p>\r\n<p><strong>来源：链家网综合整理</strong></p>\r\n<p></p><img style=\"display: none;\" src=\"//dig.lianjia.com/t.gif?r=1547098946000&amp;d=%7B%22pid%22%3A%22page%22%2C%22key%22%3A%22jupiter.lianjia.com%5C%2Finfodetail%5C%2F43107%22%2C%22uuid%22%3A%22jupiter_default_cookie%22%2C%22ssid%22%3A%22jupiter_default_ssid%22%2C%22f%22%3A%22%22%2C%22evt%22%3A%221%2C3%22%7D\"><img style=\"display: none;\" src=\"//dig.lianjia.com/t.gif?r=1547098946000&amp;d=%7B%22pid%22%3A%22lianjiaweb%22%2C%22key%22%3A%22jupiter.lianjia.com%5C%2Finfodetail%5C%2F43107%22%2C%22uuid%22%3A%22b0d4aa40-6fd4-4117-818e-160979238673%22%2C%22ssid%22%3A%222c8a7fbe-19c4-993a-5ead-1091c4f966c7%22%2C%22f%22%3A%22https%3A%5C%2F%5C%2Fnews.lianjia.com%5C%2Fsz%5C%2Fbaike%5C%2F%22%2C%22evt%22%3A%221%2C3%22%7D\"></div><div class=\"article-info\"><div class=\"tags\"><a class=\"tag\" href=\"https://news.lianjia.com/sz/baike/tag房产政策/\" target=\"_blank\">房产政策</a></div><div class=\"btn-zan\"></div><div class=\"text-zan\"><var class=\"num-zan\" data-count=\"29\">29</var>人赞过</div></div></div></div></div>', '2019-01-06', '怎样申请安居房？保障性住房大攻略', null);
INSERT INTO `blog` VALUES ('3', 'a,b', '<div class=\"box-l\"><div class=\"m-article nocopy\"><div class=\"hd\"><h1 class=\"title\">什么是契税？契税可以减免吗？</h1><div class=\"meta\"><div class=\"meta-l\"><span class=\"time\">发布时间：2017-05-15 15:45:43</span><span class=\"author\">作者：刘晓婷</span></div><div class=\"meta-r\"><span class=\"source\">来源：<span>链家网原创</span></span></div></div><p class=\"summary\"><span>文章摘要：</span><em>契税是房屋买卖中国家规定必须交的税种，城镇拆迁户、法定继承人继承房产、因灾害等重新购房可以减免契税。</em></p></div><div class=\"bd\"><!-- <div class=\"wrap-share\"><ul class=\"u-share\"><li class=\"item-1\"><a href=\"javascript:;\" class=\"jiathis_button_weixin\"></a></li><li class=\"item-2\"><a href=\"javascript:;\" class=\"jiathis_button_tsina\"></a></li><li class=\"item-3\"><a href=\"javascript:;\" class=\"jiathis_button_qzone\"></a></li><li class=\"item-4\"><a href=\"javascript:;\" class=\"jiathis_button_tqq\"></a></li></ul></div> --><div class=\"article-detail lj_editor_view\"><p>契税是购买新房之后必交的税之一，那购房契税的缴纳标准是什么呢？我们该为自己的房子付多少契税，这点购房者有必要提前了解清楚，以方便我们更好的计算出自己购房的资金。</p>\r\n<p></p><p class=\"insert-img\"><img alt=\"\" src=\"https://image1.ljcdn.com/neirong-image/neirong1494828846phpgxNFQT.png\" srcset=\"https://image1.ljcdn.com/neirong-image/m_fit,w_375/neirong1494828846phpgxNFQT.png 414w,https://image1.ljcdn.com/neirong-image/m_fit,w_750/neirong1494828846phpgxNFQT.png 828w, https://image1.ljcdn.com/neirong-image/m_fit,w_1000/neirong1494828846phpgxNFQT.png 1200w,https://image1.ljcdn.com/neirong-image/m_fit,w_2000/neirong1494828846phpgxNFQT.png 2400w\" size=\"(max-width: 414px) 414px, (max-width: 828px) 828px, (max-width: 1200px) 1200px\" _src=\"https://image1.ljcdn.com/neirong-image/neirong1494828846phpgxNFQT.png\" class=\"insert-img-img\"><span class=\"insert-img-img-title\"></span></p><p></p>\r\n<h3>一、契税的定义是什么？</h3>\r\n<p>契税是以所有权发生转移变动的不动产为征税对象，向产权承受人征收的一种财产税。应缴税范围包括：土地使用权出售、赠与和交换，房屋买卖，房屋赠与，房屋交换等。</p>\r\n<p>&nbsp;&nbsp;</p>\r\n<h3>二、购房契税目前征收标准是什么？</h3>\r\n<p>根据2016年2月19日，财政部、国家税务总局、住房城乡建设部三部委发布的《关于调整房地产交易环节契税、营业税优惠政策的通知》，如果你在深圳购买首套房且房子小于等于90平方米，契税税率为1%，房子如果大于90平方米，契税税率为1.5%；如果你买的是第二套房，不论房屋面积大小，契税税率为3%，没有减免情况。此外，非居住用房(商铺、办公写字楼、商务公寓等)的契税税率也为3%。</p>\r\n<p><strong>契税的计税公式为：计税金额×税率，这里的计税金额是指过户时税局的核定价格。</strong></p>\r\n<p></p><p class=\"insert-img\"><img alt=\"\" src=\"https://image1.ljcdn.com/neirong-image/neirong1494829506phpnoAT67.png\" srcset=\"https://image1.ljcdn.com/neirong-image/m_fit,w_375/neirong1494829506phpnoAT67.png 414w,https://image1.ljcdn.com/neirong-image/m_fit,w_750/neirong1494829506phpnoAT67.png 828w, https://image1.ljcdn.com/neirong-image/m_fit,w_1000/neirong1494829506phpnoAT67.png 1200w,https://image1.ljcdn.com/neirong-image/m_fit,w_2000/neirong1494829506phpnoAT67.png 2400w\" size=\"(max-width: 414px) 414px, (max-width: 828px) 828px, (max-width: 1200px) 1200px\" _src=\"https://image1.ljcdn.com/neirong-image/neirong1494829506phpnoAT67.png\" class=\"insert-img-img\"><span class=\"insert-img-img-title\"></span></p><p></p>\r\n<h3>三、房产契税减免的情况有哪些？</h3>\r\n<p><strong>1.城镇拆迁户</strong></p>\r\n<p>根据《财政部&nbsp;国家税务总局关于企业以售后回租方式进行融资等有关契税政策的通知》财税〔2012〕82号，针对于拆迁户，对被拆迁人因拆迁重新购置住房的，对购房成交价格中相当于拆迁补偿款的部分免征契税，成交价格超过拆迁补偿款的，对超过部分征收契税。</p>\r\n<p>&nbsp;</p>\r\n<p><strong>2.夫妻间房产更名</strong></p>\r\n<p>根据《财政部&nbsp;国家税务总局关于夫妻之间土地权属变更有关契税政策的通知》（财税〔2014〕4号），在婚姻关系存续期间，夫妻之间的房屋、土地权属“加名”、“减名”、“换名”或变更共有份额的，均享受免征契税优惠。</p>\r\n<p>&nbsp;</p>\r\n<p><strong>3.法定继承人继承房产</strong></p>\r\n<p>《国家税务总局关于继承土地、房屋权属有关契税问题的批复》的通知中提到，对于《中华人民共和国继承法》规定的法定继承人(包括配偶、子女、父母、兄弟姐妹、祖父母、外祖父母)继承土地、房屋权属“不征契税”。</p>\r\n<p>&nbsp;&nbsp;</p>\r\n<p><strong>4.因灾害等重新购房的</strong></p>\r\n<p>根据《财政部国家税务总局关于认真落实抗震救灾及灾后重建税收政策问题的通知》财税〔2008〕62号第四条，因不可抗力灭失住房而重新购买住房的，酌情准予减征或者免征契税。不可抗力是指自然灾害、战争等不能预见、避免、克服的客观情况。</p>\r\n<p>&nbsp;</p>\r\n<h3>四、契税发票丢失后如何补办？</h3>\r\n<p><strong>契税发票丢失后，购房者可以携带本人身份证、房产证原件到区房管交易所档案馆查询契税缴税档案，将契税票复印并加盖公章就可以了。</strong>加盖公章后的契税票复印件效力等同于原件，办理前请了解相关部门的工作时间。</p>\r\n<p>&nbsp;&nbsp;</p>\r\n<p><strong>来源：</strong>《关于调整房地产交易环节契税、营业税优惠政策的通知》、《关于企业以售后回租方式进行融资等有关契税政策的通知》、《关于夫妻之间土地权属变更有关契税政策的通知》、《关于继承土地、房屋权属有关契税问题的批复》、《中华人民共和国继承法》、《关于公有制单位职工首次购买住房免征契税的通知》、《关于认真落实抗震救灾及灾后重建税收政策问题的通知》&nbsp;</p>\r\n<p></p><img style=\"display: none;\" src=\"//dig.lianjia.com/t.gif?r=1547098992000&amp;d=%7B%22pid%22%3A%22page%22%2C%22key%22%3A%22jupiter.lianjia.com%5C%2Finfodetail%5C%2F157892%22%2C%22uuid%22%3A%22jupiter_default_cookie%22%2C%22ssid%22%3A%22jupiter_default_ssid%22%2C%22f%22%3A%22%22%2C%22evt%22%3A%221%2C3%22%7D\"><img style=\"display: none;\" src=\"//dig.lianjia.com/t.gif?r=1547098992000&amp;d=%7B%22pid%22%3A%22lianjiaweb%22%2C%22key%22%3A%22jupiter.lianjia.com%5C%2Finfodetail%5C%2F157892%22%2C%22uuid%22%3A%22b0d4aa40-6fd4-4117-818e-160979238673%22%2C%22ssid%22%3A%222c8a7fbe-19c4-993a-5ead-1091c4f966c7%22%2C%22f%22%3A%22https%3A%5C%2F%5C%2Fnews.lianjia.com%5C%2Fsz%5C%2Fbaike%5C%2F%22%2C%22evt%22%3A%221%2C3%22%7D\"></div><div class=\"article-info\"><div class=\"tags\"><a class=\"tag\" href=\"https://news.lianjia.com/sz/baike/tag契税/\" target=\"_blank\">契税</a></div><div class=\"btn-zan\"></div><div class=\"text-zan\"><var class=\"num-zan\" data-count=\"28\">28</var>人赞过</div></div></div></div></div>', '2019-01-06', '什么是契税？契税可以减免吗？', null);
INSERT INTO `blog` VALUES ('4', 'a,b', '<div class=\"box-l\"><div class=\"m-article nocopy\"><div class=\"hd\"><h1 class=\"title\">买二手房 怎么辨别房屋真实房龄？</h1><div class=\"meta\"><div class=\"meta-l\"><span class=\"time\">发布时间：2017-04-17 13:55:12</span><span class=\"author\">作者：路雅雯</span></div><div class=\"meta-r\"><span class=\"source\">来源：<span>链家网原创</span></span></div></div><p class=\"summary\"><span>文章摘要：</span><em>买二手房辨别房屋真实房龄的方法有：房屋产权登记部门查询，查看产权证，观察房屋内外结构，多方打听收集信息等。</em></p></div><div class=\"bd\"><!-- <div class=\"wrap-share\"><ul class=\"u-share\"><li class=\"item-1\"><a href=\"javascript:;\" class=\"jiathis_button_weixin\"></a></li><li class=\"item-2\"><a href=\"javascript:;\" class=\"jiathis_button_tsina\"></a></li><li class=\"item-3\"><a href=\"javascript:;\" class=\"jiathis_button_qzone\"></a></li><li class=\"item-4\"><a href=\"javascript:;\" class=\"jiathis_button_tqq\"></a></li></ul></div> --><div class=\"article-detail lj_editor_view\"><p>买二手房为什么要关注房龄？如果买房龄太大的二手房，可能会遇到不能贷款、物业成本增加、土地使用年限相应缩短等问题。所以在看房的时候要多辨别房龄。</p>\r\n<p></p><p class=\"insert-img\"><img alt=\"\" src=\"https://image1.ljcdn.com/neirong-image/neirong1524561499phpW1q7lE.png\" srcset=\"https://image1.ljcdn.com/neirong-image/m_fit,w_375/neirong1524561499phpW1q7lE.png 414w,https://image1.ljcdn.com/neirong-image/m_fit,w_750/neirong1524561499phpW1q7lE.png 828w, https://image1.ljcdn.com/neirong-image/m_fit,w_1000/neirong1524561499phpW1q7lE.png 1200w,https://image1.ljcdn.com/neirong-image/m_fit,w_2000/neirong1524561499phpW1q7lE.png 2400w\" size=\"(max-width: 414px) 414px, (max-width: 828px) 828px, (max-width: 1200px) 1200px\" _src=\"https://image1.ljcdn.com/neirong-image/neirong1524561499phpW1q7lE.png\" class=\"insert-img-img\"><span class=\"insert-img-img-title\"></span></p><p></p>\r\n<h3>一、到产权登记部门查询</h3>\r\n<p><strong>买二手房，辨别房龄最合适的办法就是去房屋产权登记部门查档</strong>，一般是住建委所在地或是不动产登记中心，在那能查到最准确的房龄。但是这一操作对于买家来说比较困难，需要由卖家带上产权证、身份证等相关证件去查询，费时费力，很多卖家都不愿意配合，尤其是在没拿到定金之前。</p>\r\n<p><strong>就算房龄是影响贷款的，买家需要查询也是要等到签过合同进入贷款阶段才行。</strong>也就是说，如果卖家不主动配合，那么买家只有在完成了交易手续后，才能到房产局查询。</p>\r\n<p>&nbsp; &nbsp; &nbsp;</p>\r\n<h3>二、查看产权证</h3>\r\n<p><strong>产权证的办理时间大致能推断出房龄。</strong>首次出卖的二手房可通过下面这个方法推算，如果是商品房，可由产权办理时间往前推一两年时间，如果是公房则时间更长，最少往前推两三年时间。</p>\r\n<p>而如果是多次转让的房子，可以看房产证上房屋的建成年代，有些房屋的房产证上会显示建成年代。有的房产证上会有测绘页，上面会有房屋建成年代的记载，可以做房龄参考。</p>\r\n<p>&nbsp; &nbsp; &nbsp;</p>\r\n<h3>三、观察房屋内外结构</h3>\r\n<p>买二手房看房的时候也应该注意房龄问题，特别是刚刚粉饰过的墙面，很有可能是为了出售而翻新。看房的时候需要注意观察厨房、卫生间。因为<strong>厨卫的装修关系到众多管道，不容易更换</strong>，一般能从装修风格、材质能判断房屋的装修年代，从而大致推出房屋的年龄。还有就是<strong>地板的装修也不容易更换</strong>，地板的成色以及款式，都能看出房屋的装修年代。</p>\r\n<p></p><p class=\"insert-img\"><img alt=\"装修\" src=\"https://image1.ljcdn.com/neirong-image/neirong1492407979phprUexps.jpeg\" srcset=\"https://image1.ljcdn.com/neirong-image/m_fit,w_375/neirong1492407979phprUexps.jpeg 414w,https://image1.ljcdn.com/neirong-image/m_fit,w_750/neirong1492407979phprUexps.jpeg 828w, https://image1.ljcdn.com/neirong-image/m_fit,w_1000/neirong1492407979phprUexps.jpeg 1200w,https://image1.ljcdn.com/neirong-image/m_fit,w_2000/neirong1492407979phprUexps.jpeg 2400w\" size=\"(max-width: 414px) 414px, (max-width: 828px) 828px, (max-width: 1200px) 1200px\" _src=\"https://image1.ljcdn.com/neirong-image/neirong1492407979phprUexps.jpeg\" class=\"insert-img-img\"><span class=\"insert-img-img-title\">装修</span></p><p></p>\r\n<h3>四、多方打听收集信息</h3>\r\n<p>一个是通过中介打听，中介门店一般都在小区周围，对房屋的真实年龄比较了解，靠谱的中介公司一般都会告知你真实信息；二是通过小区物业或邻居打听，通过旁敲侧击获得答案，了解真实的房龄。</p>\r\n<p>&nbsp;</p>\r\n<p>所以在购买二手房时，应当在合同中注明房龄。<strong>如果在签订合同后发现中介或卖家在签署协议过程中，故意隐瞒房屋真实房龄，购房人有权要求中介或卖家赔偿因此造成的损失。</strong>如果卖房者有恶意隐瞒房屋真实房龄的情况，严重损害购房者利益，则购房者有权依据《合同法》的规定变更或解除购房合同，并可要求赔偿损失。</p>\r\n<p>&nbsp;</p>\r\n<p><strong>来源：链家网综合整理</strong></p>\r\n<p></p><img style=\"display: none;\" src=\"//dig.lianjia.com/t.gif?r=1547099054000&amp;d=%7B%22pid%22%3A%22page%22%2C%22key%22%3A%22jupiter.lianjia.com%5C%2Finfodetail%5C%2F141318%22%2C%22uuid%22%3A%22jupiter_default_cookie%22%2C%22ssid%22%3A%22jupiter_default_ssid%22%2C%22f%22%3A%22%22%2C%22evt%22%3A%221%2C3%22%7D\"><img style=\"display: none;\" src=\"//dig.lianjia.com/t.gif?r=1547099054000&amp;d=%7B%22pid%22%3A%22lianjiaweb%22%2C%22key%22%3A%22jupiter.lianjia.com%5C%2Finfodetail%5C%2F141318%22%2C%22uuid%22%3A%22b0d4aa40-6fd4-4117-818e-160979238673%22%2C%22ssid%22%3A%222c8a7fbe-19c4-993a-5ead-1091c4f966c7%22%2C%22f%22%3A%22https%3A%5C%2F%5C%2Fnews.lianjia.com%5C%2Fsz%5C%2Fbaike%5C%2F%22%2C%22evt%22%3A%221%2C3%22%7D\"></div><div class=\"article-info\"><div class=\"tags\"><a class=\"tag\" href=\"https://news.lianjia.com/sz/baike/tag二手房/\" target=\"_blank\">二手房</a></div><div class=\"btn-zan\"></div><div class=\"text-zan\"><var class=\"num-zan\" data-count=\"5\">5</var>人赞过</div></div></div></div></div>', '2019-01-10', '买二手房 怎么辨别房屋真实房龄？', null);
INSERT INTO `blog` VALUES ('5', 'a,b', '<div class=\"box-l\"><div class=\"m-article nocopy\"><div class=\"hd\"><h1 class=\"title\">房产交易中的赎楼罚息  究竟怎么算？</h1><div class=\"meta\"><div class=\"meta-l\"><span class=\"time\">发布时间：2017-04-06 17:03:36</span><span class=\"author\">作者：路雅雯</span></div><div class=\"meta-r\"><span class=\"source\">来源：<span>链家网原创</span></span></div></div><p class=\"summary\"><span>文章摘要：</span><em>在二手房交易中，经常会听中介说二手房提前赎楼需要交一定金额的罚息，那么，究竟什么是赎楼罚息，一起来看看。</em></p></div><div class=\"bd\"><!-- <div class=\"wrap-share\"><ul class=\"u-share\"><li class=\"item-1\"><a href=\"javascript:;\" class=\"jiathis_button_weixin\"></a></li><li class=\"item-2\"><a href=\"javascript:;\" class=\"jiathis_button_tsina\"></a></li><li class=\"item-3\"><a href=\"javascript:;\" class=\"jiathis_button_qzone\"></a></li><li class=\"item-4\"><a href=\"javascript:;\" class=\"jiathis_button_tqq\"></a></li></ul></div> --><div class=\"article-detail lj_editor_view\"><p>究竟什么是赎楼罚息？各大银行都有哪些罚息政策，具体又如何计算赎楼罚息的呢？下面这张图一定会让你弄明白！</p>\r\n<p></p><p class=\"insert-img\"><img alt=\"\" src=\"https://image1.ljcdn.com/neirong-image/neirong1513165566phpqeh0Gv.png\" srcset=\"https://image1.ljcdn.com/neirong-image/m_fit,w_375/neirong1513165566phpqeh0Gv.png 414w,https://image1.ljcdn.com/neirong-image/m_fit,w_750/neirong1513165566phpqeh0Gv.png 828w, https://image1.ljcdn.com/neirong-image/m_fit,w_1000/neirong1513165566phpqeh0Gv.png 1200w,https://image1.ljcdn.com/neirong-image/m_fit,w_2000/neirong1513165566phpqeh0Gv.png 2400w\" size=\"(max-width: 414px) 414px, (max-width: 828px) 828px, (max-width: 1200px) 1200px\" _src=\"https://image1.ljcdn.com/neirong-image/neirong1513165566phpqeh0Gv.png\" class=\"insert-img-img\"><span class=\"insert-img-img-title\"></span></p><p></p>\r\n<h3>一、什么是罚息？</h3>\r\n<p>赎楼罚息：二手房交易中，有抵押的房产在上市交易之前，需要向银行申请提前还款，进行赎楼，而银行增加一部分利息作为处罚，此部分额外增加的利息被称为赎楼罚息。</p>\r\n<p></p><p class=\"insert-img\"><img alt=\"罚息的定义\" src=\"https://image1.ljcdn.com/neirong-image/neirong1491468570phpkjeOfx.jpeg\" srcset=\"https://image1.ljcdn.com/neirong-image/m_fit,w_375/neirong1491468570phpkjeOfx.jpeg 414w,https://image1.ljcdn.com/neirong-image/m_fit,w_750/neirong1491468570phpkjeOfx.jpeg 828w, https://image1.ljcdn.com/neirong-image/m_fit,w_1000/neirong1491468570phpkjeOfx.jpeg 1200w,https://image1.ljcdn.com/neirong-image/m_fit,w_2000/neirong1491468570phpkjeOfx.jpeg 2400w\" size=\"(max-width: 414px) 414px, (max-width: 828px) 828px, (max-width: 1200px) 1200px\" _src=\"https://image1.ljcdn.com/neirong-image/neirong1491468570phpkjeOfx.jpeg\" class=\"insert-img-img\"><span class=\"insert-img-img-title\">罚息的定义</span></p><p></p>\r\n<h3>二、五大银行罚息细则</h3>\r\n<p></p><p class=\"insert-img\"><img alt=\"五大银行罚息细则&nbsp;\" src=\"https://image1.ljcdn.com/neirong-image/1513669546878file44.jpg\" srcset=\"https://image1.ljcdn.com/neirong-image/m_fit,w_375/1513669546878file44.jpg 414w,https://image1.ljcdn.com/neirong-image/m_fit,w_750/1513669546878file44.jpg 828w, https://image1.ljcdn.com/neirong-image/m_fit,w_1000/1513669546878file44.jpg 1200w,https://image1.ljcdn.com/neirong-image/m_fit,w_2000/1513669546878file44.jpg 2400w\" size=\"(max-width: 414px) 414px, (max-width: 828px) 828px, (max-width: 1200px) 1200px\" _src=\"https://image1.ljcdn.com/neirong-image/1513669546878file44.jpg\" class=\"insert-img-img\"><span class=\"insert-img-img-title\">五大银行罚息细则&nbsp;</span></p><p></p>\r\n<h3>三、注意事项</h3>\r\n<p>1.买、卖双方同一银行按揭贷款，工商银行可减1.5个月罚息。</p>\r\n<p>2.针对提前还部分贷款的购房者，招商银行收取还款金额的1.5%，农业银行收取还款金额的1%。</p>\r\n<p>3.所有政策仅供参考，具体以借款合同为准，同时提前1个月申请还款。</p>\r\n<p>【示例】</p>\r\n<p>元芳有一套贷款30年、贷款总额为205万元的房子，按照等额本息还款方式还款，他每个月需还10277元，第一个月利息为7533元，第二个月利息为7523元，第三个月利息为7513元。目前房贷已还满2年，按照中国银行罚3个月利息的政策，如果他想提前赎楼，需要额外支付22569元罚息。</p>\r\n<p>&nbsp;</p>\r\n<p><strong>来源：链家网综合整理</strong></p>\r\n<p></p><img style=\"display: none;\" src=\"//dig.lianjia.com/t.gif?r=1547099092000&amp;d=%7B%22pid%22%3A%22page%22%2C%22key%22%3A%22jupiter.lianjia.com%5C%2Finfodetail%5C%2F137173%22%2C%22uuid%22%3A%22jupiter_default_cookie%22%2C%22ssid%22%3A%22jupiter_default_ssid%22%2C%22f%22%3A%22%22%2C%22evt%22%3A%221%2C3%22%7D\"><img style=\"display: none;\" src=\"//dig.lianjia.com/t.gif?r=1547099092000&amp;d=%7B%22pid%22%3A%22lianjiaweb%22%2C%22key%22%3A%22jupiter.lianjia.com%5C%2Finfodetail%5C%2F137173%22%2C%22uuid%22%3A%22b0d4aa40-6fd4-4117-818e-160979238673%22%2C%22ssid%22%3A%222c8a7fbe-19c4-993a-5ead-1091c4f966c7%22%2C%22f%22%3A%22https%3A%5C%2F%5C%2Fnews.lianjia.com%5C%2Fsz%5C%2Fbaike%5C%2F%22%2C%22evt%22%3A%221%2C3%22%7D\"></div><div class=\"article-info\"><div class=\"tags\"><a class=\"tag\" href=\"https://news.lianjia.com/sz/baike/tag购房贷款/\" target=\"_blank\">购房贷款</a></div><div class=\"btn-zan\"></div><div class=\"text-zan\"><var class=\"num-zan\" data-count=\"28\">28</var>人赞过</div></div></div></div></div>', '2019-01-06', '房产交易中的赎楼罚息  究竟怎么算？', null);
INSERT INTO `blog` VALUES ('6', 'a,b', '<div class=\"box-l\"><div class=\"m-article nocopy\"><div class=\"hd\"><h1 class=\"title\">跳槽来深圳 住房公积金怎么变更</h1><div class=\"meta\"><div class=\"meta-l\"><span class=\"time\">发布时间：2016-07-22 17:56:35</span><span class=\"author\">作者：刘晓婷</span></div><div class=\"meta-r\"><span class=\"source\">来源：<span>链家网原创</span></span></div></div><p class=\"summary\"><span>文章摘要：</span><em>异地公积金可以在深圳贷款买房，但是必须是深圳户籍，且是购买首套住房。满足这个基本条件后，只要在异地的公积金中心开具证明材料就可以了</em></p></div><div class=\"bd\"><!-- <div class=\"wrap-share\"><ul class=\"u-share\"><li class=\"item-1\"><a href=\"javascript:;\" class=\"jiathis_button_weixin\"></a></li><li class=\"item-2\"><a href=\"javascript:;\" class=\"jiathis_button_tsina\"></a></li><li class=\"item-3\"><a href=\"javascript:;\" class=\"jiathis_button_qzone\"></a></li><li class=\"item-4\"><a href=\"javascript:;\" class=\"jiathis_button_tqq\"></a></li></ul></div> --><div class=\"article-detail lj_editor_view\"><p>异地公积金可以在深圳贷款买房，但是必须是深圳户籍，且是购买首套住房。满足这个基本条件后，只要在异地的公积金中心开具证明材料就可以了。</p>\r\n<p><strong>一、首套</strong></p>\r\n<p>1.小唐是深圳户籍，此前在上海缴存公积金。可以购买深圳的首套住房。</p>\r\n<p>①在异地公积金中心（例如上海公积金管理中心）提供如下材料：</p>\r\n<p>申请当月前6个月在异地连续足额缴纳公积金；</p>\r\n<p>异地公积金出具近一年缴存明细和证明；</p>\r\n<p>（如果需要，则提供无房证明；）</p>\r\n<p></p><p class=\"insert-img\"><img alt=\"\" src=\"https://image1.ljcdn.com/baikeimg/test1469183499phpjum49L.jpeg\" _src=\"https://image1.ljcdn.com/baikeimg/test1469183499phpjum49L.jpeg\" class=\"insert-img-img\"><span class=\"insert-img-img-title\"></span></p><p></p>\r\n<p>②在深圳市住房公积金管理中心提出申请办理</p>\r\n<p><strong>备注</strong>：如果在异地名下有住房，但是在深圳市属于首套住房，也可以在深圳购买。</p>\r\n<p>2.小霄是外地户籍，此前在北京缴存公积金，这种情况是不可以在深圳用公积金购买住房的。目前公积金购房只针对深圳户籍。</p>\r\n<p></p><p class=\"insert-img\"><img alt=\"\" src=\"https://image1.ljcdn.com/baikeimg/test1469183526phpWA9wLL.jpeg\" _src=\"https://image1.ljcdn.com/baikeimg/test1469183526phpWA9wLL.jpeg\" class=\"insert-img-img\"><span class=\"insert-img-img-title\"></span></p><p></p>\r\n<p><strong>二、二套</strong></p>\r\n<p>深圳/非深圳户籍、公积金外地缴存，都不可以使用公积金在深圳购买第二套住房</p>\r\n<p></p><p class=\"insert-img\"><img alt=\"\" src=\"https://image1.ljcdn.com/baikeimg/test1469183526phplkS9LM.jpeg\" _src=\"https://image1.ljcdn.com/baikeimg/test1469183526phplkS9LM.jpeg\" class=\"insert-img-img\"><span class=\"insert-img-img-title\"></span></p><p></p>\r\n<p></p><p class=\"insert-img\"><img alt=\"\" src=\"https://image1.ljcdn.com/baikeimg/test1469183526phpA37bQL.jpeg\" _src=\"https://image1.ljcdn.com/baikeimg/test1469183526phpA37bQL.jpeg\" class=\"insert-img-img\"><span class=\"insert-img-img-title\"></span></p><p></p>\r\n<p>&nbsp;</p>\r\n<p><strong>来源：链家网综合整理、深圳市公积金管理中心</strong></p>\r\n<p></p><img style=\"display: none;\" src=\"//dig.lianjia.com/t.gif?r=1547099127000&amp;d=%7B%22pid%22%3A%22page%22%2C%22key%22%3A%22jupiter.lianjia.com%5C%2Finfodetail%5C%2F18118%22%2C%22uuid%22%3A%22jupiter_default_cookie%22%2C%22ssid%22%3A%22jupiter_default_ssid%22%2C%22f%22%3A%22%22%2C%22evt%22%3A%221%2C3%22%7D\"><img style=\"display: none;\" src=\"//dig.lianjia.com/t.gif?r=1547099127000&amp;d=%7B%22pid%22%3A%22lianjiaweb%22%2C%22key%22%3A%22jupiter.lianjia.com%5C%2Finfodetail%5C%2F18118%22%2C%22uuid%22%3A%22b0d4aa40-6fd4-4117-818e-160979238673%22%2C%22ssid%22%3A%222c8a7fbe-19c4-993a-5ead-1091c4f966c7%22%2C%22f%22%3A%22https%3A%5C%2F%5C%2Fnews.lianjia.com%5C%2Fsz%5C%2Fbaike%5C%2F%22%2C%22evt%22%3A%221%2C3%22%7D\"></div><div class=\"article-info\"><div class=\"tags\"><a class=\"tag\" href=\"https://news.lianjia.com/sz/baike/tag公积金/\" target=\"_blank\">公积金</a></div><div class=\"btn-zan\"></div><div class=\"text-zan\"><var class=\"num-zan\" data-count=\"9\">9</var>人赞过</div></div></div></div></div>', '2019-01-10', '跳槽来深圳 住房公积金怎么变更', null);
INSERT INTO `blog` VALUES ('7', 'a,b', '<div class=\"box-l\"><div class=\"m-article nocopy\"><div class=\"hd\"><h1 class=\"title\">不动产权证如何辨真伪？</h1><div class=\"meta\"><div class=\"meta-l\"><span class=\"time\">发布时间：2016-06-29 10:04:32</span><span class=\"author\">作者：刘晓婷</span></div><div class=\"meta-r\"><span class=\"source\">来源：<span>链家网原创</span></span></div></div><img class=\"article-img\" src=\"https://image1.ljcdn.com/baikeimg/test1467166558phpawLhwl.jpeg\" alt=\"不动产权证如何辨真伪？\"></div><div class=\"bd\"><!-- <div class=\"wrap-share\"><ul class=\"u-share\"><li class=\"item-1\"><a href=\"javascript:;\" class=\"jiathis_button_weixin\"></a></li><li class=\"item-2\"><a href=\"javascript:;\" class=\"jiathis_button_tsina\"></a></li><li class=\"item-3\"><a href=\"javascript:;\" class=\"jiathis_button_qzone\"></a></li><li class=\"item-4\"><a href=\"javascript:;\" class=\"jiathis_button_tqq\"></a></li></ul></div> --><div class=\"article-detail lj_editor_view\"><p>日常情况下，房产问题牵扯的金额数目巨大，所以面对辨别房产证这一问题，我们需要用更多的耐心和知识来武装自己，保护我们的权利！</p>\r\n<p>1.&nbsp;不动产权证本身是亚光封面，如果看到光滑的封皮就一定须多加留意。</p>\r\n<p>2.&nbsp;《&nbsp;不动产权证》上有“深房地字第×××号”字样的编号，该编号按照发放顺序进行编排，其中第一位数字代表房地产所在辖区：“2”代表罗湖区、“3”代表福田区、“4”代表南山区、“5”代表宝安区（包括光明新区）、“6”代表龙岗区、“7”代表盐田区。&nbsp;</p>\r\n<p></p><p class=\"insert-img\"><img alt=\"\" src=\"https://image1.ljcdn.com/baikeimg/test1467165977phpZxaGgT.jpeg\" _src=\"https://image1.ljcdn.com/baikeimg/test1467165977phpZxaGgT.jpeg\" class=\"insert-img-img\"><span class=\"insert-img-img-title\"></span></p><p></p>\r\n<p>3.&nbsp;进行核对时，还要关注该物业的宗地号与不动产权证上的宗地号是否吻合。</p>\r\n<p>4.&nbsp;《不动产权证》主要记载房地产的自然状况和权利状况。</p>\r\n<p>权利人名称、身份证号；</p>\r\n<p>宗地号、土地用途、土地位置、宗地面积、使用年限；</p>\r\n<p>房地产的名称、栋号、房号、用途、建筑面积、竣工日期、登记价款以及房地产他项权利等。</p>\r\n<p></p><p class=\"insert-img\"><img alt=\"\" src=\"https://image1.ljcdn.com/baikeimg/test1467165978phpvx35FT.jpeg\" _src=\"https://image1.ljcdn.com/baikeimg/test1467165978phpvx35FT.jpeg\" class=\"insert-img-img\"><span class=\"insert-img-img-title\"></span></p><p></p>\r\n<p>以上内容均为房产证所记载内容，个人核查时需注意防伪</p>\r\n<p></p><p class=\"insert-img\"><img alt=\"\" src=\"https://image1.ljcdn.com/baikeimg/test1467165977phpt3k3vR.jpeg\" _src=\"https://image1.ljcdn.com/baikeimg/test1467165977phpt3k3vR.jpeg\" class=\"insert-img-img\"><span class=\"insert-img-img-title\"></span></p><p></p>\r\n<p>深圳链家整理</p>\r\n<p></p><img style=\"display: none;\" src=\"//dig.lianjia.com/t.gif?r=1547099159000&amp;d=%7B%22pid%22%3A%22page%22%2C%22key%22%3A%22jupiter.lianjia.com%5C%2Finfodetail%5C%2F12252%22%2C%22uuid%22%3A%22jupiter_default_cookie%22%2C%22ssid%22%3A%22jupiter_default_ssid%22%2C%22f%22%3A%22%22%2C%22evt%22%3A%221%2C3%22%7D\"><img style=\"display: none;\" src=\"//dig.lianjia.com/t.gif?r=1547099159000&amp;d=%7B%22pid%22%3A%22lianjiaweb%22%2C%22key%22%3A%22jupiter.lianjia.com%5C%2Finfodetail%5C%2F12252%22%2C%22uuid%22%3A%22b0d4aa40-6fd4-4117-818e-160979238673%22%2C%22ssid%22%3A%222c8a7fbe-19c4-993a-5ead-1091c4f966c7%22%2C%22f%22%3A%22https%3A%5C%2F%5C%2Fnews.lianjia.com%5C%2Fsz%5C%2Fbaike%5C%2F%22%2C%22evt%22%3A%221%2C3%22%7D\"></div><div class=\"article-info\"><div class=\"tags\"><a class=\"tag\" href=\"https://news.lianjia.com/sz/baike/tag房产证/\" target=\"_blank\">房产证</a></div><div class=\"btn-zan\"></div><div class=\"text-zan\"><var class=\"num-zan\" data-count=\"12\">12</var>人赞过</div></div></div></div></div>', '2019-01-10', '不动产权证如何辨真伪？', null);
INSERT INTO `blog` VALUES ('8', 'a,b', '<div class=\"box-l\"><div class=\"m-article nocopy\"><div class=\"hd\"><h1 class=\"title\">房子是你的却住不了?2大买房风险千万要警惕</h1><div class=\"meta\"><div class=\"meta-l\"><span class=\"time\">发布时间：2016-06-21 20:47:08</span><span class=\"author\">作者：李芮</span></div><div class=\"meta-r\"><span class=\"source\">来源：<span>链家网原创</span></span></div></div><img class=\"article-img\" src=\"https://image1.ljcdn.com/baikeimg/test1466513470phpjZLJ80.png\" alt=\"房子是你的却住不了?2大买房风险千万要警惕\"><p class=\"summary\"><span>文章摘要：</span><em>买房是大多数普通居民一辈子的事。买房最怕什么？地段不好、房型不灵还是升值太慢？这些虽然也很让你关注，但相比下面的买房风险，这些都算是“小儿科”。以下风险也许不多见，但一旦被你遇到，那就是“烦恼极了”，所以还是预防为好。</em></p></div><div class=\"bd\"><!-- <div class=\"wrap-share\"><ul class=\"u-share\"><li class=\"item-1\"><a href=\"javascript:;\" class=\"jiathis_button_weixin\"></a></li><li class=\"item-2\"><a href=\"javascript:;\" class=\"jiathis_button_tsina\"></a></li><li class=\"item-3\"><a href=\"javascript:;\" class=\"jiathis_button_qzone\"></a></li><li class=\"item-4\"><a href=\"javascript:;\" class=\"jiathis_button_tqq\"></a></li></ul></div> --><div class=\"article-detail lj_editor_view\"><p>如今，买房是大多数普通居民一辈子的事。买房最怕什么？地段不好、房型不灵还是升值太慢？这些虽然也很让你关注，但相比下面的买房风险，这些都算是“小儿科”。以下风险也许不多见，但一旦被你遇到，那就是“烦恼极了”，所以还是预防为好。</p>\r\n<p><strong>关键词1：共同购房人</strong></p>\r\n<p><strong>过户后，共同购房人说不卖房</strong></p>\r\n<p>买房遭遇：2012年5月，古先生通过中介公司与徐女士签订房屋买卖合同，约定古先生以250万元购买徐女士的房屋。双方在中介公司协助下办理了交易过户手续，古先生也支付了除尾款以外的大部分款项。但是，徐女士未能按时交房，并且突然告知，该房屋系其与章某共同购买，现在章某不同意出售房屋，也不愿意搬出。</p>\r\n<p>经多次协商未果，古先生只能诉至法院。诉讼中，章某向法院提供了其与徐女士的共同购房协议，该协议约定双方出资共同购房，只是房屋产权仅登记在徐女士一人名下，所以主张徐女士未经其同意卖房行为无效。</p>\r\n<p>案例分析：</p>\r\n<p>由于限购等原因，借他人名义购房或者共同购房的现象时常发生，这就导致房地产登记权利人与真正的房屋权利人不一致。当事人之间就房屋权属自然可以通过协议方式进行约定，但是因为这些协议在房地产登记机构并无登记备案，因此购房人无从知晓是否有协议以及协议内容，所以这些协议仅在其内部有效，对于购房者并无约束力。</p>\r\n<p>以上案例中古先生只能以房地产登记的徐女士为准认定房屋产权人并与其进行交易，并无不当，张某以其与徐女士内部协议主张房屋买卖无效的说法不能成立。当然，这种风险让古先生防不胜防。</p>\r\n<p><strong>关键词2：原同住人</strong></p>\r\n<p><strong>收房后，原同住老太拒不搬出</strong></p>\r\n<p>买房遭遇：外地来沪务工人员小常从莫某手中买了一套售后产权房。可当小常付了全部房款拿到产证，去办理交接手续时，他发现房子里住着个郝老太，一问才知道这是莫某的母亲，在房屋变成售后产权房之前是同住人。小常多次与郝老太协商搬出没有结果，便将郝老太告上法院。</p>\r\n<p>令小常意外的是，法院尽管认可了小常对房子拥有产权，但认为郝老太是该售后公房的同住人，对该房屋有居住使用权且并无实际迁让之处，所以驳回了小常的请求。可小常在购房前看到的产证上明明只有莫某，看房时房子里明明没有人居住，现在突然郝老太从外地回来，且没有其他住处。</p>\r\n<p>案例分析：</p>\r\n<p>公房是国家作为一种住房待遇提供给居民的，包括承租人和符合条件的同住人，对于该公房都享有居住使用权。可当该公房被承租人或同住人买下来变成产权房时，其他人对该房屋的权利（作为国家给予的一种待遇）就自然丧失了。或者说，同住人的权利转化成要求产权人进行安置的权利（来源于公房售后时产权人对其他人的承诺）。也就是从对房屋的权利变成对产权人的权利。那么，当该售后公房转让产权时，自然应该由原产权人负责安置，与新产权人就没有任何关系了。这样的道理，法官肯定也明白，只是让老太太住到马路上去，有悖社会倡导的和谐理念。</p>\r\n<p></p><img style=\"display: none;\" src=\"//dig.lianjia.com/t.gif?r=1547099193000&amp;d=%7B%22pid%22%3A%22page%22%2C%22key%22%3A%22jupiter.lianjia.com%5C%2Finfodetail%5C%2F10594%22%2C%22uuid%22%3A%22jupiter_default_cookie%22%2C%22ssid%22%3A%22jupiter_default_ssid%22%2C%22f%22%3A%22%22%2C%22evt%22%3A%221%2C3%22%7D\"><img style=\"display: none;\" src=\"//dig.lianjia.com/t.gif?r=1547099193000&amp;d=%7B%22pid%22%3A%22lianjiaweb%22%2C%22key%22%3A%22jupiter.lianjia.com%5C%2Finfodetail%5C%2F10594%22%2C%22uuid%22%3A%22b0d4aa40-6fd4-4117-818e-160979238673%22%2C%22ssid%22%3A%222c8a7fbe-19c4-993a-5ead-1091c4f966c7%22%2C%22f%22%3A%22https%3A%5C%2F%5C%2Fnews.lianjia.com%5C%2Fsz%5C%2Fbaike%5C%2F%22%2C%22evt%22%3A%221%2C3%22%7D\"></div><div class=\"article-info\"><div class=\"tags\"><a class=\"tag\" href=\"https://news.lianjia.com/sz/baike/tag买卖/\" target=\"_blank\">买卖</a></div><div class=\"btn-zan\"></div><div class=\"text-zan\"><var class=\"num-zan\" data-count=\"7\">7</var>人赞过</div></div></div></div></div>', '2019-01-06', '房子是你的却住不了?2大买房风险千万要警惕', null);

-- ----------------------------
-- Table structure for city
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `city_name` varchar(255) NOT NULL DEFAULT '' COMMENT '城市名称',
  `city_code` varchar(255) NOT NULL DEFAULT '' COMMENT '城市编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of city
-- ----------------------------
INSERT INTO `city` VALUES ('1', '深圳市', '110000');
INSERT INTO `city` VALUES ('2', '广州市', '110001');
INSERT INTO `city` VALUES ('3', '上海市', '110002');
INSERT INTO `city` VALUES ('4', '北京市', '110003');
INSERT INTO `city` VALUES ('5', '杭州市', '110004');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `content` varchar(512) NOT NULL DEFAULT '' COMMENT '评论内容',
  `house_id` bigint(20) NOT NULL COMMENT '房屋id',
  `create_time` date NOT NULL COMMENT '发布时间戳',
  `blog_id` int(11) NOT NULL COMMENT '博客id',
  `type` tinyint(1) NOT NULL COMMENT '类型1-房产评论，2-博客评论',
  `user_id` bigint(20) NOT NULL COMMENT '评论用户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '为楼主点赞', '5', '2019-01-06', '0', '1', '1');
INSERT INTO `comment` VALUES ('2', '为楼主点赞', '5', '2019-01-06', '0', '1', '1');
INSERT INTO `comment` VALUES ('3', '为楼主点赞', '1', '2019-01-06', '0', '1', '1');
INSERT INTO `comment` VALUES ('4', '为楼主点赞', '0', '2019-01-06', '0', '1', '1');
INSERT INTO `comment` VALUES ('5', '为楼主点赞', '0', '2019-01-06', '0', '1', '1');
INSERT INTO `comment` VALUES ('10', '为楼主点赞', '0', '2019-01-06', '1', '2', '1');
INSERT INTO `comment` VALUES ('11', '撒发达撒的发', '17', '2019-01-06', '0', '1', '1');
INSERT INTO `comment` VALUES ('12', '为楼主点赞', '17', '2019-01-06', '0', '1', '1');
INSERT INTO `comment` VALUES ('13', '为楼主点赞', '17', '2019-01-06', '0', '1', '1');
INSERT INTO `comment` VALUES ('14', '为楼主点赞', '17', '2019-01-06', '0', '1', '1');
INSERT INTO `comment` VALUES ('15', '为楼主点赞', '24', '2019-01-06', '0', '1', '1');
INSERT INTO `comment` VALUES ('16', '为楼主点赞', '23', '2019-01-06', '0', '1', '1');
INSERT INTO `comment` VALUES ('18', '好房', '26', '2019-01-06', '0', '1', '1');
INSERT INTO `comment` VALUES ('21', '1111', '23', '2019-01-06', '0', '1', '1');
INSERT INTO `comment` VALUES ('22', '1111', '23', '2019-01-06', '0', '1', '1');
INSERT INTO `comment` VALUES ('24', '评论', '43', '2019-01-06', '0', '1', '1');
INSERT INTO `comment` VALUES ('25', '111', '43', '2019-01-06', '0', '1', '1');
INSERT INTO `comment` VALUES ('26', '11', '43', '2019-01-06', '0', '1', '1');
INSERT INTO `comment` VALUES ('27', '2222', '43', '2019-01-06', '0', '1', '1');
INSERT INTO `comment` VALUES ('29', '评论', '0', '2019-01-06', '5', '2', '1');
INSERT INTO `comment` VALUES ('30', 'nice!', '45', '2019-01-06', '0', '1', '1');
INSERT INTO `comment` VALUES ('31', 'wefewfew', '0', '2019-01-10', '8', '2', '1');
INSERT INTO `comment` VALUES ('32', 'wfevf', '4', '2019-01-10', '0', '1', '1');

-- ----------------------------
-- Table structure for community
-- ----------------------------
DROP TABLE IF EXISTS `community`;
CREATE TABLE `community` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `city_code` varchar(255) NOT NULL DEFAULT '' COMMENT '城市编码',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '小区名称',
  `city_name` varchar(255) NOT NULL DEFAULT '' COMMENT '城市名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of community
-- ----------------------------
INSERT INTO `community` VALUES ('1', '110002', '阳光棕榈园三期', '上海市');
INSERT INTO `community` VALUES ('2', '110000', '桂芳园六期', '深圳市');
INSERT INTO `community` VALUES ('3', '110001', '佳兆业水岸新都', '广州市');
INSERT INTO `community` VALUES ('4', '110001', '诺德假日花园', '深圳市');
INSERT INTO `community` VALUES ('5', '110000', '韵动家园', '深圳市');
INSERT INTO `community` VALUES ('6', '110004', 'THETOWN乐城', '杭州市');
INSERT INTO `community` VALUES ('7', '110003', '祥云天都世纪大厦', '北京市');
INSERT INTO `community` VALUES ('8', '110003', '盛世年华', '北京市');

-- ----------------------------
-- Table structure for house
-- ----------------------------
DROP TABLE IF EXISTS `house`;
CREATE TABLE `house` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(255) DEFAULT '' COMMENT '房产名称',
  `type` tinyint(1) DEFAULT '0' COMMENT '1:销售，2:出租',
  `price` int(11) DEFAULT NULL COMMENT '单位万元',
  `images` varchar(1024) DEFAULT '' COMMENT '图片地址',
  `area` int(11) DEFAULT '0' COMMENT '面积',
  `beds` int(11) DEFAULT '0' COMMENT '卧室数量',
  `baths` int(11) DEFAULT '0' COMMENT '卫生间数量',
  `rating` double DEFAULT '0' COMMENT '评级',
  `remarks` varchar(512) DEFAULT '' COMMENT '房产描述',
  `properties` varchar(512) DEFAULT '' COMMENT '属性',
  `floor_plan` varchar(255) DEFAULT '' COMMENT '户型图',
  `tags` varchar(255) DEFAULT '' COMMENT '标签',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `city_id` int(11) DEFAULT '0' COMMENT '城市名称',
  `community_id` int(11) DEFAULT '0' COMMENT '小区名称',
  `address` varchar(255) DEFAULT '' COMMENT '房产地址',
  `state` tinyint(1) DEFAULT '1' COMMENT '1-上架，2-下架',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of house
-- ----------------------------
INSERT INTO `house` VALUES ('1', '听风阁', '2', '600', '/1493370993/property-07.jpg,/1493370999/property-08.jpg', '120', '2', '12', '5', '听风阁', '得房率高,户型好,落地窗', '', '', '2019-01-06 00:00:00', '1', '1', '中商广场', '1');
INSERT INTO `house` VALUES ('2', '温馨小窝 幸福号', '1', '800', '/1493381459/property-detail-01.jpg,/1493381460/property-detail-02.jpg,/1493381462/property-detail-03.jpg', '120', '2', '2', '4.5', '温馨小窝 幸福号', '满五年,采光好,价格合理,税少,学区房', '', '', '2019-01-06 00:00:00', '2', '2', '中商广场', '1');
INSERT INTO `house` VALUES ('3', '阳光丽景', '2', '140', '/1493432771/property-11.jpg,/1493432771/property-12.jpg,/1493432771/property-13.jpg', '140', '2', '2', '2.5', '阳光丽景', '南北通透,环境好,带阳台', '/1493432771/floor-plan-01.jpg,/1493432771/floor-plan-02.jpg', '', '2019-01-06 00:00:00', '3', '3', '西城区', '1');
INSERT INTO `house` VALUES ('4', '天涯阁', '1', '140', '/1493432771/property-11.jpg,/1493432771/property-12.jpg,/1493432771/property-13.jpg', '140', '2', '2', '6', '天涯阁', '南北通透,环境好,带阳台', '/1493432771/floor-plan-01.jpg,/1493432771/floor-plan-02.jpg', '', '2019-01-06 00:00:00', '4', '4', '西城区', '1');
INSERT INTO `house` VALUES ('5', '北街嘉园', '1', '800', '/1493381459/property-detail-01.jpg,/1493381460/property-detail-02.jpg,/1493381462/property-detail-03.jpg', '120', '2', '2', '4', '北街嘉园', '满五年,采光好,价格合理,税少,学区房', '', '', '2019-01-06 00:00:00', '5', '5', '中商广场', '1');
INSERT INTO `house` VALUES ('6', '橡树湾', '2', '500', '/1493381459/property-detail-01.jpg,/1493381460/property-detail-02.jpg,/1493381462/property-detail-03.jpg', '120', '2', '2', '4', '橡树湾', '采光好', '', '', '2019-01-06 00:00:00', '1', '6', '清河中街', '1');
INSERT INTO `house` VALUES ('7', '安联钓鱼台壹号', '1', '200', '/1500796444/property-12.jpg,/1500796444/property-13.jpg', '100', '3', '2', '4', '安联钓鱼台壹号', '环境好,带阳台,临地铁', '/1500796444/floor-plan-02.jpg', '', '2019-01-06 00:00:00', '2', '7', '紫苑华府', '1');
INSERT INTO `house` VALUES ('8', '美的·罗兰春天', '2', '200', '/1500800727/property-12.jpg,/1500800727/property-13.jpg', '100', '3', '2', '3', '美的·罗兰春天', '', '/1500800727/floor-plan-02.jpg', '', '2019-01-06 00:00:00', '3', '8', '清河中街', '1');
INSERT INTO `house` VALUES ('9', '北湖十六峯', '1', '200', '/1500800766/property-04.jpg,/1500800766/property-05.jpg,/1500800766/property-06.jpg', '100', '3', '2', '3', '北湖十六峯', '', '/1500800766/floor-plan-01.jpg', '', '2019-01-06 00:00:00', '4', '1', '清河中街', '1');
INSERT INTO `house` VALUES ('10', '荣盛·锦绣兰庭', '2', '200', '/1500800883/property-09.jpg,/1500800883/property-10.jpg', '100', '3', '2', '3', '荣盛·锦绣兰庭', '', '/1500800883/floor-plan-02.jpg', '', '2019-01-06 00:00:00', '5', '2', '清河中街', '1');
INSERT INTO `house` VALUES ('11', '芍药居北里', '1', '200', '/1500800967/property-10.jpg,/1500800967/property-11.jpg', '100', '3', '2', '3', '芍药居北里', '', '/1500800967/floor-plan-02.jpg', '', '2019-01-06 00:00:00', '1', '3', '清河中街', '1');
INSERT INTO `house` VALUES ('12', '远洋山水', '2', '200', '/1500801115/property-09.jpg,/1500801115/property-10.jpg,/1500801115/property-11.jpg', '100', '3', '2', '3', '远洋山水', '', '/1500801115/floor-plan-01.jpg', '', '2019-01-06 00:00:00', '2', '4', '清河中街', '1');
INSERT INTO `house` VALUES ('13', '卓越万科翡翠山晓', '1', '200', '/1500801204/property-10.jpg,/1500801204/property-11.jpg', '100', '3', '2', '7', '卓越万科翡翠山晓', '', '/1500801204/floor-plan-01.jpg', '', '2019-01-06 00:00:00', '3', '5', '中商广场', '1');
INSERT INTO `house` VALUES ('14', '奥林匹克花园', '2', '300', '/1500801346/property-10.jpg', '100', '3', '2', '4', '奥林匹克花园', '', '/1500801346/floor-plan-02.jpg', '', '2019-01-06 00:00:00', '4', '6', '中商广场', '1');
INSERT INTO `house` VALUES ('15', '花样年家天下', '1', '200', '/1500801594/property-06.jpg,/1500801594/property-07.jpg', '100', '3', '2', '3', '花样年家天下', '', '/1500801594/floor-plan-02.jpg', '', '2019-01-06 00:00:00', '5', '7', '清河中街', '1');
INSERT INTO `house` VALUES ('16', '半山半海', '1', '300', '/1500803086/property-13.jpg', '100', '3', '2', '5', '半山半海', '', '/1500803086/floor-plan-02.jpg', '', '2019-01-06 17:44:47', '1', '8', '清河中街', '1');
INSERT INTO `house` VALUES ('17', '碧桂园凤凰国际公馆', '1', '200', '/1514722627/property-09.jpg,/1514722627/property-08.jpg,/1514722627/property-07.jpg', '200', '3', '3', '5', '碧桂园凤凰国际公馆', '满两年,采光好,价格合理,楼龄新,税少,户型好', '/1514722627/floor-plan-02.jpg', '', '2019-01-06 20:17:07', '2', '1', '中商广场', '1');
INSERT INTO `house` VALUES ('18', '东关乐尚林居', '2', '300', '/1514727258/property-06.jpg,/1514727258/property-05.jpg,/1514727258/property-04.jpg', '200', '4', '4', '3', '东关乐尚林居', '带阳台,临地铁,没有遮挡,精装修', '/1514727258/floor-plan-01.jpg', '', '2019-01-06 21:34:18', '3', '2', '北新家园101', '1');
INSERT INTO `house` VALUES ('19', '天玑公馆', '1', '300', '/1514727307/property-06.jpg,/1514727307/property-05.jpg,/1514727307/property-04.jpg', '200', '4', '4', '4', '天玑公馆', '带阳台,临地铁,没有遮挡,精装修', '/1514727307/floor-plan-01.jpg', '', '2019-01-06 21:35:08', '4', '3', '北新家园102', '1');
INSERT INTO `house` VALUES ('20', '卓越星源', '1', '300', '/1514727520/property-10.jpg,/1514727520/property-09.jpg,/1514727520/property-08.jpg', '200', '4', '3', '5', '卓越星源', '满五年,楼龄新,税少,落地窗', '/1514727520/floor-plan-01.jpg', '', '2019-01-06 21:38:41', '5', '4', '北新家园103', '2');
INSERT INTO `house` VALUES ('21', '枫丹丽舍', '1', '300', '/1515216506/property-08.jpg,/1515216506/property-07.jpg,/1515216506/property-06.jpg', '200', '3', '3', '4', '枫丹丽舍', '满五年,满两年,采光好,高楼层,价格合理,楼龄新,税少,得房率高', '/1515216506/floor-plan-02.jpg', '', '2019-01-06 13:28:27', '1', '5', '中商广场', '1');
INSERT INTO `house` VALUES ('22', '琳珠华庭', '2', '400', '/1515217056/property-03.jpg,/1515217056/property-02.jpg,/1515217056/property-01.jpg', '200', '4', '4', '5', '琳珠华庭', '户型好,没有遮挡,落地窗,精装修', '/1515217057/floor-plan-big.jpg', '', '2019-01-06 13:37:39', '2', '6', '中商广场', '1');

-- ----------------------------
-- Table structure for house_msg
-- ----------------------------
DROP TABLE IF EXISTS `house_msg`;
CREATE TABLE `house_msg` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `msg` varchar(255) NOT NULL DEFAULT '' COMMENT '消息',
  `create_time` date NOT NULL COMMENT '创建时间',
  `agent_id` bigint(20) NOT NULL COMMENT '经纪人id',
  `house_id` bigint(20) NOT NULL COMMENT '房屋id',
  `user_name` varchar(255) NOT NULL DEFAULT '' COMMENT '用户姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of house_msg
-- ----------------------------
INSERT INTO `house_msg` VALUES ('1', 'jgcs12345@163.com', '2019-01-06', '2', '1', 'sadfasd');
INSERT INTO `house_msg` VALUES ('2', 'd', '2019-01-06', '2', '2', '111');
INSERT INTO `house_msg` VALUES ('3', '1', '2019-01-06', '2', '3', '11');
INSERT INTO `house_msg` VALUES ('4', '1', '2019-01-06', '3', '4', '11');
INSERT INTO `house_msg` VALUES ('5', 'dafsd', '2019-01-06', '3', '5', 'hello');
INSERT INTO `house_msg` VALUES ('6', '1111', '2019-01-06', '3', '6', 'hello');
INSERT INTO `house_msg` VALUES ('7', '1111', '2019-01-06', '3', '7', 'hello');
INSERT INTO `house_msg` VALUES ('8', '111', '2019-01-06', '3', '8', 'wwww');
INSERT INTO `house_msg` VALUES ('9', '111111', '2019-01-06', '2', '9', '111');

-- ----------------------------
-- Table structure for house_user
-- ----------------------------
DROP TABLE IF EXISTS `house_user`;
CREATE TABLE `house_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `house_id` bigint(20) NOT NULL COMMENT '房屋id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `create_time` date NOT NULL COMMENT '创建时间',
  `type` tinyint(1) NOT NULL COMMENT '1-售卖，2-收藏',
  PRIMARY KEY (`id`),
  UNIQUE KEY `house_id_user_id_type` (`house_id`,`user_id`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of house_user
-- ----------------------------
INSERT INTO `house_user` VALUES ('1', '1', '1', '2019-01-06', '1');
INSERT INTO `house_user` VALUES ('11', '2', '1', '2019-01-06', '1');
INSERT INTO `house_user` VALUES ('13', '3', '1', '2019-01-06', '1');
INSERT INTO `house_user` VALUES ('17', '4', '1', '2019-01-06', '1');
INSERT INTO `house_user` VALUES ('18', '5', '2', '2019-01-06', '2');
INSERT INTO `house_user` VALUES ('19', '6', '2', '2019-01-06', '2');
INSERT INTO `house_user` VALUES ('22', '7', '1', '2019-01-06', '1');
INSERT INTO `house_user` VALUES ('23', '8', '1', '2019-01-06', '1');
INSERT INTO `house_user` VALUES ('27', '9', '1', '2019-01-06', '1');
INSERT INTO `house_user` VALUES ('28', '10', '1', '2019-01-06', '1');
INSERT INTO `house_user` VALUES ('29', '11', '1', '2019-01-06', '1');
INSERT INTO `house_user` VALUES ('30', '12', '1', '2019-01-06', '1');
INSERT INTO `house_user` VALUES ('31', '13', '1', '2019-01-06', '1');
INSERT INTO `house_user` VALUES ('33', '14', '1', '2019-01-06', '1');
INSERT INTO `house_user` VALUES ('34', '15', '1', '2019-01-06', '1');
INSERT INTO `house_user` VALUES ('35', '16', '2', '2019-01-06', '2');
INSERT INTO `house_user` VALUES ('39', '17', '1', '2019-01-06', '1');
INSERT INTO `house_user` VALUES ('90', '18', '1', '2019-01-06', '1');
INSERT INTO `house_user` VALUES ('91', '19', '1', '2019-01-06', '1');
INSERT INTO `house_user` VALUES ('92', '20', '1', '2019-01-06', '1');
INSERT INTO `house_user` VALUES ('93', '21', '1', '2019-01-06', '1');
INSERT INTO `house_user` VALUES ('94', '22', '1', '2019-01-06', '1');
INSERT INTO `house_user` VALUES ('95', '19', '2', '2019-01-06', '1');
INSERT INTO `house_user` VALUES ('96', '21', '2', '2019-01-06', '1');
INSERT INTO `house_user` VALUES ('97', '10', '2', '2019-01-06', '1');
INSERT INTO `house_user` VALUES ('101', '8', '2', '2019-01-06', '2');
INSERT INTO `house_user` VALUES ('102', '3', '2', '2019-01-06', '2');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '姓名',
  `phone` char(255) NOT NULL DEFAULT '' COMMENT '手机号',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '电子邮件',
  `aboutme` varchar(255) DEFAULT '' COMMENT '自我介绍',
  `passwd` varchar(512) NOT NULL DEFAULT '' COMMENT '经过MD5加密的密码',
  `avatar` varchar(512) NOT NULL DEFAULT '' COMMENT '头像图片',
  `type` tinyint(1) NOT NULL COMMENT '1:普通用户，2:房产经纪人',
  `create_time` date NOT NULL COMMENT '创建时间',
  `enable` tinyint(1) NOT NULL COMMENT '是否启用,1启用，0停用',
  `agency_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属经纪机构',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'ljq', '12345678910', 'jgcs12345@163.com', 'hacker', '138efa48b7b8170df1b0f75473a9f6e7', '/1546143091/o_neo.jpg', '1', '2018-12-29', '1', '0');
INSERT INTO `user` VALUES ('2', 'jackie', '12345687980', '12345@163.com', 'gala', '138efa48b7b8170df1b0f75473a9f6e7', '/1546734712/星空.jpg', '2', '2019-01-05', '1', '1');
INSERT INTO `user` VALUES ('3', 'HAHA', '13332345678', '1232313123@163.com', 'qwueqwe', '138efa48b7b8170df1b0f75473a9f6e7', '/1546774862/2.jpg', '2', '2019-01-06', '1', '3');
