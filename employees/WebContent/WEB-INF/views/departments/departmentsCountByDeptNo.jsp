<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>현재 부서별 사원수</h1>
	<table	border="1">	
		<thead>
			<tr>
				<th>deptNo</th>
				<th>deptName</th>
				<th>count</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="map" items="${list }">
				<tr>
					<td>${map.deptNo }</td>		
					<td>${map.deptName }</td>
					<td>${map.cnt }</td>
				</tr>
					
			</c:forEach>
	
		</tbody>
	</table>
</body>
</html>