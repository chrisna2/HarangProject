<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../include/a_header.jsp" %>
<!-- 해더  삽입  [지우지마세여]------------------------------------------------------------------------------------------------->
<!-- 페이지 헤드 라인 : 제목 -->
<head>
     <title>회원 관리</title>
</head>
	  <!-- 메인 페이지 구역 , 즉 작업 구역 -->
      <div class="content-wrapper">
<!----------------------------------- 메인페이지 헤더 [작업 제목] ------------------------------------------------------------->
        <section class="content-header">
          <h1>
             	회원 관리
          </h1>
          <br>
          <button class="btn btn-sm btn-primary col-md-9">신입생/편입생 등록</button>
          <br>
          <br>
          <ol class="breadcrumb">
          <!-- 페이지 기록 : 메인에서 부터 현재 페이지 까지의 경로 나열 -->
            <li><a href="#"><i class="fa fa-dashboard"></i> 관리자 메인</a></li>
            <li><a href="#"> 사이트 관리</a></li>
            <li class="active"> 회원 관리</li>
          </ol>
        </section>
<!------------------------------------ 메인페이지 바디 [작업 내용] ------------------------------------------------------------>
        <section class="content">
          <!-- 세로 길이 수정 -->
          <div class="row">
           <!-- 너비 사이즈 수정  : col-->
           <div class="col-md-9">
           
           <!-- 리스트 사용시  -->
            <div class="box">
                <div class="box-header">
                  <h3 class="box-title">회원 목록</h3>
                   <div class="box-tools">
                    <div class="input-group">
                      <input type="text" name="table_search" class="form-control input-sm pull-right" style="width: 150px;" placeholder="Search"/>
                      <select class="form-control input-sm pull-right" style="width: 150px;">
                        <option>학번 / 관리자 번호</option>
                        <option>이름</option>
                        <option>학과</option>
                        <option>포인트</option>
                      </select>
                      <div class="input-group-btn">
                        <button class="btn btn-sm btn-default"><i class="fa fa-search"></i></button>
                      </div>
                    </div>
                  </div>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <table class="table table-bordered table-striped">
                    <thead>
                      <tr>
                        <th>학번 / 관리자 번호</th>
                        <th>이름</th>
                        <th>학과</th>
                        <th>학년</th>
                        <th>보유 포인트</th>
                        <th>회원 등록 날짜</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>201602001</td>
                        <td>박중훈</td>
                        <td>정보통신학과</td>
                        <td>2학년</td>
                        <td>200000p</td>
                        <td>2016-04-01</td>
                      </tr>
                      <tr>
                        <td>201602002</td>
                        <td>박희정</td>
                        <td>정보통신학과</td>
                        <td>2학년</td>
                        <td>300000p</td>
                        <td>2016-04-01</td>
                      </tr>
                      <tr>
                        <td>201602003</td>
                        <td>박보람</td>
                        <td>정보통신학과</td>
                        <td>2학년</td>
                        <td>200000p</td>
                        <td>2016-04-01</td>
                      </tr>
                    </tbody>
                  </table>
                </div><!-- /.box-body -->
                 <div class="box-footer clearfix">
                  <ul class="pagination pagination-sm no-margin pull-right">
                    <li><a href="#">&laquo;</a></li>
                    <li><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">&raquo;</a></li>
                  </ul>
                </div>
              </div><!-- /.box -->
              
                <!-- Input addon -->
              <div class="box box-black">
                <div class="box-header">
                  <h3 class="box-title">개인 정보 수정</h3>
                  <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                    <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                  </div>
                </div>
                
                <!-- form 시작 -->
                <div class="box-body">
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-picture-o"></i>이미지</span>
                    <span class="input-group-addon  bg-gray">
                        <img src="../dist/img/TL.jpg" class="img-rounded" height="90" width="90" alt="User Image"/>
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
                  <!-- 폼 태그 따로 줌 -->
                  <form name="m_num">
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-sort-numeric-desc"></i> 학번</span>
                    <input type="text" name="m_num" class="form-control" value="201701008" required="required">
                    <span class="input-group-btn">
                      <button class="btn btn-success btn-flat" type="button">학번 수정</button>
                    </span>
                  </div>
                  </form>
                  <br>
                  <!-- 폼 태그 따로 줌 -->
                  <form name="m_dept">
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-sitemap"></i> 학과</span>
                    <input type="text" name="m_dept" class="form-control" value="국어국문학과" required="required">
                    <span class="input-group-btn">
                      <button class="btn btn-success btn-flat" type="button">학과 수정</button>
                    </span>
                  </div>
                  </form>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-star"></i> 생년월일</span>
                    <input type="text" name="m_birth" class="form-control" value="1991-03-21" readonly="readonly">
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-envelope"></i> 이메일</span>
                    <input type="text" name="m_email" class="form-control" value="chrisna2" readonly="readonly">
                    <span class="input-group-addon bg-gray"> @ </span>
                    <input type="text" name="m_email" class="form-control" value="hanmail.net" readonly="readonly">
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-phone-square"></i> 연락처</span>
                    <select class="form-control" readonly="readonly">
                        <option>010</option>
                        <option>011</option>
                        <option>012</option>
                        <option>016</option>
                        <option>017</option>
                    </select>
                    <span class="input-group-addon bg-gray"> - </span>
                    <input type="text" name="m_tel" class="form-control" value="4375" readonly="readonly">
                    <span class="input-group-addon bg-gray"> - </span>
                    <input type="text" name="m_tel" class="form-control" value="2772" readonly="readonly">
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-location-arrow"></i> 우편번호</span>
                    <input type="text" name="m_addr1" class="form-control" value="194-763" readonly="readonly">
                  </div>
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-location-arrow"></i> 우편번호 주소</span>
                    <input type="text" name="m_addr1" class="form-control" value="서울시 동작구 사당동" readonly="readonly">
                  </div>
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-location-arrow"></i> 상세 주소</span>
                    <input type="text" name="m_addr1" class="form-control" value="돌돌이 아파트 102동  905호" readonly="readonly">
                  </div>
                  <br>
                </div><!-- /.box-body -->
                
                 <div class="box-footer" align="right">
                    <input type="button" class="btn" value="닫기">
                    <input type="submit" class="btn btn-danger" value="강퇴">
                </div>
                
              </div><!-- /.box -->
              
              </div><!-- /.col -->
           </div><!-- /.row -->
        </section><!-- /. 작업 공간 끝! -->
<!------------------------------------------------------------------------------------------------------------------->        
      </div><!-- /. 전체를 감싸주는 틀입니다. 지우지 마세여. -->
      
<!-- 푸터(footer) 삽입 [지우지 마세여] ------------------------------------------------------------------------------------------------------> 
<%@ include file="../include/footer.jsp" %>