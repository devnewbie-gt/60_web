package com.bc.frontcontroller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bc.model.DAO;
import com.bc.model.vo.EmployeeVO;

@WebServlet("/controller")
public class FrontController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String type = request.getParameter("type");
		
		if("all".equals(type)) {
			// 1. DB 연결 후 데이터 취득
			List<EmployeeVO> list = DAO.getList();
			
			// 2. 응답 페이지(list.jsp)에 데이터 전달(request 객체에 속성 값으로 전달)
			request.setAttribute("list", list);
			request.getRequestDispatcher("list.jsp").forward(request, response);
		}
		else if ("dept".equals(type)) {
			request.getRequestDispatcher("dept.jsp").forward(request, response);
		}
		else if("deptList".equals(type)) {
			String deptno = request.getParameter("deptno");
			List<EmployeeVO> list = DAO.getDeptnoList(deptno);
			request.setAttribute("deptList", list);
			request.setAttribute("deptno", deptno);
			request.getRequestDispatcher("deptList.jsp").forward(request, response);
		}
		else if("fullname".equals(type)) {
			request.getRequestDispatcher("fullname.jsp").forward(request, response);
		}
		else if("fullnameList".equals(type)) {
			String fullname = request.getParameter("fullname");
			List<EmployeeVO> list = DAO.getFullnameList(fullname);
			request.setAttribute("fullnameList", list);
			request.getRequestDispatcher("fullnameList.jsp").forward(request, response);
		}
		else if("search".equals(type)) {
			String idx = request.getParameter("idx");
			String keyword = request.getParameter("keyword");
			
			if(keyword == null || "".equals(idx)) {
				request.getRequestDispatcher("search.jsp").forward(request, response);
			} else {
				List<EmployeeVO> list = DAO.getSearch(idx, keyword);
				//System.out.println(list);
				
				// 동적 검색 형태 확인
				String title = "";
				switch (idx) {
				case "0":
					title = "사번, " + keyword;
					break;
				case "1":
					title = "이름, " + keyword;
					break;
				case "2":
					title = "직종, " + keyword;
					break;
				case "3":
					title = "부서, " + keyword;
					break;
				}
				
				request.setAttribute("list", list);
				request.setAttribute("title", title);
				request.getRequestDispatcher("searchList.jsp").forward(request, response);
			}
		}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
	
}
