<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../include/header.jsp" %>
<!-- 해더  삽입  [지우지마세여]------------------------------------------------------------------------------------------------->
<!-- 페이지 헤드 라인 : 브라우저 제목 -->
<head>
     <title>개인 정보 조회</title>
     <script type="text/javascript">
    window.onload =  function () {
        
        var usermail = "${member.m_mail}";
        var mailArray = usermail.split('@');
        input.m_mail1.value = mailArray[0];
        input.m_mail2.value = mailArray[1];

        var usertel = "${member.m_tel}";
        var telArray = usertel.split('-');
        input.m_tel1.value = telArray[0];
        input.m_tel2.value = telArray[1];
        input.m_tel3.value = telArray[2];
        
        var useraddr = "${member.m_addr}"
        var mailArray = useraddr.split('/');
        input.m_addr1.value = mailArray[0];
        input.m_addr2.value = mailArray[1];
        input.m_addr3.value = mailArray[2];
    }
    
    function mailcheck(){ 
         i = input.m_mail3.selectedIndex; // 선택항목의 인덱스 번호
         var mail= input.m_mail3.options[i].value; // 선택항목 value
         input.m_mail2.value = mail;
    }


    function checkform(){
        
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

     </script>
</head>
<!-- 메인 페이지 구역 , 즉 작업 구역 -->
      <div class="content-wrapper">
<!----------------------------------- 메인페이지 헤더 [작업 제목] ------------------------------------------------------------->
        <section class="content-header">
          <h1>
                개인 정보 조회
            <small>회원님의 개인 정보를 수정하세요</small>
          </h1>
          <ol class="breadcrumb">
          <!-- 페이지 기록 : 메인에서 부터 현재 페이지 까지의 경로 나열 -->
            <li><a href="#"><i class="fa fa-dashboard"></i> 메인</a></li>
            <li><a href="#"> 마이페이지</a></li>
            <li class="active">개인정보조회</li>
          </ol>
        </section>
<!------------------------------------ 메인페이지 바디 [작업 내용] ------------------------------------------------------------>
        <section class="content">
          <!-- 세로 길이 수정 -->
          <div class="row">
           <!-- 너비 사이즈 수정  : col-->
           <div class="col-md-9">
           
             <!-- Input addon -->
              <div class="box box-black">
                <div class="box-header">
                  <h3 class="box-title">개인 정보 수정</h3>
                </div>
                <!-- form 시작 -->
                <form role="form" action="/HarangProject/myPage?cmd=update" name="input" onsubmit="return checkform()" method="post" enctype="multipart/form-data">
                <div class="box-body">
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-picture-o"></i> 이미지</span>
	                <span class="input-group-addon">
	                   <input type="file" id="imgInp" name="upFile">
	                </span>
                    <span class="input-group-addon  bg-gray">
	                    <img src="${member.m_photo}" id="local" class="img-rounded" height="120" width="90" alt="User Image"/>
	                    <input type="hidden" name="m_photo" value="${member.m_photo}">
	                </span>
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-smile-o"></i> 이름</span>
                    <input type="text" name="m_name" class="form-control" value="${member.m_name}" readonly="readonly">
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-money"></i> 보유 포인트</span>
                    <input type="text" name="m_point" class="form-control" value="${member.m_point}" readonly="readonly">
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-sort-numeric-desc"></i> 학번</span>
                    <input type="text" name="m_id" class="form-control" value="${member.m_id}" readonly="readonly">
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-sitemap"></i> 학과</span>
                    <input type="text" name="m_dept" class="form-control" value="${member.m_dept}" readonly="readonly">
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-star"></i> 생년월일</span>
                    <input type="text" name="m_birth" class="form-control" value="${member.m_birth}" readonly="readonly">
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-envelope"></i> 이메일</span>
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
                  </div>
                  <br>
                    <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-location-arrow"></i> 종합 이메일</span>
                    <input type="text" name="m_mail" class="form-control" value="${member.m_mail}" readonly="readonly">
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-phone-square"></i> 연락처</span>
                    <select class="form-control" name="m_tel1" required="required">
                        <option></option>
                        <option value="010">010</option>
                        <option value="011">011</option>
                        <option value="012">012</option>
                        <option value="016">016</option>
                        <option value="017">017</option>
                    </select>
                    <span class="input-group-addon bg-gray"> - </span>
                    <input type="text" name="m_tel2"  class="form-control" required="required" onkeydown="return showKeyCode(event)">
                    <span class="input-group-addon bg-gray"> - </span>
                    <input type="text" name="m_tel3"  class="form-control" required="required" onkeydown="return showKeyCode(event)">
                  </div>
                  <br>
                    <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-location-arrow"></i> 종합 연락처</span>
                    <input type="text" name="m_tel" class="form-control" value="${member.m_tel}" readonly="readonly">
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-location-arrow"></i> 우편번호</span>
                    <input type="text" name="m_addr1" class="form-control"  required="required">
                    <span class="input-group-btn">
                      <button class="btn btn-warning btn-flat" type="button" id="btnPopup">우편 번호 검색</button>
                    </span>
                  </div>
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-location-arrow"></i> 우편번호 주소</span>
                    <input type="text" name="m_addr2" class="form-control" required="required">
                  </div>
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-location-arrow"></i> 상세 주소</span>
                    <input type="text" name="m_addr3" class="form-control" required="required">
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-location-arrow"></i>종합 주소</span>
                    <input type="text" name="m_addr" class="form-control" value="${member.m_addr}" readonly="readonly">
                  </div>
                  <br>
                </div><!-- /.box-body -->
                
                 <div class="box-footer" align="right">
                    <input type="button" class="btn" onclick="location.href=history.go(-1)" value="뒤로가기">
                    <input type="reset" class="btn" value="리셋">
                    <input type="submit" class="btn btn-primary" value="개인정보 수정">
                </div>
                </form>
                
              </div><!-- /.box -->
              
              <!-- 페이지 단위 -->
             </div><!-- /.col -->
           </div><!-- /.row -->
        </section><!-- /. 작업 공간 끝! -->
        
                <!-- 모달 : 뒷 페이지 배경을 눌러도 꺼지지 않음 -->
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
<!------------------------------------------------------------------------------------------------------------------->        
      </div>
<!-- 푸터(footer) 삽입 [지우지 마세여] ------------------------------------------------------------------------------------------------------> 
<%@ include file="../include/footer.jsp" %>
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
        //모달 접근 바로 하기
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


