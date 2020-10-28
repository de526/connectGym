<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<meta charset="UTF-8">

<!-- 태그밑에서 푸터까지 헬스장 리스트 뿌리기 -->

<c:forEach items="#{gymList}" var="gym">
	<div class="listOne">
		<hr>
		<h2>
			<a href="/ConnectGym/gym?gymNo=${gym.gymNo}">${gym.gymName }</a>
		</h2>
		<br /> ${gym.gymInfo }<br /> ${gym.gymAddr }
		<!-- img_t 에서 gymNo값줘서 사진 받아오기 (1번사진을 대표사진으로) -->

	</div>
</c:forEach>

