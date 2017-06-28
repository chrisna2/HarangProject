<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../include/a_header.jsp" %>
<!-- 해더  삽입  [지우지마세여]------------------------------------------------------------------------------------------------->
<!-- 페이지 헤드 라인 : 제목 -->
<head>
     <title>기본 값 페이지</title>
     
     <c:if test="${result eq 'donate success'}">
     	<script>
     		alert("기부가 완료되었습니다");
     		location.href="/HarangProject/harangdin?cmd=adminDonate";
       	</script>
     </c:if>
     <c:if test="${result eq 'donate fail'}">
     	<script>
     		alert("기부가 실패했습니다");
       	</script>
     </c:if>
</head>
	  <!-- 메인 페이지 구역 , 즉 작업 구역 -->
      <div class="content-wrapper">
<!----------------------------------- 메인페이지 헤더 [작업 제목] ------------------------------------------------------------->
        <section class="content-header">
          <h1>
             	중고도서 기부 상세페이지
            <small>기부중인 중고도서의 상세정보를 알 수 있습니다.</small>
          </h1>
          <ol class="breadcrumb">
          <!-- 페이지 기록 : 메인에서 부터 현재 페이지 까지의 경로 나열 -->
            <li><a href="#"><i class="fa fa-dashboard"></i> 메인</a></li>
            <li class="active">하랑딘24</li>
            <li class="active">중고도서 기부 상세페이지</li>
          </ol>
        </section>
<!------------------------------------ 메인페이지 바디 [작업 내용] ------------------------------------------------------------>
<section class="content">
          <!-- 세로 길이 수정 -->
          <div class="row">
           <!-- 너비 사이즈 수정  : col-->
           <div class="col-md-10">
        
        <div class="box box-warning">
            <div class="box-header with-border">
              <h3 class="box-title">중고도서 기부 상세페이지</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
            	<form name="donate" action="/HarangProject/harangdin?cmd=bd_detail" method="post">
                <!-- text input -->
                <!-- select -->
                <div class="row">
                	<div class="col-sm-12 form-group">
                 	 <label>도서명</label>
                	 <input type="text" class="form-control" value="${i.b_name }" name="b_name" readonly="readonly">
             	   </div>
                </div>
 
                <div class="row">
                <div class="col-sm-6 form-group">
                  <label>도서 대표사진</label>
                  <img src="${i.b_photo}" class="img-rounded" height="450" width="350">
                </div>
                <div class="col-sm-6 form-group">
                 
                  <label>중고도서 거래번호</label>
                  <input type="text" class="form-control" value="${i.b_num }" name="b_num" readonly="readonly">
                  <label>학번</label>
                  <input type="text" class="form-control" value="${i.m_id }" name="m_id" readonly="readonly">
                  <label>저자</label>
                  <input type="text" class="form-control" value="${i.b_writer }" readonly="readonly">
                  <label>출판사</label>
                  <input type="text" class="form-control" value="${i.b_pub }" readonly="readonly">
                  <label>재고수량</label>
                  <input type="text" class="form-control" value="${i.b_stock }" readonly="readonly">
                  <label>기부완료 여부</label>
                  <input type="text" class="form-control" value="${i.b_iscomplete }" readonly="readonly">
                  <label>등록날짜</label>
	                      <div class="input-group">
	                      <div class="input-group-addon">
	                        <i class="fa fa-calendar"></i>
	                      </div>
	                      <input type="text" class="form-control pull-right" value="${i.b_regdate }" name="b_regdate" readonly="readonly"/>
	                    </div>
                  <label>현시각 최고 포인트</label>
                  <input type="text" class="form-control" value="5000" readonly="readonly">
                </div>
                </div> 

                <!-- textarea -->
                <div class="form-group">
                  <label>도서 정보</label>
                  <textarea class="form-control" rows="5" readonly="readonly">${i.b_content }</textarea>
                </div>
						<div class="row">
							<div class="col-sm-4"></div>
							<div class="col-sm-2">
									<input type="hidden" name="m_id" class="form-control" value="${i.m_id }">
									<input type="hidden" name="check" class="form-control" value="donate">
										<c:if test="${i.b_iscomplete != '기부완료'}" >
											<button type="submit" class="btn btn-block btn-primary">포인트 지급</button>
										</c:if>
										
								</form>
							</div>
					<form action="/HarangProject/harangdin?cmd=adminDonate" method="post">
						<div class="col-sm-2">	
							<button type="submit" class="btn btn-block">이전</button>
	                  	</div>
					</form>

				</div>
			</div>
            <!-- /.box-body -->
		</div><!-- /.col -->
	</div><!-- /.row -->
</section><!-- /. 작업 공간 끝! -->
<!------------------------------------------------------------------------------------------------------------------->        
      </div><!-- /. 전체를 감싸주는 틀입니다. 지우지 마세여. -->
      
<!-- 푸터(footer) 삽입 [지우지 마세여] ------------------------------------------------------------------------------------------------------> 
<%@ include file="../include/footer.jsp" %>
<!-- ---------------------------------------------------------------- -->
