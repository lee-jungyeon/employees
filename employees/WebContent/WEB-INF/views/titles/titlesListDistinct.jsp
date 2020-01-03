<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<style>
	ol {
		    counter-reset: li; /* Initiate a counter */
		    list-style: none; /* Remove default numbering */
		    *list-style: decimal; /* Keep using default numbering for IE6/7 */
		    font: 15px 'trebuchet MS', 'lucida sans';
		    padding: 0;
		    margin-bottom: 4em;
		    text-shadow: 0 1px 0 rgba(255,255,255,.5);
		    margin:auto;
		    width: 50%;
  			}

   ol ol {
		    margin: 0 0 0 2em; /* Add some left margin for inner lists */
		  }
  .rounded-list a{
    position: relative;
    display: block;
    padding: .4em .4em .4em 2em;
    *padding: .4em;
    margin: .5em 0;
    background: #ddd;
    color: #444;
    text-decoration: none;
    border-radius: .3em;
    transition: all .3s ease-out;
  }

  .rounded-list a:hover{
    background: #eee;
  }

  .rounded-list a:hover:before{
    transform: rotate(360deg);
  }

  .rounded-list a:before{
    content: counter(li);
    counter-increment: li;
    position: absolute;
    left: -1.3em;
    top: 50%;
    margin-top: -1.3em;
    background: #87ceeb;
    height: 2em;
    width: 2em;
    line-height: 2em;
    border: .3em solid #fff;
    text-align: center;
    font-weight: bold;
    border-radius: 2em;
    transition: all .3s ease-out;
  }
		
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
    		<li style="width: 650px;"><a href=""></a></li>
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
	<br/>
		<h1 style="text-align: center">업무목록(중복제거)</h1>
		<br/	>
			
			<ol class="rounded-list" style="text-align: center;">
				<c:forEach	var="row" items="${list}">
					<li  style="float: none;"><a href="#">${row}</a></li>
				
				</c:forEach>
			
			</ol>
	</div>
</body>
</html>