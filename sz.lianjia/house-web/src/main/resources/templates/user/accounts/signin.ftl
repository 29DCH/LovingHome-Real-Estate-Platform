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
                <li class="active">登录</li>
            </ol>
        </div>
        <!-- end Breadcrumb -->

        <div class="container">
            <header><h1>Sign In</h1></header>
            <div class="row">
                <div class="col-md-4 col-sm-6 col-md-offset-4 col-sm-offset-3">
                    <form role="form" id="form-create-account" method="post" action="/accounts/signin">
                        <div class="form-group">
                            <label for="form-create-account-email">Email:</label>
                            <input type="text"  name="username" value="${username!}" class="form-control" id="form-create-account-email" required>
                        </div><!-- /.form-group -->
                        <div class="form-group">
                            <label for="form-create-account-password">密码:</label>
                            <input type="password" name="password" value="${password!}" class="form-control" id="form-create-account-password" required>
                        </div><!-- /.form-group -->
                        <input type="hidden" value="${target!}" name="target" />
                        <div class="form-group clearfix">
                            <button type="submit" class="btn pull-right btn-default" id="account-submit">登录</button>
                        </div><!-- /.form-group -->
                    </form>
                    <hr>
                    <div class="center"><a href="#" onclick="openRemember()">忘记密码</a></div>
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

    function openRemember(){
        var email = document.getElementById('form-create-account-email');
        window.open('/accounts/remember?username='+email.value);
    }
        
 </script>
    }
</body>
</html>