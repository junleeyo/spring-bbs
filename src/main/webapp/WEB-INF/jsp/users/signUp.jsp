<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<link rel="stylesheet" href="../css/screen.css" type="text/css" />
<script type="text/javascript">
//<![CDATA[ 

function check() {
    //var form = document.getElementById("signUpForm");
    //TODO 유효성 검사
    return true;
}

//]]> 
</script>    
</head>
<body>
	<div id="wrap">
    	<div id="header">
    		<%@ include file="../inc/header.jsp" %>
    	</div>    
    	<div id="main-menu">
    		<%@ include file="../inc/main-menu.jsp" %>
    	</div>    
    	<div id="container">
        	<div id="content" style="min-height: 800px;">
        	
        		<div id="url-navi">회원</div>
				<h1>회원 가입</h1>
				<sf:form id="signUpForm" action="signUp" method="post" commandName="user" onsubmit="return check();">
				<sf:errors path="*" cssClass="error" />
					<table>
						<tr>
						    <td style="width: 200px;">이름(Full Name)</td>
						    <td style="width: 390px">
						  		<sf:input path="name" /><br />
        						<sf:errors path="name" cssClass="error" />			
						    </td>
						</tr>
						<tr>
						    <td>비밀번호(Password)</td>
						    <td>
						    	<sf:password path="passwd" /><br />
        						<sf:errors path="passwd" cssClass="error" />
						    </td>
						</tr>
						<tr>
						    <td colspan="2" style="text-align: center;font-weight: bold;">
						    Email이 아이디로 쓰이므로 비밀번호는 Email 계정 비밀번호와 같게 하지 마세요.
						    </td>
						</tr>
						<tr>
						    <td>비밀번호 확인(Confirm)</td>
						    <td><input type="password" name="confirm" /></td>
						</tr>
						<tr>
						    <td>Email</td>
						    <td>
						    	<sf:input path="email" /><br />
        						<sf:errors path="email" cssClass="error" />
						    </td>
						</tr>
						<tr>
						    <td>이동전화(Mobile)</td>
						    <td>
						    	<sf:input path="mobile" /><br />
        						<sf:errors path="mobile" cssClass="error" />
						    </td>
						</tr>
					</table>
					<div style="text-align: center;padding-bottom: 15px;">
					    <input type="submit" value="확인" />
					</div>
				</sf:form>
				
        	</div>
    	</div>    
    	<div id="sidebar">
    		<%@ include file="notLoginUsers-menu.jsp" %>
    	</div>    
    	<div id="extra">
    		<%@ include file="../inc/extra.jsp" %>
    	</div>    
    	<div id="footer">
    		 <%@ include file="../inc/footer.jsp" %>
    	</div>    
	</div>
</body>
</html>