<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>연봉 통계</h1>

<table border="1">
	<thead>
		<tr>
			<th>count</th>
			<th>sum</th>
			<th>avg</th>
			<th>min</th>
			<th>max</th>
			<th>std</th>
		</tr>
	</thead>
	<tbody>
		<tr>
				<td>${map.count}</td>
				<td>${map.sum}</td>
				<td>${map.avg}</td>
				<td>${map.min}</td>
				<td>${map.max}</td>
				<td>${map.std}</td>
		</tr>
	
	</tbody>	

</table>
</body>
</html>