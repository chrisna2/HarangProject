<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../include/a_header.jsp" %>
<!-- 해더  삽입  [지우지마세여]------------------------------------------------------------------------------------------------->
<!-- 페이지 헤드 라인 : 제목 -->
<head>
     <title>수업 등록 수정</title>
</head>
	  <!-- 메인 페이지 구역 , 즉 작업 구역 -->
      <div class="content-wrapper">
<!----------------------------------- 메인페이지 헤더 [작업 제목] ------------------------------------------------------------->
        <section class="content-header">
          <h1>
             	수업 신규 등록
          </h1>
         <ol class="breadcrumb">
          <!-- 페이지 기록 : 메인에서 부터 현재 페이지 까지의 경로 나열 -->
            <li><a href="#"><i class="fa fa-dashboard"></i> 관리자 메인</a></li>
            <li><a href="#"> 사이트 관리</a></li>
            <li><a href="#"> 수업 등록 수정</a></li>
            <li class="active"> 수업 신규 등록</li>
          </ol>
        </section>
<!------------------------------------ 메인페이지 바디 [작업 내용] ------------------------------------------------------------>
        <section class="content">
          <!-- 세로 길이 수정 -->
          <div class="row">
           <!-- 너비 사이즈 수정  : col-->
           <div class="col-md-9">
           
             <div class="box">
                <form name="lesson" action="/HarangProject/myPage?cmd=AnewlessonUpdate" method="post">
                <div class="box-header">
                    <h3 class="box-title">${dinfo.l_name} [${dinfo.l_num}] 수업 수정</h3>
                </div>
                <div class="box-body">
                     <div class="input-group">
                          <span class="input-group-addon bg-gray"><i class="fa fa-sort-numeric-desc"></i> 개설 학기</span>
                          <select name="l_term" class="form-control input-sm" required="required">
                            <option></option>
                            <option value="1" ${dinfo.l_term eq '1' ? 'selected' : null }>1학기</option>
                            <option value="2" ${dinfo.l_term eq '2' ? 'selected' : null }>2학기</option>
                          </select>
                             <span class="input-group-addon bg-gray"><i class="fa fa-sort-numeric-desc"></i> 개설 학년</span>
                          <select name="l_grade" class="form-control input-sm" required="required">
                            <option></option>
                            <option value="1" ${dinfo.l_grade eq '1' ? 'selected' : null }>1학년</option>
                            <option value="2" ${dinfo.l_grade eq '2' ? 'selected' : null }>2학년</option>
                            <option value="3" ${dinfo.l_grade eq '3' ? 'selected' : null }>3학년</option>
                            <option value="4" ${dinfo.l_grade eq '4' ? 'selected' : null }>4학년</option>
                          </select>
                    </div>
                     <br>
                     <div class="input-group">
                          <span class="input-group-addon bg-gray"><i class="fa fa-sort-numeric-desc"></i> 개설 학과</span>
                          <select class="form-control input-sm" name="l_dept" required="required">
                            <option></option>
                           <c:forEach items="${dlist}" var="t">
                                    <option value="${t.l_dept}" ${dinfo.l_dept eq t.l_dept ? 'selected' : null }>${t.l_dept}</option> 
                                </c:forEach>
                          </select>
                          <span class="input-group-addon bg-gray"><i class="fa fa-sort-numeric-desc"></i> 선택 필수</span>
                          <select name="l_ismust" class="form-control input-sm" required="required">
                            <option></option>
                            <option value="선택" ${dinfo.l_ismust eq '선택' ? 'selected' : null }>선택</option>
                            <option value="필수" ${dinfo.l_ismust eq '필수' ? 'selected' : null }>필수</option>
                          </select>
                          <span class="input-group-addon bg-gray"><i class="fa fa-sort-numeric-desc"></i> 이수 학점</span>
                          <select name="l_credit" class="form-control input-sm" required="required">
                            <option></option>
                            <option value="1" ${dinfo.l_credit eq '1' ? 'selected' : null }>1</option>
                            <option value="2" ${dinfo.l_credit eq '2' ? 'selected' : null }>2</option>
                            <option value="3" ${dinfo.l_credit eq '3' ? 'selected' : null }>3</option>
                            <option value="4" ${dinfo.l_credit eq '4' ? 'selected' : null }>4</option>
                          </select>
                    </div>
                    <br>
                     <div class="input-group">
                          <span class="input-group-addon bg-gray"><i class="fa fa-sort-numeric-desc"></i> 수업 요일</span>
                          <select name="l_day" class="form-control input-sm" required="required">
                            <option></option>
                            <option value="월" ${dinfo.l_day eq '월' ? 'selected' : null }>월</option>
                            <option value="회" ${dinfo.l_day eq '화' ? 'selected' : null }>화</option>
	                        <option value="수" ${dinfo.l_day eq '수' ? 'selected' : null }>수</option>
	                        <option value="목" ${dinfo.l_day eq '목' ? 'selected' : null }>목</option>
	                        <option value="금" ${dinfo.l_day eq '금' ? 'selected' : null }>금</option>
                          </select>
                          <span class="input-group-addon bg-gray"><i class="fa fa-sort-numeric-desc"></i> 수업 시간</span>
                          <select name="l_time" class="form-control input-sm" required="required">
                            <option></option>
                            <option value="1-3" ${dinfo.l_time eq '1-3' ? 'selected' : null }>1-3교시</option>
                            <option value="4-6" ${dinfo.l_time eq '4-6' ? 'selected' : null }>4-6교시</option>
                            <option value="7-9" ${dinfo.l_time eq '7-9' ? 'selected' : null }>7-9교시</option>
                          </select>
                    </div>
                    <br>
                     <div class="input-group">
                          <span class="input-group-addon bg-gray"><i class="fa fa-sort-numeric-desc"></i> 교수님</span>
                            <select class="form-control input-sm" name="l_teacher" required="required">                        
                                 <option></option>   
                                <c:forEach items="${tlist}" var="t">
                                    <option value="${t.l_teacher}" ${t.l_teacher eq dinfo.l_teacher ? 'selected' : null }>${t.l_teacher}</option> 
                                </c:forEach>
                            </select>
                          <span class="input-group-addon bg-gray"><i class="fa fa-sort-numeric-desc"></i> 강의실</span>
                          <select class="form-control input-sm" name="l_room" required="required">                        
                                 <option></option>   
                                <c:forEach items="${rlist}" var="t">
                                    <option value="${t.l_room}" ${t.l_room eq dinfo.l_room ? 'selected' : null }>${t.l_room}</option> 
                                </c:forEach>
                            </select>
                    </div>
                    <br>
                     <div class="input-group">
                          <span class="input-group-addon bg-gray"><i class="fa fa-sort-numeric-desc"></i> 수업명</span>
                            <input type="text" class="form-control input-sm" name="l_name" value="${dinfo.l_name}" required="required">                        
                      </div>
                </div>
                <div class="box-footer clearfix" align="right">
                    <input type="hidden" name="l_num" value="${dinfo.l_num}">
                    <input type="hidden" name="check" value="update">
                    <button type="button" class="btn btn-info" onclick="tfindtt()">선생님 시간표 검색</button>
                    <button type="button" class="btn btn-info" onclick="rfindtt()">수강실 시간표 검색</button>
                    <button type="button" class="btn btn-gray"> 취소  </button>
                    <button type="submit" class="btn btn-success"> 수업 수정 </button>
                </div>
           </form>
            </div>
            
            <!-- 수업 시간표 -->
             <div class="box">
                <div class="box-header">
                  <h3 class="box-title">시간표 현황</h3>
                   <div class="box-tools">
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
                    <tr id="t1">
                      <td class="bg-gray"><br><b>1교시</b><br>[9시 ~ 10시]</td>
                      <td id="d1"></td>
                      <td id="d2"></td>
                      <td id="d3"></td>
                      <td id="d4"></td>
                      <td id="d5"></td>
                    </tr>
                    <tr id="t2">
                     <td class="bg-gray"><br><b>2교시</b><br>[10시 ~ 11시]</td>
                      <td id="d1"></td>
                      <td id="d2"></td>
                      <td id="d3"></td>
                      <td id="d4"></td>
                      <td id="d5"></td>
                    </tr>
                    <tr id="t3">
                       <td class="bg-gray"><br><b>3교시</b><br>[11시 ~ 12시]</td>
                      <td id="d1"></td>
                      <td id="d2"></td>
                      <td id="d3"></td>
                      <td id="d4"></td>
                      <td id="d5"></td>
                    </tr>
                    <tr id="t4">
                       <td class="bg-gray"><br><b>4교시</b><br>[12시 ~ 13시]</td>
                      <td id="d1"></td>
                      <td id="d2"></td>
                      <td id="d3"></td>
                      <td id="d4"></td>
                      <td id="d5"></td>
                    </tr>
                    <tr id="t5">
                       <td class="bg-gray"><br><b>5교시</b><br>[13시 ~ 14시]</td>
                      <td id="d1"></td>
                      <td id="d2"></td>
                      <td id="d3"></td>
                      <td id="d4"></td>
                      <td id="d5"></td>
                    </tr>
                    <tr id="t6">
                      <td class="bg-gray"><br><b>6교시</b><br>[14시 ~ 15시]</td>
                      <td id="d1"></td>
                      <td id="d2"></td>
                      <td id="d3"></td>
                      <td id="d4"></td>
                      <td id="d5"></td>
                    </tr>
                    <tr id="t7">
                      <td class="bg-gray"><br><b>7교시</b><br>[15시 ~ 16시]</td>
                      <td id="d1"></td>
                      <td id="d2"></td>
                      <td id="d3"></td>
                      <td id="d4"></td>
                      <td id="d5"></td>
                    </tr>
                    <tr id="t8">
                       <td class="bg-gray"><br><b>8교시</b><br>[16시 ~ 17시]</td>
                      <td id="d1"></td>
                      <td id="d2"></td>
                      <td id="d3"></td>
                      <td id="d4"></td>
                      <td id="d5"></td>
                    </tr>
                    <tr id="t9">
                       <td class="bg-gray"><br><b>9교시</b><br>[17시 ~ 18시]</td>
                      <td id="d1"></td>
                      <td id="d2"></td>
                      <td id="d3"></td>
                      <td id="d4"></td>
                      <td id="d5"></td>
                    </tr>
                   </tbody>
                  </table>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
              </div><!-- /.col -->
           </div><!-- /.row -->
        </section><!-- /. 작업 공간 끝! -->
<!------------------------------------------------------------------------------------------------------------------->        
      </div><!-- /. 전체를 감싸주는 틀입니다. 지우지 마세여. -->
      
<!-- 푸터(footer) 삽입 [지우지 마세여] ------------------------------------------------------------------------------------------------------> 
<%@ include file="../include/footer.jsp" %>

<script>
function tfindtt() {

    var l_check = "teacher";
    var al_term = lesson.l_term.value;
    var al_teacher = lesson.l_teacher.value;
	
    if(null == al_term||"" == al_term){
        alert("수업 학기를 선택 해 주세요");
        return;
        }
    if(null == al_teacher||"" == al_teacher){
        alert("수업 교수를 선택 해 주세요");
        return;
        }
	
	
    $.getJSON(
    		"/HarangProject/ajax?cmd=findtt", 
    		{check:l_check,l_term:al_term,l_teacher:encodeURIComponent(al_teacher)}, 
    	    function(data) {
    			$(data).each(function(index, ttlist){
    			      // 요일  -> 날짜 숫자로 변환
    			       var day = ttlist.l_day;
    			        var daynum = 0;
    			        if(day=="월"){
    			            daynum = 1;
    			            }
    			        else if(day=="화"){
    			            daynum = 2;
    			            }
    			        else if(day=="수"){
    			            daynum = 3;
    			            }
    			        else if(day=="목"){
    			            daynum = 4;
    			            }
    			        else if(day=="금"){
    			            daynum = 5;
    			            }
    			        //alert(daynum);
    			        
    			        // 시간
    			        var time = ttlist.l_time;
    			        // 1-3 ,4-6, 7-9 
    			        var sptime = time.split("-");
    			        var start = sptime[0];
    			        //alert(start);
    			        var end = sptime[1];
    			        //alert(end);
    			        
    			        // 수업 이름
    			        var name = ttlist.l_name;
    			        
    			        // 강의실
    			        var room = ttlist.l_room;

    			        // 교수00
    			        var teacher = ttlist.l_teacher;

    			        // 학과별 색상 변경
    			        var dept =  ttlist.l_dept;
    			        var color = "";
    			        if(dept=="경영학과"){
    			            color = "#EECECE";
    			            }
    			        else if(dept=="교양학과"){
    			            color = "#EFF7BE";
    			            }
    			        else if(dept=="국어국문학과"){
    			            color = "#BEDDF7";
    			            }
    			        else if(dept=="수학과"){
    			            color = "#BEF7EA";
    			            }
    			        else if(dept=="산업디자인학과"){
    			            color = "#F4DBAF";
    			            }
    			        else if(dept=="컴퓨터공학과"){
    			            color = "#E0A8FF";
    			            }
    			        // 시간표에 해당 내용을 올리는 For문
    			        for(i=start;i<=end;i++){
    			            $("#t"+i+" > #d"+daynum)
    			            .css("background",color)
    			            .html(name+"<br>"+room+"<br>"+teacher);
    			        }
    			});
    });
}
function rfindtt() {

    var l_check = "room";
    var al_term = lesson.l_term.value;
    var al_room = lesson.l_room.value;
    
    if(null == al_term||"" == al_term){
        alert("수업 학기를 선택 해 주세요");
        return;
        }
    if(null == al_room||"" == al_room){
        alert("수업 교실를 선택 해 주세요");
        return;
        }
    
    
    $.getJSON(
            "/HarangProject/ajax?cmd=findtt", 
            {check:l_check,l_term:al_term,l_room:encodeURIComponent(al_room)}, 
            function(data) {
                $(data).each(function(index, ttlist){
                      // 요일  -> 날짜 숫자로 변환
                       var day = ttlist.l_day;
                        var daynum = 0;
                        if(day=="월"){
                            daynum = 1;
                            }
                        else if(day=="화"){
                            daynum = 2;
                            }
                        else if(day=="수"){
                            daynum = 3;
                            }
                        else if(day=="목"){
                            daynum = 4;
                            }
                        else if(day=="금"){
                            daynum = 5;
                            }
                        //alert(daynum);
                        
                        // 시간
                        var time = ttlist.l_time;
                        // 1-3 ,4-6, 7-9 
                        var sptime = time.split("-");
                        var start = sptime[0];
                        //alert(start);
                        var end = sptime[1];
                        //alert(end);
                        
                        // 수업 이름
                        var name = ttlist.l_name;
                        
                        // 강의실
                        var room = ttlist.l_room;

                        // 교수00
                        var teacher = ttlist.l_teacher;

                        // 학과별 색상 변경
                        var dept =  ttlist.l_dept;
                        var color = "";
                        if(dept=="경영학과"){
                            color = "#EECECE";
                            }
                        else if(dept=="교양학과"){
                            color = "#EFF7BE";
                            }
                        else if(dept=="국어국문학과"){
                            color = "#BEDDF7";
                            }
                        else if(dept=="수학과"){
                            color = "#BEF7EA";
                            }
                        else if(dept=="산업디자인학과"){
                            color = "#F4DBAF";
                            }
                        else if(dept=="컴퓨터공학과"){
                            color = "#E0A8FF";
                            }
                        // 시간표에 해당 내용을 올리는 For문
                        for(i=start;i<=end;i++){
                            $("#t"+i+" > #d"+daynum)
                            .css("background",color)
                            .html(name+"<br>"+room+"<br>"+teacher);
                        }
                });
    });

    
}


</script>