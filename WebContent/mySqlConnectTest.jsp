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
<h1>MySQL ���� �׽�Ʈ</h1>
<%
//���� ���
	try{
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/harang";
		Connection con =
					DriverManager.getConnection(url,"harang","1111");
		
		if(con!=null){
			out.println("���Ἲ��");
		}
	}
	catch(Exception err){
		System.out.println("������� : " + err);
	}
	finally{
	}
%>
</body>
</html>