<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/header.jsp"%>
<!-- 해더  삽입  [지우지마세여]------------------------------------------------------------------------------------------------->
<!-- 페이지 헤드 라인 : 제목 -->
<head>
<title>운동장(관리자)</title>
<style>
hr {
	border: none;
	border: 1px solid #E6E6E6;
}
</style>
</head>
<!-- 메인 페이지 구역 , 즉 작업 구역 -->
<div class="content-wrapper">
	<!----------------------------------- 메인페이지 헤더 [작업 제목] ------------------------------------------------------------->
	<section class="content-header">
		<h1>
			운동장 관리
			<!--  <small>[페이지 소개]</small> -->
		</h1>
		<ol class="breadcrumb">
			<!-- 페이지 기록 : 메인에서 부터 현재 페이지 까지의 경로 나열 -->
			<li><a href="#"><i class="fa fa-dashboard"></i> 메인</a></li>
			<li class="active">운동장 관리</li>
		</ol>
	</section>
	<!------------------------------------ 메인페이지 바디 [작업 내용] ------------------------------------------------------------>
	<section class="content">

		<!-- 첫번째 단시작 [ 1. 전체 예약 내역 ]-->
		<div class="row">
			<div class="col-md-12">
				<!-- 상단 1.전체예약 내역 테이블 box -->
				<div class="box box-primary">
					<!-- 1  상단 테이블 box-header -->
					<div class="box-header">
						<h3 class="box-title">전체 예약 내역</h3>
						<div class="box-tools pull-right">
							<button class="btn btn-box-tool" data-widget="collapse">
								<i class="fa fa-minus"></i>
							</button>
						</div>
					</div>
					<!-- 1 상단 테이블 box-body -->
					<div class="box-body">
						<!-- 테이블  -->
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>예약 번호</th>
									<th>시설 종류</th>
									<th>시설명</th>
									<th>호수</th>
									<th>예약날짜</th>
									<th>행사내용</th>
									<th>일정취소</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>l00001</td>
									<td>운동장</td>
									<td>농구장</td>
									<td>중앙회관옆</td>
									<td>2017년 5월 25일</td>
									<th>공과대학 통합 농구대회</th>
									<td><input type="button" class="btn btn-primary"
										value="선택"></td>
								</tr>
								<tr>
									<td>l00001</td>
									<td>운동장</td>
									<td>농구장</td>
									<td>중앙회관옆</td>
									<td>2017년 5월 25일</td>
									<th>공과대학 통합 농구대회</th>
									<td><input type="button" class="btn btn-primary"
										value="선택"></td>
								</tr>
							</tbody>
						</table>
						<!-- /.테이블 -->
					</div>
					<!-- 1 상단 테이블 box-footer -->
					<div class="box-footer">
						<!-- 테이블.버튼 -->
						<!-- 페이징 -->
						<div class="row" align="center">
							<ul class="pagination pagination-sm no-margin">
								<li><a href="#">&laquo;</a></li>
								<li><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">5</a></li>
								<li><a href="#">&raquo;</a></li>
							</ul>
						</div>

						<!-- 셀렉트  -->
						<form action="">
							<div class="row">
								<div class="col-md-3" align="center">
									<select class="form-control input-sm pull-left"
										style="width: 150px;">
										<option>예약번호</option>
										<option>시설 종류</option>
										<option>시설명</option>
										<option>호수</option>
										<option>예약날짜</option>
										<option>행사내용</option>
									</select>
								</div>
								<div class="col-md-3" align="center">
									<input type="text" name="table_search"
										class="form-control input-sm  pull-left" style="width: 150px;"
										placeholder="Search" />
									<div class="input-group-btn  pull-left">
										<button class="btn btn-sm btn-primary">
											검색 <i class="fa fa-search"></i>
										</button>
									</div>
								</div>
							</div>
						</form>
						<!-- /.테이블.버튼 -->
					</div>
				</div>
				<!-- /.1 box -->
			</div>
		</div>

		<!-- 두번째 단시작 [ 2. 일정 취소  확인 ] -->
		<div class="row">
			<div class="col-md-12">
				<!-- 2. 일정취소 확인 -->
				<div class="box box-primary">
					<!-- 2.box header-->
					<div class="box-header">
						<h3 class="box-title">일정 취소 확인</h3>
						<div class="box-tools pull-right">
							<button class="btn btn-box-tool" data-widget="collapse">
								<i class="fa fa-minus"></i>
							</button>
						</div>

					</div>

					<!-- 2.box body-->
					<div class="box-body">
						<!-- 2. 1단 -->
						<div class="row ">
							<!-- 일정번호  -->
							<div class="col-md-3">
								<label>예약번호</label> <input type="text" class="form-control"
									placeholder="A71201" style="width: 100px" disabled>
							</div>
							<!-- 시설종류  -->
							<div class="col-md-3">
								<label>시설종류</label> <input type="text" class="form-control"
									placeholder="운동장" style="width: 100px" disabled>
							</div>
							<!-- 시설명  -->
							<div class="col-md-3">
								<label>시설명</label> <input type="text" class="form-control"
									placeholder="농구장" style="width: 100px" disabled>
							</div>

							<!-- 호수  -->
							<div class="col-md-3">
								<label>호수</label> <input type="text" class="form-control"
									placeholder="광과대학 옆" style="width: 120px" disabled>
							</div>
						</div>

						<br> <br>
						<!-- 2. 2단 -->
						<div class="row">

							<!-- 시설종류  -->
							<div class="col-md-3">
								<label>날짜</label> <input type="text" class="form-control"
									placeholder="2017.5.12" style="width: 200px" disabled>
							</div>

							<div class="col-md-9">
								<label>행사내용</label> <input type="text" class="form-control"
									placeholder="...." style="width: 450px" disabled>
							</div>
						</div>
					</div>


					<!-- 2.box footer-->
					<div class="box-footer">
						<div class="row" align="center">
							<div class="col-md-3 btn-group"></div>
							<div class="col-md-3 btn-group">
								<input type="button" class="btn btn-block btn-primary"
									value="삭제">
							</div>
							<div class="col-md-3 btn-group">
								<input type="button" class="btn btn-block  btn-primary"
									value="다시 선택">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 세번째 단시작 [ 3. 학사일정 / 예약수정 ] 
			[Left : 3-1.학사일정List / right : 3-2.시설 학사 일정 추가]-->
		<div class="row">
			<!-- 3-1.학사일정  행 넓이 설정---->
			<div class="col-md-6">
				<!-- 3-1.학사일정 List / box-->
				<div class="box box-primary">
					<!-- 3-1. box-header -->
					<div class="box-header">
						<h3 class="box-title">학사일정</h3>
						<div class="box-tools pull-right">
							<button class="btn btn-box-tool" data-widget="collapse">
								<i class="fa fa-minus"></i>
							</button>
						</div>
					</div>
					<!-- 3-1. box-body -->
					<div class="box-body">
						<!-- 3-1. 시작 -->
						<!--첫줄 날짜 선택 -->
						<!-- 날짜 선택 제목 -->
						<div class="row">
							<div class="col-md-12" align="left">
								<h4>날짜 선택</h4>
							</div>
						</div>
						<div class="row">

							<!-- 월 선택 -->
							<div class="form-group col-md-4">
								<label>월 선택</label> <select class="form-control">
									<option>5</option>
									<option>6</option>
								</select>
							</div>

							<!-- 일 선택 -->
							<div class="form-group col-md-4">
								<label>일 선택</label> <select class="form-control">
									<option>1</option>
									<option>2</option>
									<option>3</option>
									<option>4</option>
								</select>
							</div>

							<br>
							<div class="col-md-4">
								<input type="button" class="btn btn-block btn-primary"
									value="검색">
							</div>

						</div>

						<!--검색 결과 테이블 / 기본은 전체 행사 출력 -->
						<hr />
						<div class="row">
							<div class="col-md-12" align="left">
								<h4>일정 확인</h4>
							</div>
						</div>

						<div class="row">
							<div class="col-md-12">
								<!-- 검색 결과 테이블 -->
								<table class="table table-bordered table-striped">
									<thead>
										<tr>
											<th>행사날짜</th>
											<th>행사명</th>
											<th>시설명</th>
											<th>호수</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>2017.6.13</td>
											<td>축제 1일차</td>
											<td>농구장</td>
											<td>중앙회관옆</td>
										</tr>
										<tr>
											<td>2017.6.13</td>
											<td>축제 1일차</td>
											<td>농구장</td>
											<td>중앙회관옆</td>
										</tr>
										<tr>
											<td>2017.6.13</td>
											<td>축제 1일차</td>
											<td>농구장</td>
											<td>중앙회관옆</td>
										</tr>
									</tbody>
								</table>

							</div>
						</div>
						<!-- 3-1. 종료  -->
					</div>
					<!-- 3-1. box-footer -->
					<div class="box-footer"></div>
				</div>
				<!-- /. 3-1 box -->
			</div>

			<!-- 3-2.시설 학사 일정 추가  행 넓이 설정---->
			<div class="col-md-6">
				<!-- 3-2.시설 학사 일정 추가 List / box -->
				<div class="box box-primary">
					<!-- 3-2. box-header -->
					<div class="box-header">
						<h3 class="box-title">시설 학사 일정 추가</h3>
						<div class="box-tools pull-right">
							<button class="btn btn-box-tool" data-widget="collapse">
								<i class="fa fa-minus"></i>
							</button>
						</div>
					</div>
					<!-- 3-2. box-body -->
					<div class="box-body">
						<!--  3-2. 선택날짜/시설종류 -->
						<div class="row">
							<div class="col-md-4">
								<label>날짜</label> <input type="text" class="form-control"
									placeholder="2017년 5월 16일" disabled>
							</div>
							<div class="col-md-4">
								<label>시설종류</label> <input type="text" class="form-control"
									placeholder="운동장" disabled>
							</div>
						</div>
<<<<<<< HEAD
					</div>
					<!-- 3-2. box-footer -->
					<div class="box-footer">
=======
						<br>
						<div class="row">
							<div class="form-group col-md-4">
								<label>시설명</label> <select class="form-control">
									<option>농구장</option>
									<option>족구장</option>
									<option>테니스장</option>
								</select>
							</div>
							<div class="form-group col-md-4">
								<label>호수</label> <select class="form-control">
									<option>공과대학 옆</option>
									<option>조형예술대학 옆</option>
									<option>중앙회관 옆</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<label>행사 내용</label> <input type="text" class="form-control"
									placeholder="축제 1일차" >
							</div>
						</div>
					</div>
					<!-- 3-2. box-footer -->
					<div class="box-footer">
						<div class="row">
							<div class="col-md-3 btn-group"></div>
							<div class="col-md-3 btn-group">
								<input type="button" class="btn btn-block btn-primary"
									value="추가">
							</div>
							<div class="col-md-3 btn-group">
								<input type="button" class="btn btn-block  btn-primary"
									value="다시 선택">
							</div>
						</div>
>>>>>>> refs/remotes/origin/KimSungji
					</div>
				</div>
				<!-- /. 3-2 box -->
			</div>
		</div>

	</section>
	<!------------------------------------------------------------------------------------------------------------------->
</div>
<!-- /. 전체를 감싸주는 틀입니다. 지우지 마세여. -->

<!-- 푸터(footer) 삽입 [지우지 마세여] ------------------------------------------------------------------------------------------------------>
<%@ include file="../include/footer.jsp"%>