<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>�϶����б� | �α���</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- Bootstrap 3.3.2 -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- iCheck -->
    <link href="plugins/iCheck/square/blue.css" rel="stylesheet" type="text/css" />
    <style style="text/css">
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
            position:relative;
            bottom:0;
            width:100%;
            height:70px;   
            background:#ffffff;
        }
    </style>
  </head>
  <body class="login-page">
  <div class="wrapper">
   <header class="main-header">
        <!-- Logo -->
        <a href="#" class="logo">
        <img src="dist/img/Logo.png" class="img-circle" alt="User Image" width="40" height="40"/>
        &nbsp;<b>�϶�</b> ���б�</a>
        <!-- Header Navbar: style can be found in header.less -->
   </header>
    <div class="login-box">
      <div class="login-logo">
         <img src="dist/img/Logo.png" class="img-circle" alt="User Image" width="75" height="75"/><br>
        <a href="#"><b>�϶�</b>���б�</a>
      </div><!-- /.login-logo -->
      <div class="login-box-body">
        <p class="login-box-msg">Ŀ�´�Ƽ�� �����Ͻ÷��� �α����� �ϼ���</p>
        <form name="login" action="/HarangProject/login" method="post">
          <input type="hidden" name="cmd" value="login"/>
          <div class="form-group has-feedback">
            <input type="text" class="form-control" name="m_id" placeholder="�й�" required="required"/>
            <span class="glyphicon glyphicon-user form-control-feedback"></span>
          </div>
          <div class="form-group has-feedback">
            <input type="password" class="form-control" name="m_pw" placeholder="��й�ȣ" required="required"/>
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
          </div>
          <div class="row">
            <div class="col-xs-8">    
            </div><!-- /.col -->
            <div class="col-xs-4">
              <button type="submit" class="btn btn-primary btn-block btn-flat"><i class="fa fa-unlock"></i> �α���</button>
            </div><!-- /.col -->
          </div>
        </form>
        <a href="#">��й�ȣ ã��</a><br>
      </div><!-- /.login-box-body -->
    </div><!-- /.login-box -->
    <!-- �ϼ��� ���� ���� -->
    <div class="login-box">
      <div class="login-box-body">
           <h3>�ε���</h3>
           <h4>�� ����</h4>
               <ul>
                <li>user side</li>
                <li><a href="/HarangProject/myPage?cmd=myinfo">�� ���� ��ȸ</a></li>
                <li><a href="/HarangProject/myPage?cmd=specUp">�����!</a></li>
                <li><a href="/HarangProject/myPage?cmd=timeTable">���� �ð�ǥ!</a></li>
                <li><a href="/HarangProject/myPage?cmd=pointList">����Ʈ �ŷ� ����</a></li>
                <li><a href="/HarangProject/myPage?cmd=pointZero">����Ʈ ����</a></li>
                <li><a href="/HarangProject/message?cmd=INBOX">������(������ ������ ����) </a></li>
                <li>admin side</li>
                <li><a href="/HarangProject/myPage?cmd=AmemList">ȸ�����</a></li>
                <li><a href="/HarangProject/myPage?cmd=Achallenge">���� �� ����</a></li>
                <li><a href="/HarangProject/myPage?cmd=AspecList">�ڰ��� ����</a></li>
                <li><a href="/HarangProject/myPage?cmd=Alesson">���Ǹ�� ����</a></li>
                <li><a href="/HarangProject/myPage?cmd=ApointCheck">����Ʈ ����</a></li>
               </ul>
           <h4>�϶� �������</h4>
               <ul>
                <li>user side</li>
                <li><a href="/HarangProject/food?cmd=menu">�н� �޴� ��ȸ</a></li>
                <li><a href="/HarangProject/food?cmd=ticket">�ı� ���� ����</a></li>
                <li>admin side</li>
                <li><a href="/HarangProject/food?cmd=Amenu">�н� �޴� ����</a></li>
                <li><a href="/HarangProject/food?cmd=Aticket">�ı� �Ǹ� ����</a></li>
               </ul>
           <h4>�˹� �϶�</h4> 
               <ul>
                 <li>user side</li>
                 <li><a href="/HarangProject/parttime?cmd=PMAIN">�˹� ����</a></li>
                 <li><a href="/HarangProject/parttime?cmd=DMAIN">��Ÿ ����</a></li>
                 <li><a href="/HarangProject/parttime?cmd=MYPAGE">���� �� ��</a></li>
                 <li>admin side</li>
                 <li><a href="/HarangProject/parttime?cmd=PMAIN">�˹� ���� ����</a></li>
                 <li><a href="/HarangProject/parttime?cmd=DMAIN">��Ÿ ���� ����</a></li>
               </ul>
            <h4>�볪�� ��</h4>
            <ul>
                 <li>user side</li>
                 <li><a href="/HarangProject/bamboo?cmd=BB_LIST">���� ������</a></li>
                 <li>admin side</li>
                 <li><a href="/HarangProject/bamboo?cmd=A_BB_LIST">�Խ��� ������ ����</a></li>
              </ul>
            <h4>�л�����</h4>
            <ul>
                 <li>user side</li>
                 <li><a href="/HarangProject/schedule?cmd=U_SCH_LIST">�л����� ���� ������</a></li>
                 <li>admin side</li>
                 <li><a href="/HarangProject/schedule?cmd=A_SCH_LIST">�л����� ������ ����</a></li>
              </ul>
             </div><!-- /.login-box-body -->
    </div><!-- /.login-box -->
        
     <footer>
        <div class="pull-right hidden-xs">
          <b>Version</b> 2.0
        </div>
        <strong>Web Copyright &copy; 2017 The Center Team.</strong> All rights reserved.<br>
        <Strong>���� : ������, ������ : ������, ���� : �輺��, �����, ������, ���ּ� </Strong><br>
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