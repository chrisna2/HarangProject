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
			대타 지원서 작성 <small>대타 모집에 지원하고 싶으신가요? 아래 항목을 성실하게 채워주세요!</small>
		</h1>
		<ol class="breadcrumb">
			<!-- 페이지 기록 메인에서 부터 현재 페이지 까지의 경로 나열 -->
			<li><a href="#"><i class="fa fa-dashboard"></i> 메인 > 알바 하랑</a></li>
			<li class="active">대타 모집</li>
		</ol>
	</section>
	<!------------------------------------ 메인페이지 바디 [작업 내용] ------------------------------------------------------------>
	<section class="content">
		<div class="row">
			<div class="col-md-10">
				<!-- general form elements disabled -->
				<div class="box box-warning">
					<div class="box-header">
						<h3 class="box-title">기본 신상 정보</h3>
						<small>마이 페이지에 저장된 기본 정보는 해당 페이지에서 변경할 수 없습니다.</small>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<form role="form">
							<!-- text input -->
							<div class="form-group">
								<label>이름</label><br> 
								<input type="text" class="form-control" value="김철수" readonly="readonly" />
							</div>
							<div class="form-group">
								<label>연락처</label> 
								<input type="text" class="form-control" value="010-1111-2222" readonly="readonly" />
							</div>
						</form>
					</div><!-- /.box-body -->
				</div><!-- /.box -->
			</div><!--/.col (right) -->
		</div>
			<br>
			<div class="row">
				<div class="col-md-10">
					<div class='box box-info'>
						<div class='box-header'>
							<h3 class='box-title'>
								상세 정보 <small>지원동기를 작성해주세요.</small>
							</h3>
						</div><!-- /.box-header -->
						<div class='box-body pad'>
							<form>
							<label>지원 동기</label>
								<textarea class="form-control" >
본인을 마구마구 뽐내주세요.                       	                 
		                    	</textarea>
							</form>
						</div>
					</div>
					<!-- /.box -->
					<div class="row">
						<div class="col-md-4"></div>
						<div class="col-md-2">
							<button class="btn btn-block btn-primary">지원 완료</button>
						</div>
						<div class="col-md-2">
							<button class="btn btn-block btn-danger">취소</button>
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-10"></div>
						<div class="col-md-2">
							<button class="btn btn-block btn-warning">돌아가기</button>
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
<!-- InputMask -->
<script src="../../plugins/input-mask/jquery.inputmask.js"
	type="text/javascript"></script>
<script
	src="../../plugins/input-mask/jquery.inputmask.date.extensions.js"
	type="text/javascript"></script>
<script src="../../plugins/input-mask/jquery.inputmask.extensions.js"
	type="text/javascript"></script>
<!-- date-range-picker -->
<script src="../../plugins/daterangepicker/daterangepicker.js"
	type="text/javascript"></script>
<!-- bootstrap color picker -->
<script src="../../plugins/colorpicker/bootstrap-colorpicker.min.js"
	type="text/javascript"></script>
<!-- bootstrap time picker -->
<script src="../../plugins/timepicker/bootstrap-timepicker.min.js"
	type="text/javascript"></script>
<!-- SlimScroll 1.3.0 -->
<script src="../../plugins/slimScroll/jquery.slimscroll.min.js"
	type="text/javascript"></script>
<!-- iCheck 1.0.1 -->
<script src="../../plugins/iCheck/icheck.min.js" type="text/javascript"></script>
<!-- FastClick -->
<script src='../../plugins/fastclick/fastclick.min.js'></script>
<!-- AdminLTE App -->
<script src="../../dist/js/app.min.js" type="text/javascript"></script>
<!-- AdminLTE for demo purposes -->
<script src="../../dist/js/demo.js" type="text/javascript"></script>

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