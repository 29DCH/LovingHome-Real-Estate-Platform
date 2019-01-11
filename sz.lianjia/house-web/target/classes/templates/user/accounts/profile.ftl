<!DOCTYPE html>

<html lang="en-US">
<@common.header/>

<body class="page-sub-page page-profile page-account" id="page-top">
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
                <li><a href="#">Account</a></li>
                <li class="active">Profile</li>
            </ol>
        </div>
        <!-- end Breadcrumb -->

        <div class="container">
            <div class="row">
            <!-- sidebar -->
            <div class="col-md-3 col-sm-2">
                <section id="sidebar">
                    <header><h3>账号</h3></header>
                    <aside>
                        <ul class="sidebar-navigation">
                            <li class="active"><a href="/accounts/profile"><i class="fa fa-user"></i><span>个人信息</span></a></li>
                            <li><a href="/house/ownlist"><i class="fa fa-home"></i><span>我的房产信息</span></a></li>
                            <li><a href="/house/bookmarked"><i class="fa fa-heart"></i><span>房产收藏</span></a></li>
                        </ul>
                    </aside>
                </section><!-- /#sidebar -->
            </div><!-- /.col-md-3 -->
            <!-- end Sidebar -->
                <!-- My Properties -->
                <div class="col-md-9 col-sm-10">
                    <section id="profile">
                        <header><h1>个人信息</h1></header>
                        <div class="account-profile">
                            <div class="row">
                                <div class="col-md-3 col-sm-3">
                                    <img alt="" class="image" src="${(loginUser.avatar)!}">
                                </div>
                                <div class="col-md-9 col-sm-9">
                                    <form role="form" id="form-account-profile" method="post" action="/accounts/profile">
                                        <input type="hidden" value="${(loginUser.email)!}" name="email" />

                                        <section id="contact">
                                            <h3>联系方式</h3>
                                            <dl class="contact-fields">
                                                <dt><label for="form-account-name">Your Name:</label></dt>
                                                <dd><div class="form-group">
                                                    <input type="text" class="form-control" id="form-account-name" name="name" required value="${(loginUser.name)!}">
                                                </div><!-- /.form-group --></dd>
                                                <dt><label for="form-account-phone">Phone:</label></dt>
                                                <dd><div class="form-group">
                                                    <input type="text" class="form-control" id="form-account-phone" name="phone" value="${(loginUser.phone)!}">
                                                </div><!-- /.form-group --></dd>
                                                <dt><label for="form-account-email">Email:</label></dt>
                                                <dd><div class="form-group">
                                                    <input type="text" disabled class="form-control" id="form-account-email" name="form-account-phone" value="${(loginUser.email)!}">
                                                </div><!-- /.form-group --></dd>
                                              
                                            </dl>
                                        </section>
                                        <section id="about-me">
                                            <h3>About Me</h3>
                                            <div class="form-group">
                                                <textarea class="form-control" id="form-contact-agent-message" rows="5" name="aboutme">${(loginUser.aboutme)!}</textarea>
                                            </div><!-- /.form-group -->
                                        </section>
                                         <section id="social">
                                            <div class="form-group clearfix">
                                                <button type="submit" class="btn pull-right btn-default" id="account-submit">更新</button>
                                            </div><!-- /.form-group -->
                                        </section>

                                       
                                    </form><!-- /#form-contact -->
                                    <section id="change-password">
                                        <header><h2>更新密码</h2></header>
                                        <div class="row">
                                            <div class="col-md-6 col-sm-6">
                                                <form role="form" id="form-account-password" method="post" action="/accounts/changePassword" >
                                                     <input type="hidden" value="${(loginUser.email)!}" name="email" />
                                                    <div class="form-group">
                                                        <label for="form-account-password-current">当前密码</label>
                                                        <input type="password" name="password" class="form-control" id="form-account-password-current" name="form-account-password-current">
                                                    </div><!-- /.form-group -->
                                                    <div class="form-group">
                                                        <label for="form-account-password-new">新密码</label>
                                                        <input type="password" name="newPassword" class="form-control" id="form-account-password-new" name="form-account-password-new">
                                                    </div><!-- /.form-group -->
                                                    <div class="form-group">
                                                        <label for="form-account-password-confirm-new">确认密码</label>
                                                        <input type="password" name="confirmPassword" class="form-control" id="form-account-password-confirm-new" name="form-account-password-confirm-new">
                                                    </div><!-- /.form-group -->
                                                    <div class="form-group clearfix">
                                                        <button type="submit" class="btn btn-default" id="form-account-password-submit">更新密码</button>
                                                    </div><!-- /.form-group -->
                                                </form><!-- /#form-account-password -->
                                            </div>
                                            
                                        </div>
                                    </section>
                                </div><!-- /.col-md-9 -->
                            </div><!-- /.row -->
                        </div><!-- /.account-profile -->
                    </section><!-- /#profile -->
                </div><!-- /.col-md-9 -->
                <!-- end My Properties -->
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