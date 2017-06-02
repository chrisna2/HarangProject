<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/header.jsp"%>
<!-- 해더  삽입  [지우지마세여]------------------------------------------------------------------------------------------------->
<!-- 페이지 헤드 라인 : 제목 -->
<head>
<title>운동장(관리자)</title>
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
		
		<!-- 1번째 테이블 [전체예약 내역]-->
		<div class="row">
			<div class="col-md-12">
				<!-- 상단 1.전체예약 내역 테이블 box -->
				<div class="box box-primary">
					<!-- 상단 테이블 box-header -->
					<div class="box-header">
						<h3 class="box-title">전체 예약 내역</h3>
						<div class="box-tools pull-right">
							<button class="btn btn-box-tool" data-widget="collapse">
								<i class="fa fa-minus"></i>
							</button>
						</div>
					</div>
					<!-- 상단 테이블 box-body -->
					<div class="box-body">
						<!-- 테이블  -->
						<!-- /.테이블 -->
					</div>
					<!-- 상단 테이블 box-footer -->
					<div class="box-footer">
						<!-- 테이블.버튼 -->
						<!-- /.테이블.버튼 -->
					</div>
				</div>
				<!-- /.box -->
			</div>
		</div>
		
		<!-- 두번째단 시작 [Left : 1.학사일정List / right : 2.예약수정]-->
		<div class="row">
			
			<!-- Left 열-->
			<div class="col-md-6">
				<!-- 2-1.학사일정 List -->
				<!-- box -->
				<div class="box box-primary">
					<!--  box-header -->
					<div class="box-header">
						<h3 class="box-title">학사일정</h3>
						<div class="box-tools pull-right">
							<button class="btn btn-box-tool" data-widget="collapse">
								<i class="fa fa-minus"></i>
							</button>
						</div>
					</div>
					
					<!-- box-body -->
					<div class="box-body">
					</div>		
					
					<!-- box-footer -->
					<div class="box-footer">
					</div>
				</div>
				<!-- /.box -->
			</div>
			<!-- Left 열 끝 -->
				
			<!-- Right 열 -->
			<div class="col-md-6">
				<!-- box -->
				<div class="box box-primary">
					<!--  box-header -->
					<div class="box-header">
						<h3 class="box-title">시설 사용 입력</h3>
						<div class="box-tools pull-right">
							<button class="btn btn-box-tool" data-widget="collapse">
								<i class="fa fa-minus"></i>
							</button>
						</div>
					</div>
					
					<!-- box-body -->
					<div class="box-body">
					</div>		
					
					<!-- box-footer -->
					<div class="box-footer">
					</div>

				</div>
				<!-- /.box -->
				</div>
			</div>
		
	</section>
	<!------------------------------------------------------------------------------------------------------------------->
</div>
<!-- /. 전체를 감싸주는 틀입니다. 지우지 마세여. -->

<!-- 푸터(footer) 삽입 [지우지 마세여] ------------------------------------------------------------------------------------------------------>
<%@ include file="../include/footer.jsp"%>