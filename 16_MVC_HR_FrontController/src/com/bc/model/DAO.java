package com.bc.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.bc.model.vo.EmployeeVO;
import com.bc.mybatis.DBService;

public class DAO {
	
	// 직원 전체 목록 조회
	public static List<EmployeeVO> getList(){
		SqlSession ss = DBService.getFactory().openSession();
		List<EmployeeVO> list = ss.selectList("HR.list");
		ss.close();
		return list;
	}
	
	// 부서 소속 목록 조회
	public static List<EmployeeVO> getDeptnoList(String deptno) {
		SqlSession ss = DBService.getFactory().openSession();
		List<EmployeeVO> list = ss.selectList("HR.deptList", deptno);
		ss.close();
		return list;
	}
	
	// 이름으로 목록 조회
	public static List<EmployeeVO> getFullnameList(String fullname) {
		SqlSession ss = DBService.getFactory().openSession();
		List<EmployeeVO> list = ss.selectList("HR.fullnameList", fullname);
		ss.close();
		return list;
	}
	
	// 동적 검색
	public static List<EmployeeVO> getSearch(String idx, String keyword) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("idx", idx);
		map.put("keyword", keyword);
		
		SqlSession ss = DBService.getFactory().openSession();
		List<EmployeeVO> list = ss.selectList("HR.search", map);
		ss.close();
		return list;
	}
	
}
