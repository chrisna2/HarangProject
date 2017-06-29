<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/a_header.jsp"%>
<!-- 해더  삽입  [지우지마세여]------------------------------------------------------------------------------------------------->
<!-- 페이지 헤드 라인 : 제목 -->
<head>
<title>시설 메인(관리자)</title>
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
		<!-- 시설목록 운동장 테이블 시작 -->
		<div class="row">
			<!-- 너비 사이즈 수정  : col-->
			<div class="col-md-12">
				<!-- 리스트 사용시  -->
				<div class="box box-primary" id="boxplayground">
					<div class="box-header box-frimary">
						<h3 class="box-title">시설물 운동장 목록</h3>
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
									<th>시설 번호</th>
									<th>시설 종류</th>
									<th>시설명</th>
									<th>호수</th>
									<th>설명</th>
									<th>삭제</th>
									<th>수정</th>
								</tr>
							</thead>
							<tbody>
							 	<c:forEach items="${requestScope.pglist}" var="p" varStatus="i">
									<tr class="text-blue">
										<td>${p.pg_num}</td>
										<td>운동장</td>
										<td>${p.pg_type}</td>
										<td>${p.pg_name}</td>
										<td>${p.pg_content}</td>
										<td>
										<form method="post" onclick="confirmData('pg','${p.pg_num}','${p.pg_type}','${p.pg_name}')">
											<input type="button" class="btn btn-primary" value="삭제">
										</form>
										</td>
										<td>
										<form method="post" onclick="modifityDate('pg','${p.pg_num}','${p.pg_type}','${p.pg_name}')">
											<input type="button" class="btn btn-primary" value="수정">
										</form>
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

						<form action="/HarangProject/facil?cmd=AFacilAddDel" name="search" method="post">
							<div class="row">
								<div class="col-md-3" align="center">
									<select 
										class="form-control input-sm pull-left"
										style="width: 150px"
										name="keyword">
										<option value="pg_num" 
										<c:choose>
											<c:when test="${requestScope.keyword eq 'pg_num'}">
											selected="selected"
											</c:when>
										</c:choose>>시설 번호</option>
										
										<option value="m_id" 
										<c:choose>
											<c:when test="${requestScope.keyword eq 'm_id'}">
											selected="selected"
											</c:when>
										</c:choose>>시설명</option>
										
										<!-- 이중 셀렉문 pgm_type인지 체크-->
										<option value="pg_type" 
										<c:choose>
											<c:when test="${requestScope.keyword eq 'pg_type'}">
											selected="selected"
											</c:when>
										</c:choose>>호수</option>
										
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
		<!-- 시설 운동장 목록 테이블 끝 -->
		
		<!-- 시설 스터디룸 목록 테이블 시작 -->
		<div class="row">
			<!-- 너비 사이즈 수정  : col-->
			<div class="col-md-12">
				<!-- 리스트 사용시  -->
				<div class="box box-primary" id="boxstudy">
					<div class="box-header box-frimary">
						<h3 class="box-title">시설물 스터디룸 목록</h3>
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
									<th>시설 번호</th>
									<th>시설 종류</th>
									<th>시설명</th>
									<th>호수</th>
									<th>설명</th>
									<th>삭제</th>
									<th>수정</th>
								</tr>
							</thead>
							<tbody>
							 	<c:forEach items="${requestScope.srlist}" var="p" varStatus="i">
									<tr class="text-blue">
										<td>${p.sr_num}</td>
										<td>스터디룸</td>
										<td>${p.sr_type}</td>
										<td>${p.sr_name}</td>
										<td>${p.sr_content}</td>
										<td>
										<form method="post" onclick="confirmData('sr','${p.sr_num}','${p.sr_type}','${p.sr_name}')">
											<input type="button" class="btn btn-primary" value="삭제">
										</form>
										</td>
										<td>
										<form method="post" onclick="modifityDate('sr','${p.sr_num}','${p.sr_type}','${p.sr_name}')">
											<input type="button" class="btn btn-primary" value="수정">
										</form>
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

						<form action="/HarangProject/facil?cmd=AFacilAddDel" name="search" method="post">
							<div class="row">
								<div class="col-md-3" align="center">
									<select 
										class="form-control input-sm pull-left"
										style="width: 150px"
										name="keyword">
										<option value="pg_num" 
										<c:choose>
											<c:when test="${requestScope.keyword eq 'pg_num'}">
											selected="selected"
											</c:when>
										</c:choose>>시설 번호</option>
										
										<option value="m_id" 
										<c:choose>
											<c:when test="${requestScope.keyword eq 'm_id'}">
											selected="selected"
											</c:when>
										</c:choose>>시설명</option>
										
										<!-- 이중 셀렉문 pgm_type인지 체크-->
										<option value="pg_type" 
										<c:choose>
											<c:when test="${requestScope.keyword eq 'pg_type'}">
											selected="selected"
											</c:when>
										</c:choose>>호수</option>
										
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
		<!-- 시설 스터디룸 목록 테이블 끝 -->

		<!-- 시설확인 시작 -->
		<div class="row">
			<div class="col-md-12">
				<!-- Box -->
				<div class="box box-primary" id="confirmcheck" hidden="hidden">
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
								<label>시설 번호</label> <input type="text" class="form-control"
									readonly="readonly" id="del_num" name="del_num">
							</div>

							<!-- 시설명(첫번째 카테고리) 선택 -->
							<div class="col-md-4">
								<label>시설명</label> <input type="text" class="form-control"
									readonly="readonly" id="del_type" name="del_type">
							</div>

							<!-- 호수(두번째 카테고리) 선택 -->
							<div class="col-md-4">
								<label>호수</label> <input type="text" class="form-control"
									readonly="readonly" id="del_name" name="del_name">
							</div>
						</div>
					</div>

					<!-- Box footer -->
					<div class="box-footer">
						<form method="POST" action="/HarangProject/facil?cmd=AFacilAddDel"> 
						<div class="row" align="center">
							<div class="col-md-3 btn-group"></div>
							<div class="col-md-3 btn-group">
								<input type="hidden" id="delete" name="delete" value="1">
								<input type="hidden" id="checkfacil" name="checkfacil">
								<input type="hidden" id="sendnumber" name="sendnumber">
								<input type="submit" class="btn btn-block btn-primary"
									value="삭제">
							</div>
							<div class="col-md-3 btn-group">
								<input type="button" class="btn btn-block btn-primary"
									value="다시 선택">
							</div>
						</div>
						</form>
					</div>

				</div>
			</div>
			
		</div>
		<!-- 시설확인 끝 -->

		<!-- 시설추가 시작 -->
		<form method="POST" action="/HarangProject/facil?cmd=AFacilAddDel">
		<div class="row">
			<div class="col-md-12">
				<!-- Box -->
				<div class="box box-primary" id="faciladdbox">
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
								<label>시설종류</label> <select class="form-control" name="selectfacil">
									<option value="운동장">운동장</option>
									<option value="스터디룸">스터디룸</option>
								</select>
							</div>

							<!-- 시설명 입력 -->
							<div class="col-md-4">
								<label>시설명</label> <input type="text" class="form-control"
									placeholder="시설명을 입력하세요" name="facil_type">
							</div>

							<!-- 호수 입력 -->
							<div class="col-md-4">
								<label>호수</label> <input type="text" class="form-control"
									placeholder="시설명을 입력하세요" name="facil_name">
							</div>
						</div>
						<div class="row">
							<!-- 시설 설명 -->
							<div class="col-md-12">
								<label>시설 설명</label> <input type="text" class="form-control"
									placeholder="시설명을 입력하세요" name="facil_content">
							</div>
						</div>
					</div>

					<!-- Box footer -->
					
					<div class="box-footer">
						<div class="row" align="center">
							<div class="col-md-3 btn-group"></div>
							<div class="col-md-3 btn-group">
								<input type="hidden" name="addfacil" value="1">
								<input type="submit" class="btn btn-block btn-primary"
									value="추가" >
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
		</form>
		<!-- 시설추가 끝-->

		<!-- 시설수정 시작-->
		
		<div class="row">
			<div class="col-md-12">
				<!-- Box -->
				<form method="POST" action="/HarangProject/facil?cmd=AFacilAddDel">
				<div class="box box-primary" id="reser03" hidden="hidden">
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
									readonly="readonly" id="modi_num" name="modi_num">
							</div>
							<div class="col-md-2">
								<label>시설종류</label> <input type="text" class="form-control"
									readonly="readonly" id="modi_facil" name="modi_facil">
							</div>

							<!-- 시설명(첫번째 카테고리) 선택 -->
							<div class="col-md-4">
								<label>시설명</label> <input type="text" class="form-control"
									readonly="readonly" id="modi_type">
							</div>

							<!-- 호수(두번째 카테고리) 선택 -->
							<div class="col-md-4">
								<label>호수</label> <input type="text" class="form-control"
									readonly="readonly" id="modi_name">
							</div>
							<br>
							<div class="col-md-12">
							
							<hr/>
							</div>
						</div>
						

						<div class="row">

							<!-- 시설명 입력 -->
							<div class="col-md-4">
								<label>시설명</label> <input type="text" class="form-control"
									placeholder="수정할 내용을 입력하세요" id="endmodi_type" name="endmodi_type">
							</div>

							<!-- 호수 입력 -->
							<div class="col-md-4">
								<label>호수</label> <input type="text" class="form-control"
									placeholder="수정할 내용을 입력하세요" id="endmodi_name" name="endmodi_name">
							</div>
							
							<!-- 시설 설명 입력  -->
							<div class="form-group col-md-4">
								<label>설명</label> <input type="text" class="form-control"
									placeholder="수정할 내용을 입력하세요" id="endmodi_content" name="endmodi_content">
							</div>
						</div>

						
					</div>

					<!-- Box footer -->
					<div class="box-footer">
						<div class="row" align="center">
							<div class="col-md-3 btn-group"></div>
							<div class="col-md-3 btn-group">
								<input type="hidden" name="modified" value="1">
								<input type="submit" class="btn btn-block btn-primary"
									value="수정">
							</div>
							<div class="col-md-3 btn-group">
								<input type="button" class="btn btn-block btn-primary"
									value="리셋">
							</div>
						</div>
					</div>

				</div>
				</form>
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

<script type="text/javascript">
function confirmData(check, num, type, name){
		// 삭제 확인창 보여지게.
		
		$("#confirmcheck").slideUp();
		$("#confirmcheck").slideDown();
		
		// 확인창에 데이터 입력.
		$("#del_num").attr("value",num);
		$("#del_type").attr("value",type);
		$("#del_name").attr("value",name);
		
		// 최종 삭제 쿼리문에 포함시켜줄 분기. check값을 리퀘스트 값으로 확인해서 SQL문을 작성하게 된다.
		if("pg" == check){
			$("#checkfacil").attr("value",check);
		}
		
		else if("sr" == check){
			$("#checkfacil").attr("value",check);
		}
		
		$("#sendnumber").attr("value", num)
		
		// UI적인 측면 고려. 화면 조정.
 		$("#boxstudy").attr("class", "box box-primary collapsed-box");
		$("#boxplayground").attr("class", "box box-primary collapsed-box");
		$("#faciladdbox").attr("class", "box box-primary collapsed-box");
}

function modifityDate(check, num, type, name){
		$("#reser03").slideUp();
		$("#reser03").slideDown();	
		
		if("pg" == check){
			$("#modi_facil").attr("value","운동장");
		}
		
		else if("sr" == check){
			$("#modi_facil").attr("value","스터디룸");
		}
		
		$("#modi_num").attr("value",num);
		$("#modi_type").attr("value",type);
		$("#modi_name").attr("value",name);
	
		// UI적인 측면 고려. 화면 조정.
		$("#boxstudy").attr("class", "box box-primary collapsed-box");
		$("#boxplayground").attr("class", "box box-primary collapsed-box");
		$("#faciladdbox").attr("class", "box box-primary collapsed-box");
		
}
</script>

