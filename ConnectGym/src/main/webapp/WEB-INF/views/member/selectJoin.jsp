<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../header.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="selectJoin-box">
	<input type="button" id="memberJoin" value="일반회원" onclick="location.href='memberjoin'">
	<input type="button" id="trainerJoin" value="트레이너 회원" onclick="location.href='trainerjoin'">
</div>
<jsp:include page="../footer.jsp" />