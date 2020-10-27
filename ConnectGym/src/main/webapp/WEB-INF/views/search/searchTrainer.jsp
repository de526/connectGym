<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<body>
<script type="text/javascript">
		function splitTag(tags){
			//트레이너 태그 잘라서 span에 넣기!
			var tag_arr = tags.split(',');
			var tagHtml = '';
			for(var i=0;i<tag_arr.length;i++){
				tagHtml += '<span class="trainerTag">' + tag_arr[i] +'</span>';
			}
			document.write(tagHtml);
		}
	</script>
	
	
	
	</head>
	<body>
		<!-- 태그밑에서 푸터까지 트레이너 리스트 뿌리기 -->
		 <div id="TrainerList">
			<c:forEach items="#{list}" var="trainer">
				<hr>
				<a href="채영씨 컨트롤러?memNo=${trainer.memNo}">${trainer.memName }</a><br />
				${trainer.memComment }<br />
				${trainer.memTag }
				<script type="text/javascript">
					splitTag(${trainer.memTag });			
				</script>
				
			</c:forEach>
		</div> 
</body>
</html>