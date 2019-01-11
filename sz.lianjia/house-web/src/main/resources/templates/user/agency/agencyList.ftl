<!DOCTYPE html>

<html lang="en-US">
<@common.header/>

<body class="page-sub-page page-agencies-listing" id="page-top">
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
                <li class="active">Agencies Listing</li>
            </ol>
        </div>
        <!-- end Breadcrumb -->

        <div class="container">
            <div class="row">
                <!-- Agent Detail -->
                <div class="col-md-9 col-sm-9">
                    <section id="agencies-listing">
                        <header><h1>Agencies Listing</h1></header>
                        <#list agencyList as agency>
                           <div class="agency">
                            <a href="/agency/agencyDetail?id=${agency.id}" class="agency-image"><img alt="" src="/static/assets/img/agency-logo-02.png"></a>
                            <div class="wrapper">
                                <header><a href="/agency/agencyDetail?id=${agency.id}"><h2>${agency.name}</h2></a></header>
                                <dl>
                                    <dt>手机:</dt>
                                    <dd>${agency.phone}</dd>
                                    <dt>Mobile:</dt>
                                    <dd>${agency.mobile}</dd>
                                    <dt>Email:</dt>
                                    <dd><a href="mailto:#">${agency.email}</a></dd>
                                </dl>
                                <address>
                                    <strong>地址</strong>
                                    <br>
                                    <strong>${agency.name}</strong><br>
                                    ${agency.address}
                                </address>
                            </div>
                          </div>
                        </#list>
                    </section>
                </div>
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


<!--[if gt IE 8]>
<script type="text/javascript" src="assets/js/ie.js"></script>
<![endif]-->
<@common.js/>
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