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
	String uid = request.getParameter("id");
	String uname = request.getParameter("name");
	String utel = request.getParameter("tel");
	
	UserDAO dao = new UserDAO();
	String code = dao.findps(uid, uname, utel);
	if (code != "NA") {
		//session.setAttribute("uid", uid);
		session.setAttribute("usrobj", code);
	}
	out.print(code);
%>