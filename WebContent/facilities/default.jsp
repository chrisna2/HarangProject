<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/header.jsp"%>
<!-- 해더  삽입  [지우지마세여]------------------------------------------------------------------------------------------------->
<!-- 페이지 헤드 라인 : 제목 -->
<head>
<title>기본 값 페이지</title>
<style>
.pagination {
	display: inline-block;
	padding-left: 0;
	margin: 0px 0;
	border-radius: 4px
}
</style>
</head>
<!-- 메인 페이지 구역 , 즉 작업 구역 -->
<div class="content-wrapper">
	<!----------------------------------- 메인페이지 헤더 [작업 제목] ------------------------------------------------------------->
	<section class="content-header">
		<h1>
			시설 예약 내역 <small>시설 예약 내역입니다.</small>
		</h1>
		<ol class="breadcrumb">
			<!-- 페이지 기록 : 메인에서 부터 현재 페이지 까지의 경로 나열 -->
			<li><a href="#"><i class="fa fa-dashboard"></i> 메인</a></li>
			<li class="active">시설 예약 내역</li>
		</ol>
	</section>
	<!------------------------------------ 메인페이지 바디 [작업 내용] ------------------------------------------------------------>
	<section class="content">
		<!-- 세로 길이 수정 -->
		<div class="row">
			<!-- 너비 사이즈 수정  : col-->
			<div class="col-md-12">
				<div class="box">
					<div class="box-header">
						<h3 class="box-title">예약 내역</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<table class="table table-bordered table-hover">
							<thead>
								<tr>
									<th>예약번호</th>
									<th>시설</th>
									<th>호수</th>
									<th>예약날짜</th>
									<th>예약시간</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>운동장</td>
									<td>대운동장</td>
									<td>2017.5.30</td>
									<td>6-9시</td>
								</tr>
								<tr>
									<td>2</td>
									<td>운동장</td>
									<td>농구장</td>
									<td>2017.6.2</td>
									<td>2-4시</td>
								</tr>
								<tr>
									<td>3</td>
									<td>스터디룸</td>
									<td>A</td>
									<td>2017.6.5</td>
									<td>10-12시</td>
								</tr>
								<tr>
									<td>4</td>
									<td>스터디룸</td>
									<td>B</td>
									<td>2017.6.10</td>
									<td>6-9시</td>
								</tr>
								<tr>
									<td>5</td>
									<td>스터디룸</td>
									<td>C</td>
									<td>2017.5.30</td>
									<td>6-9시</td>
								</tr>
							</tbody>

						</table>
						<div class="row" style="padding: 15px"></div>
						<div class="row">
							<div class="col-md-1"></div>
							<div class="col-md-3">
								<div class="form-group">
									<select class="form-control">
										<option>option 1</option>
										<option>option 2</option>
										<option>option 3</option>
										<option>option 4</option>
										<option>option 5</option>
									</select>
								</div>
							</div>
							<div class="col-md-4">
								<div class="box-tools">
									<div class="input-group input-group-sm" >
										<input type="text" name="table_search" class="form-control"
											placeholder="Search">

										<div class="input-group-btn">
											<button type="submit" class="btn btn-default">
												<i class="fa fa-search"></i>
											</button>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-4">
								<ul class="pagination pagination-sm">
									<li><a href="#">&laquo;</a></li>
									<li><a href="#">1</a></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">&raquo;</a></li>
								</ul>
							</div>
						</div>
						<div class="row">
						<div class="col-md-4">
						</div>
						
						<div class="col-md-4">
						<button type="button" class="btn btn-block btn-info btn-flat">예약 취소</button>
						</div>
						</div>
						<!-- /.box-body -->


						<!-- 
					<div style="border: 3px solid gold;
								float: left; height: auto;
								width: 200px; 
								margin: 15px 25px 15px 0px;">
					 -->



					</div>
					<!-- /.box -->


				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
	</section>
	<!-- /. 작업 공간 끝! -->
	<!------------------------------------------------------------------------------------------------------------------->
</div>
<!-- /. 전체를 감싸주는 틀입니다. 지우지 마세여. -->

<!-- 푸터(footer) 삽입 [지우지 마세여] ------------------------------------------------------------------------------------------------------>
<%@ include file="../include/footer.jsp"%>