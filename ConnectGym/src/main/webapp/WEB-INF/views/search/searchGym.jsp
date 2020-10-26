<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 태그밑에서 푸터까지 헬스장 리스트 뿌리기 -->
	<div id="gymList">
		<c:forEach items="#{list}" var="gym">
			<hr>
			<a href="채영씨 컨트롤러?gymNo=${gym.gymNo}">${gym.gymName }</a>
			<br />
					${gym.gymInfo }<br />
					${gym.gymAddr }
					<!-- img_t 에서 gymNo값줘서 사진 받아오기 (1번사진을 대표사진으로) -->
		</c:forEach>

	</div>
</body>
</html>