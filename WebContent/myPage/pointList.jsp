<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../include/header.jsp" %>
<!-- 해더  삽입  [지우지마세여]------------------------------------------------------------------------------------------------->
<!-- 페이지 헤드 라인 : 제목 -->
<head>
     <title>기본 값 페이지</title>
</head>
	  <!-- 메인 페이지 구역 , 즉 작업 구역 -->
      <div class="content-wrapper">
<!----------------------------------- 메인페이지 헤더 [작업 제목] ------------------------------------------------------------->
      <section class="content-header">
          <h1>
                         포인트 거래 내역
            <small>당신이 사용한 포인트의 흔적</small>
          </h1>
          <ol class="breadcrumb">
          <!-- 페이지 기록 : 메인에서 부터 현재 페이지 까지의 경로 나열 -->
            <li><a href="#"><i class="fa fa-dashboard"></i> 메인</a></li>
            <li><a href="#"> 마이페이지</a></li>
            <li class="active"> 포인트 거래 내역</li>
          </ol>
        </section>
<!------------------------------------ 메인페이지 바디 [작업 내용] ------------------------------------------------------------>
        <section class="content">
          <!-- 세로 길이 수정 -->
          <div class="row">
           <!-- 너비 사이즈 수정  : col-->
           <div class="col-md-12">
        
            <!-- 리스트 사용시  -->
             <div class="box">
                <div class="box-header">
                  <h3 class="box-title">포인트 거래 내역 조회</h3>
                   <div class="box-tools">
                    <form action="">
                     <div class="input-group">
                       <input type="text" name="table_search" class="form-control input-sm pull-right" style="width: 150px;" placeholder="Search"/>
	                      <select class="form-control input-sm pull-right" style="width: 150px;">
	                        <option>거래 날짜</option>
	                        <option>거래 내용</option>
	                        <option>포인트</option>
	                        <option>출금 대상</option>
	                        <option>입금 대상</option>
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
                        <th>거래 날짜</th>
                        <th>거래 내용</th>
                        <th>포인트</th>
                        <th>출금 대상</th>
                        <th>입금 대상</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr class="text-red">
                        <td>2017-07-21</td>
                        <td>식권 구매</td>
                        <td>5000 포인트 출금</td>
                        <td>나현기</td>
                        <td>학교 식당 관리자</td>
                      </tr>
                      <tr class="text-green">
                        <td>2017-06-15</td>
                        <td>스펙업[정보처리기사]</td>
                        <td>600000 포인트 입금</td>
                        <td>학교 포인트 관리자</td>
                        <td>나현기</td>
                      </tr>
                      <tr class="text-red">
                        <td>2017-06-12</td>
                        <td>학자금 포인트 감면</td>
                        <td>400000 포인트 감면 </td>
                        <td>나현기</td>
                        <td>학교 포인트 관리자</td>
                      </tr>
                      <tr class="text-green">
                        <td>2017-05-15</td>
                        <td>교내 경시 대회 우승</td>
                        <td>1000000 포인트 입금</td>
                        <td>학교 포인트 관리자</td>
                        <td>나현기</td>
                      </tr>
                    </tbody>
                    <tfoot>
                       <tr>
                        <th>거래 날짜</th>
                        <th>거래 내용</th>
                        <th>포인트</th>
                        <th>출금 대상</th>
                        <th>입금 대상</th>
                      </tr>
                    </tfoot>
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
