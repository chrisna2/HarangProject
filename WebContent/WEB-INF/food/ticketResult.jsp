<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<c:if test="${result eq 'used'}">
    <script type="text/javascript">
    alert("해당 식권이 사용 되었습니다.");
    location.href="/HarangProject/food?cmd=ticket";
    </script>
</c:if>   
<c:if test="${result eq 'return'}">
    <script type="text/javascript">
    alert("해당 식권이 환불 되었습니다.");
    location.href="/HarangProject/food?cmd=ticket";
    </script>
</c:if>
</body>
</html>