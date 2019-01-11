
<!DOCTYPE html>

<html lang="en-US">
<@common.header/>

<body class="page-sub-page page-blog-listing" id="page-top">
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
                <li class="active">Blog Listing</li>
            </ol>
        </div>
        <!-- end Breadcrumb -->

        <div class="container">
            <div class="row">
                <!-- Content -->
                <div class="col-md-9 col-sm-9">
                    <section id="content">
                        <header><h1>博客列表</h1></header>
                        
                     <#list ps.list as blog> 
                        <article class="blog-post">
                            <header><a href="/blog/detail?id=${blog.id}"><h2>${blog.title}</h2></a></header>
                            <figure class="meta">
                                <a href="#" class="link-icon"><i HUANclass="fa fa-user"></i>Admin</a>
                                <a href="#" class="link-icon"><i class="fa fa-calendar"></i><td>${(blog.createTime?datetime)}</td></a>
                                <div class="tags">
                                   <#list blog.tagList as tag> 
                                    <a href="#" class="tag article">${tag}</a>
                                  </#list>
                                </div>
                            </figure>
                            <p>
                               ${blog.digest}
                            </p>
                            <a href="/blog/detail?id=${blog.id}" class="link-arrow">Read More</a>
                        </article><!-- /.blog-post -->
                    </#list>

                        <!-- Pagination -->
                        <div class="center">
                              <@common.paging ps.pagination/>
                        </div><!-- /.center-->
                    </section><!-- /#content -->
                </div><!-- /.col-md-9 -->
                <!-- end Content -->

                <!-- sidebar -->
                <div class="col-md-3 col-sm-3">
                    <section id="sidebar">
                       <@common.search />
                       <@common.hot />
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
        
 </script>

</body>
</html>