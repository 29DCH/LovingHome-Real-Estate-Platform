<!DOCTYPE html>

<html lang="en-US">
<@common.header/>

<body class="page-homepage navigation-fixed-top page-slider page-slider-search-box" id="page-top" data-spy="scroll"
      data-target=".navigation" data-offset="90">
<!-- Wrapper -->
<div class="wrapper">

    <@common.nav/>

    <!-- Slider -->
    <div id="slider" class="loading has-parallax">
        <div id="loading-icon"><i class="fa fa-cog fa-spin"></i></div>
        <div class="owl-carousel homepage-slider carousel-full-width">
            <div class="slide">
                <div class="container">
                    <div class="overlay">
                        <div class="info">
                            <div class="tag price">800 万</div>
                            <h3>蔚蓝海岸</h3>
                            <figure>深圳市南山区后海</figure>
                        </div>
                        <hr>
                        <a href="property-detail.html" class="link-arrow">Read More</a>
                    </div>
                </div>
                <img alt="" src="/static/assets/img/slide-01.jpg" style="height: 100%; width: auto;">
            </div>
            <div class="slide">
                <div class="container">
                    <div class="overlay">
                        <div class="info">
                            <div class="tag price"> 900 万</div>
                            <h3>华洲公寓 · 阳光湾畔</h3>
                            <figure>深圳市龙华区 深圳北站</figure>
                        </div>
                        <hr>
                        <a href="property-detail.html" class="link-arrow">Read More</a>
                    </div>
                </div>
                <img alt="" src="/static/assets/img/slide-02.jpg" style="height: 100%; width: auto;">
            </div>
            <div class="slide">
                <div class="container">
                    <div class="overlay">
                        <div class="info">
                            <div class="tag price"> 1080 万</div>
                            <h3>星河时代</h3>
                            <figure>深圳市宝安区 新安</figure>
                        </div>
                        <hr>
                        <a href="property-detail.html" class="link-arrow">Read More</a>
                    </div>
                </div>
                <img alt="" src="/static/assets/img/slide-03.jpg" style="height: 100%; width: auto;">
            </div>
            <div class="slide">
                <div class="container">
                    <div class="overlay">
                        <div class="info">
                            <div class="tag price"> ???? 万</div>
                            <h3>乡间小屋</h3>
                            <figure>古镇</figure>
                        </div>
                        <hr>
                        <a href="property-detail.html" class="link-arrow">Read More</a>
                    </div>
                </div>
                <img alt="" src="/static/assets/img/slide-04.jpg" style="height: 100%; width:auto;">
            </div>
        </div>
    </div>
    <!-- end Slider -->

    <!-- Search Box -->
    <div class="search-box-wrapper">
        <div class="search-box-inner">
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-md-offset-9 col-sm-4 col-sm-offset-8">
                        <div class="search-box map">
                            <form role="form" id="form-map" class="form-map form-search" method="POST"
                                  action="/house/list">
                                <h2>搜索</h2>
                                <div class="form-group">
                                    <input type="text" class="form-control" id="search-box-property-id" name="name"
                                           placeholder="尝试输入小区或者房产名">
                                </div>
                                <div class="form-group">
                                    <select name="type">
                                        <option value="1">类型</option>
                                        <option value="1">售卖</option>
                                        <option value="2">出租</option>
                                    </select>
                                </div><!-- /.form-group -->
                                <div class="form-group">
                                    <button type="submit" class="btn btn-default">Search Now</button>
                                </div><!-- /.form-group -->
                            </form><!-- /#form-map -->
                        </div><!-- /.search-box.map -->
                    </div><!-- /.col-md-3 -->
                </div><!-- /.row -->
            </div><!-- /.container -->
        </div><!-- /.search-box-inner -->
    </div>
    <!-- end Search Box -->

    <!-- Page Content -->
    <div id="page-content">


        <aside id="advertising" class="block">

        </aside>
        <section id="new-properties" class="block">
            <div class="container">
                <header class="section-title">
                    <h2>新上房源</h2>
                    <a href="/house/list" class="link-arrow">所有房源</a>
                </header>
                <div class="row">
                   <#list recomHouses as house>
                       <div class="col-md-3 col-sm-6">
                           <div class="property">
                               <a href="/house/detail?id=${house.id}">
                                   <div class="property-image">
                                       <img alt="" src="${(house.firstImg)!}" style="width: 262px;height: 196px">
                                   </div>
                                   <div class="overlay">
                                       <div class="info">
                                           <div class="tag price">￥ ${house.price} 万元</div>
                                           <h3>${house.name}</h3>
                                           <figure>${house.address}</figure>
                                       </div>
                                       <ul class="additional-info">
                                           <li>
                                               <header>面积:</header>
                                               <figure>${house.area}m<sup>2</sup></figure>
                                           </li>
                                           <li>
                                               <header>床:</header>
                                               <figure>${house.beds}</figure>
                                           </li>
                                           <li>
                                               <header>卫生间:</header>
                                               <figure>${house.baths}</figure>
                                           </li>
                                           <li>
                                               <header>车库:</header>
                                               <figure>0</figure>
                                           </li>
                                       </ul>
                                   </div>
                               </a>
                           </div><!-- /.property -->
                       </div><!-- /.col-md-3 -->
                   </#list>

                </div><!-- /.row-->
            </div><!-- /.container-->
        </section><!-- /#new-properties-->
        <section id="testimonial" class="block">
            <div class="container">
                <header class="section-title"><h2>Celebrity Quotes</h2></header>
                <div class="owl-carousel testimonials-carousel">
                    <blockquote class="testimonial">
                        <figure>
                            <div class="image">
                                <img alt="" style="height: 224px;width: 160px" src="/static/assets/img/client-01.jpg">
                            </div>
                        </figure>
                        <aside class="cite">
                            <p>鸡蛋，从外打破是食物，从内打破是生命。人生亦是</p>
                            <footer>李嘉诚</footer>
                        </aside>
                    </blockquote>
                    <blockquote class="testimonial">
                        <figure>
                            <div class="image">
                                <img alt="" style="height: 180px;width: 160px" src="/static/assets/img/client-02.png">
                            </div>
                        </figure>
                        <aside class="cite">
                            <p>心有多大舞台就有多大，志向大小决定了你成功的概率</p>
                            <footer>王健林</footer>
                        </aside>
                    </blockquote>
                    <blockquote class="testimonial">
                        <figure>
                            <div class="image">
                                <img alt="" style="height: 201px;width: 160px" src="/static/assets/img/client-03.jpg">
                            </div>
                        </figure>
                        <aside class="cite">
                            <p>永葆一颗纯洁、仁慈和意气风发的心</p>
                            <footer>潘石屹</footer>
                        </aside>
                    </blockquote>
                </div><!-- /.testimonials-carousel -->
            </div><!-- /.container -->
        </section><!-- /#testimonials -->
        <section id="partners" class="block">
            <div class="container">
                <header class="section-title"><h2>Our Partners</h2></header>
                <div class="logos">
                    <div class="logo"><a href=""><img src="/static/assets/img/logo-partner-01.png" alt=""></a></div>
                    <div class="logo"><a href=""><img src="/static/assets/img/logo-partner-02.png" alt=""></a></div>
                    <div class="logo"><a href=""><img src="/static/assets/img/logo-partner-03.png" alt=""></a></div>
                    <div class="logo"><a href=""><img src="/static/assets/img/logo-partner-04.png" alt=""></a></div>
                    <div class="logo"><a href=""><img src="/static/assets/img/logo-partner-05.png" alt=""></a></div>
                </div>
            </div><!-- /.container -->
        </section><!-- /#partners -->
    </div>
     <@common.footer/>
</div>

<div id="overlay"></div>

 <@common.js/>

<script>
    $(window).load(function () {
        initializeOwl(false);
    });
    $(document).ready(function () {
        var errorMsg = "${errorMsg!""}";
        var successMsg = "${successMsg!""}";
        if (errorMsg) {
            errormsg("error", errorMsg);
        }
        if (successMsg) {
            successmsg("success", successMsg);
        }
    })
</script>
</body>
</html>