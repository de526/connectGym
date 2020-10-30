<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../header.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="login-box">
	<h3>로그인</h3>
	
	<c:if test="${error eq 'true'}">
		<div class="msg">${msg.message }</div>
	</c:if>
	
	<form id="login-form" name="login-form" action="login.do" method="POST">
	</form>
</div>
<jsp:include page="../footer.jsp" />