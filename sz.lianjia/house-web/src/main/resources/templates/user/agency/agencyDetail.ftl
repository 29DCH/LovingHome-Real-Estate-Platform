<!DOCTYPE html>

<html lang="en-US">
<@common.header/>

<body class="page-sub-page page-agency-detail" id="page-top">
<!-- Wrapper -->
<div class="wrapper">
    <!-- Navigation -->
     <@common.nav/>
    <!-- end Navigation -->
    <!-- Page Content -->
    <div id="page-content">
        <!-- Breadcrumb -->
        <div class="container">
            <ol class="breadcrumb">
                <li><a href="#">Home</a></li>
                <li><a href="#">经纪机构</a></li>
                <li class="active">机构详情</li>
            </ol>
        </div>
        <!-- end Breadcrumb -->

        <div class="container">
            <div class="row">
                <!-- Agent Detail -->
                <div class="col-md-9 col-sm-9">
                    <section id="agent-detail">
                        <header><h1>${agency.name}</h1></header>
                        <section id="agent-info">
                            <div class="row">
                                <div class="col-md-3 col-sm-3">
                                    <figure class="agency-image"><img alt="" src="/static/assets/img/agency-logo-big-01.png"></figure>
                                </div><!-- /.col-md-3 -->
                                <div class="col-md-5 col-sm-5">
                                    <h3>联系信息</h3>
                                    <address>
                                        ${agency.address}
                                    </address>
                                    <dl>
                                        <dt>手机:</dt>
                                        <dd>${agency.phone}</dd>
                                        <dt>Mobile:</dt>
                                        <dd>${agency.mobile}</dd>
                                        <dt>Email:</dt>
                                        <dd><a href="mailto:#">${agency.email}</a></dd>
                                        <dt>官网:</dt>
                                        <dd>${agency.webSite}</dd>
                                    </dl>
                                </div><!-- /.col-md-5 -->
                                <div class="col-md-4 col-sm-4">
                                    <h3>简单介绍</h3>
                                    <p>${agency.aboutUs} 
                                    </p>
                                    <div id="social">
                                        <h3>Social Profiles</h3>
                                        <div class="agent-social">
                                            <a href="#" class="fa fa-twitter btn btn-grey-dark"></a>
                                            <a href="#" class="fa fa-facebook btn btn-grey-dark"></a>
                                            <a href="#" class="fa fa-linkedin btn btn-grey-dark"></a>
                                        </div>
                                    </div><!-- /.block -->
                                </div><!-- /.col-md-4 -->
                            </div><!-- /.row -->
                            <div class="row">

                            </div><!-- /.row -->
                        </section><!-- /#agent-info -->
                      
                    </section><!-- /#agent-detail -->
                </div><!-- /.col-md-9 -->
                <!-- end Agent Detail -->

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