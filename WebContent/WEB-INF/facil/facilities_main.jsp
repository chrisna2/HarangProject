<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/header.jsp"%>
<!-- 해더  삽입  [지우지마세여]------------------------------------------------------------------------------------------------->
<!-- 페이지 헤드 라인 : 제목 -->
<head>
<title>내 예약 내역(사용자 )</title>
<style>
.pagination {
	display: inline-block;
	padding-left: 0;
	margin: 0px 0;
	border-radius: 4px
}
</style>
<script type="text/javascript">
function dateFormCheck(){
	  /*날짜 비교 */
    var _reserdate = checkform.resertime.value.split("-");
    //alert(_reserdate);
    var year = _reserdate[0];
    var month = _reserdate[1];
    var day = _reserdate[2];
    var reserdate = new Date();
    reserdate.setFullYear(year, month - 1, day);
    var today = new Date();

    if(today.getTime()>reserdate.getTime()){
        alert("이미 예약일을 지난 시설예약은 환불이 불가합니다.");
        return false;
    }
    else{
        return true;
    }  

}
</script>
</head>
<!-- 메인 페이지 구역 , 즉 작업 구역 -->
<div class="content-wrapper">
	<!----------------------------------- 메인페이지 헤더 [작업 제목] ------------------------------------------------------------->
	<section class="content-header">
		<h1>시설 예약 관리</h1>
		<ol class="breadcrumb">
			<!-- 페이지 기록 : 메인에서 부터 현재 페이지 까지의 경로 나열 -->
			<li><a href="#"><i class="fa fa-dashboard"></i> 메인</a></li>
			<li class="active">시설 예약 내역</li>
		</ol>
	</section>
	<!------------------------------------ 메인페이지 바디 [작업 내용] ------------------------------------------------------------>

	<section class="content">
		
		<!-- 운동장 테이블 위치 -->
		<!-- 세로 길이 수정 -->
		<div class="row">
			<!-- 너비 사이즈 수정  : col-->
			<div class="col-md-12">
				<!-- 리스트 사용시  -->
				<div class="box">
					<div class="box-header">
						<h3 class="box-title">운동장 예약내역</h3>
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
									<th>예약 번호</th>
									<th>시설 종류</th>
									<th>시설명</th>
									<th>호수</th>
									<th>예약날짜</th>
									<th>예약 포인트</th>
									<th>선택</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${requestScope.pgmlist}" var="p" varStatus="i">
									<tr class="text-blue">
										<td>${p.pgm_num}</td>
										<td>운동장</td>
										<td>${p.pg_type}</td>
										<td>${p.pg_name}</td>
										<td>${p.pgm_date}</td>
										<td>${p.payoutpoint}</td>
										<td>
										<input type="button" class="btn btn-primary" value="선택" 
										onclick="pgSelectDelete('${p.pgm_num}','${p.pg_type}','${p.pg_name}','${p.pgm_date}','${p.payoutpoint}')" />
										</td>
										
									</tr>
								</c:forEach>


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
									<option>시설종류</option>
									<option>시설명</option>
									<option>호수</option>
									<option>예약시간</option>
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
		<!-- /.row -->

		<!-- 스터디룸 테이블 위치. -->
		<!-- 세로 길이 수정 -->
		<div class="row">
			<!-- 너비 사이즈 수정  : col-->
			<div class="col-md-12">
				<!-- 리스트 사용시  -->
				<div class="box">
					<div class="box-header">
						<h3 class="box-title">스터디룸 예약내역</h3>
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
									<th>예약 번호</th>
									<th>시설 종류</th>
									<th>시설명</th>
									<th>호수</th>
									<th>예약날짜</th>
									<th>예약 포인트</th>
									<th>선택</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${requestScope.srmlist}" var="s" varStatus="i">
									<tr class="text-blue">
										<td>${s.srm_num}</td>
										<td>스터디룸</td>
										<td>${s.sr_type}</td>
										<td>${s.sr_name}</td>
										<td>${s.srm_date}</td>
										<td>${s.payoutpoint}</td>
										<td>
										
										<input type="button" class="btn btn-primary" value="선택" 
										onclick="srSelectDelete('${s.srm_num}','${s.sr_type}','${s.sr_name}','${s.srm_date}','${s.payoutpoint}')" />
										</td>
									</tr>
								</c:forEach>


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
									<option>시설종류</option>
									<option>시설명</option>
									<option>호수</option>
									<option>예약시간</option>
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

		<!-- -------취소 시설 선택후 표기되는 정보------- -->
		<!-- 세로 길이 수정 -->
		<div class="row">
			<!-- 너비 사이즈 수정  : col-->
			<div class="col-md-12">
				<!-- box -->
				<div class="box box-warning" id="cancel" hidden="hidden">
					<!--  box-header -->
					<div class="box-header">
						<h3 class="box-title">취소 사항</h3>
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

					<!-- box-body -->
					<form role="form" method="post" name="checkform" action="/HarangProject/facil?cmd=FacilMain" onsubmit="return dateFormCheck()">
					<input type="hidden" id="deleteOk" name="deleteOk" value="1">
					<div class="box-body">
						
							<div class="row">

								<!-- text input -->
								<div class="form-group col-md-4">
									<label>예약번호</label> <input type="text" class="form-control"
										id="resernum" name="resernum" readonly="readonly">
								</div>

							</div>
							<div class="row">
								<div class="form-group col-md-4">
									<label>시설종류</label> 
									<input type="text" id="mfaciltype" name="mfaciltype" class="form-control" readonly="readonly" style="width: 200px">
								</div>
								<div class="form-group col-md-4">
									<label>시설명</label> 
									<input type="text" id="faciltype" name="faciltype" class="form-control" readonly="readonly" style="width: 200px">
								</div>
								<div class="form-group col-md-4">
									<label>호수</label> 
									<input type="text" id="facilname" name="facilname" class="form-control" readonly="readonly" style="width: 100px">
								</div>
							</div>

							<div class="row">
								<div class="form-group col-md-4">
									<label>예약시간</label> 
									<input type="text" id="resertime" name="resertime" class="form-control" readonly="readonly">
								</div>
								<div class="form-group col-md-4">
									<label>환불포인트</label> 
									<input type="text" id="backpoint" name="backpoint" class="form-control" readonly="readonly" >
								</div>
							</div>
						
						<!-- /.box-body -->
						<!-- box-footer -->
						<div class="box-footer">
												<div class="row" align="center">
							<div class="col-md-3 btn-group">
							</div>
							<div class="col-md-3 btn-group">
								<input type="button" class="btn btn-block btn-primary" value="예약취소" onclick="dateFormCheck()">
							</div>
							<div class="col-md-3 btn-group">
								<input type="button" class="btn btn-block  btn-primary" value="다시 선택" onclick="shutdown()">
							</div>
						</div>
						</div>
						
						<!-- /.box-footer -->
					</div>
					</form>
					<!-- /.box -->
				</div>
			</div>
		</div>



	</section>
	<!-- /. 작업 공간 끝! -->

	<!------------------------------------------------------------------------------------------------------------------->
</div>
<!-- /. 전체를 감싸주는 틀입니다. 지우지 마세여. -->

<!-- 푸터(footer) 삽입 [지우지 마세여] ------------------------------------------------------------------------------------------------------>
<%@ include file="../include/footer.jsp"%>
<script type="text/javascript">
	function srSelectDelete(srm_num, sr_type, sr_name, srm_date, payoutpoint){

		$("#cancel").slideUp();
		$("#cancel").slideDown();
		
		$("#mfaciltype").attr("value","스터디룸");
		$("#resernum").attr("value",srm_num);
		$("#faciltype").attr("value",sr_type);
		$("#facilname").attr("value",sr_name);
		$("#resertime").attr("value",srm_date);
		$("#backpoint").attr("value",payoutpoint);
	}
	
	function pgSelectDelete(pgm_num, pg_type, pg_name, pgm_date, payoutpoint){

		$("#cancel").slideUp();
		$("#cancel").slideDown();
		
		$("#mfaciltype").attr("value","운동장");
		$("#resernum").attr("value",pgm_num);
		$("#faciltype").attr("value",pg_type);
		$("#facilname").attr("value",pg_name);
		$("#resertime").attr("value",pgm_date);
		$("#backpoint").attr("value",payoutpoint);
	}
	function shutdown(){
		$("#cancel").slideUp();
		}
</script>

