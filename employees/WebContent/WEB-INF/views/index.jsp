<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<style>

ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: gray;
   

}

li {
    float: left;
}

li a, .dropbtn {
    display: inline-block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

li a:hover, .dropdown:hover .dropbtn {
    background-color: red;
}

li.dropdown {
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}

.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    text-align: left;
}

.dropdown-content a:hover {background-color: #f1f1f1}

.dropdown:hover .dropdown-content {
    display: block;
}
      .jbTitle {
        text-align: center;
        margin-top: 50px;
      }
      
      .jbContent {
        height: 1000px;
      }
      .jbFixed {
        position: fixed;
        top: 10px;
      }
</style>
<meta charset="UTF-8">
<title>index.jsp</title>
</head>
<body>

 		<div class="jbTitle">
    		<h1><a href="${pageContext.request.contextPath}">Employees</a></h1>
    		  <c:if test="${sessionEmpNo != null}">
					<span style="float:center;"><a href="${pageContext.request.contextPath}/logout">로그아웃</a></span>
   			  </c:if>
	    </div>
		<br/> 
		  
	
	
    <div class="jbContent">
    <ul>
    		<li style="width: 600px;"><a href=""></a></li>
			<li><a href="${pageContext.request.contextPath}/departments/getDepartmentsList">부서 목록</a></li>
			<li><a href="${pageContext.request.contextPath}/titles/getTitlesListDistinct">업무목록(중복제거)</a></li>
			<li><a href="${pageContext.request.contextPath}/salaries/getSalariesStatistics">연봉의 통계값</a></li>
			
			
			<li class="dropdown">
			    <a href="${pageContext.request.contextPath}/employees/getEmployeesCountByGender">사원 수(group by gender)</a>
			    	<div class="dropdown-content">
					  <a href="${pageContext.request.contextPath}/departments/getDepartmentsCountByDeptNo">현재 부서별 사원수</a>
	    			</div>
	  		</li>
			
			
			<li class="dropdown">
			    <a href="${pageContext.request.contextPath}/employees/getEmployeesList" class="dropbtn">사원 목록</a>
			    	<div class="dropdown-content">
					    <a href="${pageContext.request.contextPath}/employees/getEmployeesListOrderBy?order=asc">first_name 오름차순</a>
						<a href="${pageContext.request.contextPath}/employees/getEmployeesListOrderBy?order=desc">first_name 내림차순</a>
					    <a href="${pageContext.request.contextPath}/employees/getEmployeesListByPage">사원 목록(10명씩 페이징)</a>
					    
	    			</div>
	  		</li>
	</ul>
		    
    
	
	<br/><br/><br/><br/>	
	<div style="text-align: center">
		<form method="get" action="${pageContext.request.contextPath}/emloyees/getEmployeesBetween">
			<input type="number" name="begin">~<input type="number" name="end">
			<button type="submit">사원 목록 between......and....</button>
			(${minEmpNo}~{maxEmpNo})(10001~499999)
		</form>
	</div>
	
	</div>
</body>
</html>