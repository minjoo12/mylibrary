<%@ page contentType = "text/html; charset = UTF-8" pageEncoding = "UTF-8" %>
<%@ page import="java.sql.*" %>
<%
   String usjuso = request.getParameter("sjuso");
   
   Class.forName("com.mysql.jdbc.Driver");
   Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mylibrary", "root", "1111");
   
   String sql = "DELETE FROM baedalinfo WHERE sjuso = ?";
   PreparedStatement st = conn.prepareStatement(sql);
   st.setString(1, usjuso);
   
   int cnt = st.executeUpdate();
   
   String res = (cnt == 0) ? "배달 삭제 중 에러가 발생하였습니다." : "배달 삭제가 완료되었습니다.";
   
      out.print("<script>alert('배달 삭제가 완료되었습니다.'); window.location.href='/MyLibrary/admin_baedal.jsp';</script>");
   
   st.close();
   conn.close();
%>