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
			이력서 보기 <small>당신의 알바 채용 글에 지원한 지원자의 이력서입니다. 채용 의사가 있다면 선택버튼을 눌러주세요.</small>
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
						<form role="form">
							<!-- text input -->
							<div class="row">
								<div class="col-md-9">
									<div class="form-group">
										<label>이름</label><br> 
										<input type="text" class="form-control" value="김철수" readonly="readonly" />
									</div>
									<div class="form-group">
										<label>생년월일</label> 
										<input type="text" class="form-control" value="901225" readonly="readonly" />
									</div>
									<div class="form-group">
										<label>나이</label> 
										<input type="text" class="form-control" value="28" readonly="readonly" />
									</div>
								</div>
								<div class="col">
									<img src="/HarangProject/WebContent/dist/img/photo1.png"/>
								</div>
							</div>
							<div class="form-group">
								<label>학번</label> 
								<input type="text" class="form-control" value="2009540018" readonly="readonly" />
							</div>				
							<div class="form-group">
								<label>연락처</label> 
								<input type="text" class="form-control" value="010-1111-2222" readonly="readonly" />
							</div>
							<div class="form-group">
									<label>지원 동기</label>
									<textarea class="form-control"  readonly="readonly">
열심히 일하겠습니다!!	                       	                 
			                    	</textarea>
							</div>
							<br>
							<div class="form-group">
								<label>경력사항</label><br>
								<textarea class="form-control"  readonly="readonly">
편의점 알바 6개월
								</textarea>
							</div>
							<br>
							<div class="form-group">
								<label>희망 근무 시간</label><br>
								<textarea class="form-control"  readonly="readonly">
월수금 6-10시 가능합니다.
								</textarea>
							</div>
					
					<div class="row">
						<div class="col-md-4"></div>
						<div class="col-md-4">
							<button class="btn btn-block btn-primary">선택</button>
						</div>
					</div>
			</form>
			</div>
			</div>
			
					<div class="row">
						<div class="col-md-10"></div>
						<div class="col-md-2">
							<button class="btn btn-block btn-warning">목록</button>
						</div>
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
<!-- ------------------------------------------------------------------------------------------------ -->
<!-- jQuery 2.1.3 -->
<script src="plugins/jQuery/jQuery-2.1.3.min.js"></script>
<!-- Bootstrap 3.3.2 JS -->
<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<!-- FastClick -->
<script src='plugins/fastclick/fastclick.min.js'></script>
<!-- AdminLTE App -->
<script src="dist/js/app.min.js" type="text/javascript"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js" type="text/javascript"></script>
<!-- CK Editor -->
<script src="//cdn.ckeditor.com/4.4.3/standard/ckeditor.js"></script>
<!-- InputMask -->
<script src="plugins/input-mask/jquery.inputmask.js"
	type="text/javascript"></script>
<script
	src="plugins/input-mask/jquery.inputmask.date.extensions.js"
	type="text/javascript"></script>
<script src="plugins/input-mask/jquery.inputmask.extensions.js"
	type="text/javascript"></script>
<!-- date-range-picker -->
<script src="plugins/daterangepicker/daterangepicker.js"
	type="text/javascript"></script>
<!-- bootstrap color picker -->
<script src="plugins/colorpicker/bootstrap-colorpicker.min.js"
	type="text/javascript"></script>
<!-- bootstrap time picker -->
<script src="plugins/timepicker/bootstrap-timepicker.min.js"
	type="text/javascript"></script>
<!-- SlimScroll 1.3.0 -->
<script src="plugins/slimScroll/jquery.slimscroll.min.js"
	type="text/javascript"></script>
<!-- iCheck 1.0.1 -->
<script src="plugins/iCheck/icheck.min.js" type="text/javascript"></script>
<!-- FastClick -->
<script src='plugins/fastclick/fastclick.min.js'></script>
<!-- AdminLTE App -->
<script src="dist/js/app.min.js" type="text/javascript"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js" type="text/javascript"></script>

<!-- Bootstrap WYSIHTML5 -->
<script
	src="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"
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