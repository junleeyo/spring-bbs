<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>title</title>
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
				<div id="url-navi">Java Home</div>
				            
				
				<!--..중간 생략..-->
				
				
				<!-- 본문 끝 -->
        	</div>
    	</div>    
    	<div id="sidebar">
    		<h1>Java</h1>
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