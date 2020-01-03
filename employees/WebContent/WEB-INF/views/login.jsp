	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style>
* {
  box-sizing: border-box;
  font-family: 'Noto Sans KR', sans-serif;
}
.login-form {
  background-color: #eeeff1;
  border-radius: 5px;
  margin-left: auto;
  margin-right: auto;
  width: 300px;
  height: 260px;
  padding: 20px;
}

.text-field {
  border: 10px solid #ffffff;
  border-radius: 5px;
  font-size: 14px;
  margin: 10px 0 0 0;
  width: 260px;
  height: 44px;

}

.submit-btn {
  font-size: 14px;
  background-color: #1bbc9b;
  border-radius: 5px;
  border: 10px solid #1bbc9b;
  width: 260px;
  height: 44px;
  margin: 15px 0 30px 0;
}
      body {
        margin: 0px;
        padding: 0px;
      }
      .jbTitle {
        text-align: center;
      }
      .jbMenu {
        text-align: center;
        background-color: gray;
        padding: 10px 0px;
        width: 100%;
        height: 200px;
        font-size: 50px;
        font: white;
      }
      .jbContent {
        height: 1000px;
      }
      .jbFixed {
        position: fixed;
        top: 0px;
      }

</style>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
<div>
	
		<div class="jbTitle">
    		<h1><a href="${pageContext.request.contextPath}">Employees</a></h1>
    		 
	    </div>
		<br/> 
	
	
    <div class="jbContent">
		   <div class="jbMenu">
		      <p>
		        	사원 관리 시스템
		      </p>
		    </div>
	
	<!-- 로그인 폼 -->
	<h1 style="text-align: center">로그인</h1>
	<div div class="login-form">
	<form method="post" action="${pageContext.request.contextPath}/login" >	
		<div>
			<input type="text" name="empNo" class="text-field"  placeholder="empNo" value="10001"> 
		</div>
		<div>
			<input type="text" name="firstName" class="text-field" placeholder="first_name" value="Georgi">
		</div>
		<div>
			<input type="text" name="lastName" class="text-field" placeholder="last_name" value="Facello">
		</div>
		<div>
			<button type="submit" class="submit-btn">로그인</button>
		</div>
	</form>
	</div>	
	</div>
</div>
</body>
</html> 