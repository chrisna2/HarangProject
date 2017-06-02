<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/header.jsp"%>
<!-- 해더  삽입  [지우지마세여]------------------------------------------------------------------------------------------------->
<!-- 페이지 헤드 라인 : 제목 -->
<head>
<title>시설 추가(관리자)</title>
	<style>
		hr{border:none; 
		   border:1px solid #E6E6E6;}
	</style>
</head>
<!-- 메인 페이지 구역 , 즉 작업 구역 -->
<div class="content-wrapper">
	<!----------------------------------- 메인페이지 헤더 [작업 제목] ------------------------------------------------------------->
	<section class="content-header">
		<h1>
			시설 추가/삭제 [관리자] <small>[페이지 소개]</small>
		</h1>
		<ol class="breadcrumb">
			<!-- 페이지 기록 : 메인에서 부터 현재 페이지 까지의 경로 나열 -->
			<li><a href="#"><i class="fa fa-dashboard"></i> 메인</a></li>
			<li class="active">기본값 페이지[현재 페이지]</li>
		</ol>
	</section>
	<!------------------------------------ 메인페이지 바디 [작업 내용] ------------------------------------------------------------>
	<section class="content">
		<!-- 시설목록 테이블 시작 -->
		<div class="row">
			<!-- 너비 사이즈 수정  : col-->
			<div class="col-md-12">
				<!-- 리스트 사용시  -->
				<div class="box box-primary">
					<div class="box-header box-frimary">
						<h3 class="box-title">시설물</h3>
						<div class="box-tools pull-right">
							<button class="btn btn-box-tool" data-widget="collapse">
								<i class="fa fa-minus"></i>
							</button>
							<button class="btn btn-box-tool" data-widget="remove">
								<i class="fa fa-times"></i>
							</button>
						</div>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>시설 번호</th>
									<th>시설 종류</th>
									<th>시설명</th>
									<th>호수</th>
									<th>선택</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>l00001</td>
									<td>운동장</td>
									<td>농구장</td>
									<td>중앙회관옆</td>
									<td><input type="button" class="btn btn-primary"
										value="선택"></td>
								</tr>
								<tr>
									<td>l00002</td>
									<td>운동장</td>
									<td>농구장</td>
									<td>중앙회관옆</td>
									<td><input type="button" class="btn btn-primary"
										value="선택"></td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- /.box-body -->


					<div class="box-footer">
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
										<option>시설번호</option>
										<option>시설종류</option>
										<option>시설명</option>
										<option>호수</option>
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

					</div>
				</div>
				<!-- /.box -->
			</div>
			<!-- /.col -->
		</div>
		<!-- 시설 목록 테이블 끝 -->

		<!-- 시설확인 시작 -->
		<div class="row">
			<div class="col-md-12">
				<!-- Box -->
				<div class="box box-primary">
					<!-- Box header -->
					<div class="box-header">
						<h3 class="box-title">삭제 확인</h3>
						<small>[확인하세요.]</small>
						<div class="box-tools pull-right">
							<button class="btn btn-box-tool" data-widget="collapse">
								<i class="fa fa-minus"></i>
							</button>
						</div>
					</div>

					<!-- Box body -->
					<div class="box-body">
						<!-- 사용자 편의를 위한.. 운동장 표시 -->
						<div class="row">
							<div class="col-md-4">
								<label>시설종류</label> <input type="text" class="form-control"
									placeholder="운동장" disabled>
							</div>

							<!-- 시설명(첫번째 카테고리) 선택 -->
							<div class="col-md-4">
								<label>시설명</label> <input type="text" class="form-control"
									placeholder="족구장" disabled>
							</div>

							<!-- 호수(두번째 카테고리) 선택 -->
							<div class="col-md-4">
								<label>호수</label> <input type="text" class="form-control"
									placeholder="예술조형대학 옆" disabled>
							</div>
						</div>
					</div>

					<!-- Box footer -->
					<div class="box-footer">
						<div class="row" align="center">
							<div class="col-md-3 btn-group"></div>
							<div class="col-md-3 btn-group">
								<input type="button" class="btn btn-block btn-primary"
									value="삭제">
							</div>
							<div class="col-md-3 btn-group">
								<input type="button" class="btn btn-block btn-primary"
									value="다시 선택">
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
		<!-- 시설확인 끝 -->

		<!-- 시설추가 시작 -->
		<div class="row">
			<div class="col-md-12">
				<!-- Box -->
				<div class="box box-primary">
					<!-- Box header -->
					<div class="box-header">
						<h3 class="box-title">시설 추가</h3>
						<div class="box-tools pull-right">
							<button class="btn btn-box-tool" data-widget="collapse">
								<i class="fa fa-minus"></i>
							</button>
						</div>
					</div>

					<!-- Box body -->
					<div class="box-body">

						<!-- 운동장/스터디룸 선택 -->

						<div class="row">
							<div class="form-group col-md-4">
								<label>시설종류</label> <select class="form-control">
									<option>운동장</option>
									<option>스터디룸</option>
								</select>
							</div>

							<!-- 시설명 입력 -->
							<div class="col-md-4">
								<label>시설명</label> <input type="text" class="form-control"
									placeholder="시설명을 입력하세요">
							</div>

							<!-- 호수 입력 -->
							<div class="col-md-4">
								<label>시설명</label> <input type="text" class="form-control"
									placeholder="시설명을 입력하세요">
							</div>
						</div>
					</div>

					<!-- Box footer -->
					<div class="box-footer">
						<div class="row" align="center">
							<div class="col-md-3 btn-group"></div>
							<div class="col-md-3 btn-group">
								<input type="button" class="btn btn-block btn-primary"
									value="추가">
							</div>
							<div class="col-md-3 btn-group">
								<input type="button" class="btn btn-block btn-primary"
									value="리셋">
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
		<!-- 시설추가 끝-->

		<!-- 시설수정 시작-->
		<div class="row">
			<div class="col-md-12">
				<!-- Box -->
				<div class="box box-primary">
					<!-- Box header -->
					<div class="box-header">
						<h3 class="box-title">시설 수정</h3>
						<div class="box-tools pull-right">
							<button class="btn btn-box-tool" data-widget="collapse">
								<i class="fa fa-minus"></i>
							</button>
						</div>
					</div>

					<!-- Box body -->
					<div class="box-body">

						<!-- 운동장/스터디룸 선택 -->
						<div class="row">
							<div class="col-md-2">
								<label>번호</label> <input type="text" class="form-control"
									placeholder="F0001" disabled>
							</div>
							<div class="col-md-2">
								<label>시설종류</label> <input type="text" class="form-control"
									placeholder="운동장" disabled>
							</div>

							<!-- 시설명(첫번째 카테고리) 선택 -->
							<div class="col-md-4">
								<label>시설명</label> <input type="text" class="form-control"
									placeholder="족구장" disabled>
							</div>

							<!-- 호수(두번째 카테고리) 선택 -->
							<div class="col-md-4">
								<label>호수</label> <input type="text" class="form-control"
									placeholder="예술조형대학 옆" disabled>
							</div>
							<br>
							<div class="col-md-12">
							
							<hr/>
							</div>
						</div>
						

						<div class="row">
							<div class="form-group col-md-4">
								<label>시설종류</label> <select class="form-control">
									<option>운동장</option>
									<option>스터디룸</option>
								</select>
							</div>

							<!-- 시설명 입력 -->
							<div class="col-md-4">
								<label>시설명</label> <input type="text" class="form-control"
									placeholder="수정할 내용을 입력하세요">
							</div>

							<!-- 호수 입력 -->
							<div class="col-md-4">
								<label>호수</label> <input type="text" class="form-control"
									placeholder="수정할 내용을 입력하세요">
							</div>
						</div>

						
					</div>

					<!-- Box footer -->
					<div class="box-footer">
						<div class="row" align="center">
							<div class="col-md-3 btn-group"></div>
							<div class="col-md-3 btn-group">
								<input type="button" class="btn btn-block btn-primary"
									value="수정">
							</div>
							<div class="col-md-3 btn-group">
								<input type="button" class="btn btn-block btn-primary"
									value="리셋">
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
		<!-- 시설수정 끝-->

	</section>
	<!-- /. 작업 공간 끝! -->
	<!------------------------------------------------------------------------------------------------------------------->
</div>
<!-- /. 전체를 감싸주는 틀입니다. 지우지 마세여. -->

<!-- 푸터(footer) 삽입 [지우지 마세여] ------------------------------------------------------------------------------------------------------>
<%@ include file="../include/footer.jsp"%>