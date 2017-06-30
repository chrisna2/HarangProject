<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<%@ include file="../include/a_header.jsp"%>
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
			이력서 보기 <small>당신의 대타 채용 글에 지원한 지원자의 이력서입니다. 채용 의사가 있다면 선택버튼을 눌러주세요.</small>
		</h1>
		<ol class="breadcrumb">
			<!-- 페이지 기록 메인에서 부터 현재 페이지 까지의 경로 나열 -->
			<li><a href="#"><i class="fa fa-dashboard"></i> 메인 > 알바 하랑</a></li>
			<li class="active">알바 모집</li>
		</ol>
	</section>
	<!------------------------------------ 메인페이지 바디 [작업 내용] ------------------------------------------------------------>
	<section class="content">
		<div class="row">
			<div class="col-md-10">
				<!-- general form elements disabled -->
				<div class="box box-warning">
					<div class="box-header">
						<h3 class="box-title">이력서</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						
				
							<!-- text input -->
							<div class="form-group">
								<label>이름</label><br> 
								<input type="text" class="form-control" value="${applicant.m_name}" readonly="readonly" />
							</div>
							<div class="form-group">
								<label>연락처</label> 
								<input type="text" class="form-control" value="${applicant.m_tel}" readonly="readonly" />
							</div>
							<div class="form-group">
								<label>지원 동기</label>
								<textarea class="form-control" name="dm_reason" readonly="readonly">${resume.dm_reason}</textarea>
							</div>
					</div>
					
					<div class="row">
						<div class="col-md-5"></div>
						<c:choose>
						<c:when test="${m_id eq resume.m_id}">
							<div class="col-md-2">
								<button class="btn btn-block btn-primary">선택</button>
							</div>
						</c:when>
						<c:otherwise>
							<div class="col-md-2">
								<button class="btn btn-block btn-primary" onclick="fnDelete()">삭제</button>
							</div>
						</c:otherwise>	
						</c:choose>
					</div>
					<br><br>
				</div>
					<div class="row">
						<div class="col-md-10"></div>
						<div class="col-md-2">
							<button class="btn btn-block btn-warning" onclick="fnList()">글보기</button>
						</div>
					</div>
			</div>
		</div>
	</section>
	<!-- /. 작업 공간 끝! -->
	<!------------------------------------------------------------------------------------------------------------------->
</div>
<form name="list" method="post" action="/HarangProject/parttime?cmd=DREAD">
	<input type="hidden" name="a_nowPage" value="${a_nowPage}"/>
	<input type="hidden" name="a_nowBlock" value="${a_nowBlock}"/>
	<input type="hidden" name="nowPage" value="${nowPage}"/>
    <input type="hidden" name="nowBlock" value="${nowBlock}"/>
	<input type="hidden" name="d_num" value="${d_num}"/>
	<input type="hidden" name="tab" value="${tab}"/>
	<input type="hidden" name="read" value="no"/>
</form>
<form name="del" method="post" action="/HarangProject/parttime?cmd=DREAD">
	<input type="hidden" name="d_num" value="${d_num}"/>
	<input type="hidden" name="cancel" value="OK"/>
	<input type="hidden" name="tab" value="${tab}"/>
	<input type="hidden" name="read" value="no"/>
</form>
<!-- /. 전체를 감싸주는 틀입니다. 지우지 마세여. -->

<!-- 푸터(footer) 삽입 [지우지 마세여] ------------------------------------------------------------------------------------------------------>
<%@ include file="../include/a_footer.jsp"%>
<!-- ------------------------------------------------------------------------------------------------ -->

<script>
	function fnList(){document.list.submit();}
	function fnDelete(){
		if(confirm("지금 이력서를 삭제하면 복구할 수 없습니다.\n정말 삭제하시겠습니까?") == true){
			document.del.submit();
		}else{
			return;
		}
	}
</script>