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
                <li class="active">重置密码</li>
            </ol>
        </div>
        <!-- end Breadcrumb -->

        <div class="container">
             <header><h1>为${email!}重设密码</h1></header>
            <div class="row">
                <div class="col-md-4 col-sm-6 col-md-offset-4 col-sm-offset-3">
                    <form role="form" id="form-create-account" method="post" action="/accounts/resetSubmit" >
                       
                        <div class="form-group">
                            <label for="form-create-account-password">密码:</label>
                            <input type="password" name="passwd" class="form-control" id="form-create-account-password" required>
                        </div><!-- /.form-group -->

                         <div class="form-group">
                            <label for="form-create-account-confirm-password">确认密码:</label>
                            <input type="password" name="confirmPasswd" class="form-control" id="form-create-account-confirm-password" required>
                        </div>
                        <input type="hidden"  name="email" value="${email!}">
                        <input type="hidden"  name="key" value="${sucess_key!}">
                        <div class="form-group clearfix">
                            <button type="submit" class="btn pull-right btn-default" id="account-submit">确认</button>
                        </div><!-- /.form-group -->
                    </form>
                    <hr>
                    
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