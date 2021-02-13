<%@ page contentType = "text/html; charset = UTF-8" pageEncoding = "UTF-8" %>
<%@ page import="java.sql.*" %>
<%

   request.setCharacterEncoding("UTF-8");

   String addr_num = request.getParameter("zip_code");
   String juso = request.getParameter("roadAddress");
   
   try {
   Class.forName("com.mysql.jdbc.Driver");
   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mylibrary", "root", "1111");
   
   String sql = "INSERT INTO juso(zip_code,roadAddress) VALUES(?,?)";

   PreparedStatement pstmt = con.prepareStatement(sql);
   pstmt.setString(1,addr_num);
   pstmt.setString(2,juso);
   
   pstmt.executeUpdate();
   response.sendRedirect("baedal.html");   
   pstmt.close();
   con.close();
}
catch(ClassNotFoundException e)
{
   out.println(e);
}
catch(SQLException e)
{
   out.println(e);
}



%>