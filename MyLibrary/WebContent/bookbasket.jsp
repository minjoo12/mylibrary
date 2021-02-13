<%@ page contentType = "text/html; charset = UTF-8" pageEncoding = "UTF-8" %>
<%@ page import="java.sql.*" %>
<%
	String ubookname = request.getParameter("bookname2");
	String uwriter = request.getParameter("writer2");

	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mylibrary", "root", "1111");

	String sql = "SELECT * FROM basket WHERE bookname2 = ?";
	PreparedStatement st = conn.prepareStatement(sql);
	st.setString(1, ubookname);

	ResultSet rs = st.executeQuery();
	if (rs.next()) {
		out.print("<script>alert('이미 장바구니에 추가된 도서입니다.'); window.location.href='/MyLibrary/basketlist.jsp';</script>");
	}
	else {
		st.close();
		
		sql = "INSERT INTO basket(bookname2, writer2) VALUES(?, ?)";
		
		st = conn.prepareStatement(sql);
		st.setString(1, ubookname);
		st.setString(2, uwriter);
		
		int cnt = st.executeUpdate();
		String res = (cnt == 0) ? "장바구니에 도서 추가 중 에러가 발생하였습니다." : "장바구니에 도서가 추가되었습니다.";
	
		out.print("<script>alert('장바구니에 도서가 추가되었습니다.'); window.location.href='/MyLibrary/basketlist.jsp';</script>");
	}
	
	st.close();
	conn.close();
%>