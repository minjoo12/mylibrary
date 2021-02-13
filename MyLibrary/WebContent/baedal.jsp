<%@ page contentType = "text/html; charset = UTF-8" pageEncoding = "UTF-8" %>
<%@ page import="java.sql.*" %>
<%

   request.setCharacterEncoding("UTF-8");

   String sjuso = request.getParameter("sjuso");
   String phone = request.getParameter("phone");
   String pay = request.getParameter("pay");
   
   try {
   Class.forName("com.mysql.jdbc.Driver");
   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mylibrary", "root", "1111");
   
   String sql = "INSERT INTO baedalinfo(sjuso,phone,pay) VALUES(?,?,?)";

   PreparedStatement pstmt = con.prepareStatement(sql);
   pstmt.setString(1,sjuso);
   pstmt.setString(2,phone);
   pstmt.setString(3,pay);
   
   pstmt.executeUpdate();
   response.sendRedirect("end.html");   
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