<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BBS</title>
<link rel="stylesheet" href="../css/screen.css" type="text/css" />
<script type="text/javascript">
//<![CDATA[
           
function check() {
    //var form = document.getElementById("writeForm");
    //유효성 검사 로직 추가
    return true;
}

function goList() {
    var form = document.getElementById("listForm");
    form.submit();
}

function goView() {
    var form = document.getElementById("viewForm");
    form.submit();
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
				<div id="url-navi">BBS</div>
				<h1>${boardNm }</h1>
				
				<div id="bbs">
				<h2>글쓰기</h2>
				<sf:form id="writeForm" action="write?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data" commandName="article" onsubmit="return check();">
					<p style="margin: 0;padding: 0;">
						<input type="hidden" name="articleNo" value="${param.articleNo }" />
					    <input type="hidden" name="boardCd" value="${param.boardCd }" />
					    <input type="hidden" name="curPage" value="${param.curPage }" />
					    <input type="hidden" name="searchWord" value="${param.searchWord }" />
					</p>
					<sf:errors path="*" cssClass="error" />
					<table id="write-form">
						<tr>
						    <td>제목</td>
						    <td>
						    	<sf:input path="title" style="width: 90%" /><br />
        						<sf:errors path="title" cssClass="error" />
						    </td>
						</tr>
						<tr>
						    <td colspan="2">
						        <textarea name="content" rows="17" cols="50"></textarea>
						        <sf:errors path="content" cssClass="error" />
						    </td>
						</tr>
						<tr>
						    <td>첨부 파일</td>
						    <td><input type="file" name="attachFile" /></td>
						</tr>
					</table>
					<div style="text-align: center;padding-bottom: 15px;">
					    <input type="submit" value="전송" />
					    <input type="button" value="목록" onclick="goList()" />
					    <c:if test="${not empty param.articleNo }">
					  	  <input type="button" value="상세보기" onclick="goView()" />
					    </c:if>
					</div>
				</sf:form>
				</div>
				<!-- 본문 끝 -->        	
        	
        	</div>
    	</div>    
    	<div id="sidebar">
    		<%@ include file="bbs-menu.jsp" %>
    	</div>    
    	<div id="extra">    		
		    <%@ include file="../inc/extra.jsp" %>	
    	</div>    
    	<div id="footer">
    		<%@ include file="../inc/footer.jsp" %> 
    	</div>    
	</div>
	
	<div id="form-group" style="display: none">
	    <form id="viewForm" action="view" method="get">
	    <p>
	        <input type="hidden" name="articleNo" value="${param.articleNo }" />
	        <input type="hidden" name="boardCd" value="${param.boardCd }" />
	        <input type="hidden" name="curPage" value="${param.curPage }" />
	        <input type="hidden" name="searchWord" value="${param.searchWord }" />
	    </p>
	    </form>
	    <form id="listForm" action="list" method="get">
	    <p>
	        <input type="hidden" name="boardCd" value="${param.boardCd }" />
	        <input type="hidden" name="curPage" value="${param.curPage }" />
	        <input type="hidden" name="searchWord" value="${param.searchWord }" />
	    </p>
	    </form>   
	</div>
</body>
</html>