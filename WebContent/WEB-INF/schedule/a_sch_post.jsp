<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../include/a_header.jsp"%>
<!-- 해더  삽입  [지우지마세여]------------------------------------------------------------------------------------------------->
<!-- 페이지 헤드 라인 : 제목 -->
<head>
<title>학사일정</title>
<script>

function fnschp(){
	
	//alert(CKEDITOR.instances.editor1.getData().length);
	
	if(CKEDITOR.instances.editor1.getData() ==""||
		document.schpostcomplete.s_title.value ==""||
		document.schpostcomplete.s_dstart.value ==""||
		document.schpostcomplete.s_dend.value ==""){
		
		alert("제목, 행사 시작일, 행사 종료일, 일정 상세정보는 필수로 입력하셔야 합니다.");
		return;
		
	}
	else if(document.schpostcomplete.s_title.value.length>200){
		
		
		alert("제목을 너무 길게 입력하셨습니다. 200글자 이하로 입력 해 주세요.(공백 포함)");
		return;
	}
	
	else if(CKEDITOR.instances.editor1.getData().length>4000){
		
		
		alert("본문을 너무 길게 입력하셨습니다. 4000글자 이하로 입력 해 주세요.(공백 포함)");
		return;
	}
	
	
	else {
		document.schpostcomplete.submit();
					
	}
	
}








</script>

</head>
<!-- 메인 페이지 구역 , 즉 작업 구역 -->
<div class="content-wrapper">
	<!----------------------------------- 메인페이지 헤더 [작업 제목] ------------------------------------------------------------->
	<section class="content-header">
		<h1>
			학사일정 등록 <small>관리자가 일정등록하는 곳</small>
		</h1>
		<ol class="breadcrumb">
			<!-- 페이지 기록 : 메인에서 부터 현재 페이지 까지의 경로 나열 -->
			<li><a href="#"><i class="fa fa-dashboard"></i> 메인</a></li>
			<li class="active">학사일정</li>
		</ol>
	</section>
	<!------------------------------------ 메인페이지 바디 [작업 내용] ------------------------------------------------------------>
	<form action="/HarangProject/schedule" name="schpostcomplete" method="post">
		<input type = "hidden" name="cmd" value="A_SCH_POST_COMPLETE">
		<section class="content">
			<!-- 세로 길이 수정 -->
			<div class="row">
				<!-- 너비 사이즈 수정  : col-->
				<div class="col-md-12">

					<div class='box box-info'>
						<div class='box-header'>
							<h3 class='box-title'>학사일정 등록</h3>
							<br> <br>
							<!-- tools box -->

							<div class="form-group">
								<label>제목</label> <input type="text" class="form-control"
									placeholder="제목을 입력 하세요." name = "s_title" />
							</div>

							<div class="row">
								<div class="col-md-3 form-group">
									<label>학과</label> <select class="form-control" name = "s_dept">
										<option value = "전체">전체</option>
										<option value = "국문학과">국문학과</option>
										<option value = "수학과">수학과</option>
										<option value = "경영학과">경영학과</option>
										<option value = "시각디자인과">시각디자인과</option>
										<option value = "컴퓨터공학과">컴퓨터공학과</option>
									</select>
								</div>

							</div>

							<div class="row">
								<div class="col-md-6 form-group">
									<label>일정시작일</label>
									<div class="input-group">
										<div class="input-group-addon">
											<i class="fa fa-calendar"></i>
										</div>
										<input type="text" class="form-control pull-right"
											id="reservation" name = "s_dstart" />
									</div>
									<!-- /.input group -->
								</div>
								<div class="col-md-6 form-group">
									<label>일정종료일</label>
									<div class="input-group">
										<div class="input-group-addon">
											<i class="fa fa-calendar"></i>
										</div>
										<input type="text" class="form-control pull-right"
											id="reservation" name = "s_dend" />
									</div>
									<!-- /.input group -->
								</div>
							</div>
							<div class="row">
								<div class="col-md-6 form-group">
									<label>신청시작일</label>
									<div class="input-group">
										<div class="input-group-addon">
											<i class="fa fa-calendar"></i>
										</div>
										<input type="text" class="form-control pull-right"
											id="reservation" name = "s_rstart" />
									</div>
									<!-- /.input group -->
								</div>
								<div class="col-md-6 form-group">
									<label>신청종료일</label>
									<div class="input-group">
										<div class="input-group-addon">
											<i class="fa fa-calendar"></i>
										</div>
										<input type="text" class="form-control pull-right"
											id="reservation" name = "s_rend"/>
									</div>
									<!-- /.input group -->
								</div>
							</div>
							<div class="row">
								<div class="col-md-2 form-group">
									<div class="checkbox">
										<label> <input type="checkbox" name = "point">포인트 지급
										</label>
									</div>



								</div>
								<div class="col-md-6 form-group">

									<input class="form-control" type="text"
										placeholder="지급할 포인트를 입력하세요" name = "s_point">

								</div>
							</div>

						</div>
						<!-- /.box-header -->





						<div class='box-body pad'>

							<textarea id="editor1" name="editor1" rows="10" cols="80" name = "s_content"></textarea>
						</div>

						<div class="row">
							<div class="col-md-4"></div>
							<div class="col-md-2">
								<a type="button" class="btn btn-block btn-primary"
								href="javascript:fnschp()">등록</a>
							</div>
							<div class="col-md-2">
								<a class="btn btn-block btn-danger"
									href="/HarangProject/schedule?cmd=A_SCH_LIST">취소</a>
							</div>
						</div>



					</div>
					<!-- /.box -->
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</section>
	</form>
	<!-- /. 작업 공간 끝! -->
	<!------------------------------------------------------------------------------------------------------------------->
</div>
<!-- /. 전체를 감싸주는 틀입니다. 지우지 마세여. -->

<!-- 푸터(footer) 삽입 [지우지 마세여] ------------------------------------------------------------------------------------------------------>
<%@ include file="../include/footer.jsp"%>

<!-- CK Editor -->
<script src="//cdn.ckeditor.com/4.4.3/standard/ckeditor.js"></script>
<!-- jQuery 2.1.3 -->
<script src="../../plugins/jQuery/jQuery-2.1.3.min.js"></script>
<!-- Bootstrap 3.3.2 JS -->
<script src="../../bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<!-- FastClick -->
<script src='../../plugins/fastclick/fastclick.min.js'></script>
<!-- AdminLTE App -->
<script src="../../dist/js/app.min.js" type="text/javascript"></script>
<!-- AdminLTE for demo purposes -->
<script src="../../dist/js/demo.js" type="text/javascript"></script>
<!-- CK Editor -->
<script src="//cdn.ckeditor.com/4.4.3/standard/ckeditor.js"></script>
<!-- Bootstrap WYSIHTML5 -->
<script
	src="../../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"
	type="text/javascript"></script>
<script type="text/javascript">
	$(function() {
		// Replace the <textarea id="editor1"> with a CKEditor
		// instance, using default configuration.
		CKEDITOR.replace('editor1');
		//bootstrap WYSIHTML5 - text editor
		$(".textarea").wysihtml5();
	});
</script>

