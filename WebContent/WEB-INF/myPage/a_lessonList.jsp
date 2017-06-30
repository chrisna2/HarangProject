<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../include/a_header.jsp" %>
<!-- 해더  삽입  [지우지마세여]------------------------------------------------------------------------------------------------->
<!-- 페이지 헤드 라인 : 제목 -->
<head>
     <title>수업 등록 수정</title>
<c:if test="${result eq 'insert_complete'}">
    <script type="text/javascript">
    alert("신규 수업이 등록 되었습니다.");
    </script>
</c:if>   
<c:if test="${result eq 'insert_fail'}">
    <script type="text/javascript">
    alert("신규 수업이 등록 실패 했습니다.");
    </script>
</c:if>
<c:if test="${result eq 'update_complete'}">
    <script type="text/javascript">
    alert("해당 수업이 수정 되었습니다.");
    </script>
</c:if>
<c:if test="${result eq 'update_fail'}">
    <script type="text/javascript">
    alert("해당 수업이 수정 실패 했습니다.");
    </script>
</c:if>   
</head>
	  <!-- 메인 페이지 구역 , 즉 작업 구역 -->
      <div class="content-wrapper">
<!----------------------------------- 메인페이지 헤더 [작업 제목] ------------------------------------------------------------->
        <section class="content-header">
          <h1>
             	수업 등록 수정
          </h1>
         <br>
         <form name="newlesson" action="/HarangProject/myPage?cmd=Anewlesson" method="post">
            <input type="submit" class="btn btn-success col-md-9 col-xs-9" value="수업 신규 등록">
         </form>
         <br>
         <br>
         <ol class="breadcrumb">
          <!-- 페이지 기록 : 메인에서 부터 현재 페이지 까지의 경로 나열 -->
            <li><a href="#"><i class="fa fa-dashboard"></i> 관리자 메인</a></li>
            <li><a href="#"> 사이트 관리</a></li>
            <li class="active"> 수업 등록 수정 </li>
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
                  <h3 class="box-title">수업 목록</h3>
                   <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                    <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                  </div>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <table class="table table-bordered table-striped">
                    <thead>
                      <tr>
                        <th>수업 번호</th>
                        <th>주요 학과</th>
                        <th>필수 여부</th>
                        <th>수업 명</th>
                        <th>대상 학년</th>
                        <th>학기</th>
                        <th>수업 요일</th>
                        <th>수업 시간</th>
                        <th>교수님</th>
                        <th>강의실</th>
                        <th>이수 학점</th>
                        <th>시간표 수정</th>
                      </tr>
                    </thead>
                    <tbody>
                      <c:choose>
                        <c:when test="${fn:length(llist) eq 0}">
                        </c:when>
                        <c:otherwise>
                        <c:forEach items="${llist}"
                          begin="${paging.beginPerPage}" 
                          end="${paging.beginPerPage + paging.numPerPage -1}" 
                          varStatus="i"
                          var="l">
                          <tr>
                            <td>${l.l_num}</td>
                            <td>${l.l_dept}</td>
                            <td>${l.l_ismust}</td>
                            <td>${l.l_name}</td>
                            <td>${l.l_grade}</td>
                            <td>${l.l_term}</td>
                            <td>${l.l_day}</td>
                            <td>${l.l_time}</td>
                            <td>${l.l_teacher}</td>
                            <td>${l.l_room}</td>
                            <td>${l.l_credit}</td>
                            <td><input type="button" onclick="updatelesson('${l.l_num}')"  class="btn btn-primary" value="수업 수정" /></td>
                          </tr>
                            </c:forEach>
                        </c:otherwise>
                        </c:choose>
                    </tbody>
                  </table>
                </div><!-- /.box-body -->
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
                    <!-- 검색 폼 -->    
                    <form name="search" method="post" action="/HarangProject/myPage?cmd=Alesson">
                      <div class="input-group">
                          <input type="hidden" name="grade" value="${grade}"/>
                          <input type="hidden" name="term" value="${term}"/>
                          <input type="hidden" name='check' value="search">
                          <select name="keyfield" class="form-control input-sm pull-left" style="width: 150px;">
                            <option value="l_num" ${keyfield eq 'l_num' ? 'selected' : null }>수업 번호</option>
                            <option value="l_dept" ${keyfield eq 'l_dept' ? 'selected' : null }>주요 학과</option>
                            <option value="l_ismust" ${keyfield eq 'l_ismust' ? 'selected' : null }>필수 여부</option>
                            <option value="l_name" ${keyfield eq 'l_name' ? 'selected' : null }>수업명</option>
                            <option value="l_grade" ${keyfield eq 'l_grade' ? 'selected' : null }>대상 학년</option>
                            <option value="l_day" ${keyfield eq 'l_day' ? 'selected' : null }>수업 요일</option>
                            <option value="l_time" ${keyfield eq 'l_time' ? 'selected' : null }>수업 시간</option>
                            <option value="l_teacher" ${keyfield eq 'l_teacher' ? 'selected' : null }>교수님</option>
                            <option value="l_room" ${keyfield eq 'l_room' ? 'selected' : null }>강의실</option>
                            <option value="l_credit" ${keyfield eq 'l_credit' ? 'selected' : null }>이수 학점</option>
                          </select>
                          <input type="text" name="keyword" class="form-control input-sm  pull-left" style="width: 150px;" value="${keyword}"/>
                         <div class="input-group-btn  pull-left">
                            <button type="submit" class="btn btn-sm btn-primary"> 검색 <i class="fa fa-search"></i></button>
                         </div>
                      </div>
                    </form>
                </div>
              </div><!-- /.box -->
		          
              </div><!-- /.col -->
           </div><!-- /.row -->
        </section><!-- /. 작업 공간 끝! -->
<!------------------------------------------------------------------------------------------------------------------->        
      </div><!-- /. 전체를 감싸주는 틀입니다. 지우지 마세여. -->
      <!-- 페이징 : 이전 블록으로 이동하는 폼 -->
<form id="prevPage" method="post" action="/HarangProject/myPage?cmd=Alesson">
    <input type="hidden" name="nowPage" value="${paging.pagePerBlock * (paging.nowBlock-1)}"/>
    <input type="hidden" name="nowBlock" value="${paging.nowBlock-1}"/>
    <input type="hidden" name="keyword" value="${keyword}"/>
    <input type="hidden" name="keyfield" value="${keyfield}"/>
</form>
<!-- 페이징 : 다음 블록으로 이동하는 폼 -->
<form id="nextPage" method="post" action="/HarangProject/myPage?cmd=Alesson">
    <input type="hidden" name="nowPage" value="${paging.pagePerBlock * (paging.nowBlock+1)}"/>
    <input type="hidden" name="nowBlock" value="${paging.nowBlock+1}"/>
    <input type="hidden" name="keyword" value="${keyword}"/>
    <input type="hidden" name="keyfield" value="${keyfield}"/>
</form>
<!-- 페이징 : 해당 페이지로 이동하는 폼 -->
<form id="goPage" method="post" action="/HarangProject/myPage?cmd=Alesson">
    <input type="hidden" name="nowPage" value="" id="page"/>
    <input type="hidden" name="nowBlock" value="${paging.nowBlock}"/>
    <input type="hidden" name="keyword" value="${keyword}"/>
    <input type="hidden" name="keyfield" value="${keyfield}"/>
</form>
<!-- 수업 수정 : 수업 시간 수정 -->
<form id="update" name="update" method="post" action="/HarangProject/myPage?cmd=Aupdatelesson">
    <input type="hidden" name="l_num" value=""> 
</form>
      
<!-- 푸터(footer) 삽입 [지우지 마세여] ------------------------------------------------------------------------------------------------------> 
<%@ include file="../include/footer.jsp" %>
<script>
//페이징
function prevPage() {
    document.getElementById("prevPage").submit();
}
function nextPage() {
    document.getElementById("nextPage").submit();
}
function goPage(nowPage) {
    document.getElementById("page").value = nowPage;
    document.getElementById("goPage").submit();
}
function updatelesson(l_num) {

	update.l_num.value = l_num;
    //alert(update.l_num.value);
    update.submit();
	
}

</script>