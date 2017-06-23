<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../include/header.jsp" %>
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
             	쪽지함
            <small>쪽지를 관리하세요.</small>
          </h1>
          <ol class="breadcrumb">
          <!-- 페이지 기록 : 메인에서 부터 현재 페이지 까지의 경로 나열 -->
            <li><a href="#"><i class="fa fa-dashboard"></i> 메인</a></li>
            <li><a href="#">마이페이지</a></li>
            <li class="active">쪽지함</li>
          </ol>
        </section>
<!------------------------------------ 메인페이지 바디 [작업 내용] ------------------------------------------------------------>
        <section class="content">
          <!-- 세로 길이 수정 -->
          <div class="row">
           <!-- 너비 사이즈 수정  : col-->
           <div class="col-md-9">
        	 <div class="box box-primary">
                <div class="box-header with-border">
                  <h3 class="box-title">보낸 쪽지함</h3>
                </div><!-- /.box-header -->
                <div class="box-body no-padding">
                  <%@ include file="message_paging.jsp" %>
                  
                  <div class="table-responsive mailbox-messages">
                    <table class="table table-hover table-striped">
                      <tbody>
	                      <tr>
	                      	<th></th>
	                      	<th>#</th>
	                      	<th>받는사람</th>
	                      	<th>제목</th>
	                      	<th>날짜</th>
	                      </tr>
                      <c:choose>
								<c:when test="${fn:length(list) eq 0}">
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td>보낸 쪽지가 없습니다.<td>
									<td></td>
								</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${list}" var="list" 
											   begin="${paging.beginPerPage}" 
											   end="${paging.beginPerPage + paging.numPerPage -1}" 
											   varStatus="status">
										<tr>
				                          <td><input type="checkbox" value="${list.t_num}"/></td>
				                          <td>${list.list_num}</td>
				                          <td class="mailbox-name" >${list.m_reader_name}</td>
				                          <td class="mailbox-subject" style="width: 50%">
				                          	<a href="javascript:fnRead('${list.t_num}');" style="color:black">${list.t_title}</a>
				                          </td>
				                          <td class="mailbox-date">${list.t_send_date}</td>
				                        </tr>
									</c:forEach>
							</c:otherwise>
							</c:choose>
                      </tbody>
                    </table><!-- /.table -->
                  </div><!-- /.mail-box-messages -->
                </div><!-- /.box-body -->
                
                <div class="box-footer no-padding">
                  <%@ include file="message_paging.jsp" %>
                </div>
              </div><!-- /. box -->
              </div><!-- /.col -->
              
              <!-- 오른쪽에 메시지 탭 바 구성 -->
              <div class="col-md-3">
              	<a href="/HarangProject/message?cmd=POST" class="btn btn-primary btn-block margin-bottom">쪽지쓰기</a>
	          	  <div class="box box-solid">
	                <div class="box-body no-padding">
	                  <ul class="nav nav-pills nav-stacked">
	                    <li><a href="/HarangProject/message?cmd=INBOX"><i class="fa fa-inbox"></i> 받은 쪽지함 <span class="label label-primary pull-right">${notRead}</span></a></li>
	                    <li class="active"><a href="/HarangProject/message?cmd=SENT"><i class="fa fa-envelope-o"></i> 보낸 쪽지함</a></li>
	                    <li><a href="/HarangProject/message?cmd=TOME"><i class="fa fa-file-text-o"></i> 내게 쓴 쪽지함 <span class="label label-primary pull-right">${notRead_toMe}</span></a></li>
	                  </ul>
	                </div><!-- /.box-body -->
                </div>
              </div><!-- /. box -->
           </div><!-- /.row -->
        </section><!-- /. 작업 공간 끝! -->
<!------------------------------------------------------------------------------------------------------------------->        
      </div><!-- /. 전체를 감싸주는 틀입니다. 지우지 마세여. -->
      <!-- 페이징 : 이전 블록으로 이동하는 폼 -->
<form id="prevPage" method="post" action="/HarangProject/message?cmd=SENT">
	<input type="hidden" name="nowPage" value="${paging.pagePerBlock * (paging.nowBlock-1)}"/>
	<input type="hidden" name="nowBlock" value="${paging.nowBlock-1}"/>
</form>
<!-- 페이징 : 다음 블록으로 이동하는 폼 -->
<form id="nextPage" method="post" action="/HarangProject/message?cmd=SENT">
	<input type="hidden" name="nowPage" value="${paging.pagePerBlock * (paging.nowBlock+1)}"/>
	<input type="hidden" name="nowBlock" value="${paging.nowBlock+1}"/>
</form>
<!-- 메시지 읽기 -->
<form name="read" method="post" action="/HarangProject/message?cmd=READ">
	<input type="hidden" name="t_num" value="" id="t_num"/>
	<input type="hidden" name="nowPage" value="${paging.nowPage}"/>
	<input type="hidden" name="nowBlock" value="${paging.nowBlock}"/>
	<input type="hidden" name="tab" value="${tab}"/>
</form>
<!-- 푸터(footer) 삽입 [지우지 마세여] ------------------------------------------------------------------------------------------------------> 
<%@ include file="../include/footer.jsp" %>
<script>
///////////////// 페이지 관련 javascript function////////////////////
function prevPage(){
	document.getElementById("prevPage").submit();
}
function nextPage(){
	document.getElementById("nextPage").submit();
}
/////////////////////////////////////////////////////////////////

function fnRead(t_num){
	document.getElementById("t_num").value = t_num;
	document.read.submit();
}

</script>