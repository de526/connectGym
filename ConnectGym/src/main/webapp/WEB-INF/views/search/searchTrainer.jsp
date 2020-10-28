<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<meta charset="UTF-8">
<style>

.trainerTag {
	border-radius: 5px;
	padding: 3px;
	text-align: center;
	margin: 5px;
	background-color: grey;
}

.trainerResult{
	margin: 10px;
}

#trainerName h2 {
	margin: 5px;
}
</style>
<script type="text/javascript">
	function splitTag(tags) {
		//트레이너 태그 잘라서 span에 넣기!
		var tag_arr = tags.split(',');
		var tagHtml = '';
		for (var i = 0; i < tag_arr.length; i++) {
			tagHtml += '<span class="trainerTag">' + tag_arr[i] + '</span>';
		}
		document.write(tagHtml);
	}
</script>




<body>
	<!-- 태그밑에서 푸터까지 트레이너 리스트 뿌리기 -->
	<c:forEach items="#{traList}" var="trainer">
		<div class="trainerResult">
			<hr>
			<h2 id="trainerName">
				<a href="채영씨 컨트롤러?memNo=${trainer.memNo}">${trainer.memName }</a>
			</h2>
			${trainer.memComment }<br />
			<br />
			<script type="text/javascript">
				splitTag('${trainer.memTag }');
			</script>
		</div>
	</c:forEach>