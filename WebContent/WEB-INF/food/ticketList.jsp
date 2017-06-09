<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../include/header.jsp" %>
<!-- 해더  삽입  [지우지마세여]------------------------------------------------------------------------------------------------->
<!-- 페이지 헤드 라인 : 제목 -->
<head>
     <title>식권 구매 내역</title>
</head>
	  <!-- 메인 페이지 구역 , 즉 작업 구역 -->
      <div class="content-wrapper">
<!----------------------------------- 메인페이지 헤더 [작업 제목] ------------------------------------------------------------->
      <section class="content-header">
          <h1>
                         식권 구매 내역
            <small>당신이 구매한 식권의 흔적</small>
          </h1>
          <ol class="breadcrumb">
          <!-- 페이지 기록 : 메인에서 부터 현재 페이지 까지의 경로 나열 -->
            <li><a href="#"><i class="fa fa-dashboard"></i> 메인</a></li>
            <li><a href="#"> 하랑 레스토랑</a></li>
            <li class="active"> 식권 구매 내역</li>
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
                  <h3 class="box-title">식권 구매 조회</h3>
                   <div class="box-tools">
                    <form action="">
                     <div class="input-group">
                       <input type="text" name="table_search" class="form-control input-sm pull-right" style="width: 150px;" placeholder="Search"/>
	                      <select class="form-control input-sm pull-right" style="width: 150px;">
	                        <option>구매 날짜</option>
	                        <option>메뉴 판매일</option>
	                        <option>메뉴</option>
	                        <option>구매 포인트</option>
	                        <option>사용 여부</option>
	                      </select>
	                      <div class="input-group-btn">
                        <button class="btn btn-sm btn-default"><i class="fa fa-search"></i></button>
                      </div>
                    </div>
                    </form>
                  </div>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <table class="table table-bordered table-striped">
                    <thead>
                      <tr>
                        <th>식권 구매일</th>
                        <th>메뉴 판매일</th>
                        <th>메뉴</th>
                        <th>구매 포인트</th>
                        <th>사용 여부</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr class="text-blue">
                        <td>2017-06-05</td>
                        <td>2017-06-09</td>
                        <td>철판 볶음</td>
                        <td>6000p</td>
                        <td>미사용</td>
                      </tr>
                      <tr class="text-red">
                        <td>2017-06-05</td>
                        <td>2017-06-08</td>
                        <td>김치찌게</td>
                        <td>6000p</td>
                        <td>환불처리</td>
                      </tr>
                      <tr class="text-blue">
                        <td>2017-06-05</td>
                        <td>2017-06-07</td>
                        <td>청라면</td>
                        <td>6000p</td>
                        <td>미사용</td>
                      </tr>
                      <tr class="text-blue">
                        <td>2017-06-05</td>
                        <td>2017-06-06</td>
                        <td>유린기</td>
                        <td>5000p</td>
                        <td>미사용</td>
                      </tr>
                      <tr class="text-black">
                        <td>2017-06-05</td>
                        <td>2017-06-05</td>
                        <td>청라면</td>
                        <td>6000p</td>
                        <td>사용</td>
                      </tr>
                  </table>
                </div><!-- /.box-body -->
                 <div class="box-footer clearfix">
                  <ul class="pagination pagination-sm no-margin pull-right">
                    <li><a href="#">&laquo;</a></li>
                    <li><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li><a href="#">&raquo;</a></li>
                  </ul>
                </div>
              </div><!-- /.box -->
              </div><!-- /.col -->
           </div><!-- /.row -->
        </section><!-- /. 작업 공간 끝! -->
<!------------------------------------------------------------------------------------------------------------------->        
      </div><!-- /. 전체를 감싸주는 틀입니다. 지우지 마세여. -->
      
<!-- 푸터(footer) 삽입 [지우지 마세여] ------------------------------------------------------------------------------------------------------> 
<%@ include file="../include/footer.jsp" %>
