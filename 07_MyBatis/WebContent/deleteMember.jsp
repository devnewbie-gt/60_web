<%@page import="com.bc.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	
	SqlSession ss = DBService.getFactory().openSession();
	
	try {
		int result = ss.delete("deleteMember", id);
		//System.out.println("result : " + result);
		ss.commit();
		response.sendRedirect("selectAll.jsp");
	} catch (Exception e) {
		e.printStackTrace();
		response.sendRedirect("error.jsp");
	} finally {
		ss.close();
	}

%>