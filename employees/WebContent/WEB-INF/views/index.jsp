<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
</head>
<body>
	<h1>Index</h1>
	<h2>table 정보</h2>
<table border="1">	
	<thead>
		<tr>
		<th>테이블 이름</th>
		<th>현재 행의 수</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>departments</td>
			<td>${departmentsRowCount}</td>
		</tr>
		<tr>
			<td>employees</td>
			<td>${employeesRowCount}</td>
		</tr>
		<tr>
			<td>dept_manager</td>
			<td>${deptManagerRowCount}</td>
		</tr>
		<tr>
			<td>dept_emp</td>
			<td>${deptEmpRowCount}</td>
		</tr>
		<tr>
			<td>titles</td>
			<td>${titlesRowCount}</td>
		</tr>
		<tr>
			<td>salaries</td>
			<td>${salariesRowCount}</td>
		</tr>
	</tbody>	
	
	</table>
	
	
	
	
	<div>
		<ul>
			<li><a href="${pageContext.request.contextPath}/departments/getDepartmentsList">부서 목록</a></li>
			<li><a href="${pageContext.request.contextPath}/employees/getEmployeesList">사원 목록</a></li>
		
			
			<li><a href="${pageContext.request.contextPath}/employees/getEmployeesListOrderBy?order=asc">first_name 오름차순</a></li>
			<li><a href="${pageContext.request.contextPath}/employees/getEmployeesListOrderBy?order=desc">first_name 내림차순</a></li>
			<li><a href="${pageContext.request.contextPath}/titles/getTitlesListDistinct">업무목록(중복제거)</a></li>
			<li><a href="${pageContext.request.contextPath}/salaries/getSalariesStatistics">연봉의 통계값</a></li>
			<li><a href="${pageContext.request.contextPath}/employees/getEmployeesCountByGender">사원 수(group by gender)</a></li>
			<li><a href="${pageContext.request.contextPath}/departments/getDepartmentsCountByDeptNo">현재 부서별 사원수</a></li>
			<li><a href="${pageContext.request.contextPath}/employees/getEmployeesListByPage">사원 목록(10명씩 페이징)</a></li>
		</ul>
		
	</div>
	<div>
		<form method="get" action="${pageContext.request.contextPath}/emloyees/getEmployeesBetween">
			<input type="number" name="begin">~<input type="number" name="end">
			<button type="submit">사원 목록 between......and....</button>
			(${minEmpNo}~{maxEmpNo})(10001~499999)
		</form>
	
	</div>
</body>
</html>