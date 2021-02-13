<%@ page language="java" contentType = "text/html; charset = UTF-8" pageEncoding = "UTF-8" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>MyLibrary</title>
<meta name=viewport content="width=device-width, initial-scale=1, user-scalable=0">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="css/core.css">
</head>
<body>
<div class="page-hdr">회원 목록</div>
<div class="page-body">
<%
	Class.forName("com.mysql.jdbc.Driver");

	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mylibrary", "root", "1111");
	
	Statement st = conn.createStatement();
	
	String str = "<table border=1>";
	ResultSet rs = st.executeQuery("SELECT id, name, email FROM user");
	
	while(rs.next()) {
		str += "<tr>";
		str += "<td width =200>" + rs.getString("id") + "</td>";
		str += "<td width =200>" + rs.getString("name") + "</td>";
		str += "<td width =200>" + rs.getString("email") + "</td>";
		str += "<td><a href='userDelete.jsp?id=" + rs.getString("id") + "'>";
		str += "<button>삭제</button>";
		str += "</a></td>";
		str += "</tr>";
	}
	str += "</table>";
	out.print(str);
	
	rs.close();
	st.close();
	conn.close();
%>
</div>
</body>
</html>