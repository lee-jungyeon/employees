<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>departments List</title>
</head>
<body>
<div>
	<a href="${pageContext.request.contextPath}">home으로 </a>

</div>
	<h1>부서 목록</h1>
	
	<table border="1">
		<thead>
		<tr>
			<th>부서번호</th>
			<th>부서이름</th>
		</tr>
		</thead>
		<tbody>
			<c:forEach var="departments" items="${list}">
				<tr>
					<td>${departments.deptNo}</td>
					<td>${departments.deptName}</td>
				</tr>
			</c:forEach>
			
		</tbody>
		
	</table>
</body>
</html>