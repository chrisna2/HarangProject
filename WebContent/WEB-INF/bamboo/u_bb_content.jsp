<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<!-- 페이지 헤드 라인 : 제목 -->
<head>
<%@ include file="../include/header.jsp"%>
<title>대나무숲 리스트+컨텐츠 사용자페이지</title>

<script>
	function fnbrdelete(br_num){
		document.fnbrdelete.br_num.value=br_num;
		//document객체의 fnbrdelete form의 br_num 의 값에 br_num을 대입한다.
		
		document.fnbrdelete.submit();
		
		
	}
	function fnbrpost(){
		
		if(document.bbreply.br_nickname.value ==""||document.bbreply.br_coment.value ==""){
			
			alert("빠짐없이 입력 해주세요");
			return;
			
		}
		else {
			document.bbreply.submit();
						
		}
		
	}
	
	function fnBbconup(){
		
		document.bbconupdateform.submit();
	}
	
	function fnBbdel(){
		
		if(${brlist.size() > 0 }){
			alert("댓글이 등록된 글은 삭제 할 수 없습니다.");
			
		}
		else{
			
		document.bbcondel.submit();
		}
		
		
	}
	
	function fnBblike(){
		document.bblike.submit()
	}
	function fnBbdlike(){
		document.bbdlike.submit()
	}
	function fnBblikecancle(){
		document.bblikecancle.submit()
	}
	function fnBbdlikecancle(){
		document.bbdlikecancle.submit()
	}
	
	
	
	
</script>


</head>

<div class="content-wrapper">
	<!----------------------------------- 메인페이지 헤더 [작업 제목] ------------------------------------------------------------->
	<section class="content-header">
		<h1>대나무숲 리스트+컨텐츠 사용자페이지</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> 메인</a></li>
			<li class="active">대나무숲</li>
		</ol>
	</section>
	<!------------------------------------ 메인페이지 바디 [작업 내용] ------------------------------------------------------------>
	<br> <br>
	<section class="content">

		<!-- 컨텐츠 헤더부분. 제목. 작성일. 작성자. 추천/비추천 수 표시 -->


		<div class="row">
			<!-- 너비 사이즈 수정  : col-->
			<div class="col-md-9">
				<div class="box" id="bamcon">
					<div class="box-header">
						<font size="6">${bbcon.bb_title}</font> <span
							class="badge bg-green pull-right"> ${bbcon.bb_regdate}<br>닉네임
							: ${bbcon.bb_nickname}<br> <br> <span
							class="badge bg-blue"><i class="fa fa-thumbs-o-up"></i>
								${bblcnt.size()}</span> <span class="badge bg-red"><i
								class="fa fa-thumbs-o-down"></i> ${bbdlcnt.size()}</span>
						</span>

					</div>

					<div class="box-body">${bbcon.bb_content}
						<br>테스트용 작성자 m_id : ${bbcon.m_id}<br>테스트용 로그인한 m_id :
						${sessionScope.member.m_id}
						<br> 테스트용 islike : ${islike }
						<br> 테스트용 isdlike : ${isdlike }
					</div>
					<!-- /.box-body -->
					<div class="box-footer ">

						<!-- 아이디 검사 해서 본인일 경우만 수정, 삭제 출력되도록 if문 처리 -->
						<c:if test="${bbcon.m_id eq sessionScope.member.m_id  }">
							<div class="pull-right">
								<a type="button" class="btn btn-success btn-xs" href="javascript:fnBbconup()">수정</a> 
								<a type="button" class="btn btn-success btn-xs" href= "javascript:fnBbdel()">삭제</a>

							</div>
						</c:if>

						<!--  수정을 위한 폼 시작 -->
						<!-- 수정 하려면.. 글번호를 가져가야함.  -->
						<form method="post" action="/HarangProject/bamboo"
							name="bbconupdateform">
							 <input type="hidden" name="bb_num" value="${bbcon.bb_num}" />
							 <input type="hidden" name="cmd" value="U_BB_CONUP" />

						</form>
						<!--  수정을 위한 폼 끝 -->

						<!--  삭제를 위한 폼 시작 -->
						<!-- 삭제 하려면.. 글번호를 가져가야함.  -->
						<form method="post" action="/HarangProject/bamboo"
							name="bbcondel">
							 <input type="hidden" name="bb_num" value="${bbcon.bb_num}" />
							 <input type="hidden" name="cmd" value="U_BB_DEL" />

						</form>
						<!--  수정을 위한 폼 끝 -->


						<div align="center">
						
						<c:if test="${islike == y}" >	
							<a type="button" class="btn btn-primary" href="javascript:fnBblike()">추천</a>
						</c:if>	
						<c:if test="${islike != y}" >	
							<a type="button" class="btn btn-primary" href="javascript:fnBblikecancle()">추천취소</a>
						</c:if>	
						<c:if test="${isdlike == y}" >
							<a type="button" class="btn btn-danger" href="javascript:fnBbdlike()">비추천</a>
						</c:if>	
						<c:if test="${isdlike != y}" >
							<a type="button" class="btn btn-danger" href="javascript:fnBbdlikecancle()">비추천취소</a>
						</c:if>	
						</div>
						
						<!-- 추천을 위한 폼 시작 -->
						<form method="post" action="/HarangProject/bamboo"
							name="bblike">
							 <input type="hidden" name="bb_num" value="${bbcon.bb_num}" />
							 <input type="hidden" name="cmd" value="U_BB_LIKE" />

						</form>
						<!--  추천을 위한 폼 끝 -->
						
						<!-- 비추천을 위한 폼 시작 -->
						<form method="post" action="/HarangProject/bamboo"
							name="bbdlike">
							 <input type="hidden" name="bb_num" value="${bbcon.bb_num}" />
							 <input type="hidden" name="cmd" value="U_BB_DLIKE" />

						</form>
						<!--  비추천을 위한 폼 끝 -->
						
						<!-- 추천취소를 위한 폼 시작 -->
						<form method="post" action="/HarangProject/bamboo"
							name="bblikecancle">
							 <input type="hidden" name="bb_num" value="${bbcon.bb_num}" />
							 <input type="hidden" name="cmd" value="U_BB_LIKE_CANCLE" />

						</form>
						<!--  추천취소를 위한 폼 끝 -->
						
						<!-- 비추천취소를 위한 폼 시작 -->
						<form method="post" action="/HarangProject/bamboo"
							name="bbdlikecancle">
							 <input type="hidden" name="bb_num" value="${bbcon.bb_num}" />
							 <input type="hidden" name="cmd" value="U_BB_DLIKE_CANCLE" />

						</form>
						<!--  비추천취소를 위한 폼 끝 -->
						
						
						
						
						
						
					</div>
					<!-- /.box-body -->
				</div>

				<br> <br>
			</div>

		</div>



		<div class="row">
			<!-- 너비 사이즈 수정  : col-->
			<div class="col-md-9">
				<div class="box" id="reply">

					<div class="box-body">
						<c:if test="${brlist.size() > 0 }">
							<c:forEach var="i" begin="0" end="${brlist.size()-1 }">
								<!--  댓글 들어가는 곳 -->
								<div class="box-header">
									<span class="badge bg-green">${brlist[i].br_nickname }</span>
								</div>

								<div class="box-body">${brlist[i].br_coment }</div>
								<!-- /.box-body -->
								<div class="box-footer ">
									<p align="right">



										<a type="button" class="btn btn-success btn-xs"
											href="javascript:fnbrdelete('${brlist[i].br_num }')">삭제</a>
									</p>

								</div>

								<!-- 댓글 들어가는 곳 끝 -->
							</c:forEach>
						</c:if>




					</div>
					<!--  여기까지가 기존 댓글 들어가는 부분 -->

					<!--  댓글 삭제를 위한 폼 -->

					<form method="post" action="/HarangProject/bamboo"
						name="fnbrdelete">
						<input type="hidden" name="br_num" /> <input type="hidden"
							name="bb_num" value="${bbcon.bb_num}" /> <input type="hidden"
							name="cmd" value="U_BR_DEL" />

					</form>

					<!--  댓글 삭제를 위한 폼 끝-->





					<!-- 여기부터 새 댓글 작성창 -->
					<form action="/HarangProject/bamboo" name="bbreply" method="post">
						<input type="hidden" name="cmd" value="U_BB_REPLY" /> <input
							type="hidden" name="bb_num" value="${bbcon.bb_num }" />

						<div class="box-footer">

							<div class="box" id="reply">

								<div class="box-header">
									<div class="form-group">

										<textarea class="form-control" rows="1"
											placeholder="닉네임을 입력 해 주세요" name="br_nickname"></textarea>
									</div>

								</div>

								<div class="box-body">

									<div class="form-group">

										<textarea class="form-control" rows="3"
											placeholder="댓글을 입력 해 주세요" name="br_coment"></textarea>
									</div>



								</div>
								<!-- /.box-body -->
								<div class="box-footer ">
									<p align="right">
										<a type="button" class="btn btn-success btn-xs"
											href="javascript:fnbrpost()">등록</a>


									</p>

								</div>

							</div>




						</div>
					</form>
					<!-- 여기까지 새 댓글 작성창 -->
				</div>
			</div>
		</div>


		<!-- 컨텐츠 헤더 끝-->

		<!--  여기부터 본문 -->

		<!-- 세로 길이 수정 -->
		<div class="row">
			<!-- 너비 사이즈 수정  : col-->
			<div class="col-md-9">
				<div class="box">
					<div class="box-header">
						<h3 class="box-title">대나무숲</h3>
						<div class="box-tools">
							<form action="/HarangProject/bamboo?cmd=U_BB_POST" name="bbpost"
								method="post">
								<div class="input-group">
									<button type="submit" class="btn btn-primary pull-right btn-sm">글쓰기</button>

								</div>
							</form>
						</div>
					</div>
					<!-- /.box-header -->
					<div class="box-body table-responsive no-padding">
						<table class="table table-hover">


							<tr>


								<th>작성자</th>
								<th>작성일</th>
								<th>제목</th>
								<th>조회수</th>


							</tr>


							<c:if test="${bblist != null }">
								<c:forEach var="i" begin="0" end="${bblist.size()-1 }">

									<tr>

										<td>${bblist[i].bb_nickname}</td>
										<td><fmt:formatDate value="${bblist[i].bb_regdate}"
												pattern="yyyy-MM-dd" /></td>
										<td><a
											href="/HarangProject/bamboo?cmd=U_BB_CON&bb_num=${bblist[i].bb_num}"
											style="color: black">${bblist[i].bb_title}</a></td>
										<td>${bblist[i].bb_count}</td>

									</tr>


								</c:forEach>
							</c:if>


						</table>
					</div>
					<!-- /.box-body -->

					<div class="box-footer clearfix">






						<ul class="pagination pagination-sm no-margin pull-right">
							<li><a href="#">&laquo;</a></li>
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">&raquo;</a></li>
						</ul>

						<form action="/HarangProject/bamboo?cmd=BB_LIST" name="search"
							method="post">
							<div class="input-group">

								<select name="sOption" class="form-control input-sm"
									style="width: 150px;">

									<option value="bb_title">제목</option>
									<option value="bb_content">내용</option>

								</select> <input type="text" name="table_search"
									class="form-control input-sm" style="width: 150px;"
									placeholder="Search" />

								<button class="btn btn-sm btn-default pull-left">
									<i class="fa fa-search"></i>
								</button>

							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- /.box -->
		</div>

	</section>
</div>




<!-- /.col -->

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

		$('#calendar').fullCalendar(
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
					monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월",
							"8월", "9월", "10월", "11월", "12월" ],
					monthNamesShort : [ "1월", "2월", "3월", "4월", "5월", "6월",
							"7월", "8월", "9월", "10월", "11월", "12월" ],
					dayNames : [ "일요일", "월요일", "화요일", "수요일", "목요일", "금요일",
							"<font color='blue'>토요일</font>" ],
					dayNamesShort : [ "일", "월", "화", "수", "목", "금", "토" ],
					editable : true
				});
	});
</script>