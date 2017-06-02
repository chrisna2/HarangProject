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
				<h1>관리자 강의평가 상세 페이지</h1>
				
			</div>
		</div>




		<ol class="breadcrumb">
			<!-- 페이지 기록 : 메인에서 부터 현재 페이지 까지의 경로 나열 -->
			<li><a href="#"><i class="fa fa-dashboard"></i> 메인</a></li>
			<li class="active">관리자 강의평가 상세 페이지[현재 페이지]</li>
		</ol>
	</section>
	<!------------------------------------ 메인페이지 바디 [작업 내용] ------------------------------------------------------------>
	 <section class="content">
        
         <div class="row">
            <div class="col-md-10">
            
 
			<div class="row">
			<!-- 너비 사이즈 수정  : col-->
			<div class="col-md-10">

				<div class="box-header"></div>
				<div class="box-body">

					<div class="row">
						<div class="col-md-5 form-group">
							<label>작성자</label> <input type="text" class="form-control"
								readonly="readonly" />
						</div>

					</div>


					<div class="row">

						<div class="col-md-5 form-group">
							<label>교수명</label> <input type="text" class="form-control"
								readonly="readonly" />
						</div>
						<div class="col-md-5 form-group">
							<label>강의명</label> <input type="text"
								class="form-control pull-right" id="reservation"
								readonly="readonly" />
						</div>
					</div>

					<div class="row">
						<div class="col-md-5 form-group">
							<label>개설년도</label> <input type="text" class="form-control"
								readonly="readonly" />
						</div>
						<div class="col-md-5 form-group">
							<label>개설학기</label> <input type="text"
								class="form-control pull-right" id="reservation"
								readonly="readonly" />
						</div>

					</div>

					<div class="row">
						<div class="col-md-5 form-group">
							<label>만족도</label> <input type="text" class="form-control"
								readonly="readonly" />
						</div>
						<div class="col-md-5 form-group">
							<label>조모임</label> <input type="text"
								class="form-control pull-right" id="reservation"
								readonly="readonly" />
						</div>

					</div>

					<div class="row">
						<div class="col-md-5 form-group">
							<label>과제</label> <input type="text" class="form-control"
								readonly="readonly" />
						</div>
						<div class="col-md-5 form-group">
							<label>시험횟수</label> <input type="text"
								class="form-control pull-right" id="reservation"
								readonly="readonly" />
						</div>

					</div>


					<div class="row">
						<div class="col-md-10 form-group">
							<label><big>총평</big></label>
							<textarea class="form-control" rows="3" readonly="readonly"></textarea>

						</div>



					</div>

					<div class="row">
						<div class="col-md-2"></div>
						<div class="col-md-3">
							<button class="btn btn-block btn-primary">글 삭제</button>
						</div>
						<div class="col-md-3">
							<button class="btn btn-block btn-primary">뒤로가기</button>
						</div>


					</div>



				</div>
		<div class="col-md-10">
              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">신고내역</h3>
                    <!-- select -->
                 
                </div><!-- /.box-header -->
                <div class="box-body no-padding">
                  <table class="table">
                    <tr>
                      <th>신고번호</th>
                      <th>작성자</th>
                  
                        <th>신고내용</th>
                    </tr>
                    <tr>
                      <td>1.</td>
                      <td>Update software</td>
                      <td>
               			      ☆☆☆☆☆
                      </td>
                   
                    </tr>
                    <tr>
                      <td>2.</td>
             			
                      <td>
                      Update software
                      </td>
                      <td>	        ★☆☆☆☆</td>

                    </tr>
                   
                    
                    
                   
                  </table>
               
                </div><!-- /.box-body -->
              </div><!-- /.box -->
        </div>
        
        
        
        
        
           </div>
                
              </div><!-- /.box -->



			</div>
		</div>



        </section><!-- /. 작업 공간 끝! -->
<!-- /. 작업 공간 끝! -->
<!------------------------------------------------------------------------------------------------------------------->
</div>
<!-- /. 전체를 감싸주는 틀입니다. 지우지 마세여. -->

<!-- 푸터(footer) 삽입 [지우지 마세여] ------------------------------------------------------------------------------------------------------>
<%@ include file="../include/footer.jsp"%>