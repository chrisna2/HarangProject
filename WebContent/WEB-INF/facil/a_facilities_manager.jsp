<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/a_header.jsp"%>
<!-- 해더  삽입  [지우지마세여]------------------------------------------------------------------------------------------------->
<!-- 페이지 헤드 라인 : 제목 -->
<head>
<title>사용 예약 취소 추가(관리자)</title>
<script>
	//스크롤 이동 JQuery
	function fnMove(){
		var offset = $("#confirm72").offset();
		$('html, body').animate({scrollTop : offset.top}, 1200)
	}

</script>
</head>
<!-- 메인 페이지 구역 , 즉 작업 구역 -->
<div class="content-wrapper">
	<!----------------------------------- 메인페이지 헤더 [작업 제목] ------------------------------------------------------------->
	<section class="content-header">
		<h1>
			사용 예약 취소 [관리자] <small>[페이지 소개]</small>
		</h1>
		<ol class="breadcrumb">
			<!-- 페이지 기록 : 메인에서 부터 현재 페이지 까지의 경로 나열 -->
			<li><a href="#"><i class="fa fa-dashboard"></i> 메인</a></li>
			<li class="active">기본값 페이지[현재 페이지]</li>
		</ol>
	</section>
	<!------------------------------------ 메인페이지 바디 [작업 내용] ------------------------------------------------------------>
	<section class="content">
		<!-- 세로 길이 수정 -->
		<div class="row">
			<!-- 너비 사이즈 수정  : col-->
			<div class="col-md-12">
				<!-- 리스트 사용시  -->
				<div class="box box-primary">
					<div class="box-header">
						<h3 class="box-title">운동장 예약내역</h3>
						<div class="box-tools pull-right">
							<button class="btn btn-box-tool" data-widget="collapse">
								<i class="fa fa-minus"></i>
							</button>
						</div>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
					
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>예약 번호</th>
									<th>예약한 날짜</th>
									<th>학번[ID]</th>
									<th>시설 종류</th>
									<th>시설명</th>
									<th>호수</th>
									<th>예약날짜</th>
									<th>예약시간</th>
									<th>선택</th>
								</tr>
							</thead>
							<tbody>
							 	<c:forEach items="${requestScope.pglist}" var="p" varStatus="i">
									<tr class="text-blue">
										<td>${p.pgm_num}</td>
										<td>${p.pgm_regdate}</td>
										<td>${p.m_id}</td>
										<td>운동장</td>
										<td>${p.pg_type}</td>
										<td>${p.pg_name}</td>
										<td>${p.pgm_date}</td>
										<td>${p.pgm_timecode}</td>
										<td>
										<!-- /HarangProject/facil?cmd=AFacilManager -->
										<input type="button" class="btn btn-primary" value="선택"
										onclick="selectDel('pg','${p.pgm_num}','${p.m_id}','${p.pg_type}','${p.pg_name}','${p.pgm_date}','${p.pgm_timecode}','${p.pg_point}')" />
										
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

						<!-- 검색문 / 셀렉트  -->
						<form action="/HarangProject/facil?cmd=AFacilManager" name="search" method="post">
							<div class="row">
								
								<div class="col-md-3" align="center">
									<select 
										class="form-control input-sm pull-left"
										style="width: 150px"
										name="keyword">
										<option value="pgm_num" 
										<c:choose>
											<c:when test="${requestScope.keyword eq 'pgm_num'}">
											selected="selected"
											</c:when>
										</c:choose>>예약번호</option>
										
										<option value="pgm_regdate" 
										<c:choose>
											<c:when test="${requestScope.keyword eq 'pgm_regdate'}">
											selected="selected"
											</c:when>
										</c:choose>>예약한 날짜</option>	
										
										<option value="m_id" 
										<c:choose>
											<c:when test="${requestScope.keyword eq 'm_id'}">
											selected="selected"
											</c:when>
										</c:choose>>학번[ID]</option>
										
										<!-- 이중 셀렉문 pgm_type인지 체크-->
										<option value="p.pg_type" 
										<c:choose>
											<c:when test="${requestScope.keyword eq 'p.pg_type'}">
											selected="selected"
											</c:when>
										</c:choose>>시설명</option>
										
										<!-- 이중 셀렉문 pgm_name인지 체크-->
										<option value="p.pg_name" 
										<c:choose>
											<c:when test="${requestScope.keyword eq 'p.pg_name'}">
											selected="selected"
											</c:when>
										</c:choose>>호수</option>
										
										<option value="pgm_date" 
										<c:choose>
											<c:when test="${requestScope.keyword eq 'pgm_date'}">
											selected="selected"
											</c:when>
										</c:choose>>예약날짜</option>
										
									</select>
								</div>
								
								<div class="col-md-3" align="center">
									<input type="text" 
										   name="keyfield"
										   class="form-control input-sm  pull-left" 
										   style="width: 150px;"
										   placeholder="Search" />
									<div class="input-group-btn  pull-left">
										<button
											type="submit" 
											class="btn btn-sm btn-primary">
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
		
		<div class="row">
			<!-- 너비 사이즈 수정  : col-->
			<div class="col-md-12">
				<!-- 리스트 사용시  -->
				<div class="box box-primary">
					<div class="box-header">
						<h3 class="box-title">스터디룸 예약내역</h3>
						<div class="box-tools pull-right">
							<button class="btn btn-box-tool" data-widget="collapse">
								<i class="fa fa-minus"></i>
							</button>
						</div>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
					
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>예약 번호</th>
									<th>예약한 날짜</th>
									<th>학번[ID]</th>
									<th>시설 종류</th>
									<th>시설명</th>
									<th>호수</th>
									<th>예약날짜</th>
									<th>예약시간</th>
									<th>선택</th>
								</tr>
							</thead>
							<tbody>
							 	<c:forEach items="${requestScope.srlist}" var="p" varStatus="i">
									<tr class="text-blue">
										<td>${p.srm_num}</td>
										<td>${p.srm_regdate}</td>
										<td>${p.m_id}</td>
										<td>스터디룸</td>
										<td>${p.sr_type}</td>
										<td>${p.sr_name}</td>
										<td>${p.srm_date}</td>
										<td>${p.srm_timecode}</td>
										<td>
										<!-- /HarangProject/facil?cmd=AFacilManager -->
										<input type="button" class="btn btn-primary" value="선택"
										onclick="selectDel('sr','${p.srm_num}','${p.m_id}','${p.sr_type}','${p.sr_name}','${p.srm_date}','${p.srm_timecode}','${p.sr_point}')" />
										
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

						<!-- 검색문 / 셀렉트  -->
						<form action="/HarangProject/facil?cmd=AFacilManager" name="search" method="post">
							<div class="row">
								
								<div class="col-md-3" align="center">
									<select 
										class="form-control input-sm pull-left"
										style="width: 150px"
										name="keyword">
										<option value="pgm_num" 
										<c:choose>
											<c:when test="${requestScope.keyword eq 'pgm_num'}">
											selected="selected"
											</c:when>
										</c:choose>>예약번호</option>
										
										<option value="pgm_regdate" 
										<c:choose>
											<c:when test="${requestScope.keyword eq 'pgm_regdate'}">
											selected="selected"
											</c:when>
										</c:choose>>예약한 날짜</option>	
										
										<option value="m_id" 
										<c:choose>
											<c:when test="${requestScope.keyword eq 'm_id'}">
											selected="selected"
											</c:when>
										</c:choose>>학번[ID]</option>
										
										<!-- 이중 셀렉문 pgm_type인지 체크-->
										<option value="p.pg_type" 
										<c:choose>
											<c:when test="${requestScope.keyword eq 'p.pg_type'}">
											selected="selected"
											</c:when>
										</c:choose>>시설명</option>
										
										<!-- 이중 셀렉문 pgm_name인지 체크-->
										<option value="p.pg_name" 
										<c:choose>
											<c:when test="${requestScope.keyword eq 'p.pg_name'}">
											selected="selected"
											</c:when>
										</c:choose>>호수</option>
										
										<option value="pgm_date" 
										<c:choose>
											<c:when test="${requestScope.keyword eq 'pgm_date'}">
											selected="selected"
											</c:when>
										</c:choose>>예약날짜</option>
										
									</select>
								</div>
								
								<div class="col-md-3" align="center">
									<input type="text" 
										   name="keyfield"
										   class="form-control input-sm  pull-left" 
										   style="width: 150px;"
										   placeholder="Search" />
									<div class="input-group-btn  pull-left">
										<button
											type="submit" 
											class="btn btn-sm btn-primary">
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

		<!-- -------취소 시설 선택후 표기되는 정보------- -->
		<!-- 세로 길이 수정 -->
		<div class="row" id="confirm72">
			<!-- 너비 사이즈 수정  : col-->
			<div class="col-md-12">
				<!-- box -->
				<div class="box box-warning">
					<!--  box-header -->
					<div class="box-header">
						<h3 class="box-title">사용자 예약 상세 내역</h3>
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
					<form method="POST" action="/HarangProject/facil?cmd=AFacilManager">
					<div class="box-body">
					
							<div class="row" >

								<!-- text input -->
								<div class="form-group col-md-4">
									<label>예약번호</label> <input type="text" class="form-control"
									readonly="readonly" id="facil_num" name="facil_num">
								</div>
								<div class="form-group col-md-4">
									<label>학번[ID]</label> <input type="text" class="form-control"
									readonly="readonly" id="m_id" name="m_id">
								</div>
								<div class="form-group col-md-4">
									<label>예약 날짜</label> <input type="text" class="form-control"
									readonly="readonly" id="facilm_date" name="facilm_date">
								</div>

							</div>
							<div class="row">
								<div class="form-group col-md-4">
									<label>시설종류</label> <input type="text" class="form-control"
										style="width: 200px" readonly="readonly" id="pors" name="pors">
								</div>
								<div class="form-group col-md-4">
									<label>시설명</label> <input type="text" class="form-control"
										style="width: 200px" readonly="readonly" id="facil_type" name="facil_type">
								</div>
								<div class="form-group col-md-4">
									<label>호수</label> <input type="text" class="form-control"
										style="width: 100px" readonly="readonly" id="facil_name" name="facil_name">
								</div>
							</div>

							<div class="row">
								<div class="form-group col-md-4">
									<label>예약시간</label> <input type="text" class="form-control"
										readonly="readonly" id="resertime" name="resertime">
								</div>
								<div class="form-group col-md-4">
									<label>환불포인트</label> <input type="text" class="form-control"
										readonly="readonly" id="backpoint" name="backpoint">
								</div>
							</div>

							<div class="row">
								<div class="col-md-6">
									<label>예약 취소 사유</label> <input type="text" class="form-control"
										placeholder="취소사유를 입력하세요" id="cancelMsg" name="cancelMsg">
								</div>
							</div>
						
						<!-- /.box-body -->
						<!-- box-footer -->
						<div class="box-footer">
							<div class="row" align="center">
								<div class="col-md-3 btn-group"></div>
									
										<div class="col-md-3 btn-group">
											<input type="hidden" id="deleteOk" name="deleteOk">
											<input type="submit" class="btn btn-block btn-primary"
												value="예약취소">
										</div>
									
								<div class="col-md-3 btn-group">
									<input type="reset" class="btn btn-block  btn-primary"
										value="다시 선택">
								</div>
							</div>

						</div>
						<!-- /.box-footer -->
					</div>
					<!-- /.box -->
					</form>
					
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
function selectDel(pors, facil_num, m_id, facil_type, facil_name, facilm_date, facilm_timecode, facil_point){
	if("pg" == pors){
		$("#pors").attr("value", "운동장");
	}

	else if("sr" == pors){
		$("#pors").attr("value", "스터디룸");
	}

	// 타임코드를 통해서 예약한 '시간' 계산
	var c = transcode(facilm_timecode);
	
	// 타임코드를 통해서 예약한 '시간'* 포인트. = 사용시간.
	alert(facil_point);
	point = facil_point*c;	
	
		$("#facil_num").attr("value", facil_num);
		$("#deleteOk").attr("value", facil_num);
					   
		$("#m_id").attr("value", m_id);
		
		$("#facil_type").attr("value", facil_type);
		$("#facil_name").attr("value", facil_name);
		$("#facilm_date").attr("value", facilm_date);
		$("#deleteOK").attr("value", facil_num);
		$("#backpoint").attr("value", point);
		$("#resertime").attr("value", c + "시간동안 사용");
		
		
		
	}
		
function transcode(timecode){
	 cnt = 0;
	 list = timecode.split('');
	 for(i=0;i < list.length;i++){
		 if(list[i] == "1"){
		 cnt++;
		 }
	}
	return cnt;
}	

</script>