<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../include/header.jsp" %>
<!-- 해더  삽입  [지우지마세여]------------------------------------------------------------------------------------------------->
<!-- 페이지 헤드 라인 : 제목 -->
<head>
     <title>수강 시간표 작성</title>
     <style type="text/css">
        td{
            text-align:center;
            height:80px;
        }
        th{
            text-align:center;
        }
     </style>
</head>
	  <!-- 메인 페이지 구역 , 즉 작업 구역 -->
      <div class="content-wrapper">
<!----------------------------------- 메인페이지 헤더 [작업 제목] ------------------------------------------------------------->
        <section class="content-header">
          <h1>
             	수강 시간표
            <small>당신의 수강 시간표를 미리 작성해 보세요</small>
          </h1>
          <ol class="breadcrumb">
          <!-- 페이지 기록 : 메인에서 부터 현재 페이지 까지의 경로 나열 -->
            <li><a href="#"><i class="fa fa-dashboard"></i> 메인</a></li>
            <li><a href="#"> 마이페이지</a></li>
            <li class="active"> 수강 시간표</li>
          </ol>
        </section>
<!------------------------------------ 메인페이지 바디 [작업 내용] ------------------------------------------------------------>
        <section class="content">
          <!-- 세로 길이 수정 -->
          <div class="row">
           <!-- 너비 사이즈 수정  : col-->
           <div class="col-md-9">
             
           <!-- 수업 시간표 -->
             <div class="box">
                <div class="box-header">
                  <h3 class="box-title">${ttname} 당신의 시간표</h3>
                   <div class="box-tools">
                    <form action="/HarangProject/myPage?cmd=timeTable" method="post" name="timetable">
                     <div class="input-group">
                          <select name="term" class="form-control input-sm pull-right" style="width: 15%;">
                            <option value="1" ${term eq '1' ? 'selected' : null }>1학기</option>
                            <option value="2" ${term eq '2' ? 'selected' : null }>2학기</option>
                          </select>
                          <select name="grade" class="form-control input-sm pull-right" style="width: 15%;">
                            <option value="1" ${grade eq '1' ? 'selected' : null }>1학년</option>
                            <option value="2" ${grade eq '2' ? 'selected' : null }>2학년</option>
                            <option value="3" ${grade eq '3' ? 'selected' : null }>3학년</option>
                            <option value="4" ${grade eq '4' ? 'selected' : null }>4학년</option>
                          </select>
                          <div class="input-group-btn">
                          <input type="hidden" name='check' value="findtt">
                        <button type="submit" class="btn btn-sm btn-primary">&nbsp;&nbsp;&nbsp; 시간표 조회  &nbsp;&nbsp;&nbsp;<i class="fa fa-search">&nbsp;</i></button>
                      </div>
                    </div>
                    </form>
                  </div>
                </div><!-- /.box-header -->
                <div class="box-body">
                  <table class="table table-bordered table-striped" style="border-color: #9E9E9E">
                  <colgroup>
                    <col class="col-md-1 col-xs-1">
                    <col class="col-md-2 col-xs-2"> 
                    <col class="col-md-2 col-xs-2"> 
                    <col class="col-md-2 col-xs-2"> 
                    <col class="col-md-2 col-xs-2"> 
                    <col class="col-md-2 col-xs-2"> 
                  </colgroup>
                  <thead>
                    <tr class="bg-gray">
                      <th></th>
                      <th>월요일</th>
                      <th>화요일</th>
                      <th>수요일</th>
                      <th>목요일</th>
                      <th>금요일</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td class="bg-gray"><br><b>1교시</b><br>[9시 ~ 10시]</td>
                      <td id="T11"></td>
                      <td id="T21"></td>
                      <td id="T31"></td>
                      <td id="T41"></td>
                      <td id="T51"></td>
                    </tr>
                    <tr>
                     <td class="bg-gray"><br><b>2교시</b><br>[10시 ~ 11시]</td>
                      <td id="T12"></td>
                      <td id="T22"></td>
                      <td id="T32"></td>
                      <td id="T42"></td>
                      <td id="T52"></td>
                    </tr>
                    <tr>
                       <td class="bg-gray"><br><b>3교시</b><br>[11시 ~ 12시]</td>
                      <td id="T13"></td>
                      <td id="T23"></td>
                      <td id="T33"></td>
                      <td id="T43"></td>
                      <td id="T53"></td>
                    </tr>
                    <tr>
                       <td class="bg-gray"><br><b>4교시</b><br>[12시 ~ 13시]</td>
                      <td id="T14"></td>
                      <td id="T24"></td>
                      <td id="T34"></td>
                      <td id="T44"></td>
                      <td id="T54"></td>
                    </tr>
                    <tr>
                       <td class="bg-gray"><br><b>5교시</b><br>[13시 ~ 14시]</td>
                      <td id="T15"></td>
                      <td id="T25"></td>
                      <td id="T35"></td>
                      <td id="T45"></td>
                      <td id="T55"></td>
                    </tr>
                    <tr>
                       <td class="bg-gray"><br><b>6교시</b><br>[14시 ~ 15시]</td>
                      <td id="T16"></td>
                      <td id="T26"></td>
                      <td id="T36"></td>
                      <td id="T46"></td>
                      <td id="T56"></td>
                    </tr>
                    <tr>
                       <td class="bg-gray"><br><b>7교시</b><br>[15시 ~ 16시]</td>
                      <td id="T17"></td>
                      <td id="T27"></td>
                      <td id="T37"></td>
                      <td id="T47"></td>
                      <td id="T57"></td>
                    </tr>
                    <tr>
                       <td class="bg-gray"><br><b>8교시</b><br>[16시 ~ 17시]</td>
                      <td id="T18"></td>
                      <td id="T28"></td>
                      <td id="T38"></td>
                      <td id="T48"></td>
                      <td id="T58"></td>
                    </tr>
                    <tr>
                       <td class="bg-gray"><br><b>9교시</b><br>[17시 ~ 18시]</td>
                      <td id="T19"></td>
                      <td id="T29"></td>
                      <td id="T39"></td>
                      <td id="T49"></td>
                      <td id="T59"></td>
                    </tr>
                   </tbody>
                  </table>
                </div><!-- /.box-body -->
              </div><!-- /.box -->

 <!-- 리스트 사용시  -->
             <div class="box">
                <div class="box-header">
                  <h3 class="box-title">${ttname} 시간표 출력 목록</h3>
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
                        <th>시간표 등록</th>
                      </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${ttlist}"
                          varStatus="i"
                          var="tt">
                          <tr>
                            <td>${tt.l_num}</td>
                            <td>${tt.l_dept}</td>
                            <td>${tt.l_ismust}</td>
                            <td>${tt.l_name}</td>
                            <td>${tt.l_grade}</td>
                            <td>${tt.l_term}</td>
                            <td>${tt.l_day}</td>
                            <td>${tt.l_time}</td>
                            <td>${tt.l_teacher}</td>
                            <td>${tt.l_room}</td>
                            <td>${tt.l_credit}</td>
                            <c:choose>
                                <c:when test="${tt.m_id eq member.m_id}">
                                   <td><input type="button" class="btn btn-danger" value="등록 취소"></td>
                                </c:when>
                            </c:choose>
                          </tr>
                            </c:forEach>
                    </tbody>
                  </table>
                </div><!-- /.box-body -->
              </div><!-- /.box -->


            <!-- 리스트 사용시  -->
             <div class="box">
                <div class="box-header">
                  <h3 class="box-title">${ttname} 수업 목록</h3>
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
                        <th>시간표 등록</th>
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
	                        <c:choose>
		                        <c:when test="${l.m_id eq member.m_id}">
		                           <td><input type="button" class="btn btn-danger" value="등록 취소"></td>
		                        </c:when>
		                        <c:otherwise>
	                               <td><input type="button" class="btn btn-primary" value="시간표 등록"></td>
	                            </c:otherwise>
	                        </c:choose>
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
                    <form action="">
                      <div class="input-group">
                          <select name="keyfield" class="form-control input-sm pull-left" style="width: 150px;">
                            <option ${requestScope.keyfield eq 'r_regdate' ? 'selected' : null }>거래 날짜</option>
                            <option>거래 내용</option>
                            <option>포인트</option>
                            <option>출금 대상</option>
                            <option>입금 대상</option>
                          </select>
                          <input type="text" name="keyword" class="form-control input-sm  pull-left" style="width: 150px;" placeholder="Search"/>
                         <div class="input-group-btn  pull-left">
                            <button class="btn btn-sm btn-primary"> 검색 <i class="fa fa-search"></i></button>
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
<form id="prevPage" method="post" action="/HarangProject/myPage?cmd=timeTable">
    <input type="hidden" name="nowPage" value="${paging.pagePerBlock * (paging.nowBlock-1)}"/>
    <input type="hidden" name="nowBlock" value="${paging.nowBlock-1}"/>
    <input type="hidden" name="grade" value="${grade}"/>
    <input type="hidden" name="term" value="${term}"/>
    <input type="hidden" name="keyword" value="${keyword}"/>
    <input type="hidden" name="keyfield" value="${keyfield}"/>
</form>
<!-- 페이징 : 다음 블록으로 이동하는 폼 -->
<form id="nextPage" method="post" action="/HarangProject/myPage?cmd=timeTable">
    <input type="hidden" name="nowPage" value="${paging.pagePerBlock * (paging.nowBlock+1)}"/>
    <input type="hidden" name="nowBlock" value="${paging.nowBlock+1}"/>
    <input type="hidden" name="grade" value="${grade}"/>
    <input type="hidden" name="term" value="${term}"/>
    <input type="hidden" name="keyword" value="${keyword}"/>
    <input type="hidden" name="keyfield" value="${keyfield}"/>
</form>
<!-- 페이징 : 해당 페이지로 이동하는 폼 -->
<form id="goPage" method="post" action="/HarangProject/myPage?cmd=timeTable">
    <input type="hidden" name="nowPage" value="" id="page"/>
    <input type="hidden" name="nowBlock" value="${paging.nowBlock}"/>
    <input type="hidden" name="grade" value="${grade}"/>
    <input type="hidden" name="term" value="${term}"/>
    <input type="hidden" name="keyword" value="${keyword}"/>
    <input type="hidden" name="keyfield" value="${keyfield}"/>
</form>
<!-- 푸터(footer) 삽입 [지우지 마세여] ------------------------------------------------------------------------------------------------------> 
<%@ include file="../include/footer.jsp" %>
<script>
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
</script>