<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<%@ include file="../include/header.jsp"%>
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
			알바 채용 정보 <small>교내의 알바 채용 정보를 확인하세요!</small>
		</h1>
		<ol class="breadcrumb">
			<!-- 페이지 기록 메인에서 부터 현재 페이지 까지의 경로 나열 -->
			<li><a href="#"><i class="fa fa-dashboard"></i> Home > 알바 하랑</a></li>
			<li class="active">알바 모집</li>
		</ol>
	</section>
	<!------------------------------------ 메인페이지 바디 [작업 내용] ------------------------------------------------------------>
	<section class="content">
		<div class="row">
			<div class="col-md-10">
				<div class="box">
					<div class="box-header">
						<h3 class="box-title"></h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<table id = "example1" class="table table-bordered table-striped">
							<tr>
								<th style="width: 10px">#</th>
								<th style="width: 40%">제목</th>
								<th>시급</th>
								<th>글쓴이</th>
								<th>작성일</th>
								<th>조회수</th>
								<th>지원자 수</th>
							</tr>
							<c:forEach items="${list}" var="list" varStatus="status">
								<tr>
									<td>${status.count}</td>
									<td>${list.p_header}&nbsp;&nbsp; ${list.p_title}</td>
									<td>${list.p_wage}원 </td>
									<td>${list.m_id}</td>
									<td>${list.p_regdate}</td>
									<td>${list.p_cnt}</td>
									<td>${list.cnt_apply}</td>
								</tr>
							</c:forEach>
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
					</div><!-- /.box -->
					<div class="row">
						<div class="col-md-2"></div>
						<div class="col-md-2 form-group">
							<select class="form-control">
	                        <option>제목</option>
	                        <option>시급</option>
	                        <option>직종</option>
	                      </select>
						</div>
						<div class="col-md-6 input-group input-group-sm">
	                    <input type="text" class="form-control">
	                    <span class="input-group-btn">
	                      <button class="btn btn-info btn-flat" type="button">Go!</button>
	                    </span>
	                  </div><!-- /input-group -->
                  </div>
				</div>
			</div>
		</div><!-- row -->


	</section><!-- /. 작업 공간 끝! -->
<!------------------------------------------------------------------------------------------------------------------->
</div><!-- /. 전체를 감싸주는 틀입니다. 지우지 마세여. -->

<!-- 푸터(footer) 삽입 [지우지 마세여] ------------------------------------------------------------------------------------------------------>
<%@ include file="../include/footer.jsp"%>

<!-- --------------------------------------------------------------------------------------------------- -->

 
