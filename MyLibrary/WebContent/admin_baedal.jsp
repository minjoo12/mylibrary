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
<img src="images/back_btn.png" class="back_btn" onclick="goBack()">
<span class="text_hdr">배달 관리</span>
</div>
<div class="page-body">
<input id="filterText" type="text" placeholder="배달 검색">

<table id = table border=1>
<%
	Class.forName("com.mysql.jdbc.Driver");

	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mylibrary", "root", "1111");
	
	Statement st = conn.createStatement();
	
	String str = "<tr>";
	ResultSet rs = st.executeQuery("SELECT sjuso, phone, pay FROM baedalinfo");
	
	while(rs.next()) {
		str += "<td width =250>" + rs.getString("sjuso") + "</td>";
		str += "<td width =200>" + rs.getString("phone") + "</td>";
		str += "<td width =200>" + rs.getString("pay") + "</td>";
		str += "<td><a href='baedalDelete.jsp?sjuso=" + rs.getString("sjuso") + "&phone=" + rs.getString("phone") + "&pay=" + rs.getString("pay") + "'>";
		str += "<button>삭제</button>";
		str += "</a></td></tr>";
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

function goBack() {
	  window.history.back();
	}
</script>
