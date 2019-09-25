<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>'
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
<title>Insert title here</title>
</head>
<body>
<div>
	<a href="${pageContext.request.contextPath}">home으로 </a>

</div>
	<h1>사원 목록</h1>
	
	<table id="customers">
		<thead>	
		<tr>	
		<th>사원 번호</th>
			<th>사원 생일</th>
			<th>사원 이름</th>
			<th>사원 성</th>
			<th>사원 성별</th>
			<th>사원 입사날짜</th>
		</tr>
		</thead>
		<tbody>
			<c:forEach var="employees" items="${list}">
				<tr>
					<td>${employees.empNo }</td>
					<td>${employees.birthDate }</td>
					<td>${employees.firstName }</td>
					<td>${employees.lastName }</td>
					<td>${employees.gender }</td>
					<td>${employees.hireDate }</td>
			
				</tr>
			</c:forEach>
		</tbody>
	</table>	
		<!-- currentPage가 1보다 크면 "이전" 이 나온다 -->
		<c:if test="${currentPage > 1 }">
		<a href="${pageContext.request.contextPath}/employees/getEmployeesListByPage?currentPage=${currentPage-1}">이전</a>
	</c:if>
		<!-- currentPage가 lastPage보다 작으면 "다음"이 나온다 -->
		<c:if test="${currentPage < lastPage }">
			<a href="${pageContext.request.contextPath}/employees/getEmployeesListByPage?currentPage=${currentPage+1}">다음</a>
		</c:if>

</body>
</html>