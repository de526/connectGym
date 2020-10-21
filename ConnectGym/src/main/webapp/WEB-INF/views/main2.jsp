<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false"%>
<html>
<head>
<title>Main2 page</title>
</head>
<body>

	 <c:forEach var="gym" items="${list}">
		헬스장 이름 뿌리기 : ${gym.gymName}<br />

	</c:forEach>

</body>
</html>
