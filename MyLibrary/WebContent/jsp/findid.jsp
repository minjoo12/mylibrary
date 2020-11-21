<%@ page contentType = "text/html; charset = UTF-8" pageEncoding = "UTF-8" %>
<%@ page import="core.*" %>
<%
	request.setCharacterEncoding("UTF-8");

	String sid = (String) session.getAttribute("uid");
	/*
	if (sid != null) {
		out.print("EX");
		return;
	}
	*/
	String uname = request.getParameter("name");
	String utel = request.getParameter("tel");
	String ubirth = request.getParameter("birth");
	
	UserDAO dao = new UserDAO();
	String code = dao.findid(uname, utel, ubirth);
	if (code != "NA") {
		//session.setAttribute("uid", uid);
		session.setAttribute("usrobj", code);
	}
	out.print(code);
%>