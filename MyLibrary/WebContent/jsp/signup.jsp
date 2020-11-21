<%@ page contentType = "text/html; charset = UTF-8" pageEncoding = "UTF-8" %>
<%@ page import="core.*" %>
<%
	request.setCharacterEncoding("UTF-8");

	String uid = request.getParameter("id");
	String upass = request.getParameter("ps");
	String uemail = request.getParameter("email");
	String uname = request.getParameter("name");
	String utel = request.getParameter("tel");
	String ubirth = request.getParameter("birth");
	
	
	UserDAO dao = new UserDAO();
	String code = dao.signup(uid, upass, uemail, uname, utel, ubirth);
	out.print(code);
%>