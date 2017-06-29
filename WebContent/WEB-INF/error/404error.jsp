<%@ page contentType="text/html; charset=UTF-8"%>
<%
response.setStatus(HttpServletResponse.SC_OK);
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>하랑대학교 | 로그인</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- Bootstrap 3.3.2 -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- iCheck -->
    <link href="plugins/iCheck/square/blue.css" rel="stylesheet" type="text/css" />
    <style>
        html,
        body {
            margin:0;
            padding:0;
            height:100%;
        }
        .wrapper {
            position:relative;
            min-height:100%;
        }
        
        header {
            height:60px;
            background:#ffffff;
        }
        
        footer {
            position:absolute;
            bottom:0;
            width:100%;
            height:70px;   
            background:#ffffff;
        }
        .content{
            margin-top: 200px;
            margin-bottom :400px;
        
        }
    </style>
  </head>
  <body class="login-page">
  <div class="wrapper">
   <header class="main-header">
        <!-- Logo -->
        <a href="/HarangProject/login?cmd=logout" class="logo">
        <img src="dist/img/Logo.png" class="img-circle" alt="User Image" width="40" height="40"/>
        &nbsp;<b>하랑</b> 대학교</a>
        <!-- Header Navbar: style can be found in header.less -->
   </header>
    <!-- Main content -->
    <section class="content">

      <div class="error-page">
        <h2 class="headline text-red">404 </h2>
        <div class="error-content">
        <br>
          <h3><i class="fa fa-warning text-red"></i> 해당페이지가 존재 하지 않습니다.</h3>
          <p>해당 페이지에 접근 할수 없습니다.</p>
          <p>로그인을 다시 해 주시거나 재접속 해 주십시요.</p>
        </div>
      </div>
      <!-- /.error-page -->

    </section>
    <!-- /.content -->
  <!-- /.content-wrapper -->
        
     <footer>
        <div class="pull-right hidden-xs">
          <b>Version</b> 2.0
        </div>
        <strong>Web Copyright &copy; 2017 The Center Team.</strong> All rights reserved.<br>
        <Strong>팀장 : 나현기, 부팀장 : 양혜민, 팀원 : 김성지, 김민준, 서지윤, 박주선 </Strong><br>
        <strong>Template Copyright &copy; 2014-2015 <a href="http://almsaeedstudio.com">Almsaeed Studio</a>.</strong> All rights reserved.
     </footer>
    </div><!-- .\ wrapper --> 
    <!-- jQuery 2.1.3 --> 
    <script src="plugins/jQuery/jQuery-2.1.3.min.js"></script>
    <!-- Bootstrap 3.3.2 JS -->
    <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- iCheck -->
    <script src="plugins/iCheck/icheck.min.js" type="text/javascript"></script>
  </body>
</html>