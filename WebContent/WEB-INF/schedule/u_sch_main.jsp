<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<%@ include file="../include/header.jsp"%>
<!-- 페이지 헤드 라인 : 제목 -->
<head>
<title>학사일정 학생 페이지</title>
<style>
table {
	table-layout: fixed;
}

td {
	word-break: break-all;
	word-wrap: break-word;
}

font#s_title {
	word-wrap: break-word; /* Internet Explorer 5.5+ */
	white-space: pre-wrap; /* css-3 */
	white-space: -moz-pre-wrap; /* Mozilla, since 1999 */
	white-space: -pre-wrap; /* Opera 4-6 */
	white-space: -o-pre-wrap; /* Opera 7 */
	word-break: break-all;
}
div#s_content {
	word-wrap: break-word; /* Internet Explorer 5.5+ */
	white-space: pre-wrap; /* css-3 */
	white-space: -moz-pre-wrap; /* Mozilla, since 1999 */
	white-space: -pre-wrap; /* Opera 4-6 */
	white-space: -o-pre-wrap; /* Opera 7 */
	word-break: break-all;
}
</style>




</head>

<div class="content-wrapper">
	<!----------------------------------- 메인페이지 헤더 [작업 제목] ------------------------------------------------------------->
	<section class="content-header">
		<h1>
			학사일정 	 <small>학생 페이지</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> 메인</a></li>
			<li class="active">학사일정</li>
		</ol>
	</section>
	<!------------------------------------ 메인페이지 바디 [작업 내용] ------------------------------------------------------------>
	<!-- 달력 모양 -->
	<section class="content">
		<div class="row">
			<!-- 달력의 크기 조정 -->
			<div class="col-md-9">



				<div class="box box-primary">
					<div class="box-body no-padding">
						<!-- THE CALENDAR -->
						<div id="calendar"></div>
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /. box -->



			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->
	</section>
	<!-- /.content -->
	<!-- 여기까지 달력 -->

	<!--  여기부터 본문 -->

	<section class="content">
		<!-- 세로 길이 수정 -->
		<div class="row">
			<!-- 너비 사이즈 수정  : col-->
			<div class="col-md-9">

				<div class="box" id="schcon" hidden="hidden">
					<div class="box-header with-border" style="background-color: #dceff4">
						<font size="6" id="s_title"></font>

					</div>
					<div class="box-body">

						<div id="s_content"></div>
						<hr />
						<!-- <div id="s_isnum">
							글 번호 : <span id="s_num"></span>
						</div> -->
						<div id="s_rgigan">
							참가신청 시작일 :<span id="s_rstart"></span> <br>
							참가신청 마감일 :<span id="s_rend"></span>
						</div>
						<div id="s_dgigan">
							행사 시작일 : <span id="s_dstart"></span><br>
							행사 종료일 : <span id="s_dend"></span>
						</div>
						<div id="s_isgrade">
							해당 학년 : <span id="s_grade"></span><span id="s_dend"></span>
						</div>
						<div id="s_pointdetail">
							지급 포인트 : <span id="s_point"></span>
						</div>
						<div id="s_islocation">
							행사 장소 : <span id="s_location"></span>
						</div>
						
						
						

					</div>
					<!-- /.box-body -->
					
					<div class="box-footer" id = "is_join" style="background-color: #dceff4 ">

						<p align = "center">
						<a type="button"  href = "javascript:scjoin(${schconlist.s_num})" class="btn btn-primary" id = "joinjoin"> 참가신청</a>
						<a type="button" href = "javascript:scjoincancle(${schconlist.s_num})" class="btn btn-primary" id = "joincancle"> 참가취소</a>
						</p>
					

					</div>
					<!-- /.box-footer-->
				</div>
				<!-- /.box -->

				<div class="row">
					<div class="col-xs-12">
						<div class="box">
							<div class="box-header" style="background-color: #dceff4 ">
								<h3 class="box-title">학사 일정</h3>
								<div class="box-tools">
								<form action="/HarangProject/schedule" name="search" method="post">
								<input type="hidden" name="cmd" value="U_SCH_LIST">
									<div class="input-group">
										<input type="text" name="table_search"
											class="form-control input-sm pull-right"
											style="width: 150px;" placeholder="Search" /> <select
											class="form-control input-sm pull-right"
											style="width: 150px;" name="sOption">
											<option value="s_ispoint">포인트 지급</option>
											<option value="s_dept">학과</option>
											<option value="s_title">제목</option>

										</select>
										<div class="input-group-btn">
											<button class="btn btn-sm btn-default">
												<i class="fa fa-search"></i>
											</button>
										</div>
									</div>
									</form>
								</div>
							</div>
							<!-- /.box-header -->
							<div class="box-body table-responsive no-padding">
								<table class="table table-hover">
									<tr>
										<th width="150">학과</th>
										<th width="100">시작일</th>
										<th>제목</th>
										<th width="100">해당 학년</th>
										<th width="110">포인트지급</th>

									</tr>
									<c:choose>
										<c:when test="${fn:length(schlist) eq 0}">
								학사일정이 없습니다.
								</c:when>
										<c:otherwise>
											<c:forEach items="${schlist}" var="schlist"
												begin="${paging.beginPerPage}"
												end="${paging.beginPerPage + paging.numPerPage -1}"
												varStatus="i">
												<tr>
													<td>${schlist.s_dept}</td>
													<td>${schlist.s_dstart}</td>
													<td><a href = "#" style="color: black" onclick="schRead('${schlist.s_num}')">${schlist.s_title} </a></td>
													<td><c:choose>
															<c:when test="${'1234' eq schlist.s_grade}">
								전체
								</c:when>
															<c:otherwise>
								${schlist.s_grade }	
								</c:otherwise>
														</c:choose></td>



													<td>${schlist.s_ispoint}</td>

												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>





								</table>
							</div>
							<!-- /.box-body -->

							<!-- 페이징 버튼 -->
						<div class="box-footer clearfix" style="background-color: #dceff4 ">
							<ul class="pagination pagination-sm no-margin pull-right">
								<c:if test="${paging.nowBlock > 0}">
									<li><a href="javascript:prevPage()">&laquo;</a></li>
								</c:if>
								<c:forEach var="i" begin="0" end="${paging.pagePerBlock-1}"
									step="1">
									<!-- if문 추가 : 20170615 -->
									<c:if
										test="${paging.nowBlock*paging.pagePerBlock+i < paging.totalPage}">
										<li><a
											href="javascript:goPage('${paging.nowBlock*paging.pagePerBlock+i}')">${paging.nowBlock*paging.pagePerBlock+(i+1)}</a></li>
									</c:if>
									<!-- 끝 -->
								</c:forEach>
								<c:if test="${paging.totalBlock > paging.nowBlock +1}">
									<li><a href="javascript:nextPage()">&raquo;</a></li>
								</c:if>
							</ul>
						</div>
						<!-- 페이징 버튼 -->
						</div>
						<!-- /.box -->
					</div>
				</div>
			</div>
			<!-- /.col -->
		</div>
		<!-- /.row -->
	</section>
	
	
	<!--  참가신청을 위한 폼 시작 -->
	<!-- 참가신청 하려면.. 글번호를 가져가야함.  -->
	<form method="post" action="/HarangProject/schedule"
		name="schjoin">
		<input type="hidden" name="s_num" value="" /> 
		<input type="hidden" name="cmd" value="U_SCH_JOIN" />
	</form>
	<!--  참가신청을 위한 폼 끝 -->
	
	<!--  참가취소를 위한 폼 시작 -->
	<!-- 참가취소 하려면.. 글번호를 가져가야함.  -->
	<form method="post" action="/HarangProject/schedule"
		name="schjoincancle">
		<input type="hidden" name="s_num" value="" /> 
		<input type="hidden" name="cmd" value="U_SCH_JOIN_CANCLE" />
	</form>
	<!--  참가신청을 위한 폼 끝 -->
	
	<!-- 페이징 관련 폼 ----------------------------------------------------------------------->
	<!-- 페이징 : 이전 블록으로 이동하는 폼 -->
	<form id="prevPage" method="post" action="/HarangProject/schedule">
		<input type="hidden" name="cmd" value="U_SCH_LIST" /> <input
			type="hidden" name="nowPage"
			value="${paging.pagePerBlock * (paging.nowBlock-1)}" /> <input
			type="hidden" name="nowBlock" value="${paging.nowBlock-1}" />
	</form>
	<!-- 페이징 : 다음 블록으로 이동하는 폼 -->
	<form id="nextPage" method="post" action="/HarangProject/schedule">
		<input type="hidden" name="cmd" value="U_SCH_LIST" /> <input
			type="hidden" name="nowPage"
			value="${paging.pagePerBlock * (paging.nowBlock+1)}" /> <input
			type="hidden" name="nowBlock" value="${paging.nowBlock+1}" />
	</form>
	<!-- 페이징 : 해당 페이지로 이동하는 폼 -->
	<form id="goPage" method="post" action="/HarangProject/schedule">
		<input type="hidden" name="cmd" value="U_SCH_LIST" /> <input
			type="hidden" name="nowPage" value="" id="page" /> <input
			type="hidden" name="nowBlock" value="${paging.nowBlock}" />
	</form>
	<!-- 페이징 관련 폼 여기까지입니다. ----------------------------------------------------------------------------------- -->
	
	
	
	
	
	
	<!-- /. 작업 공간 끝! -->
	<!--  본문 끝 -->
	<!-- 푸터(footer) 삽입 [지우지 마세여] -------------------------------------------------------------------------------------->
</div>
<!-- /.content-wrapper -->
<%@ include file="../include/footer.jsp"%>

<!-- ★★★Ajax를 배우면 이해 할 수 있는 곳 : 여기에 데이터를 삽입합니다. -->
<script type="text/javascript">
	$(function() {

		/* initialize the calendar
		 -----------------------------------------------------------------*/
		//현재 년 월 일 불러 오기
		var date = new Date();
		var d = date.getDate(), m = date.getMonth(), y = date.getFullYear();

		$('#calendar')
				.fullCalendar(
						{
							header : {
								left : 'prev,next',
								center : 'title',
								right : 'today'
							},
							buttonText : {
								today : '오늘날짜',
								month : '월별',
								week : '주별',
								day : '일별'
							},
							titleFormat : {
								month : 'YYYY년 MMMM'
							},
							monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월",
									"7월", "8월", "9월", "10월", "11월", "12월" ],
							monthNamesShort : [ "1월", "2월", "3월", "4월", "5월",
									"6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
							dayNames : [ "일요일", "월요일", "화요일", "수요일", "목요일",
									"금요일", "<font color='blue'>토요일</font>" ],
							dayNamesShort : [ "일", "월", "화", "수", "목", "금", "토" ],
							editable : false,
							events : "/HarangProject/ajax?cmd=sche",
							//입력 글자 색
							eventTextColor : '#000000',
							eventMouseover : function(calEvent, jsEvent, view) {
								$(this).css('cursor', 'pointer');
							},
							
							eventClick : function(calEvent, jsEvent, view) {
								$("#schcon").slideUp();
								$("#schcon").slideDown();
								//날짜를 클릭 했을 때 해당 날짜에 포함된 데이터를 불러 옵니다. 위와 마찮가지..
								$.getJSON("/HarangProject/ajax?cmd=schecon",{s_num : calEvent.id},function(data) {
													
													$(data).each(function(index, schconlist) {
														$("#s_content").html(schconlist.s_content);
														var ss_num = schconlist.s_num;
														$("#s_num").text(ss_num);
														$("#s_title").text(schconlist.s_title);
														$("#s_dstart").text(schconlist.s_dstart);
														$("#s_dend").text(schconlist.s_dend);
														$("#s_dept").text(schconlist.s_dept);
														schjoin.s_num.value = ss_num;
														schjoincancle.s_num.value = ss_num;
														if (null != schconlist.s_rend && null != schconlist.s_rstart) {
															$("#s_rend").text(schconlist.s_rend);
															$("#s_rstart").text(schconlist.s_rstart);
															
														}
														else {
															$("#s_rend").text("");
															$("#s_rstart").text("");
															
														}
														
														if (null != schconlist.s_point) {
															$("#s_point").text(schconlist.s_point);
															$("#is_join").show();
															
														}
														else{
															$("#s_point").text(0);
															$("#is_join").hide();
														}
														var ss_rend;
														ss_rend = new Date(schconlist.s_rend);
													
														var ss_rstart;
															ss_rstart = new Date(schconlist.s_rstart);
															
														if (ss_rend.getTime() > Date.now() && ss_rstart < Date.now() ) {
															$("#is_join").show();
														}
														else{
															$("#is_join").hide();
														}
														
														
														if (0 == schconlist.isjoin) {
															
															$("#joinjoin").show();
															$("#joincancle").hide();
															
														}
														else{
															
															$("#joinjoin").hide();
															$("#joincancle").show();
														}
														
														if (null != schconlist.s_location) {
															$("#s_location").text(schconlist.s_location);
														}
														else {
															$("#s_location").text("");
														}
														if ('1234' == schconlist.s_grade) {
															$("#s_grade").text('전체');
														}
														else {
															var grade = schconlist.s_grade;
															var grade2 = new Array(grade.split(""));
															var grade3 = "";
															for (var i = 0; i < grade2.length; i++) {
																grade3 += grade2[i];
															}
														$("#s_grade").text(grade3);
														}
														
														
												});
											});
							}
						});
		
		
		
	});
	
	
	
	
	
	
	
	
	
	
	
	
</script>
<script>

function schRead(s_num) {
		//alert($.now()); 
		$("#schcon").slideUp();
		$("#schcon").slideDown();
		$.getJSON("/HarangProject/ajax?cmd=schecon",{s_num : s_num},function(data) {
			$(data).each(function(index, schconlist) {
				$("#s_content").html(schconlist.s_content);
				var ss_num = schconlist.s_num;
				$("#s_num").text(ss_num);
				schjoin.s_num.value = ss_num;
				schjoincancle.s_num.value = ss_num;
				$("#s_title").text(schconlist.s_title);
				$("#s_dstart").text(schconlist.s_dstart);
				$("#s_dend").text(schconlist.s_dend);
				$("#s_dept").text(schconlist.s_dept);
				if (null != schconlist.s_rend && null != schconlist.s_rstart) {
					$("#s_rend").text(schconlist.s_rend);
					$("#s_rstart").text(schconlist.s_rstart);
					
				}
				else {
					$("#s_rend").text("");
					$("#s_rstart").text("");
					
				}
				if (null != schconlist.s_point) {
					$("#s_point").text(schconlist.s_point);
					$("#is_join").show();
				}
				else{
					$("#s_point").text(0);
					$("#is_join").hide();
				}
				var ss_rend;
					ss_rend = new Date(schconlist.s_rend);
				
				var ss_rstart;
					ss_rstart = new Date(schconlist.s_rstart);
					
				if (ss_rend.getTime() > Date.now() && ss_rstart < Date.now() ) {
					$("#is_join").show();
				}
				else{
					$("#is_join").hide();
				}
				
				//alert(ss_rend.getTime());
				
				
				if (0 == schconlist.isjoin) {
					
					$("#joinjoin").show();
					$("#joincancle").hide();
					
				}
				else{
					
					$("#joinjoin").hide();
					$("#joincancle").show();
				}
				if (null != schconlist.s_location) {
					$("#s_location").text(schconlist.s_location);
				}
				else {
					$("#s_location").text("");
				}
				if ('1234' == schconlist.s_grade) {
					$("#s_grade").text('전체');
				}
				else {
					var grade = schconlist.s_grade;
					var grade2 = new Array(grade.split(""));
					var grade3 = "";
					for (var i = 0; i < grade2.length; i++) {
						grade3 += grade2[i];
					}
				$("#s_grade").text(grade3);
				}
		});
	}); 
}	
	

function scjoin(s_num){
	document.schjoin.submit();
	alert("신청 되었습니다.");
}
function scjoincancle(s_num){
	document.schjoincancle.submit();
	alert("취소 되었습니다.");
}

///////////////// 페이지 관련 javascript function////////////////////
function prevPage() {
	document.getElementById("prevPage").submit();
}
function nextPage() {
	document.getElementById("nextPage").submit();
}
function goPage(nowPage) {
	document.getElementById("page").value = nowPage;
	document.getElementById("goPage").submit();
}
/////////////////////////////끝//////////////////////////////////



</script>

