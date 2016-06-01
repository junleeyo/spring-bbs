<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BBS</title>
<link rel="stylesheet" href="../css/screen.css" type="text/css" />
<script type="text/javascript" src="bbs-view.js"></script>
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
    	
    		<!-- 본문 시작 -->
        	<div id="content" style="min-height: 800px;">
        	<h1>${boardNm }</h1>
        		
        		<div id="bbs">
					<table>
						<tr>
						    <th style="width: 37px;text-align: left;vertical-align: top;">title</th>
						    <th style="text-align: left;color: #555;">${title }</th>
						</tr> 
					</table>
					<div id="gul-content">
					    <span id="date-writer-hit">edited ${regdate } by ${name } hit ${hit }</span>
					    <p>${content }</p>
					    <p id="file-list" style="text-align: right">
					        <c:forEach var="file" items="${attachFileList }" varStatus="status">					            
					            <a href="javascript:;" title="${file.attachFileNo }" class="download">${file.filename }</a>					            
					            <security:authorize access="#email == principal.username or hasRole('ROLE_ADMIN')">
					            	<a href="javascript:;" title="${file.attachFileNo }">x</a>
					            </security:authorize>
					            <br />
					        </c:forEach>
					    </p>
					</div>
				
					<!--  댓글 반복 시작 -->
					<c:forEach var="comment" items="${commentList }" varStatus="status">
					<div class="comments">
					    <span class="writer">${comment.name }</span>
					    <span class="date">${comment.regdate }</span>
					    <c:if test="${user.email == comment.email }">
					    <span class="modify-del">
					       <a href="javascript:;" class="comment-toggle">수정</a> | 
    					   <a href="javascript:;" class="comment-delete" title="${comment.commentNo }">삭제</a>
					    </span>
					    </c:if>
					    <p class="view-comment">${comment.memo }</p>
					    <form id="modifyCommentForm${comment.commentNo }" class="modify-comment" action="updateComment" method="post" style="display: none;">
					    <p>
					        <input type="hidden" name="commentNo" value="${comment.commentNo }" />
					        <input type="hidden" name="boardCd" value="${param.boardCd }" />
					        <input type="hidden" name="articleNo" value="${param.articleNo }" />
					        <input type="hidden" name="curPage" value="${param.curPage }" />
					        <input type="hidden" name="searchWord" value="${param.searchWord }" />
					    </p>
					    <div class="fr">
				            <security:authorize access="#comment.email == principal.username or hasRole('ROLE_ADMIN')">
						    <span class="modify-del">
						    	<a href="javascript:;">수정하기</a> | 
						    	<a href="javascript:;">취소</a>						    
						    </span>
						    </security:authorize>
					    </div>
					    <div>
					        <textarea class="modify-comment-ta" name="memo" rows="7" cols="50">${comment.memo }</textarea>
					    </div>
					    </form>
					</div>
					</c:forEach>
					<!--  댓글 반복 끝 -->
				
					<form id="addCommentForm" action="addComment_proc" method="post">
					    <p style="margin: 0; padding: 0;">
					        <input type="hidden" name="articleNo" value="${param.articleNo }"/>
					        <input type="hidden" name="boardCd" value="${param.boardCd }" />
					        <input type="hidden" name="curPage" value="${param.curPage }" />
					        <input type="hidden" name="searchWord" value="${param.searchWord }" />       
					    </p>
					    <div id="addComment">
					        <textarea name="memo" rows="7" cols="50"></textarea>
					    </div>
					    <div style="text-align: right;">
					        <input type="submit" value="댓글 남기기" />
					    </div>
					</form>
					
					<div id="next-prev">
					    <c:if test="${nextArticle != null }">
					    <p>다음 글 : <a href="javascript:goView('${nextArticle.articleNo }')">${nextArticle.title }</a></p>
					    </c:if>
					    <c:if test="${prevArticle != null }">
					    <p>이전 글 : <a href="javascript:goView('${prevArticle.articleNo }')">${prevArticle.title }</a></p>
					    </c:if>
					</div>
					
					<div id="view-menu">
					    <security:authorize access="#email == principal.username or hasRole('ROLE_ADMIN')">
					    <div class="fl">
					        <input type="button" value="수정" id="goModify" />
					        <input type="button" value="삭제" id="goDelete" />
					    </div>
					    </security:authorize>
					    <div id="next-prev" class="fr">
					        <c:if test="${nextArticle != null }">
					        <p>다음글:
					        	<a href="javascript:;" title="${nextArticle.articleNo }">
						        	${nextArticle.title }
						        </a>
					        </p>
					        </c:if>
					        <c:if test="${prevArticle != null }">
					        <p>이전글:
					        	<a href="javascript:;" title="${prevArticle.articleNo }">
						        	${prevArticle.title }
						        </a>
					        </p>					        
					        </c:if>
					        <input type="button" value="목록" id="goList" />
					        <input type="button" value="새 글쓰기" id="goWrite" />
					    </div>
					</div>
				</div>			
        	</div>
        	<!-- 본문 끝 -->
        	
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
	        <input type="hidden" name="articleNo" value="${param.articleNo }" />
	        <input type="hidden" name="boardCd" value="${param.boardCd }" />
	        <input type="hidden" name="curPage" value="${param.curPage }" />
	        <input type="hidden" name="searchWord" value="${param.searchWord }" />
	    </p>
	    </form>
	    <form id="modifyForm" action="modify_form" method="get">
	    <p>
	        <input type="hidden" name="articleNo" value="${param.articleNo }" />
	        <input type="hidden" name="boardCd" value="${param.boardCd }" />
	        <input type="hidden" name="curPage" value="${param.curPage }" />
	        <input type="hidden" name="searchWord" value="${param.searchWord }" />
	    </p>
	    </form>
	    <form id="delForm" action="del" method="post">
	    <p>
	        <input type="hidden" name="articleNo" value="${param.articleNo }" />
	        <input type="hidden" name="boardCd" value="${param.boardCd }" />
	        <input type="hidden" name="curPage" value="${param.curPage }" />
	        <input type="hidden" name="searchWord" value="${param.searchWord }" />
	    </p>
	    </form>
	    <form id="deleteCommentForm" action="deleteComment" method="post">
	    <p>
	        <input type="hidden" name="commentNo" />
	        <input type="hidden" name="articleNo" value="${param.articleNo }" />
	        <input type="hidden" name="boardCd" value="${param.boardCd }" />
	        <input type="hidden" name="curPage" value="${param.curPage }" />
	        <input type="hidden" name="searchWord" value="${param.searchWord }" />
	    </p>
	    </form>   
	    <form id="deleteAttachFileForm" action="deleteAttachFile" method="post">
	    <p>
	        <input type="hidden" name="attachFileNo" />
	        <input type="hidden" name="articleNo" value="${param.articleNo }" />
	        <input type="hidden" name="boardCd" value="${param.boardCd }" />
	        <input type="hidden" name="curPage" value="${param.curPage }" />
	        <input type="hidden" name="searchWord" value="${param.searchWord }" />
	    </p>
	    </form>	    
	    <form id="downloadForm" action="./file/download" method="post">
		<p>
		    <input type="hidden" name="filename" />
		</p>
		</form>
	</div>
</body>
</html>