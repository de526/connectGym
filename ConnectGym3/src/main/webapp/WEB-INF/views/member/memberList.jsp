<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta charset="UTF-8">

<c:forEach items="#{memList }" var="mem">
	<div class="listAll">
	<a href="/ConnectGym/memberList">회원관리</a>
	${mem.memMail } ${mem.memName }
	</div>
</c:forEach>
