<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ include file="../include/a_header.jsp" %>
<!-- 해더  삽입  [지우지마세여]------------------------------------------------------------------------------------------------->
<!-- 페이지 헤드 라인 : 제목 -->
<head>
<script type="text/javascript">

window.onload =  function () {
    
    var usermail = "${read3.m_mail}";
    var mailArray = usermail.split('@');
    input.m_mail1.value = mailArray[0];
    input.m_mail2.value = mailArray[1];

    var usertel = "${read3.m_tel}";
    var telArray = usertel.split('-');
    input.m_tel1.value = telArray[0];
    input.m_tel2.value = telArray[1];
    input.m_tel3.value = telArray[2];
    
    var useraddr = "${read3.m_addr}"
    var mailArray = useraddr.split('/');
    input.m_addr1.value = mailArray[0];
    input.m_addr2.value = mailArray[1];
    input.m_addr3.value = mailArray[2];
}

function mailcheck(){ 
     i = input.m_mail3.selectedIndex; // 선택항목의 인덱스 번호
     var mail= input.m_mail3.options[i].value; // 선택항목 value
     input.m_mail2.value = mail;
}


function checkform(){
    
    var m_mail1 = input.m_mail1.value;
    var m_mail2 = input.m_mail2.value;
    var m_mail = m_mail1 + "@" + m_mail2;
    input.m_mail.value = m_mail;

    var m_tel1 = input.m_tel1.value;
    var m_tel2 = input.m_tel2.value;
    var m_tel3 = input.m_tel3.value;
    var m_tel = m_tel1 + "-" + m_tel2 + "-" + m_tel3;
    input.m_tel.value = m_tel;

    var m_addr1 = input.m_addr1.value;
    var m_addr2 = input.m_addr2.value;
    var m_addr3 = input.m_addr3.value;
    var m_addr = m_addr1 + "/" + m_addr2 + "/" + m_addr3;
    input.m_addr.value = m_addr;

    return true;
    
}


</script>


     <title>회원 관리</title>
</head>
	  <!-- 메인 페이지 구역 , 즉 작업 구역 -->
      <div class="content-wrapper">
<!----------------------------------- 메인페이지 헤더 [작업 제목] ------------------------------------------------------------->
        <section class="content-header">
          <h1>
             	회원 관리
          </h1>
          <br>
          <form action="/HarangProject/myPage?cmd=Anewmem" method="post">
          <input type="submit" class="btn btn-sm btn-primary col-md-9" value="신입생/편입생 등록">
          </form>
          <br>
          <br>
          <ol class="breadcrumb">
          <!-- 페이지 기록 : 메인에서 부터 현재 페이지 까지의 경로 나열 -->
            <li><a href="#"><i class="fa fa-dashboard"></i> 관리자 메인</a></li>
            <li><a href="#"> 사이트 관리</a></li>
            <li class="active"> 회원 관리</li>
          </ol>
        </section>
<!------------------------------------ 메인페이지 바디 [작업 내용] ------------------------------------------------------------>
        <section class="content">
          <!-- 세로 길이 수정 -->
          <div class="row">
           <!-- 너비 사이즈 수정  : col-->
           <div class="col-md-9">
           
           <!-- 리스트 사용시  -->
            <div class="box">
                <div class="box-header">
                  <h3 class="box-title">회원 목록</h3>
                   <div class="box-tools">
                    <div class="input-group">
                    <form action="/HarangProject/myPage?cmd=AmemList" name="search" method="post">
                      <input type="text"  name="keyfield" class="form-control input-sm pull-right" style="width: 150px;" placeholder="Search"/>
                      <select class="form-control input-sm pull-right" name="keyword" style="width: 150px;">
                        
                         <option value="m_id"
                        <c:choose>
                        <c:when test="${requestScope.keyword eq 'm_id' }">
                        selected="selected"
                         </c:when>
                         </c:choose>>학번 / 관리자 번호</option>
                        <option value="m_name"   <c:choose>
                        <c:when test="${requestScope.keyword eq 'm_name' }">
                        selected="selected"
                         </c:when>
                         </c:choose>>이름</option>
                        <option value="m_dept"   <c:choose>
                        <c:when test="${requestScope.keyword eq 'm_dept' }">
                        selected="selected"
                         </c:when>
                         </c:choose>>학과</option>
                         <option value="m_point"   <c:choose>
                        <c:when test="${requestScope.keyword eq 'm_dept' }">
                        selected="selected"
                         </c:when>
                         </c:choose>>포인트</option>
                       
                      
                        
                        
                        
                        
                    
                      </select>
                     
                      <div class="input-group-btn" >
                        <button type="submit" class="btn btn-sm btn-default"><i class="fa fa-search"></i></button>
                      </div>
                       </form>
                    </div>
                    
                  </div>
                  
                </div><!-- /.box-header -->
                
                <div class="box-body">
                  <table class="table table-bordered table-striped">
                    <thead>
                      <tr>
                        <th>학번 / 관리자 번호</th>
                        <th>이름</th>
                        <th>학과</th>
                        <th>학년</th>
                        <th>보유 포인트</th>
                        <th>회원 등록 날짜</th>
                      </tr>
                    </thead>
                    <tbody>
                    
                    <c:choose>
						<c:when test="${fn:length(alllist2) eq 0}">
						</c:when>
          				<c:otherwise>
                      <c:forEach var="all" items="${requestScope.alllist2}"
                       begin="${paging.beginPerPage}"  end="${paging.beginPerPage + paging.numPerPage -1}">
                       <tr>
                        <td><a href="/HarangProject/myPage?cmd=AmemList&m_id=${all.m_id}" > ${all.m_id} </a></td>
                        <td>${all.m_name }</td>
                        <td>${all.m_dept}</td>
                        <td>${all.m_grade}</td>
                        <td>${all.m_point}</td>
                        <td>${all.m_regdate}</td>
                     
					 	  
                      </tr>
                          </c:forEach>
                        </c:otherwise>
                   </c:choose>
                  
                  
                    
                   
                    </tbody>
                  </table>
                     <div class="box-footer clearfix">
                   <ul class="pagination pagination-sm no-margin pull-right">
							<c:if test="${paging.nowBlock > 0}">
							<li><a href="javascript:prevPage()">&laquo;</a></li>
							</c:if>
						  <c:forEach var="i" begin="0" end="${paging.pagePerBlock-1}" step="1">
                            <!-- if문 추가 : 20170615 -->
                               <c:if test="${paging.nowBlock*paging.pagePerBlock+i < paging.totalPage}" >
                                    <li><a href="javascript:goPage('${paging.nowBlock*paging.pagePerBlock+i}')">${paging.nowBlock*paging.pagePerBlock+(i+1)}</a></li>
                               </c:if>
                            <!-- 끝 -->
						  </c:forEach>
						  	<c:if test="${paging.totalBlock > paging.nowBlock +1}">
							<li><a href="javascript:nextPage()">&raquo;</a></li>
							</c:if>
						</ul>
                </div><!-- /.box-body -->
                  
                </div><!-- /.box-body -->
                
              </div><!-- /.box -->
              
              
              <c:if test="${requestScope.read3 !=null }">
              
                <!-- Input addon -->
              <div class="box box-black">
                <div class="box-header">
                  <h3 class="box-title">개인 정보 수정</h3>
                  <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                    <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                  </div>
                </div>
                
                <!-- form 시작 -->
                <form role="form" name="input" onsubmit="return checkform()"  method="post" enctype="multipart/form-data">
                 <input type="hidden" name="alllist2" value="${requestScope.alllist2}" />
                <div class="box-body">
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-picture-o"></i>이미지</span>
                    <span class="input-group-addon  bg-gray">
   
                        <img src="${read3.m_photo}" id="local" class="img-rounded" height="90" width="90" alt="User Image"/>
                        
                    </span>
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-smile-o"></i> 이름</span>
                    <input type="text" name="m_name" class="form-control" value="${read3.m_name }" readonly="readonly">
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-money"></i> 보유 포인트</span>
                    <input type="text" name="m_point" class="form-control" value="${read3.m_point }" readonly="readonly">
                  </div>
                  <br>
                  <!-- 폼 태그 따로 줌 -->
                  
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-sort-numeric-desc"></i> 학번</span>
                    <input type="text" name="m_num" class="form-control" value="${read3.m_id }" required="required">
                    <span class="input-group-btn">
                      <button class="btn btn-success btn-flat" type="button">학번 수정</button>
                    </span>
                  </div>
                 
                  <br>
                  <!-- 폼 태그 따로 줌 -->
                  
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-sitemap"></i> 학과</span>
                    <input type="text" name="m_dept" class="form-control" value="${read3.m_dept }" required="required">
                    <span class="input-group-btn">
                      <button class="btn btn-success btn-flat" type="button">학과 수정</button>
                    </span>
                  </div>
                 
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-star"></i> 생년월일</span>
                    <input type="text" name="m_birth" class="form-control" value="${read3.m_birth }" readonly="readonly">
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-envelope"></i> 이메일</span>
                    <input type="text" name="m_mail1" class="form-control"  readonly="readonly">
                    <span class="input-group-addon bg-gray"> @ </span>
                    <input type="text" name="m_mail2" class="form-control" value="${m_mail1}" readonly="readonly">
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-phone-square"></i> 연락처</span>
                   <input type="text" name="m_tel1" class="form-control"  readonly="readonly">
                    <span class="input-group-addon bg-gray"> - </span>
                    <input type="text" name="m_tel2" class="form-control"  readonly="readonly">
                    <span class="input-group-addon bg-gray"> - </span>
                    <input type="text" name="m_tel3" class="form-control"  readonly="readonly">
                  </div>
                  <br>
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-location-arrow"></i> 우편번호</span>
                    <input type="text" name="m_addr1" class="form-control"  readonly="readonly">
                  </div>
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-location-arrow"></i> 우편번호 주소</span>
                    <input type="text" name="m_addr2" class="form-control"  readonly="readonly">
                  </div>
                  <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-location-arrow"></i> 상세 주소</span>
                    <input type="text" name="m_addr3" class="form-control"  readonly="readonly">
                  </div>
                  <br>
                </div><!-- /.box-body -->
              
                 <div class="box-footer" align="right">
                    <input type="button" class="btn" value="닫기">
                    <input type="submit" class="btn btn-danger" value="강퇴">
                </div>
                  </form>
              </div><!-- /.box -->
              </c:if>
              </div><!-- /.col -->
           </div><!-- /.row -->
        </section><!-- /. 작업 공간 끝! -->
<!------------------------------------------------------------------------------------------------------------------->        
      </div><!-- /. 전체를 감싸주는 틀입니다. 지우지 마세여. -->
        <!-- 페이징 관련 폼 ----------------------------------------------------------------------->
<!-- 페이징 : 이전 블록으로 이동하는 폼 -->
<form id="prevPage" method="post" action="/HarangProject/myPage?cmd=AmemList">
	<input type="hidden" name="nowPage" value="${paging.pagePerBlock * (paging.nowBlock-1)}"/>
	<input type="hidden" name="nowBlock" value="${paging.nowBlock-1}"/> 
	<input type="hidden" name="keyfield" value="${keyfield }" /> 
	<input type="hidden" name="keyword" value="${keyword }" />
</form>
<!-- 페이징 : 다음 블록으로 이동하는 폼 -->
<form id="nextPage" method="post" action="/HarangProject/myPage?cmd=AmemList">
	<input type="hidden" name="nowPage" value="${paging.pagePerBlock * (paging.nowBlock+1)}"/>
	<input type="hidden" name="nowBlock" value="${paging.nowBlock+1}"/>
	<input type="hidden" name="keyfield" value="${keyfield }" /> 
	<input type="hidden" name="keyword" value="${keyword }" />
</form>
<!-- 페이징 : 해당 페이지로 이동하는 폼 -->
<form id="goPage" method="post" action="/HarangProject/myPage?cmd=AmemList">
	<input type="hidden" name="nowPage" value="" id="page"/>
	<input type="hidden" name="nowBlock" value="${paging.nowBlock}"/>
	<input type="hidden" name="keyfield" value="${keyfield }" /> 
	<input type="hidden" name="keyword" value="${keyword }" />
</form>   


<form name="frmRead" method="post" action="/HarangProject/myPage?cmd=AmemList">
		<input type="hidden" name="m_id" />

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
function goPage(nowPage){
	document.getElementById("page").value = nowPage;
	document.getElementById("goPage").submit();
}

//로컬 업로드 사진 불러오기
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#local').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}
$("#imgInp").change(function(){
    readURL(this);
});






</script>
