<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BBS</title>
<link rel="stylesheet" href="../css/screen.css" type="text/css" />
<script type="text/javascript" src="bbs-list.js"></script>
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
				    <table id="list-table">
				    <!--  게시판 목록 머리말 -->
				    <tr>
					    <th style="width: 60px;">NO</th>
					    <th>TITLE</th>
					    <th style="width: 84px;">DATE</th>
					    <th style="width: 60px;">HIT</th>
					</tr>
				    
				    <!--  반복 구간 시작 -->
				    <c:forEach var="article" items="${list }" varStatus="status">
				    <tr>
				        <td style="text-align: center;">${listItemNo - status.index }</td>
				        <td>
				            <a href="javascript:;" title="${article.articleNo }">
				            	${article.title }
				            </a>
				            <c:if test="${article.attachFileNum > 0 }">
				            	<img src="../images/attach.png" alt="첨부 파일" />
				            </c:if>
				            <c:if test="${article.commentNum > 0 }">
				            	<span class="bbs-strong">[${article.commentNum }]</span>
				            </c:if>
				        </td>
				        <td style="text-align: center;">${article.regdateForList }</td>
				        <td style="text-align: center;">${article.hit }</td>
				    </tr>
				    </c:forEach>
				    <!--  반복 구간 끝 -->           
				    </table>
				                
				    <div id="paging">
				        <c:if test="${prevPage > 0 }">
				            <a href="javascript:;" title="${prevPage }">[이전]</a>
				        </c:if>
				        
				        <c:forEach var="i" begin="${firstPage }" end="${lastPage }">
				            <c:choose>
				                <c:when test="${param.curPage == i }">
				                <span class="bbs-strong">${i }</span>
				                </c:when>
				                <c:otherwise>
				                <a href="javascript:;" title="${i }">${i }</a>
				                </c:otherwise>
				            </c:choose>
				        </c:forEach>
				
				        <c:if test="${nextPage > 0 }">
				            <a href="javascript:;" title="${nextPage }">[다음]</a>
				        </c:if>
				    </div>
				
				    <div id="list-menu">
				        <input type="button" value="새 글쓰기" />
				    </div>
				
				    <div id="search">
				        <form action="list" method="get">
				        <p style="margin: 0;padding: 0;" >
				            <input type="hidden" name="boardCd" value="${param.boardCd }" />
				            <input type="hidden" name="curPage" value="1" />                               
				            <input type="text" name="searchWord" size="15" maxlength="30" />
				            <input type="submit" value="<spring:message code="bbs.search" />" />
				        </p>
				        </form>
				    </div>
				
				</div>
				<!--  본문 끝 -->	
        	
        	
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
	    <form id="listForm" action="list" method="get">
	    <p>
	        <input type="hidden" name="boardCd" value="${param.boardCd }" />
	        <input type="hidden" name="curPage" />
	        <input type="hidden" name="searchWord" value="${param.searchWord }" />
	    </p>
	    </form>
	    <form id="viewForm" action="view" method="get">
	    <p>
	        <input type="hidden" name="articleNo" />
	        <input type="hidden" name="boardCd" value="${param.boardCd }" />
	        <input type="hidden" name="curPage" value="${param.curPage }" />
	        <input type="hidden" name="searchWord" value="${param.searchWord }" />
	    </p>
	    </form>
	    <form id="writeForm" action="write_form" method="get">
	    <p>
	        <input type="hidden" name="boardCd" value="${param.boardCd }" />
	        <input type="hidden" name="curPage" value="${param.curPage }" />
	        <input type="hidden" name="searchWord" value="${param.searchWord }" />
	    </p>
	    </form>
	</div>


</body>
</html>