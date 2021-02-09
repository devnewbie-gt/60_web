<%@page import="com.bc.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<jsp:useBean id="memberVO" class="com.bc.mybatis.MemberVO" />
	<jsp:setProperty property="*" name="memberVO"/>

<%
	//System.out.println("memberVO : " + memberVO);

	SqlSession ss = DBService.getFactory().openSession();
	
	try {
		int result = ss.insert("insertMember", memberVO);
		//System.out.println("result : " + result);
		ss.commit();
		response.sendRedirect("selectAll.jsp");
	} catch (Exception e) {
		e.printStackTrace();
		ss.rollback();
		response.sendRedirect("error.jsp");
	} finally {
		ss.close();
	}

%>