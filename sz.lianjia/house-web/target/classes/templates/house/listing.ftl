<!DOCTYPE html>

<html lang="en-US">
<@common.header/>

<body class="page-sub-page page-listing-lines page-search-results" id="page-top">
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
                <li class="active">房产列表</li>
            </ol>
        </div>
        <!-- end Breadcrumb -->

                      

        <div class="container">
            <div class="row">
                <!-- Results -->
                <div class="col-md-9 col-sm-9">
                    <section id="results">
                        <header><h1>房产列表</h1></header>
                        <section id="search-filter">
                            <figure><h3><i class="fa fa-search"></i>搜索结果:</h3>
                                <span class="search-count"></span>
                                 <div class="sorting">
                                    <div class="form-group">
                                        <select name="sorting" id="sorting">
                                        <option value="">排序</option>
                                        <option value="price_asc"   <#if (vo.sort) == "price_asc">   selected </#if>  >价格由低到高</option>
                                        <option value="price_desc"  <#if (vo.sort) == "price_desc">  selected </#if> >价格由高到低</option>
                                            <option value="time_desc"   <#if (vo.sort) == "time_desc">   selected </#if> >加入时间</option>
                                        </select>
                                    </div><!-- /.form-group -->
                                </div>
                            </figure>
                        </section>
                    <section id="properties" class="display-lines">
                      <#list ps.list as house>
                            <div class="property">
                                <figure class="tag status">${house.typeStr}</figure>
                                <div class="property-image">
                                    <figure class="ribbon">In Hold</figure>
                                    <a href="/house/detail?id=${house.id}">
                                        <img alt="" src="${house.firstImg}" style="width: 260px;height: 195px" >
                                    </a>
                                </div>

                                <div class="info" style="width: 300px">
                                    <header>
                                        <a href="/house/detail?id=${house.id}"><h3>${house.name}</h3></a>
                                        <figure>${house.address}</figure>

                                    </header>
                                    <div class="tag price">￥ ${house.price}万</div>
                                    <aside>
                                         <p>${house.remarks}</p>
                                        <dl style="width: 150px">
                                            <dt>Status:</dt>
                                                <dd>Sale</dd>
                                            <dt>Area:</dt>
                                                <dd>${house.area} m<sup>2</sup></dd>
                                            <dt>Beds:</dt>
                                                <dd>${house.beds}</dd>
                                            <dt>Baths:</dt>
                                                <dd>${house.baths}</dd>
                                        </dl>
                                    </aside>
                                    <br/>
                                    <a href="/house/detail?id=${house.id}" class="link-arrow">Read More</a>
                                </div>
                            </div>
                        </#list>
                       </section>
                            <!-- Pagination -->
                            <div class="center">
                                 <@common.paging ps.pagination/>
                            </div><!-- /.center-->
                        </section><!-- /#properties-->
                    </section><!-- /#results -->
                </div><!-- /.col-md-9 -->
                <!-- end Results -->

                <!-- sidebar -->
                <div class="col-md-3 col-sm-3">
                    <section id="sidebar">
                        <aside id="edit-search">
                            <header><h3>Search Properties</h3></header>
                            <form role="form" id="searchForm" class="form-search" method="post" action="/house/list">

                                <div class="form-group">
                                    <input type="text" class="form-control" id="search-box-property-id" value="${(vo.name)!}" name="name" placeholder="尝试输入小区或者房产名">
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
                                    <div class="tag price">￥${(house.price)!} 万</div>
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
<script type="text/javascript" src="assets/js/ie.js"></script>
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
      
      
  
     
      $('#sorting').change(function() {
           var type =  $(this).val();
           if (!type) {
               return;
           }
           window.location.href=  "/house/list?sort="+type+"&name=" + "${(vo.name)!}" + "&type=" + "${(vo.type)!0}" ;
       });

        
 </script>

</body>
</html>