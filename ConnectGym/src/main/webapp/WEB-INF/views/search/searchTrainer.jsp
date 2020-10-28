 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="testt">
	<!-- 태그밑에서 푸터까지 트레이너 리스트 뿌리기 -->
	<c:forEach items="#{traList}" var="trainer">
		<div class="trainerResult">
			<hr>
			<h2 id="trainerName">
				<a href="/ConnectGym/trainer?memNo=${trainer.memNo}">${trainer.memName }</a>
			</h2>
			${trainer.memComment }<br /> <br />
			<script type="text/javascript">
				splitTag('${trainer.memTag }');
			</script>
		</div>
	</c:forEach>
</div>