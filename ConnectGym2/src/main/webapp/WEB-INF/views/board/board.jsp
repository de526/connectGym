<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"
	type="text/javascript"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js">
	
</script>

<style>
#board {
	width: 65%;
	margin: 0 auto;
	margin-top: 80px;
}

a {
	text-decoration: none;
}
</style>
<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href = "/ConnectGym/board?nowPage=${paging.nowPage}&cntPerPage=" + sel;
	}
</script>
<title>게시판</title>
<jsp:include page="../header.jsp" />

<div class="container-fluid">
	<div id="board">
		<!-- n줄 보기 옵션선택 -->
		<div style="float: right;">
			<select id="cntPerPage" name="sel" onchange="selChange()">
				<option value="5"
					<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄
					보기</option>
				<option value="10"
					<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄
					보기</option>
				<option value="15"
					<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄
					보기</option>
				<option value="20"
					<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄
					보기</option>
			</select>
		</div>
		<div class="col-md-12">
			<table class="table table-striped table-hover">
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
					<c:forEach var="btemp" items="${viewAll}">
						<tr>
							<td class="col-2 text-center">${btemp.boNo}</td>
							<td class="col-4 text-center"><a href='/connectGym/boardDetail?boNo=${btemp.boNo}'>${btemp.boTitle}</a></td>
							<td class="col-2 text-center">${btemp.memNo}</td>
							<td class="col-2 text-center">${btemp.boDate}</td>
							<td class="col-2 text-center">${btemp.boHit}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

		</div>
	</div>
</div>
<button type="button" class="btn btn-default navbar-btn">게시글 작성</button>
<div style="display: block; text-align: center;">
	<c:if test="${paging.startPage != 1}">
		<a href="/ConnectGym/board?nowPage=${paging.startPage - 1}&cntPerPage=${paging.cntPerPage}">&lt;</a>
	</c:if>
	<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
		<c:choose>
			<c:when test="${p == paging.nowPage}">
				<b>${p}</b>
			</c:when>
			<c:when test="${p != paging.nowPage}">
				<a href="/ConnectGym/board?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
			</c:when>
		</c:choose>
	</c:forEach>
	<c:if test="${paging.endPage != paging.lastPage}">
		<a href="/ConnectGym/board?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
	</c:if>
</div>
<jsp:include page="../footer.jsp" />


