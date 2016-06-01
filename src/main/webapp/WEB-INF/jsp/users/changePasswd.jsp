<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<link rel="stylesheet" href="../css/screen.css" type="text/css" />
<script type="text/javascript">
//<![CDATA[
           
function check() {
    var form = document.getElementById("changePasswordForm");
    if (form.newPasswd.value == form.confirm.value) {
        return true;    
    } else {
        alert("[변경 비밀번호]와 [변경 비밀번호 확인] 값이 같지 않습니다.");
        return false;
    }
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
        	
        		<!-- 본문 시작 -->
				<div id="url-navi">회원</div>
				
				<h1>비밀번호 변경</h1>
				${user.name }<br />
				이동전화 ${user.mobile }<br />
				<sf:form id="changePasswordForm" action="changePasswd" method="post"
					        commandName="passwordVO" onsubmit="return check();">
					<table>
					<tr>
					    <td>현재 비밀번호</td>
					    <td>
					        <sf:password path="currentPasswd" /><br />
					        <sf:errors path="currentPasswd" cssClass="error" />
					    </td>
					</tr>
					<tr>
					    <td>변경 비밀번호</td>
					    <td>
					        <sf:password path="newPasswd" /><br />
					        <sf:errors path="newPasswd" cssClass="error" />
					    </td>
					</tr>
					<tr>
					    <td>변경 비밀번호 확인</td>
					    <td>
					        <input type="password" name="confirm" />
					    </td>
					</tr>
					<tr>
					    <td colspan="2"><input type="submit" value="확인" /></td>
					</tr>
					</table>
				</sf:form>	
				<!--  본문 끝 -->
				
        	</div>
    	</div>    
    	<div id="sidebar">
    		<%@ include file="loginUsers-menu.jsp" %>
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