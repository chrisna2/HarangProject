<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp" %>
<!-- 해더  삽입  [지우지마세여]------------------------------------------------------------------------------------------------->
<!-- 페이지 헤드 라인 : 제목 -->
<head>
     <title>수강 시간표 작성</title>
     <meta http-equiv="Expires" content="-1"/>
     <meta http-equiv="Pragma" content="no-cache"/>
     <meta http-equiv="Cache-Control" content="no-cache"/>
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
     <meta http-equiv="X-UA-Compatible" content="IE=edge"/>

     <link rel="stylesheet" type="text/css" href="../plugins/hanpyo/libs/dhtmlx/skins/web/dhtmlxgrid.css"/>
     <link rel="stylesheet" type="text/css" href="../plugins/hanpyo/main.css"/>
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
           <div class="col-md-12">
                <div id="gridBox">
            <input type="text" id="filter" size=14 placeholder="검색...">
            <button type="button" id="btnEnter">검색</button>
            <select id="comboDep">
                <option value="">개설학부</option>
                <option value="컴퓨터">컴퓨터</option>
                <option value="전기">전전통</option>
                <option value="에너지">에신화</option>
                <option value="산업경">산경</option>
                <option value="메카트">메카</option>
                <option value="기계공">기계</option>
                <option value="디자인">디공,건축</option>
                <option value="문리H">문리HRD</option>
            </select>
            <button type="button" id="btnCart">과목담기</button>
            <div id="grid1"></div>

            <button type="button" id="btnUncart">과목빼기</button>
            <button type="button" id="btnUncartAll">초기화</button>
            <div id="totalCredits">신청학점 : 0</div>
            <div id="grid2"></div>
            
        </div>
        
        
        <div id="canvasBox">
            <button type="button" id="btnInfo">도움말</button>
            <a id="btnSave" download="table.png">
                <button type="button">이미지 저장</button></a>
            <button type="button" id="btnShare">Facebook 공유</button>
            <button type="button" id="btnLinkShare">링크공유</button>
            <br>
            <canvas id="canvas" width=484 height=645></canvas>
        </div>

        <div id="svimg">
        </div>
        <div id="svtxt">
        </div>

              </div><!-- /.col -->
           </div><!-- /.row -->
        </section><!-- /. 작업 공간 끝! -->
<!------------------------------------------------------------------------------------------------------------------->        
      </div><!-- /. 전체를 감싸주는 틀입니다. 지우지 마세여. -->
      
<!-- 푸터(footer) 삽입 [지우지 마세여] ------------------------------------------------------------------------------------------------------> 
<%@ include file="../include/footer.jsp" %>
    <script src="../plugins/hanpyo/iecheck.js"></script>
    <script src="../plugins/hanpyo/libs/dhtmlx/codebase/dhtmlxgrid.js"></script>
    <script src="../plugins/hanpyo/dbt/dbt170228.jsd?v=2"></script>
    <script src="../plugins/hanpyo/util.js?v=3"></script>
    <script src="../plugins/hanpyo/canvas.js?v=1"></script>
    <script src="../plugins/hanpyo/index.js?v=6"></script>
    <script>
        (function(i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r;
            i[r] = i[r] || function() {
                (i[r].q = i[r].q || []).push(arguments)
            }, 
            i[r].l = 1 * new Date();
            a = s.createElement(o),
              m = s.getElementsByTagName(o)[0];
            a.async = 1;
            a.src = g;
            m.parentNode.insertBefore(a, m)
        })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');
        ga('create', 'UA-72344028-1', 'auto');
        ga('send', 'pageview');
    </script>