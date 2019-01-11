<!DOCTYPE html>

<html lang="en-US">
 <@common.header/>

<body class="page-sub-page page-agent-detail" id="page-top">
<!-- Wrapper -->
<div class="wrapper">
    <!-- Navigation -->
     <@common.nav/><!-- /.navigation -->
    <!-- end Navigation -->
    <!-- Page Content -->
    <div id="page-content">
        <!-- Breadcrumb -->
        <div class="container">
            <ol class="breadcrumb">
                <li><a href="#">Home</a></li>
                <li><a href="#">经纪人</a></li>
                <li class="active">经纪人详情</li>
            </ol>
        </div>
        <!-- end Breadcrumb -->

        <div class="container">
            <div class="row">
                <!-- Agent Detail -->
                <div class="col-md-9 col-sm-9">
                    <section id="agent-detail">
                        <header><h1>${agent.name!}</h1></header>
                        <section id="agent-info">
                            <div class="row">
                                <div class="col-md-3 col-sm-3">
                                    <figure class="agent-image"><img alt="" src="${(agent.avatar)!}"></figure>
                                </div><!-- /.col-md-3 -->
                                <div class="col-md-5 col-sm-5">
                                    <h3>联系信息</h3>
                                    <dl>
                                        <dt>Phone:</dt>
                                        <dd>${(agent.phone)!}</dd>
                                        <dt>Email:</dt>
                                        <dd><a href="mailto:#">${(agent.email)!}</a></dd>
                                        <dt>经纪机构:</dt>
                                        <dd>${(agent.agencyName)!}</dd>
                                    </dl>
                                </div><!-- /.col-md-5 -->
                                <div class="col-md-4 col-sm-4">
                                    <h3>简单自我介绍</h3>
                                    <p>${agent.aboutme!}
                                    </p>
                                </div><!-- /.col-md-4 -->
                            </div><!-- /.row -->
                            
                        </section><!-- /#agent-info -->
                        <hr class="thick">
                        <section id="agent-properties">
                            <header><h3>我代理的房产</h3></header>
                            <div class="layout-expandable">
                                <div class="row">
                                  <#list bindHouses as house>
                                    <div class="col-md-4 col-sm-4">
                                        <div class="property">
                                            <a href="/house/detail?id=${house.id}">
                                                <div class="property-image">
                                                    <img alt="" src="/static/assets/img/properties/property-09.jpg">
                                                </div>
                                                <div class="overlay">
                                                    <div class="info">
                                                        <div class="tag price">￥ ${house.price}</div>
                                                        <h3>${house.name}</h3>
                                                        <figure>${house.address}</figure>
                                                    </div>
                                                    <ul class="additional-info">
                                                        <li>
                                                            <header>面积:</header>
                                                            <figure>${house.area}<sup>2</sup></figure>
                                                        </li>
                                                        <li>
                                                            <header>床:</header>
                                                            <figure>${house.beds}</figure>
                                                        </li>
                                                        <li>
                                                            <header>洗手间:</header>
                                                            <figure>${house.baths}</figure>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </a>
                                        </div><!-- /.property -->
                                    </div><!-- /.col-md-4 -->
                                   </#list>
                                </div><!-- /.row-->
                               
                            </div>
                           
                        </section><!-- /#agent-properties -->
                        <hr class="thick">
                        <div class="row">
                            <div class="col-md-5">
                                <section id="agent-testimonials">
                                    <h3>What Other Said About Me</h3>
                                    <div class="owl-carousel testimonials-carousel small">
                                        <blockquote class="testimonial">
                                            <figure>
                                                <div class="image">
                                                    <img alt="" src="/static/assets/img/client-01.jpg">
                                                </div>
                                            </figure>
                                            <aside class="cite">
                                                <p>Fusce risus metus, placerat in consectetur eu, porttitor a est sed sed dolor lorem cras adipiscing</p>
                                                <footer>Natalie Jenkins</footer>
                                            </aside>
                                        </blockquote>
                                        <blockquote class="testimonial">
                                            <figure>
                                                <div class="image">
                                                    <img alt="" src="/static/assets/img/client-01.jpg">
                                                </div>
                                            </figure>
                                            <aside class="cite">
                                                <p>Fusce risus metus, placerat in consectetur eu, porttitor a est sed sed dolor lorem cras adipiscing</p>
                                                <footer>Natalie Jenkins</footer>
                                            </aside>
                                        </blockquote>
                                    </div><!-- /.testimonials-carousel -->
                                </section><!-- /#agent-testimonial -->
                            </div><!-- /.col-md-5 -->
                            <div class="col-md-7">
                                <h3>给我留言</h3>
                                <div class="agent-form">
                                    <form role="form" id="form-contact-agent" method="post"  class="clearfix" action="/agency/agentMsg">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="form-contact-agent-name">Your Name<em>*</em></label>
                                                    <input type="text" class="form-control" id="form-contact-agent-name"  name="name" required>
                                                </div><!-- /.form-group -->
                                            </div><!-- /.col-md-6 -->
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="form-contact-agent-email">Your Email<em>*</em></label>
                                                    <input type="email"  class="form-control" id="form-contact-agent-email" name="email" required>
                                                </div><!-- /.form-group -->
                                            </div><!-- /.col-md-6 -->
                                        </div><!-- /.row -->
                                        <input type="hidden" name="id" value="${agent.id!}">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="form-contact-agent-message">Your Message<em>*</em></label>
                                                    <textarea class="form-control" id="form-contact-agent-message" rows="5" name="msg" required></textarea>
                                                </div><!-- /.form-group -->
                                            </div><!-- /.col-md-12 -->
                                        </div><!-- /.row -->
                                        <div class="form-group clearfix">
                                            <button type="submit" class="btn pull-right btn-default" id="form-contact-agent-submit">Send a Message</button>
                                        </div><!-- /.form-group -->
                                        <div id="form-rating-status"></div>
                                    </form><!-- /#form-contact -->
                                </div><!-- /.rating-form -->
                            </div>
                        </div><!-- /.row -->
                    </section><!-- /#agent-detail -->
                </div><!-- /.col-md-9 -->
                <!-- end Agent Detail -->

                <!-- sidebar -->
                <div class="col-md-3 col-sm-3">
                    <section id="sidebar">
                         <aside id="edit-search">
                            <header><h3>Search Properties</h3></header>
                            <form role="form" id="searchForm" class="form-search" method="post" action="/house/list">

                                <div class="form-group">
                                    <input type="text" class="form-control" id="search-box-property-id" value="${(vo.name)!}" name="name" placeholder="尝试输入小区名">
                                </div>
                                <div class="form-group">
                                    <select name="type">
                                        <option value="1" >类型</option>
                                        <option value="1" <#if (vo.type)?? && (vo.type)==1> selected </#if> >售卖</option>
                                        <option value="2" <#if (vo.type)?? && (vo.type)==2> selected </#if> >出租</option>
                                    </select>
                                </div><!-- /.form-group -->
                                <input type="text" value="${(vo.sort)!}" name=sort hidden="true">
                               
                                <div class="form-group">
                                    <button type="submit" class="btn btn-default">搜索</button>
                                </div><!-- /.form-group -->
                            </form><!-- /#form-map -->
                        </aside><!-- /#edit-search -->
                        <aside id="featured-properties">
                            <header><h3>热门房产</h3></header>
                            <#list recomHouses as house>
                            <div class="property small">
                                <a href="/house/detail?id=${house.id}">
                                    <div class="property-image">
                                        <img alt="" src="${(house.firstImg)!}">
                                    </div>
                                </a>
                                <div class="info">
                                    <a href="/house/detail?id=${house.id}"><h4>${(house.name)!}</h4></a>
                                    <figure>${(house.address)!} </figure>
                                    <div class="tag price">￥${(house.price)!}</div>
                                </div>
                            </div><!-- /.property -->
                            </#list>
                            
                        </aside><!-- /#featured-properties -->
                       
                    </section><!-- /#sidebar -->
                </div><!-- /.col-md-3 -->
                <!-- end Sidebar -->
            </div><!-- /.row -->
        </div><!-- /.container -->
    </div>
    <!-- end Page Content -->
    <!-- Page Footer -->
   
        <@common.footer/>
    <!-- end Page Footer -->
</div>

<@common.js/>
<!--[if gt IE 8]>
<script type="text/javascript" src="/assets/js/ie.js"></script>
<![endif]-->
 <script  type="text/javascript" >
    $(document).ready(function() {
          var errorMsg   = "${errorMsg!""}";
          var successMsg = "${successMsg!""}";
          if(errorMsg){ 
              errormsg("error",errorMsg);
          }
          if(successMsg) {
              successmsg("success",successMsg);
          }
        })
        
 </script>

</body>
</html>