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
	width:270px;
}

table {
	border-collapse: collapse;
	border-color: #7a579e;
}

</style>
</head>
<body>
<div class="page-hdr">
도서 검색
</div>
<div class="page-body">
	<select name="choose" style="width:90px;height:45px;margin-top: -10px;">
		<option value="all">전체</option>
		<option value="writer3">저자명</option>
		<option value="title3">제목</option>
		<option value="publish3">출판사</option>
	</select>
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
		str += "<td><a href='bookbasket.jsp?bookname2=" + rs.getString("bookname2") + "&writer2=" + rs.getString("writer2") + "'>";
		str += "<button>추가</button>";
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

$(document).ready(function() {
	Page.init(start);
});

var pagectx = {};
function start(usrobj) {
	pagectx.usrobj = usrobj;
	
	var params = "id=" + usrobj.id;
}


var $rows = $('#table tr');
$('#filterText').keyup(function() {
    var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();

    $rows.show().filter(function() {
        var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
        return !~text.indexOf(val);
    }).hide();
});
</script>
