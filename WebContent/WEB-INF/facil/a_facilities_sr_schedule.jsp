<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/a_header.jsp"%>
<!-- 해더  삽입  [지우지마세여]------------------------------------------------------------------------------------------------->
<!-- 페이지 헤드 라인 : 제목 -->
<head>
<title>스터디룸(관리자)</title>
<style>
</style>
</head>
<!-- 메인 페이지 구역 , 즉 작업 구역 -->
<div class="content-wrapper">
	<!----------------------------------- 메인페이지 헤더 [작업 제목] ------------------------------------------------------------->
	<section class="content-header">
		<h1>
			스터디룸 관리
			<!--  <small>[페이지 소개]</small> -->
		</h1>
		<ol class="breadcrumb">
			<!-- 페이지 기록 : 메인에서 부터 현재 페이지 까지의 경로 나열 -->
			<li><a href="#"><i class="fa fa-dashboard"></i> 메인</a></li>
			<li class="active">스터디룸 관리</li>
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

								<c:forEach items="${requestScope.srlist}" var="s" varStatus="i">
									<tr class="text-blue">
										<td>${s.srm_num}</td>
										<td>스터디룸</td>
										<td>${s.sr_type}</td>
										<td>${s.sr_name}</td>
										<td>${s.srm_date}</td>
										<td>${s.srm_issue}</td>
										<td>
											<!-- /HarangProject/facil?cmd=AFacilManager --> <input
											type="button" class="btn btn-primary" value="일정취소"
											onclick="selectDel('${s.srm_num}','${s.sr_type}','${s.sr_name}','${s.srm_date}','${s.srm_issue}')" />

										</td>
									</tr>
								</c:forEach>




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
				<form method="POST" action="/HarangProject/facil?cmd=AFacilSR">
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
										style="width: 150px" id="srm_num" name="srm_num"
										readonly="readonly">
								</div>
								<!-- 시설종류  -->
								<div class="col-md-3">
									<label>시설종류</label> <input type="text" class="form-control"
										style="width: 100px" value="스터디룸" readonly="readonly">
								</div>
								<!-- 시설명  -->
								<div class="col-md-3">
									<label>시설명</label> <input type="text" class="form-control"
										style="width: 100px" id="sr_type" name="sr_type"
										readonly="readonly">
								</div>

								<!-- 호수  -->
								<div class="col-md-3">
									<label>호수</label> <input type="text" class="form-control"
										style="width: 120px" id="sr_name" name="sr_name"
										readonly="readonly">
								</div>
							</div>

							<br> <br>
							<!-- 2. 2단 -->
							<div class="row">

								<!-- 시설종류  -->
								<div class="col-md-3">
									<label>날짜</label> <input type="text" class="form-control"
										style="width: 200px" id="srm_date" name="srm_date"
										readonly="readonly">
								</div>

								<div class="col-md-9">
									<label>행사내용</label> <input type="text" class="form-control"
										style="width: 450px" id="srm_issue" name="srm_issue"
										readonly="readonly">
								</div>
							</div>
						</div>


						<!-- 2.box footer-->
						<div class="box-footer">
							<div class="row" align="center">
								<div class="col-md-3 btn-group"></div>
								<div class="col-md-3 btn-group">
									<input type="hidden" id="delete" name="delete"> <input
										type="submit" class="btn btn-block btn-primary" value="삭제">
								</div>
								<div class="col-md-3 btn-group">
									<input type="button" class="btn btn-block  btn-primary"
										value="다시 선택">
								</div>
							</div>
						</div>
					</div>

				</form>
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
											<th>시작날짜</th>
											<th>종료날짜</th>
											<th>행사명</th>
											<th>장소</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${requestScope.sclist}" var="s"
											varStatus="i">
											<tr class="text-blue">
												<td>${s.s_dstart}</td>
												<td>${s.s_dend}</td>
												<td>${s.s_title}</td>
												<td>${s.s_location}</td>
											</tr>
										</c:forEach>
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
				<form method="POST" action="/HarangProject/facil?cmd=AFacilSR">
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
							<div class="col-md-6 form-group">
								<label>날짜선택</label>
								<div class="input-group">
									<div class="input-group-addon">
										<i class="fa fa-calendar"></i>
									</div>
									<input type="text" class="form-control pull-right"
										name="addsrm_date" required="required" id="datepicker" />
								</div>
								<!-- /.input group -->
							</div>
							<div class="col-md-6 form-group">
								<label>시설종류</label> <input type="text" class="form-control"
									value="스터디룸" readonly="readonly">
							</div>
						</div>
						<br>
						<div class="row">
							<div class="form-group col-md-4">
								<label>시설명</label> <select class="form-control" id="addsr_type" onchange="selectfacil()" >
									<option>시설 종류를 선택하세요</option>
									<c:forEach items="${ajaxlist}" var="s">
											<option value="${s.sr_type}">${s.sr_type}</option>
									</c:forEach>
								</select>
							</div>
							<div class="form-group col-md-4">
								<label>호수</label> <select class="form-control" id="addsr_name" name="addsr_name" onchange="select02()">
									<option>시설 이름을 선택하세요.</option>
								</select>
							</div>
							<div class="form-group col-md-4">
								<label>시설 번호</label> <input type="text" class="form-control" id="addsr_num" name="addsr_num"
								readonly="readonly">
							</div>
							
						</div>
						<div class="row">
							<div class="form-group col-md-12">
								<label>행사 내용</label> <input type="text" class="form-control" id="addsrm_issue" name="addsrm_issue"
								required="required" />
							</div>
						</div>

					</div>
					<!-- 3-2. box-footer -->
					<div class="box-footer">
						<div class="row">
							<div class="col-md-3 btn-group"></div>
							<div class="col-md-3 btn-group">
								<input type="hidden" id="check" name="check" value="faciladd">
								<input type="submit" class="btn btn-block btn-primary"
									value="추가">
							</div>
							<div class="col-md-3 btn-group">
								<input type="button" class="btn btn-block  btn-primary"
									value="다시 선택">
							</div>
						</div>

					</div>
				</div>
				<!-- /. 3-2 box -->
				</form>
			</div>
		</div>

	</section>
	<!------------------------------------------------------------------------------------------------------------------->
</div>
<!-- /. 전체를 감싸주는 틀입니다. 지우지 마세여. -->

<!-- 푸터(footer) 삽입 [지우지 마세여] ------------------------------------------------------------------------------------------------------>
<%@ include file="../include/footer.jsp"%>
<script src="plugins/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>
<script>
	$('#datepicker').datepicker({
		format : 'yyyy-mm-dd',
		autoclose : true
	});
</script>

<Script type="text/javascript">
	function selectDel(srm_num, sr_type, sr_name, srm_date, srm_issue) {
		$("#srm_num").attr("value", srm_num);
		$("#sr_type").attr("value", sr_type);
		$("#sr_name").attr("value", sr_name);
		$("#srm_date").attr("value", srm_date);
		$("#srm_issue").attr("value", srm_issue);
		$("#delete").attr("value", "1");
	}
	
	//시설 선택을 셀렉트 생성. pg_type을 바탕으로 pg_name의 list를 출력한다.
	function selectfacil() {

		var wsr_type = document.getElementById('addsr_type').value;
		
		$.getJSON("/HarangProject/ajax?cmd=selectSr", {
			sr_type : encodeURIComponent(wsr_type)
		}, function(data) {
			$("#addsr_name option").remove();
			$("#addsr_name").append("<option>호수를 입력하세요.</option>");
			$(data).each(
					function(index, srlist) {
						$("#addsr_name").append(
								"<option value='"+srlist.sr_name+"'>"
										+ srlist.sr_name + "</option>");
					});
		});
	}
	
	function select02() {
		var varsr_type = document.getElementById('addsr_type').value;
		var varsr_name = document.getElementById('addsr_name').value;


		$.getJSON("/HarangProject/ajax?cmd=selectSr",
						{
							sr_type : encodeURIComponent(varsr_type),
							sr_name : encodeURIComponent(varsr_name),
							check : 1
						},
						function(data) {
							$("#addsr_num").attr("value"," ");
							$(data)
									.each(
											function(index, srlist) {
												$("#addsr_num").attr("value",
														srlist.sr_num);
											});
						});
	}
</Script>

