package model;

import java.util.*;

import db.DBHelper;

import java.sql.*;


import vo.Departments;

public class DepartmentsDao {	
	public List<Map<String , Object>>selectDepartmentsCountByDeptNo(){
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql="select d.dept_no, d.dept_name, count(d.dept_no) cnt from dept_emp de inner join departments d on de.dept_no = d.dept_no where de.to_date = '9999-01-01' group by d.dept_no order by count(d.dept_no)desc";
		
		try {
			conn= DBHelper.getConnection();
			stmt=conn.prepareStatement(sql);
			rs=stmt.executeQuery();
			
			while(rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("deptNo",rs.getString("dept_no"));
				map.put("deptName",rs.getString("dept_name"));
				map.put("cnt",rs.getInt("cnt"));
				list.add(map);
			}
			
		}catch(Exception e) {
			
		}finally {
			
			   DBHelper.close(rs, stmt, conn);
			}
		
		return list;
	}
	

	public int selectDepartmentsRowCount() {
		int count = 0;
		final String sql="SELECT COUNT(*) FROM departments";
		Connection conn =null;
		PreparedStatement stmt=null;
		ResultSet rs = null;
		try {
			//드라이브 이름
			conn= DBHelper.getConnection();
			stmt=conn.prepareStatement(sql);
			rs=stmt.executeQuery();
			if(rs.next()) {
				count=rs.getInt("COUNT(*)");
			}
			
		}catch(Exception e) { // 자바의 변수 생명주기는 {} 
			e.printStackTrace();
		}finally {
			
			   DBHelper.close(rs, stmt, conn);
			}
	
		
		return  count;
	}
	public List<Departments> selectDepartmentsList(){
		List<Departments>list = new ArrayList<Departments>();
		Connection conn=null;
		PreparedStatement stmt=null;
		ResultSet rs = null;
		String sql="SELECT dept_no, dept_name FROM departments";
		
		
		try {
			conn= DBHelper.getConnection();
			stmt=conn.prepareStatement(sql);
			rs=stmt.executeQuery();
			
		while(rs.next()) {
			Departments departments = new Departments();
			departments.setDeptNo(rs.getString("dept_no"));
			departments.setDeptName(rs.getString("dept_name"));
			list.add(departments);
		}

		}catch(Exception e) {
			
			
		}finally {
			
			   DBHelper.close(rs, stmt, conn);
			}
		return list;
		
	}
	

}
