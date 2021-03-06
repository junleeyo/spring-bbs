<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탈퇴 확인</title>
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
				
				<h1>회원 탈퇴 확인</h1>
				회원님의 모든 정보가 삭제되었습니다.<br />
				<!--  본문 끝 -->
				
        	</div>
    	</div>    
    	<div id="sidebar">
    		 <h1>Goodbye</h1>
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