<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>

<c:if test="${msg eq 'challenge_success'}">
    <script type="text/javascript">
    alert("해당 자격증이 심사에 올라갔습니다.");
    location.href = "/HarangProject/myPage?cmd=specUp";
    </script>
</c:if>
<c:if test="${msg eq 'challenge_fail'}">
    <script type="text/javascript">
    alert("해당 자격증 전송이 실패 했습니다.");
    location.href = "/HarangProject/myPage?cmd=specUp";
    </script>
</c:if>
<c:if test="${msg eq 'rechallenge_success'}">
    <script type="text/javascript">
    alert("해당 자격증이 재심사에 올라갔습니다.");
    location.href = "/HarangProject/myPage?cmd=specUp";
    </script>
</c:if>
<c:if test="${msg eq 'rechallenge_fail'}">
    <script type="text/javascript">
    alert("해당 자격증 전송이 실패 했습니다.");
    location.href = "/HarangProject/myPage?cmd=specUp";
    </script>
</c:if>
</body>
</html>