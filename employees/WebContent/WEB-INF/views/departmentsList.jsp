<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#customers {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #B2EBF4;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
}



</style>
<meta charset="UTF-8">
<title>departments List</title>
</head>
<body>
<div>
	<a href="${pageContext.request.contextPath}">home으로 </a>

</div>
	<h1>부서 목록</h1>
	
	<table id="customers">
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