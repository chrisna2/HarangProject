<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<c:if test="${tradecheck eq 'complete'}">
<script>
alert("시설 예약이 완료 되었습니다.");
location.href="/HarangProject/facil?cmd=FacilMain"
</script>
</c:if>
<c:if test="${tradecheck eq 'overpoint' and facheck eq 'pg'}">
<script>
alert("운동장 예약이 실패 했습니다.");
location.href="/HarangProject/facil?cmd=FacilPGreserv"
</script>
</c:if>
<c:if test="${tradecheck eq 'overpoint' and facheck eq 'sr'}">
<script>
alert("스터디룸 예약이 실패 했습니다.");
location.href="/HarangProject/facil?cmd=FacilSRreserv"
</script>
</c:if>