<%@ page contentType = "text/html; charset = UTF-8" pageEncoding = "UTF-8" %>
<%@ page import="java.sql.*" %>
<%
	String ubookname = request.getParameter("bookname2");
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mylibrary", "root", "1111");
	
	String sql = "DELETE FROM bookdb WHERE bookname2 = ?";
	PreparedStatement st = conn.prepareStatement(sql);
	st.setString(1, ubookname);
	
	int cnt = st.executeUpdate();
	
	String res = (cnt == 0) ? "도서 삭제 중 에러가 발생하였습니다." : "도서 삭제가 완료되었습니다.";
	
		out.print("<script>alert('도서 삭제가 완료되었습니다.'); history.back();</script>");
	
	st.close();
	conn.close();
%>