<!DOCTYPE html>

<html lang="en-US">
<@common.header/>

<body class="page-sub-page page-create-account page-account" id="page-top">
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
                <li class="active">创建账号</li>
            </ol>
        </div>
        <!-- end Breadcrumb -->

        <div class="container">
            <div class="row">
                <!-- About Us -->
                <div class="col-md-12 col-sm-12">
                    <section id="about-us">
                        <header><h1>重置密码</h1></header>
                        <section id="ceo-section" class="center">
                           
                            <div class="cite no-bottom-margin">已经向邮箱${email}发送重置密码确认邮件
                            </div>
                        </section>
                    </section>
                </div>
            </div>
           
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