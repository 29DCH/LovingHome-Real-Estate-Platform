<!DOCTYPE html>

<html lang="en-US">
<@common.header/>

<body class="page-sub-page page-property-detail" id="page-top">
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
                <li class="active">Property Detail</li>
            </ol>
        </div>
        <!-- end Breadcrumb -->

        <div class="container">
            <div class="row">
                <!-- Property Detail Content -->
                <div class="col-md-9 col-sm-9">
                    <section id="property-detail">
                        <header class="property-title">
                            <h1>${house.name}</h1>
                            <figure>${house.address}</figure>

                        <#if loginUser??>
                            <span class="actions">
                                <!--<a href="#" class="fa fa-print"></a>-->
                                <a href="#" class="bookmark" data-bookmark-state="empty"
 
                                ><span class="title-add">Add to bookmark</span><span class="title-added">Added</span></a>
                            </span>
                       </#if>
                        </header>
                        <section id="property-gallery">
                            <div class="owl-carousel property-carousel">
                                <#list house.imageList as image> 
                                   <div class="property-slide">
                                      <a href="${image}" class="image-popup">
                                         <div class="overlay"><h3>Front View</h3></div>
                                         <img alt="" src="${image}">
                                     </a>
                                   </div><!-- /.property-slide -->
                                </#list>
                            </div><!-- /.property-carousel -->
                        </section>
                        <div class="row">
                            <div class="col-md-4 col-sm-12">
                                <section id="quick-summary" class="clearfix">
                                    <header><h2>总体</h2></header>
                                    <dl>
                                        <dt>地址</dt>
                                            <dd>${house.address}</dd>
                                        <dt>价格</dt>
                                            <dd><span class="tag price">${house.priceStr}</span></dd>
                                        <dt>类型:</dt>
                                            <dd>销售</dd>
                                        <dt>面积:</dt>
                                            <dd>${house.area} m<sup>2</sup></dd>
                                        <dt>卧室:</dt>
                                            <dd>${house.beds}</dd>
                                        <dt>卫生间:</dt>
                                            <dd>${house.baths}</dd>
                                        <dt>评分:</dt>
                                            <dd><div class="rating rating-overall" data-score="${house.rating}"></div></dd>
                                    </dl>
                                </section><!-- /#quick-summary -->
                            </div><!-- /.col-md-4 -->
                            <div class="col-md-8 col-sm-12">
                                <section id="description">
                                    <header><h2>房屋描述</h2></header>
                                    ${house.remarks}
                                </section><!-- /#description -->
                                <section id="property-features">
                                    <header><h2>房屋特点</h2></header>
                                    <ul class="list-unstyled property-features-list">
                                    <#list house.featureList as feature> 
                                        <li>${feature}</li>
                                    </#list>
                                    </ul>
                                </section><!-- /#property-features -->
                                <section id="floor-plans">
                                    <div class="floor-plans">
                                        <header><h2>户型图</h2></header>
                                         <#list house.floorPlanList as floorPlan> 
                                            <a href="${floorPlan}" class="image-popup"><img alt="" src="${floorPlan}"></a>
                                         </#list>
                                    </div>
                                </section><!-- /#floor-plans -->
                               <!--   <section id="property-map">
                                    <header><h2>Map</h2></header>
                                    <div class="property-detail-map-wrapper">
                                        <div class="property-detail-map" id="property-detail-map"></div>
                                    </div>
                                </section> -->
                                <section id="property-rating">
                                    <header><h2>评价</h2></header>
                                    <div class="clearfix">
                                        <aside>
                                            <header>您的评价</header>
                                            <div class="rating rating-user">
                                                <div class="inner"></div>
                                            </div>
                                        </aside>
                                        <figure>
                                            <header>总体评价</header>
                                            <div class="rating rating-overall" data-score="${house.rating}"></div>
                                        </figure>
                                    </div>
                                    <div class="rating-form">
                                    </div><!-- /.rating-form -->
                                </section><!-- /#property-rating -->
                                

                                
                            </div><!-- /.col-md-8 -->
                           
                            <div class="col-md-12 col-sm-12">
                                <#if (agent)?? >
                                   <section id="contact-agent">
                                    <header><h2>联系经纪人</h2></header>
                                    <div class="row">
                                        <section class="agent-form">
                                            <div class="col-md-7 col-sm-12">
                                                <aside class="agent-info clearfix">
                                                    <figure><a href="/agency/agentDetail?id=${(agent.id)!}"><img alt="" src="${(agent.avatar)!}"></a></figure>
                                                    <div class="agent-contact-info">
                                                        <h3>${(agent.name)!}</h3>
                                                        <p>
                                                            ${(agent.aboutme)!}
                                                        </p>
                                                        <dl>
                                                            <dt>手机:</dt>
                                                            <dd>${(agent.phone)!}</dd>
                                                            <dt>Email:</dt>
                                                            <dd><a href="mailto:#">${(agent.email)!}</a></dd>
                                                            <dt>&nbsp;&nbsp;&nbsp;</dt>
                                                            <dd>&nbsp;&nbsp;&nbsp;</dd>
                                                        </dl>
                                                        <hr>
                                                    </div>
                                                </aside><!-- /.agent-info -->
                                            </div><!-- /.col-md-7 -->
                                            <div class="col-md-5 col-sm-12">
                                                <div class="agent-form">
                                                    <form role="form" id="form-contact-agent" method="post" action="/house/leaveMsg" class="clearfix">
                                                        <div class="form-group">
                                                            <label for="form-contact-agent-name">你的名字<em>*</em></label>
                                                            <input type="hidden" name="agentId" value="${(agent.id)!}">
                                                            <input type="hidden" name="houseId" value="${house.id}">
                                                            <input type="text" class="form-control" id="name" name="userName" required>
                                                        </div><!-- /.form-group -->
                                                        <div class="form-group">
                                                            <label for="form-contact-agent-email">你的邮箱<em>*</em></label>
                                                            <input type="email" class="form-control" id="form-contact-agent-email" name="email" required>
                                                        </div><!-- /.form-group -->
                                                        <div class="form-group">
                                                            <label for="form-contact-agent-message">你的留言<em>*</em></label>
                                                            <textarea class="form-control" id="form-contact-agent-message" rows="2" name="msg" required></textarea>
                                                        </div><!-- /.form-group -->
                                                        <div class="form-group">
                                                            <button type="submit" class="btn pull-right btn-default" id="form-contact-agent-submit">Send a Message</button>
                                                        </div><!-- /.form-group -->
                                                        <div id="form-contact-agent-status"></div>
                                                    </form><!-- /#form-contact -->
                                                </div><!-- /.agent-form -->
                                            </div><!-- /.col-md-5 -->
                                        </section><!-- /.agent-form -->
                                    </div><!-- /.row -->
                                   </section><!-- /#contact-agent -->
                                </#if>
                               
                                <hr class="thick">
                                <section id="comments">
                                    <div class="agent-form">
                                                    <form role="form" id="form-contact-agent" method="post" action="/comment/leaveComment" class="clearfix">
                                                        <input type="hidden" name="houseId" value="${house.id}">
                                                        <div class="form-group">
                                                            <label for="form-contact-agent-message">评论</label>
                                                            <textarea class="form-control" id="form-contact-agent-message" rows="2" name="content" required></textarea>
                                                        </div><!-- /.form-group -->
                                                        <div class="form-group">
                                                            <button type="submit" class="btn pull-right btn-default" id="form-contact-agent-submit">评论</button>
                                                        </div><!-- /.form-group -->
                                                        <div id="form-contact-agent-status"></div>
                                                    </form><!-- /#form-contact -->
                                                </div>
                                    <header><h2 class="no-border">Comments</h2></header>
                                    <ul class="comments">
                                      <#list commentList as comment> 
                                        <li class="comment" style="width: 830px;">
                                            <figure>
                                                <div class="image">
                                                    <img alt="" src="${comment.avatar}">
                                                </div>
                                            </figure>
                                            <div class="comment-wrapper">
                                                <div class="name pull-left">${comment.userName}</div>
                                                <span class="date pull-right"><span class="fa fa-calendar"></span>${(comment.createTime)?datetime}</span>
                                                <p>${comment.content}
                                                </p>
                                                <hr>
                                            </div>
                                        </li>
                                      </#list>
                                    </ul>
                                </section>
                            </div><!-- /.col-md-12 -->
                            
                        </div><!-- /.row -->
                    </section><!-- /#property-detail -->
                </div><!-- /.col-md-9 -->
                <!-- end Property Detail Content -->

                <!-- sidebar -->
                <div class="col-md-3 col-sm-3">
                    <section id="sidebar">
                        <aside id="edit-search">
                            <header><h3>搜索房产</h3></header>
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
                                        <img alt="" src="${(house.firstImg)!}" style="width: 100px;height: 75px">
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
<!-- <script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyABT1kCnk8CW4Ckpd0RisUg25PIdDD3Gfg"></script> -->

<@common.js/>

<!--[if gt IE 8]>
<script type="text/javascript" src="/static//js/ie.js"></script>
<![endif]-->
 <script  type="text/javascript" >
     
    
    
    $(window).load(function(){
        initializeOwl(false);
    });


     $(document).ready(function() {
          var errorMsg   = "${errorMsg!""}";
          var successMsg = "${successMsg!""}";
          if(errorMsg){ 
              errormsg("error",errorMsg);
          }
          if(successMsg) {
              successmsg("success",successMsg);
          }

           var ratingUser = $('.rating-user');
            if (ratingUser.length > 0) {
                $('.rating-user .inner').raty({
                    path: '/static/assets/img',
                    starOff : 'big-star-off.png',
                    starOn  : 'big-star-on.png',
                    width: 150,
                    //target : '#hint',
                    targetType : 'number',
                    targetFormat : 'Rating: {score}',
                    click: function(score, evt) {
                        showRatingForm();
                        $.ajax({
                               url: "/house/rating?id=${house.id}&rating="+score,
                               type: 'GET',
                               cache:false,
                               timeout:60000
                              })
                              .done(function(ret) {
                                   
                              })
                    }
                });
            }
        })

    var bookmarkButton = $(".bookmark");

    
    bookmarkButton.on("click", function() {
        if (bookmarkButton.data('bookmark-state') == 'empty') {
            commonAjax('/house/bookmark?id=${house.id}');
        } else if (bookmarkButton.data('bookmark-state') == 'added') {
            commonAjax('/house/unbookmark?id=${house.id}');
        }
    });
    
   

        
 </script>

</body>
</html>