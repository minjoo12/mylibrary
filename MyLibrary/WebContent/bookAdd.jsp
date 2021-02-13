<%@ page contentType = "text/html; charset = UTF-8" pageEncoding = "UTF-8" %>
<%@ page import="java.sql.*" %>
<%
	String ubooknum = request.getParameter("booknum");
	String ubookname = request.getParameter("bookname2");
	String uwriter = request.getParameter("writer2");
	String upublisher = request.getParameter("publisher2");
	String ubookbirth = request.getParameter("bookbirth");
	String ubookloca = request.getParameter("bookloca");
	
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mylibrary", "root", "1111");

	String sql = "SELECT * FROM bookdb WHERE bookname2 = ?";
	PreparedStatement st = conn.prepareStatement(sql);
	st.setString(1, ubookname);

	ResultSet rs = st.executeQuery();
	if (rs.next()) {
		out.print("<script>alert('이미 기재된 도서입니다.'); history.back();</script>");
	}
	else {
		st.close();
		
		sql = "INSERT INTO bookdb(booknum, bookname2, writer2, publisher2, bookbirth, bookloca) VALUES(?, ?, ?, ?, ?, ?)";
		
		st = conn.prepareStatement(sql);
		st.setString(1, ubooknum);
		st.setString(2, ubookname);
		st.setString(3, uwriter);
		st.setString(4, upublisher);
		st.setString(5, ubookbirth);
		st.setString(6, ubookloca);
		
		int cnt = st.executeUpdate();
		String res = (cnt == 0) ? "도서 입력 중 에러가 발생하였습니다." : "도서 입력이 완료되었습니다.";
	
		out.print("<script>alert('도서 입력이 완료되었습니다.'); history.back();</script>");
	}
	
	st.close();
	conn.close();
%>