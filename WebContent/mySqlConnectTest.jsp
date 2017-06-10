<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>MySQL 연결 테스트</h1>
<%
//연결 모듈
	try{
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/harang";
		Connection con =
					DriverManager.getConnection(url,"harang","1111");
		
		if(con!=null){
			out.println("연결성공");
		}
	}
	catch(Exception err){
		System.out.println("연결실패 : " + err);
	}
	finally{
	}
%>
</body>
</html>