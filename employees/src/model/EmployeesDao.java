package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import db.DBHelper;
import vo.Employees;

public class EmployeesDao {
	public List<Map<String , Object>>selectEmployeesCountGroupByGender(){
		List<Map<String , Object>> list = new ArrayList<Map<String, Object>>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql="SELECT gender, COUNT(gender) cnt FROM employees GROUP BY gender";
		try {
			conn= DBHelper.getConnection();
			stmt=conn.prepareStatement(sql);
		
			rs=stmt.executeQuery();
			
			while(rs.next()) {
				Map<String, Object>  map = new HashMap<String, Object>();
				map.put("gender",rs.getString("gender"));
				map.put("cnt",rs.getInt("cnt"));
				list.add(map);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			   DBHelper.close(rs, stmt, conn);
			}
		return list;
	}

	
	public List<Employees> selectEmployeesBetween(int begin, int end){
		List<Employees> list = new ArrayList<Employees>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql="SELECT emp_no, birth_date, first_name, last_name, gender, hire_date FROM employees WHERE emp_no BETWEEN ? AND ? ORDER BY emp_no asc";
		
		
		try {
			conn= DBHelper.getConnection();
			stmt=conn.prepareStatement(sql);
			stmt.setInt(1, begin);
			stmt.setInt(2,end);
			rs=stmt.executeQuery();
			
			while(rs.next()) {
				Employees employees = new Employees();
				 employees.setEmpNo(rs.getInt("emp_no"));
				 employees.setBirthDate(rs.getString("birth_date" ));
				 employees.setFirstName(rs.getString("first_name" ));
				 employees.setLastName(rs.getString("last_name" ));
				 employees.setGender(rs.getString("gender" ));
				 employees.setHireDate(rs.getString("hire_date" ));
				list.add(employees);	
			}
			
		}catch(Exception e) {
			
		}finally {
			
			   DBHelper.close(rs, stmt, conn);
			}
		
		
		return list;
	}


	public int selectEmpNo(String str) {
		int empNo=0;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql=null;
		if(str.equals("max")) {
			sql="SELECT MAX(emp_no) FROM employees";
		}else if(str.equals("min")){
			sql="SELECT MIN(emp_no) FROM employees";
		}
			try {
				conn= DBHelper.getConnection();
				stmt=conn.prepareStatement(sql);
				rs=stmt.executeQuery();
				
			   if(rs.next()) {
					empNo = rs.getInt(1);
				}
				
			}catch(Exception e) {
				
			}finally {
				
				   DBHelper.close(rs, stmt, conn);
				}
			
		
		return empNo;
	}
	
	
	public List<Employees> selectEmployeesListOrderBy(String order){
		List<Employees> list = new ArrayList<Employees>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql=null;
		if(order.equals("asc")) {
			sql="SELECT emp_no, birth_date, first_name, last_name, gender, hire_date FROM employees ORDER BY first_name asc LIMIT 50";
		}else if(order.equals("desc")){
			sql="SELECT emp_no, birth_date, first_name, last_name, gender, hire_date FROM employees ORDER BY first_name desc LIMIT 50";

		}
			try {
				conn= DBHelper.getConnection();
				stmt=conn.prepareStatement(sql);
				rs=stmt.executeQuery();
				
				while(rs.next()) {
					Employees employees = new Employees();
					 employees.setEmpNo(rs.getInt("emp_no"));
					 employees.setBirthDate(rs.getString("birth_date" ));
					 employees.setFirstName(rs.getString("first_name" ));
					 employees.setLastName(rs.getString("last_name" ));
					 employees.setGender(rs.getString("gender" ));
					 employees.setHireDate(rs.getString("hire_date" ));
					list.add(employees);	
				}
				
			}catch(Exception e) {
				
			}finally {
				
				   DBHelper.close(rs, stmt, conn);
				}
			return list;
		}
		
	
	public int selectEmployeesRowCount() {
		int count = 0;
		final String sql="SELECT COUNT(*) FROM employees";
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
	public List<Employees> selectEmployeesListByLimit(int limit){
		System.out.println("EmployeesDao selectEmployeesListByLimit parama limit :"+limit);
		List<Employees> list = new ArrayList<Employees>();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql="SELECT emp_no, birth_date, first_name, last_name, gender, hire_date FROM employees LIMIT ?";
		
		
		try {
			conn= DBHelper.getConnection();
			stmt=conn.prepareStatement(sql);
			stmt.setInt(1,limit);
			rs=stmt.executeQuery();
			
			while(rs.next()) {
				Employees employees = new Employees();
				 employees.setEmpNo(rs.getInt("emp_no"));
				 employees.setBirthDate(rs.getString("birth_date" ));
				 employees.setFirstName(rs.getString("first_name" ));
				 employees.setLastName(rs.getString("last_name" ));
				 employees.setGender(rs.getString("gender" ));
				 employees.setHireDate(rs.getString("hire_date" ));
				list.add(employees);	
			}
			
		}catch(Exception e) {
			
		}finally {
			
			   DBHelper.close(rs, stmt, conn);
			}
		
		
		return list;
	}

}