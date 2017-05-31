<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../include/header.jsp" %>
<!-- 해더  삽입  [지우지마세여]------------------------------------------------------------------------------------------------->
<!-- 페이지 헤드 라인 : 브라우저 제목 -->
<head>
     <title>개인 정보 조회</title>
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
           <div class="col-md-10">
           
             <!-- Input addon -->
              <div class="box box-black">
                <div class="box-header">
                  <h3 class="box-title">개인 정보 수정</h3>
                </div>
                
                <!-- form 시작 -->
                <form role="form">
                
                <div class="box-body">
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-picture-o"></i> 이미지</span>
	                <span class="input-group-addon">
	                   <input type="file" id="exampleInputFile" required="required">
	                </span>
                    <span class="input-group-addon  bg-gray">
	                    <img src="../dist/img/TL.jpg" class="img-circle" height="90" width="90" alt="User Image"/>
	                </span>
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-smile-o"></i> 이름</span>
                    <input type="text" name="m_name" class="form-control" value="나현기" readonly="readonly">
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-money"></i> 보유 포인트</span>
                    <input type="text" name="m_point" class="form-control" value="999999" readonly="readonly">
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-sort-numeric-desc"></i> 학번</span>
                    <input type="text" name="m_num" class="form-control" value="201701008" readonly="readonly">
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-sitemap"></i> 학과</span>
                    <input type="text" name="m_dept" class="form-control" value="국어국문학과" readonly="readonly">
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-star"></i> 생년월일</span>
                    <input type="text" name="m_birth" class="form-control" value="1991-03-21" readonly="readonly">
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-envelope"></i> 이메일</span>
                    <input type="text" name="m_email" class="form-control" value="chrisna2" required="required">
                    <span class="input-group-addon bg-gray"> @ </span>
                    <input type="text" name="m_email" class="form-control" value="hanmail.net" required="required">
                    <span class="input-group-addon bg-gray"> 선택 </span>
                    <select class="form-control" required="required">
                        <option>google.com</option>
                        <option>hanmail.net</option>
                        <option>naver.com</option>
                        <option>nate.om</option>
                        <option>gmail.com</option>
                    </select>
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-phone-square"></i> 연락처</span>
                    <select class="form-control" required="required">
                        <option>010</option>
                        <option>011</option>
                        <option>012</option>
                        <option>016</option>
                        <option>017</option>
                    </select>
                    <span class="input-group-addon bg-gray"> - </span>
                    <input type="text" name="m_tel" class="form-control" value="4375" required="required">
                    <span class="input-group-addon bg-gray"> - </span>
                    <input type="text" name="m_tel" class="form-control" value="2772" required="required">
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-location-arrow"></i> 우편번호</span>
                    <input type="text" name="m_addr1" class="form-control" value="194-763" required="required">
                    <span class="input-group-btn">
                      <button class="btn btn-warning btn-flat" type="button">우편 번호 검색</button>
                    </span>
                  </div>
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-location-arrow"></i> 우편번호 주소</span>
                    <input type="text" name="m_addr1" class="form-control" value="서울시 동작구 사당동" required="required">
                  </div>
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-location-arrow"></i> 상세 주소</span>
                    <input type="text" name="m_addr1" class="form-control" value="돌돌이 아파트 102동  905호" required="required">
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
              
              <!-- 페이지 단위 -->
             </div><!-- /.col -->
           </div><!-- /.row -->
        </section><!-- /. 작업 공간 끝! -->
<!------------------------------------------------------------------------------------------------------------------->        
      </div>
<!-- 푸터(footer) 삽입 [지우지 마세여] ------------------------------------------------------------------------------------------------------> 
<%@ include file="../include/footer.jsp" %>
