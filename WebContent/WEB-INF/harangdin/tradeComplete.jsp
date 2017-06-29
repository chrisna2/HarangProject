<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<c:if test="${result eq 'success'}">
    <script type="text/javascript">
    alert("거래가 완료 되었습니다.");
    location.href="/HarangProject/harangdin?cmd=main";
    </script>
</c:if>   
<c:if test="${result eq 'fail'}">
    <script type="text/javascript">
    alert("거래가 실패 하였습니다. 관리자에게 문의해주십시오");
    location.href="/HarangProject/harangdin?cmd=main";
    </script>
</c:if>
</body>
</html>