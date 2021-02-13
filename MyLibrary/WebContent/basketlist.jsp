<%@ page language="java" contentType = "text/html; charset = UTF-8" pageEncoding = "UTF-8" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>MyLibrary</title>
<meta name=viewport content="width=device-width, initial-scale=1, user-scalable=0">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="css/core.css">
<style>
input[type=button]{
	margin-top: 300px;
	margin-left: 18px;
	padding-top: 5px;
	padding-bottom: 5px;
	font-size: 19px;
	color: white;
	background-color: #6b4194;
	border: 0px none;
}
</style>
</head>
<body>
<div class="page-hdr">
나의 서재
</div>
<div class="page-body">
<%
	Class.forName("com.mysql.jdbc.Driver");

	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mylibrary", "root", "1111");
	
	Statement st = conn.createStatement();
	
	String str = "<table border=1>";
	ResultSet rs = st.executeQuery("SELECT bookname2, writer2 FROM basket");
	
	while(rs.next()) {
		str += "<tr>";
		str += "<td width =250>" + rs.getString("bookname2") + "</td>";
		str += "<td width =200>" + rs.getString("writer2") + "</td>";
		str += "<td><a href='basketdelete.jsp?bookname2=" + rs.getString("bookname2") + "'>";
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
<a href="booksearch.jsp"><input type="button" value="도서 검색으로 돌아가기"></a>
<a href="rent.html"><input type="button" value="대여하기"></a>
</body>
</html>
<script src="js/jquery-1.12.0.min.js"></script>
<script src="js/core.js"></script>