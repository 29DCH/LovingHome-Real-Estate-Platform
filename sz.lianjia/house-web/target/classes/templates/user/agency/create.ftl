<!DOCTYPE html>

<html lang="en-US">
<@common.header/>

<body class="page-sub-page page-create-agency page-account" id="page-top">
<!-- Wrapper -->
<div class="wrapper">
    <!-- Navigation -->
     <@common.nav/>
     <!-- /.navigation -->
    <!-- end Navigation -->
    <!-- Page Content -->
    <div id="page-content">
        <!-- Breadcrumb -->
        <div class="container">
            <ol class="breadcrumb">
                <li><a href="#">Home</a></li>
                <li class="active">创建经纪机构</li>
            </ol>
        </div>
        <!-- end Breadcrumb -->

        <div class="container">
            <header><h1>创建经纪机构</h1></header>
            <div class="row">
                <div class="col-md-8 col-sm-12 col-md-offset-2">
                    <form role="form" id="form-create-agency" method="post" action="/agency/submit">
                        <section>
                            <div class="form-group">
                                <label for="form-create-agency-title">经纪机构名称:</label>
                                <input type="text" class="form-control" id="form-create-agency-title" name="name" required>
                            </div><!-- /.form-group -->
                            <div class="form-group">
                                <label for="form-create-agency-description">描述:</label>
                                <textarea class="form-control" id="form-create-agency-description"    name="aboutUs" rows="4" required></textarea>
                            </div><!-- /.form-group -->
                        </section>
                        <h3>联系信息</h3>
                        <div class="row">
                            <div class="col-md-6 col-sm-6">
                                <section id="address">
                                    <div class="form-group">
                                        <label for="form-create-agency-address-1">地址:</label>
                                        <input type="text" class="form-control" name="address" id="form-create-agency-address-1" required>
                                    </div><!-- /.form-group -->
                                </section><!-- /#address -->
                            </div><!-- /.col-md-6 -->
                            <div class="col-md-6 col-sm-6">
                                <section id="contacts">
                                    <div class="form-group">
                                        <label for="form-create-agency-email">Email:</label>
                                        <input type="email" class="form-control" name="email" id="form-create-agency-email" required>
                                    </div><!-- /.form-group -->
                                    <div class="form-group">
                                        <label for="form-create-agency-phone">手机:</label>
                                        <input type="tel" class="form-control"   name="phone" id="form-create-agency-phone">
                                    </div><!-- /.form-group -->
                                    <div class="form-group">
                                        <label for="form-create-agency-phone">电话:</label>
                                        <input type="tel" class="form-control"   name="mobile" id="form-create-agency-phone">
                                    </div>
                                    <div class="form-group">
                                        <label for="form-create-agency-website">网站:</label>
                                        <input type="text" class="form-control"  name="webSite" id="form-create-agency-website">
                                    </div><!-- /.form-group -->
                                </section><!-- /#address -->
                            </div><!-- /.col-md-6 -->
                        </div><!-- /.row -->
                        <!-- /#select-package -->
                        <section id="submit">
                            <div class="form-group center">
                                <button type="submit" class="btn btn-default large" id="account-submit">创建经纪机构信息</button>
                            </div><!-- /.form-group -->
                        </section>
                    </form>
                    <hr>
                    <section class="center">
                        <figure class="note">By clicking the “Create Agency” button you agree with our <a href="terms-conditions.html">Terms and conditions</a></figure>
                    </section>
                </div><!-- /.col-md-8 -->
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