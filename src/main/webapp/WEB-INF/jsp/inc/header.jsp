<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
<h1 style="float: left;width: 150px;"><a href="../"><img src="../images/ci.gif" alt="java-school logo" /></a></h1>
<div id="memberMenu" style="float: right; position: relative; top: 7px;">
	<security:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN')">
	    <security:authentication property="principal.username" var="check" />
	</security:authorize>
	<c:choose>
	    <c:when test="${empty check}">
	        <input type="button" value="<spring:message code="user.login" />" onclick="location.href='../users/login'" />
	        <input type="button" value="회원가입" onclick="location.href='../users/signUp'" />
	    </c:when>
	    <c:otherwise>
	        <input type="button" value="<spring:message code="user.logout"/>" id="logout" onclick="location.href='../j_spring_security_logout'" />
	        <input type="button" value="내정보수정" onclick="location.href='../users/editAccount'" />
	    </c:otherwise>
	</c:choose>
</div>

<form id="logoutForm" action="${pageContext.request.contextPath}/logout" method="post" style="display:none">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>

<script>
$(document).ready(function() {
        $('#logout').click(function() {
                $('#logoutForm').submit();
                return false;
        });
});
</script>