<%@ page language="java" contentType = "text/html; charset = UTF-8" pageEncoding = "UTF-8" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>MyLibrary</title>
<meta name=viewport content="width=device-width, initial-scale=1, user-scalable=0">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="css/core.css">
<style>

input[type=text] {
	margin-top: -10px;
}

table {
	border-collapse: collapse;
	border-color: #7a579e;
}

</style>
</head>
<body>
<div class="page-hdr">
도서 관리
</div>
<div class="page-body">
<input id="filterText" type="text" placeholder="도서 검색">
<table id = table border=1>
<%
	Class.forName("com.mysql.jdbc.Driver");

	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mylibrary", "root", "1111");
	
	Statement st = conn.createStatement();
	
	String str = "<tr>";
	ResultSet rs = st.executeQuery("SELECT bookname2, writer2 FROM bookdb");
	
	while(rs.next()) {
		str += "<td width =250>" + rs.getString("bookname2") + "</td>";
		str += "<td width =200>" + rs.getString("writer2") + "</td>";
		str += "<td><a href='bookDelete.jsp?bookname2=" + rs.getString("bookname2") + "&writer2=" + rs.getString("writer2") + "'>";
		str += "<button>삭제</button>";
		str += "</a></td></tr>";
	}
	str += "</table>";
	out.print(str);

	rs.close();
	st.close();
	conn.close();
%>

</table>
</div>
</body>
</html>

<script src="js/jquery-1.12.0.min.js"></script>
<script src="js/core.js"></script>
<script type="text/javascript">

var $rows = $('#table tr');
$('#filterText').keyup(function() {
    var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();

    $rows.show().filter(function() {
        var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
        return !~text.indexOf(val);
    }).hide();
});
</script>
