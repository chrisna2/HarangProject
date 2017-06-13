<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>하랑대학교 | 커뮤니티 회원 등록</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- Bootstrap 3.3.2 -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- iCheck -->
    <link href="plugins/iCheck/square/blue.css" rel="stylesheet" type="text/css" />

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
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
            height:50px;
            background:#ffffff;
        }
        footer {
            position:absolute;
            bottom:0;
            width:100%;
            height:7%;   
            background:#ffffff;
        }
        .content{
          margin-bottom: 50px;
        }
    </style>
  </head>
  <body class="login-page">
  <div class="wrapper">
   <header class="main-header">
        <!-- Logo -->
        <a href="#" class="logo">
        <img src="dist/img/Logo.png" class="img-circle" alt="User Image" width="40" height="40"/>
        &nbsp;<b>하랑</b> 대학교</a>
        <!-- Header Navbar: style can be found in header.less -->
   </header>
    <!-- 세로 길이 수정 -->
    <section class="content">
          <div class="row">
           <!-- 너비 사이즈 수정  : col-->
           <div class="col-md-9">
              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">정식 회원 가입</h3>
                </div>
                <form role="form">
                <div class="box-body">
                  <div class="input-group">
                    <span class="input-group-addon bg-gray"><i class="fa fa-picture-o"></i> 개인 이미지</span>
                    <span class="input-group-addon">
                       <input type="file" id="exampleInputFile" required="required">
                    </span>
                    <span class="input-group-addon bg-gray">
                        <img src="" class="img-rounded" height="120" width="90" alt="User Image"/>
                    </span>
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon bg-gray"><i class="fa fa-smile-o"></i> 이름</span>
                    <input type="text" name="m_name" class="form-control" value="${newbee.m_name}" readonly="readonly">
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon bg-gray"><i class="fa fa-sort-numeric-desc"></i> 학번</span>
                    <input type="text" name="m_num" class="form-control" value="${newbee.m_id}" readonly="readonly">
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon bg-gray"><i class="fa  fa-unlock-alt"></i> 비밀번호 등록</span>
                    <input type="password" name="m_pw" class="form-control" required="required">
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon bg-gray"><i class="fa  fa-unlock-alt"></i> 비밀번호 확인</span>
                    <input type="password" name="m_pw2" class="form-control" required="required">
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon bg-gray"><i class="fa fa-sitemap"></i> 학과</span>
                    <input type="text" name="m_dept" class="form-control" value="${newbee.m_dept}" readonly="readonly">
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon bg-gray"><i class="fa fa-star"></i> 생년월일</span>
                    <input type="text" name="m_birth" class="form-control" value="${newbee.m_birth}" readonly="readonly">
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon bg-gray"><i class="fa fa-envelope"></i> 이메일</span>
                    <input type="text" name="m_email" class="form-control" required="required">
                    <span class="input-group-addon bg-gray"> @ </span>
                    <input type="text" name="m_email" class="form-control" required="required">
                    <span class="input-group-addon bg-gray"> 선택 </span>
                    <select class="form-control" required="required">
                        <option></option>
                        <option>google.com</option>
                        <option>hanmail.net</option>
                        <option>naver.com</option>
                        <option>nate.om</option>
                        <option>gmail.com</option>
                    </select>
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon bg-gray"><i class="fa fa-phone-square"></i> 연락처</span>
                    <select class="form-control" required="required">
                        <option></option>
                        <option>010</option>
                        <option>011</option>
                        <option>012</option>
                        <option>016</option>
                        <option>017</option>
                    </select>
                    <span class="input-group-addon bg-gray"> - </span>
                    <input type="text" name="m_tel" class="form-control" required="required">
                    <span class="input-group-addon bg-gray"> - </span>
                    <input type="text" name="m_tel" class="form-control" required="required">
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon bg-gray"><i class="fa fa-location-arrow"></i> 우편번호</span>
                    <input type="text" name="m_addr1" class="form-control" required="required">
                    <span class="input-group-btn">
                      <button class="btn btn-warning btn-flat" type="button">우편 번호 검색</button>
                    </span>
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon bg-gray"><i class="fa fa-location-arrow"></i> 우편번호 주소</span>
                    <input type="text" name="m_addr1" class="form-control" required="required">
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon bg-gray"><i class="fa fa-location-arrow"></i> 상세 주소</span>
                    <input type="text" name="m_addr1" class="form-control" required="required">
                  </div>
                  <br>
                </div><!-- /.box-body -->
                 <div class="box-footer" align="right">
                    <input type="button" class="btn" value="뒤로가기">
                    <input type="reset" class="btn" value="리셋">
                    <input type="submit" class="btn btn-primary" value="개인정보 수정">
                </div>
                </form>
              </div><!-- /.box -->
             </div><!-- /.col -->
           </div><!-- /.row -->  
       </section>
        
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
    <script>
      $(function () {
        $('input').iCheck({
          checkboxClass: 'icheckbox_square-blue',
          radioClass: 'iradio_square-blue',
          increaseArea: '20%' // optional
        });
      });
    </script>
  </body>
</html>