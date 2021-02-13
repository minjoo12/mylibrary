<%@ page contentType = "text/html; charset = UTF-8" pageEncoding = "UTF-8" %>
<%@ page import="java.sql.*" %>
<%
	String uid = request.getParameter("id");
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mylibrary", "root", "1111");
	
	String sql = "DELETE FROM user WHERE id = ?";
	PreparedStatement st = conn.prepareStatement(sql);
	st.setString(1, uid);
	
	int cnt = st.executeUpdate();
	
	String res = (cnt == 0) ? "회원 삭제 중 에러가 발생하였습니다." : "회원 삭제가 완료되었습니다.";
	
		out.print("<script>alert('회원 삭제가 완료되었습니다.'); window.location.href='/MyLibrary/userList.jsp';</script>");
	
	st.close();
	conn.close();
%>