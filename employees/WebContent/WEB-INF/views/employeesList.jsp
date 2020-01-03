<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>'
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
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
	#customers {
	   font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	   border-collapse: collapse;
	   margin: auto;	
	   width:70%
	  
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
	select { width: 200px; /* 원하는 너비설정 */ padding: .8em .5em; /* 여백으로 높이 설정 */ font-family: inherit; /* 폰트 상속 */ background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%; /* 네이티브 화살표 대체 */ border: 1px solid #999; border-radius: 0px; /* iOS 둥근모서리 제거 */ -webkit-appearance: none; /* 네이티브 외형 감추기 */ -moz-appearance: none; appearance: none; }
	


</style>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	    		<li style="width: 650px;"><a href="#"></a></li>
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
	

			
				<h1 style="text-align: center">사원 목록</h1>
					<form method="get" action="${pageContext.request.contextPath}/employees/getEmployeesList">
						<div style="width: 70%; margin: auto">
							<select name = "limit">
								<option >값 설정</option>
								<option value="10">10</option>
								<option value="20">20</option>
								<option value="30">30</option>
								<option value="40">40</option>
								<option value="50">50</option>
							</select>
							<button>사원 목록</button>
						</div>
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
					</form>
		</div>			
</body>
</html>