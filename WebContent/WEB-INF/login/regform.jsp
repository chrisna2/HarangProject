<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
          margin-top: 20px;
          margin-bottom: 100px;
        }
    </style>
    <script type="text/javascript">
    function checkform(){

        if(input.m_pw.value!=input.m_pw2.value){
            alert("두 비밀번호가 다릅니다. 다시한번 확인 하여 주십시요.");
            return false;
        }
        
        var m_mail1 = input.m_mail1.value;
        var m_mail2 = input.m_mail2.value;
        var m_mail = m_mail1 + "@" + m_mail2;
        input.m_mail.value = m_mail;

        var m_tel1 = input.m_tel1.value;
        var m_tel2 = input.m_tel2.value;
        var m_tel3 = input.m_tel3.value;
        var m_tel = m_tel1 + "-" + m_tel2 + "-" + m_tel3;
        input.m_tel.value = m_tel;

        var m_addr1 = input.m_addr1.value;
        var m_addr2 = input.m_addr2.value;
        var m_addr3 = input.m_addr3.value;
        var m_addr = m_addr1 + "/" + m_addr2 + "/" + m_addr3;
        input.m_addr.value = m_addr;

        return true;
    }
    
    function mailcheck(){ 
        i = input.m_mail3.selectedIndex; // 선택항목의 인덱스 번호
        var mail= input.m_mail3.options[i].value; // 선택항목 value
        input.m_mail2.value = mail;
   }

   
    </script>
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
                <form role="form" action="/HarangProject/login?cmd=join" name="input" onsubmit="return checkform()" method="post" enctype="multipart/form-data">
                <div class="box-body">
<table class="table" style="margin-bottom: 50px">
    <tr align="center">
        <td class="bg-gray">약관 동의</td>
    </tr>
    <tr>
        <td>
        <textarea rows="5" style="width: 100%" readonly>
        전자금융 이용약관 
        제 1 조 【 목적 】
        이 『전자금융 이용 약관』(이하 약관이라 함)은 서비스의 제공자인 ○○은행(이하 당행이라 함)과 이용자인 고객간에 전자금융 이용에 관한 제반 사항을 정함을 목적으로 합니다.
        
        제 2 조 【 서비스와 이용업무 】
        서비스의 종류는 텔레뱅킹, pc뱅킹 및 인터넷뱅킹으로 구분하며 제공되는 서비스는 다음과 같습니다.
        1.텔레뱅킹 : 각종 조회, 자금이체, 예약이체, 전자금융론, 통지, 안내, 상담, 사고신고접수 등
        2.pc 뱅킹 : 각종 조회, 자금이체, 예약이체, 예금계좌의 개설 및 해지, 통지, 안내, 상담, 사고신고 접수 등
        3.인터넷뱅킹
        가.예금, 신탁, 대출, 신용카드, 외국환 및 기타 업무에 관한 정보조회
        나.원화 및 외화자금이체, 예금계좌의 개설 및 해지, 대출원금 상환 및 이자 납부, 신용카드 현금 서비스, 지로 등 공과금 납부, 수출입 업무 관련 이자 및 수수료의 납부, 신용장 개설 및 조건변경 신청, 해외 송금
        , 외환의 매매 등
        다.대출 신청, 사고신고, 기타 부가 서비스 등
        제 3 조 【 서비스 이용매체 】
        서비스별로 이용할 수 있는 매체는 다음과 같습니다.
        1.텔레뱅킹 : 전화
        2.pc 뱅킹 : 개인용컴퓨터(pc), 하이텔단말기, 다기능전화기(이지폰 등)
        3.인터넷뱅킹 : 개인용컴퓨터(pc), 인터넷tv, 인터넷폰, 휴대용 정보 단말기(pda)
        제 4 조 【 서비스의 개시 및 종료 】
        ① 고객은 텔레뱅킹, pc뱅킹, 인터넷뱅킹 모두 또는 어느 한가지 서비스만을 선택하여 전자금융이용신청서(이하 신청서라 함)를 작성하여 제출하고 당행이 이를 승낙한 후 고객이 직접 각종 비밀번호를 입력함으로써 개시됩니
        다.
        ② 고객은 이용 업무에 따라 별도의 약정이 필요한 경우에는 별도의 개별 약정을 체결하셔야 합니다.
        ③ 고객이 제①항의 서비스 이용을 중단하고자 할 경우에는 신청서에 의하여 해지 신청을 하셔야 합니다.
        제 5 조 【 본인 확인방법 】
        당행은 다음 각 호와 같이 서비스 종류별로 은행이 요구하는 해당 항목을 고객이 입력했을 때 동 내용이 당행에 등록된 것과 일치할 경우 본인으로 간주하여 서비스를 제공합니다.
        
        1.텔레뱅킹 : 텔레뱅킹이용자번호 또는 주민등록번호, 텔레뱅킹비밀번호, 계좌비밀번호, otp(one time password)카드 번호, 보안카드 비밀번호, 음성확인 등
        
        2.pc 뱅킹 : pc뱅킹이용자번호, pc뱅킹비밀번호, 자금이체비밀번호, 계좌비밀번호, otp (one time password)카드번호, 보안카드비밀번호 등
        (이하 생략)
        </textarea>
        </td>
    </tr>
    <tr>
        <td class="bg-gray"></td>
    </tr>
    <tr align="center">
        <td><br>전체 약관에 동의 합니다.&nbsp;<input type="checkbox" name="terms_check" required="required"></td>
    </tr>
    <tr>
        <td class="bg-gray"></td>
    </tr>
</table>
                  <div class="input-group">
                    <span class="input-group-addon bg-gray"><i class="fa fa-picture-o"></i> 개인 이미지</span>
                    <span class="input-group-addon">
                       <input type="file" id="imgInp" name="upFile" required="required">
                    </span>
                    <span class="input-group-addon bg-gray">
                        <img src="#" id="local" class="img-rounded" height="120" width="90" alt="User Image"/>
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
                    <input type="text" name="m_id" class="form-control" value="${newbee.m_id}" readonly="readonly">
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
                    <input type="text" name="m_mail1" class="form-control" required="required">
                    <span class="input-group-addon bg-gray"> @ </span>
                    <input type="text" name="m_mail2" class="form-control" required="required">
                    <span class="input-group-addon bg-gray"> 선택 </span>
                    <select name="m_mail3"class="form-control" onChange="mailcheck()">
                        <option selected="selected" value="self">선택하세요</option>
                        <option value='nate.com' >nate.com</option>
                        <option value='empas.com' >empas.com</option>
                        <option value='dreamwiz.com' >dreamwiz.com</option>
                        <option value='gmail.com' >gmail.com</option>
                        <option value='hanafos.com' >hanafos.com</option>
                        <option value='hanmail.net' >hanmail.net</option>
                        <option value='daum.net' >daum.net</option>
                        <option value='hotmail.com' >hotmail.com</option>
                        <option value='korea.com' >korea.com</option>
                        <option value='naver.com' >naver.com</option>
                        <option value='yahoo.com' >yahoo.com</option>
                    </select>
                    <input type="hidden" name="m_mail">
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon bg-gray"><i class="fa fa-phone-square"></i> 연락처</span>
                    <select class="form-control" name="m_tel1" required="required">
                        <option></option>
                        <option value="010">010</option>
                        <option value="011">011</option>
                        <option value="012">012</option>
                        <option value="016">016</option>
                        <option value="017">017</option>
                    </select>
                    <span class="input-group-addon bg-gray"> - </span>
                    <input type="text" name="m_tel2" class="form-control" required="required" onkeydown="return showKeyCode(event)">
                    <span class="input-group-addon bg-gray"> - </span>
                    <input type="text" name="m_tel3" class="form-control" required="required" onkeydown="return showKeyCode(event)">
                    <input type="hidden" name="m_tel">
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon bg-gray"><i class="fa fa-location-arrow"></i> 우편번호</span>
                    <input type="text" name="m_addr1" class="form-control" required="required" readonly="readonly">
                    <span class="input-group-btn">
                      <button class="btn btn-warning btn-flat" type="button" id="btnPopup">우편 번호 검색</button>
                    </span>
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon bg-gray"><i class="fa fa-location-arrow"></i> 우편번호 주소</span>
                    <input type="text" name="m_addr2" class="form-control" required="required" readonly="readonly">
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon bg-gray"><i class="fa fa-location-arrow"></i> 상세 주소</span>
                    <input type="text" name="m_addr3" class="form-control" required="required">
                  </div>
                  <input type="hidden" name="m_addr">
                  <br>
                </div><!-- /.box-body -->
                 <div class="box-footer" align="right">
                    <input type="button" class="btn" value="뒤로가기">
                    <input type="reset" class="btn" value="리셋">
                    <input type="submit" class="btn btn-primary" value="회원 정보 수정">
                </div>
                </form>
              </div><!-- /.box -->
             </div><!-- /.col -->
           </div><!-- /.row -->  
       </section>
       
                    <!-- 뒷 페이지 배경을 눌러도 꺼지지 않음 -->
                <div class="modal fade" id="theModal" data-backdrop="static">
                    <div class="modal-dialog">
                        <form name="zip" action="">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h3>우편 번호 검색</h3>
                            </div>
                            <div class="modal-body">
                              <div class="input-group">
			                    <span class="input-group-addon bg-gray"><i class="fa fa-map-o"></i> 시/도 선택</span>
			                    <select name="sido" class="form-control" onchange="fngugun()" required="required">
			                             <option>시/도를 선택해 주세요</option>
			                         <c:forEach items="${sido}" var="s">
			                             <option value="${s.sido}">${s.sido}</option>
			                         </c:forEach>
			                    </select>
			                  </div>
                              <br>
                              <div class="input-group">
			                    <span class="input-group-addon bg-gray"><i class="fa fa-map-o"></i> 구/군 선택</span>
			                    <select name="gugun" class="form-control" required="required" disabled="disabled" id="gugun" onchange="fndong()">
			                        <option>시/도를 선택해 주세요</option>
			                    </select>
			                  </div>
                              <br>
                              <div class="input-group">
			                    <span class="input-group-addon bg-gray"><i class="fa fa-map-o"></i> 동/면 입력</span>
			                    <input type="text" name="dong" id="dong" class="form-control" required="required" placeholder="구/군을 선택하세요" readonly="readonly">
			                    <span class="input-group-btn">
                                    <button class="btn btn-info btn-flat" type="button" onclick="fnSearch()">우편 번호 검색</button>
                                </span>
			                  </div>
                              <br>
                              <div style="width:100%; height:200px; overflow:auto">
                              <table class="table table-bordered table-striped">
			                    <thead>
			                      <tr>
			                        <th>우편번호</th>
			                        <th>시/도</th>
			                        <th>구/군</th>
			                        <th>동/면</th>
			                        <th>번지</th>
			                      </tr>
			                    </thead>
			                    <tbody id="total">
			                      <tr>
			                         <td colspan="5">동/면을 입력 하세요.</td>
			                      </tr>
			                    </tbody>
			                  </table>
			                  </div>
                            </div>
                            <div class="modal-footer">
                                <button class="btn btn-primary" data-dismiss="modal">닫기</button>
                            </div>
                        </div>
                        </form>
                    </div>
                </div><!-- 모달 끝 -->
                
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
    function showKeyCode(event) {
        event = event || window.event;
        var keyID = (event.which) ? event.which : event.keyCode;
        if( ( keyID >=48 && keyID <= 57 ) || ( keyID >=96 && keyID <= 105 ) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 )
        {
            return;
        }
        else
        {
            return false;
        }
    }
      $(function () {
        $('input').iCheck({
          checkboxClass: 'icheckbox_square-blue',
          radioClass: 'iradio_square-blue',
          increaseArea: '20%' // optional
        });
        //아이디 접근 바로 하기
        $("#btnPopup").click(
            function(){
                //alert("버튼 눌림");
                $("#theModal").modal('toggle');
            });
      });

      //로컬 업로드 사진 불러오기
      function readURL(input) {
          if (input.files && input.files[0]) {
              var reader = new FileReader();
              reader.onload = function (e) {
                  $('#local').attr('src', e.target.result);
              }
              reader.readAsDataURL(input.files[0]);
          }
      }
      $("#imgInp").change(function(){
          readURL(this);
      });

      //jquery로 json입력 방법
         function fngugun() {
        	 $("#gugun").removeAttr("disabled");
        	  var valsido = zip.sido.value;
        	   $.getJSON("/HarangProject/ajax?cmd=gugun",{sido:encodeURIComponent(valsido)},
                	    function(data){
        	    	   $("#gugun option").remove();
        	    	   $("#gugun").append("<option>구/군을 선택해 주세요</option>");
        	    	   $(data).each(function(index, glist){
            	    	   $("#gugun").append("<option value="+glist.gugun+">"+glist.gugun+"</option>");
					});
        	    });
          }

      // readonly 해제
         function fndong() {
             $("#dong").removeAttr("readonly");
             $("#dong").attr("placeholder", "동/면을 입력하세요");
		}

     //종합검색     
     function fnSearch() {
         
    	  var valsido = zip.sido.value;
          var valgugun = zip.gugun.value;
          var valdong = zip.dong.value;
          
          $.getJSON("/HarangProject/ajax?cmd=dong",
                  {sido:encodeURIComponent(valsido),gugun:encodeURIComponent(valgugun),dong:encodeURIComponent(valdong)},
                  function(data){
                 $("#total tr").remove();
                 $(data).each(function(index, zlist){

             	    var bunji = zlist.bunji;
                     
                	 if(zlist.bunji == undefined){
                    	 bunji = " ";
                	 }
                     $("#total").append(
                             "<tr id='"+zlist.zipcode
                             +"' style='cursor:pointer;'>"
                             +"<td>"+zlist.zipcode+"</td>"
                             +"<td>"+zlist.sido+"</td>"
                             +"<td>"+zlist.gugun+"</td>"
                             +"<td>"+zlist.dong+"</td>"
                             +"<td>"+bunji+"</td>"
                             +"</tr>");
                     $("#"+zlist.zipcode).click(function(){
                         input.m_addr1.value = zlist.zipcode;
                    	 input.m_addr2.value = zlist.sido+" "+zlist.gugun+" "+zlist.dong+" "+bunji;
                    	 $("#theModal").modal("toggle");
                     });
              });
          });
     }
    </script>
  </body>
</html>