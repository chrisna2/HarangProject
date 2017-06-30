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

		<div class="row">

			<div class="col-md-7">
				<h1>강의평가 상세 페이지</h1>
				<div class="col-md-2">
					<button class="btn btn-block btn-primary" id ="input">신고</button>
				</div>
			</div>
		</div>




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
			<div class="col-md-10">
			
				<div class="box-header"></div>
				<div class="box-body">
					<form role="form2" name="read2"
					action="/HarangProject/impage?cmd=insert" method="post">
					<div class="row">
						<div class="col-md-5 form-group">
							<label>작성자</label> <input type="text" class="form-control" value="${read2.m_name }"
								readonly="readonly" />
						</div>
				
					</div>


					<div class="row">

						<div class="col-md-5 form-group">
							<label>교수명</label> <input type="text" class="form-control"
								value="${read2.l_teacher }" readonly="readonly" />
						</div>
						<div class="col-md-5 form-group">
							<label>강의명</label> <input type="text"
								class="form-control pull-right" id="reservation"
								value="${read2.l_name }" readonly="readonly" />
						</div>
					</div>

					<div class="row">
						<div class="col-md-5 form-group">
							<label>개설년도</label> <input type="text" class="form-control"
								value="${read2.lm_year }" readonly="readonly" />
						</div>
						<div class="col-md-5 form-group">
							<label>개설학기</label> <input type="text"
								class="form-control pull-right" 
								value="${read2.lm_term }" readonly="readonly" />
						</div>

					</div>

					<div class="row">
						<div class="col-md-5 form-group">
							<label>만족도</label> <input type="text" class="form-control"
								value="${read2.lm_star }" readonly="readonly" />
						</div>
						<div class="col-md-5 form-group">
							<label>조모임</label> <input type="text"
								class="form-control pull-right" 
								value="${read2.lm_group }" readonly="readonly" />
						</div>

					</div>

					<div class="row">
						<div class="col-md-5 form-group">
							<label>과제</label> <input type="text" class="form-control"
							value="${read2.lm_hw }"	readonly="readonly" />
						</div>
						<div class="col-md-5 form-group">
							<label>작성일</label> <input type="text"
							value="${read2.lm_regdate}"	class="form-control pull-right" id="reservation"
								readonly="readonly" />
						</div>

					</div>


					<div class="row">
						<div class="col-md-10 form-group">
							<label><big>총평</big></label>
							<textarea class="form-control" rows="3" readonly="readonly">${read2.lm_comment}</textarea>

						</div>



					</div>

					<div class="row">
						<div class="col-md-4"></div>
						<div class="col-md-3">
							<input type="button" value="뒤로가기"  id="btn2" class="btn btn-block btn-primary"/>
						</div>


					</div>

</form>

				</div>
				
				
				




			</div>
			
			
			
		</div>
		
		
		
		<!-- /.col -->
		
		
		 <!-- 신고  등록  -->
              <div class="box box-black" id="theRemote" style="display: none;">
                <div class="box-header">
                  <h3 class="box-title">글 신고하기</h3>
                  <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                    <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                  </div>
                </div>
                
                <!-- form 시작 -->
                
                <form role="form" action="/HarangProject/impage?cmd=warning" method="post">
              	<input type="hidden" name="lm_num" value="${read2.lm_num }"/>
                <div class="box-body">
                 <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-bolt"></i> 신고자 이름</span>
                    <input type="text" name="m_id" class="form-control" value="${read2.m_id }" required="required" readonly="readonly">
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-sort-numeric-desc"></i> 신고내용</span>
                    <input type="text" name="w_comment" class="form-control" required="required">
                  </div>
                
                </div><!-- /.box-body -->
                
                  <div class="box-footer" align="right">
                   
                    <input type="submit" id="btn1" class="btn btn-primary" value="신고">
                </div>
                
                </form>
              </div><!-- /.box -->
</div>
<!-- /.row -->
</section>
<!-- /. 작업 공간 끝! -->
<!------------------------------------------------------------------------------------------------------------------->
</div>
<!-- /. 전체를 감싸주는 틀입니다. 지우지 마세여. -->

<!-- 푸터(footer) 삽입 [지우지 마세여] ------------------------------------------------------------------------------------------------------>
<%@ include file="../include/footer.jsp"%>

<script>
$(document).ready(function(){
	
	$("#input").click(function(){
		if($("#theRemote").css("display") == "none"){
			$("#theRemote").slideDown();
		}
		else{
			$("#theRemote").slideUp();
		}
	});
	
});

$(
		function () {
		
			$("#btn1").click(
					function(){	
						alert("신고 완료!");
						
					}
			);
		}	
	);


$(
function () {
	
	$("#btn2").click(
			function(){	
				self.location = "/HarangProject/impage?cmd=main";
				
			}
	);
}	
);






</script>

