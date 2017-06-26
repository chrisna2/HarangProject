<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../include/a_header.jsp" %>
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
                  <h3 class="box-title">새 쪽지를 작성하세요.</h3>
                </div><!-- /.box-header -->
                <div class="box-body">
                <form name="send" method="post" action="/HarangProject/message?cmd=SENT">
                  <div class="row">
                  	  <div class=" col-md-2 form-group">
                  	  	<input id="toMe" type="checkbox" onclick ="fnToMe('${member.m_name}')"/>
                  	    <label>내게 쓰기</label>
	                  </div>
	                  <div class=" col-md-5 form-group">
	                  <c:choose>
	                  	<c:when test="${not empty reader}">
	                  		<input class="form-control" id="reader" placeholder="받는사람 입력 후 오른쪽에서 학번 선택" value="${reader}" onblur="fnSearch()"/>
	                  	</c:when>
	                  	<c:otherwise>
		                    <input class="form-control" id="reader" placeholder="받는사람 입력 후 오른쪽에서 학번 선택" value="" onblur="fnSearch()"/>
	                  	</c:otherwise>
	                  </c:choose>
	                  </div>
	                  <div class=" col-md-5 form-group">
	                    <select class="form-control" name="m_reader" id="display">
	                    	<option> 이름중복확인</option>
	                    	
	                    </select>
	                  </div>
                  </div>
                  <div class="form-group">
                    <input class="form-control" name="t_title" placeholder="제목:"/>
                  </div>
                  <div class="form-group">
                    <textarea id="compose-textarea" name="t_content" class="form-control" style="height: 300px">
                      
                    </textarea>
                  </div>
                </form>
                </div><!-- /.box-body -->
                <div class="box-footer">
                  <div class="pull-right">
                    <button class="btn btn-default" onclick="fnCancel()"><i class="fa fa-times"></i> 취소하기</button>
                    <button type="submit" class="btn btn-primary" onclick="fnSend()"><i class="fa fa-envelope-o"></i> 보내기</button>
                  </div>
                </div><!-- /.box-footer -->
                <br><br>
              </div><!-- /. box -->
             </div><!-- /.col -->
              
              <!-- 오른쪽에 메시지 탭 바 구성 -->
             <div class="col-md-3">
            <a href="/HarangProject/message?cmd=POST" class="btn btn-primary btn-block margin-bottom">쪽지쓰기</a>
	          <div class="box box-solid">
                <div class="box-body no-padding">
                  <ul class="nav nav-pills nav-stacked">
                    <li><a href="/HarangProject/message?cmd=INBOX"><i class="fa fa-inbox"></i> 받은 쪽지함 <span class="label label-primary pull-right">${notRead}</span></a></li>
                    <li><a href="/HarangProject/message?cmd=SENT"><i class="fa fa-envelope-o"></i> 보낸 쪽지함</a></li>
                    <li><a href="/HarangProject/message?cmd=TOME"><i class="fa fa-file-text-o"></i> 내게 쓴 쪽지함 <span class="label label-primary pull-right">${notRead_toMe}</span></a></li>
                  </ul>
                </div><!-- /.box-body -->
              </div><!-- /. box -->
           	</div>
           </div><!-- /.row -->
        </section><!-- /. 작업 공간 끝! -->
<!------------------------------------------------------------------------------------------------------------------->        
      </div><!-- /. 전체를 감싸주는 틀입니다. 지우지 마세여. -->
      
<!-- 푸터(footer) 삽입 [지우지 마세여] ------------------------------------------------------------------------------------------------------> 
<%@ include file="../include/a_footer.jsp" %>
<script>
var httpRequest = null;

function sendRequest(method, url, param, callback){
	httpRequest = new XMLHttpRequest();
	
	var httpMethod = method ? method : "GET";
	//method가 null이면 method값으로 아니면 "Get"으로
	if(httpMethod != "Get" && httpMethod != "POST"){
		httpMethod="GET";
	}//오타방지
	
	var httpParam = (param == null || param == "")?null : param;
	//param이 없으면 null처리 있으면 그대로
	if(httpMethod == "GET" && httpParam != null){
		url = url + "?" + httpParam;
	}
	
	httpRequest.open(httpMethod, url, true);
	httpRequest.onreadystatechange = callback;
	httpRequest.setRequestHeader("Content-Type","application/x-www-form-urlencoded; charset=utf-8");
	httpRequest.send(httpMethod=="POST"?httpParam:null);
	
}

	function fnSend(){
		if(confirm("정말 보내시겠습니까?\n보낸 메시지는 수정이 불가능합니다.")==true){
			document.send.submit();
		}else{
			return;
		}
	}
	
	function fnSearch(){
		var m_name = document.getElementById("reader").value;
		var param = "m_name=" + m_name;
		
		sendRequest("POST", "/HarangProject/m_search", param, callback );
	}
	
	function callback(){
		if(httpRequest.readyState == 4){
			if(httpRequest.status == 200){
				var idArray = httpRequest.responseText.split("\n");
				$("#display option").remove();
				for(var i=0;i<idArray.length-1;i++){
					var option = $("<option>"+idArray[i]+"</option>");
	                $('#display').append(option);
				}
			}
			else{
				alert(httpRequest.status);
			}
		}
	}
	function fnToMe(m_name){
		var cbx = document.getElementById("toMe");
		if(cbx.checked == true){
			document.getElementById("reader").value = m_name;
			document.getElementById("reader").focus();
		}else{
			document.getElementById("reader").value = "";
		}
	}
	
	function fnCancel(){
		if(confirm("정말 취소하시겠습니까?\n작성하던 메시지는 저장되지 않습니다.")==true){
			location.href = "/HarangProject/message?cmd=INBOX";
		}else{
			return;
		}
	}
	
	window.onload = function(){
		document.getElemembById("reader").focus();
	}
</script>