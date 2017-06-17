<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
                  <h3 class="box-title">쪽지 읽기</h3>
                </div><!-- /.box-header -->
                <div class="box-body no-padding">
                  <div class="mailbox-read-info">
                    <h3>${msg.t_title}</h3><br>
                    <h5><small>To:</small> ${msg.m_reader_name} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    	<small>From:</small> ${msg.m_sender_name} <span class="mailbox-read-time pull-right">${msg.t_send_date}</span></h5>
                  </div><!-- /.mailbox-read-info -->
                  <div class="mailbox-read-message">
                    <p>${msg.t_content}</p>
                    <br><br><br><br>
                  </div><!-- /.mailbox-read-message -->
                </div><!-- /.box-body -->
                <div class="box-footer">
                  <div class="pull-right">
                    <button class="btn btn-default"><i class="fa fa-reply"></i> 답장</button>
                    <button class="btn btn-default" onclick="fnList('${tab}')"><i class="fa fa-share"></i> 목록</button>
                  </div>
                  <button class="btn btn-default"><i class="fa fa-trash-o"></i> 삭제</button>
                </div><!-- /.box-footer -->
              </div><!-- /. box -->
           </div><!-- /.col -->
              
           <!-- 오른쪽에 메시지 탭 바 구성 -->
              <div class="col-md-3">
              	<a href="/HarangProject/message?cmd=POST" class="btn btn-primary btn-block margin-bottom">쪽지쓰기</a>
	             <div class="box box-solid">
	             <c:choose>  
	               <c:when test="${tab eq 'inbox'}"> 
	                <div class="box-body no-padding">
	                  <ul class="nav nav-pills nav-stacked">
	                    <li class="active"><a href="/HarangProject/message?cmd=INBOX"><i class="fa fa-inbox"></i> 받은 쪽지함 <span class="label label-primary pull-right">12</span></a></li>
	                    <li><a href="/HarangProject/message?cmd=SENT"><i class="fa fa-envelope-o"></i> 보낸 쪽지함</a></li>
	                    <li><a href="/HarangProject/message?cmd=TOME"><i class="fa fa-file-text-o"></i> 내게 쓴 쪽지함 </a></li>
	                  </ul>
	                </div><!-- /.box-body -->
	               </c:when>
	               <c:when test="${tab eq 'sent'}"> 
	                <div class="box-body no-padding">
	                  <ul class="nav nav-pills nav-stacked">
	                    <li><a href="/HarangProject/message?cmd=INBOX"><i class="fa fa-inbox"></i> 받은 쪽지함 <span class="label label-primary pull-right">12</span></a></li>
	                    <li class="active"><a href="/HarangProject/message?cmd=SENT"><i class="fa fa-envelope-o"></i> 보낸 쪽지함</a></li>
	                    <li><a href="/HarangProject/message?cmd=TOME"><i class="fa fa-file-text-o"></i> 내게 쓴 쪽지함 </a></li>
	                  </ul>
	                </div><!-- /.box-body -->
	               </c:when>
	               <c:when test="${tab eq 'tome'}"> 
	                <div class="box-body no-padding">
	                  <ul class="nav nav-pills nav-stacked">
	                    <li><a href="/HarangProject/message?cmd=INBOX"><i class="fa fa-inbox"></i> 받은 쪽지함 <span class="label label-primary pull-right">12</span></a></li>
	                    <li><a href="/HarangProject/message?cmd=SENT"><i class="fa fa-envelope-o"></i> 보낸 쪽지함</a></li>
	                    <li class="active"><a href="/HarangProject/message?cmd=TOME"><i class="fa fa-file-text-o"></i> 내게 쓴 쪽지함 </a></li>
	                  </ul>
	                </div><!-- /.box-body -->
	               </c:when> 
	             </c:choose>
           	  </div>
           </div><!-- /.row -->
        </section><!-- /. 작업 공간 끝! -->
<!------------------------------------------------------------------------------------------------------------------->        
      </div><!-- /. 전체를 감싸주는 틀입니다. 지우지 마세여. -->
      <form name="list" method="post" action="">
      	<input type="hidden" name="nowPage" value="${nowPage}"/>
      	<input type="hidden" name="nowBlock" value="${nowBlock}"/>
      </form>
<!-- 푸터(footer) 삽입 [지우지 마세여] ------------------------------------------------------------------------------------------------------> 
<%@ include file="../include/footer.jsp" %>
<script>
function fnList(tab){
	if(tab == 'inbox'){
		document.list.action = "/HarangProject/message?cmd=INBOX";
	}else if(tab == 'sent'){
		document.list.action = "/HarangProject/message?cmd=SENT";
	}else if(tab == 'tome'){
		document.list.action = "/HarangProject/message?cmd=TOME";
	}
	document.list.submit();
}
</script>