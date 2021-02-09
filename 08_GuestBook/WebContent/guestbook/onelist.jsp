<%@page import="com.bc.mybatis.GuestBookVO"%>
<%@page import="com.bc.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String idx = request.getParameter("idx");
	
	SqlSession ss = DBService.getFactory().openSession();
	
	GuestBookVO vo = ss.selectOne("guestbook.one", idx);
	ss.close();
	
	System.out.println("vo : " + vo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>