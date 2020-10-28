<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="http://code.jquery.com/jquery-3.5.1.min.js" type="text/javascript"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<title>게시판</title>
	<jsp:include page="../header.jsp"/>
	
	<div class="container">
		<div class="col-md-12">
			<table class="table">
				<thead>
					<tr>
						<th class="col-2 text-center">번호</th>
						<th class="col-4 text-center">제목</th>
						<th class="col-2 text-center">작성자</th>
						<th class="col-2 text-center">작성일</th>
						<th class="col-2 text-center">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="btemp" items="${bList}">
						<tr>
							<td class="col-2 text-center">${btemp.boNo}</td>
							<td class="col-4 text-center">${btemp.boTitle}</td>
							<td class="col-2 text-center">${btemp.memNo}</td>
							<td class="col-2 text-center">${btemp.boDate}</td>
							<td class="col-2 text-center">${btemp.boHit}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<jsp:include page="../footer.jsp" />
