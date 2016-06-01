<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="../css/screen.css" type="text/css" />
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
        		<!-- 본문 시작 -->
				<div id="url-navi">회원</div>
				
				<h1>로그인</h1>
				<c:if test="${not empty param.error }">
				    <h2>Username/Password not corrrect</h2>
				</c:if>
				
				<c:url var="loginUrl" value="/login" />
				<form id="loginForm" action="${loginUrl }" method="post">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />					
					<table>
						<tr>
						    <td style="width: 200px;"><spring:message code="user.email" /></td>
						    <td style="width: 390px"><input type="text" name="username" style="width: 99%;" /></td>
						</tr>
						<tr>
						    <td><spring:message code="user.password" /></td>
						    <td><input type="password" name="password" style="width: 99%;" /></td>
						</tr>
					</table>
					<div style="text-align: center;padding-top: 15px;">
					    <input type="submit" value="확인" />
					    <input type="button" value="회원 가입" onclick="location.href='signUp'" />
					</div>
				</form>
				<!--  본문 끝 -->
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