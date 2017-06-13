<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/header.jsp"%>
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
             	나의 페이지
            <small>나의 중고도서 거래 내역을 알 수 있습니다.</small>
          </h1>
          <ol class="breadcrumb">
          <!-- 페이지 기록 : 메인에서 부터 현재 페이지 까지의 경로 나열 -->
            <li><a href="#"><i class="fa fa-dashboard"></i> 메인</a></li>
            <li class="active">하랑딘24</li>
            <li class="active">마이페이지</li>
          </ol>
        </section>
<!------------------------------------ 메인페이지 바디 [작업 내용] ------------------------------------------------------------>
<section class="content">
	<div class="row">
		<div class="col-md-10">
			<!-- 내가 구매신청한 내역 -->
			<div class="box box-danger">
                <div class="box-header with-border">
                  <h3 class="box-title">구매 신청</h3>
                  <small>내가 중고도서 구매 신청한 내역입니다.</small>
                  <!-- <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                    <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                  </div> -->
                </div><!-- /.box-header -->
                <div class="box-body">
                  <table id="example1" class="table table-bordered table-striped dataTable">
							<tbody><tr>
								<th style="width: 10px">No</th>
								<th style="width: 50%">도서명</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>포인트내역</th>
							</tr>
							<tr>
								<td>1</td>
								<td>정보처리기사 실기(산업기사 포함)</td>
								<td>나대박</td>
								<td>2017-05-29</td>
								<td>-3000</td>
							</tr>
                  </tbody></table>
                  <br>
                  
            <!-- 나의 도서 구매신청 -->
            <div class="box box-warning">
                <div class="box-header with-border">
                  <h3 class="box-title">나의 도서 구매 신청</h3>
                  <small>나의 중고도서를 구매 신청한 회원 목록입니다.</small>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <table id="example1" class="table table-bordered table-striped">
							<tbody><tr>
								<th style="width: 10px">No</th>
								<th style="width: 50%">도서명</th>
								<th>지원자 학번</th>
								<th>신청일</th>
								<th>지원 포인트</th>
								<th></th>
							</tr>
							<tr>
								<td>1</td>
								<td>지윤이의 하루</td>
								<td>20137214</td>
								<td>2017-06-08</td>
								<td>500</td>
								<td><input type="checkbox" name="check"></td>
							</tr>
					</tbody></table>
					<br>
					
			<!-- 나의 도서 기부 내역 -->
            <div class="box box-success">
                <div class="box-header with-border">
                  <h3 class="box-title">기부 내역</h3>
                  <small>나의 도서 기부 내역입니다. 기부 현 상태를 알 수 있습니다.</small>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <table id="example1" class="table table-bordered table-striped">
						<tbody>
							<tr>
								<th style="width: 10px">No</th>
								<th style="width: 50%">도서명</th>
								<th>지은이</th>
								<th>출판사</th>
								<th>신청일</th>
								<th>기부 상태</th>
							</tr>
							<tr>
								<td>1</td>
								<td>자존감 수업</td>
								<td>윤홍균</td>
								<td>심플라이프</td>
								<td>2017-06-13</td>
								<td>기부완료</td>
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
				</div><!-- /.box -->
              </div><!-- /.box -->  
			
           
        </div><!-- /.col -->
	</div>
</section><!-- /. 작업 공간 끝! -->
<!------------------------------------------------------------------------------------------------------------------->
</div><!-- /. 전체를 감싸주는 틀입니다. 지우지 마세여. -->

<!-- 푸터(footer) 삽입 [지우지 마세여] ------------------------------------------------------------------------------------------------------>
<%@ include file="../include/footer.jsp"%>

<!-- --------------------------------------------------------------------------------------------------- -->

 
