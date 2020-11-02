<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>	
	<meta charset="UTF-8">
	<title>Insert Board</title>
	<!-- Bootstrap -->
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src="http://code.jquery.com/jquery-3.5.1.min.js" type="text/javascript"></script>
	
	<!-- SmartEditor2 라이브러리 -->
	<script type="text/javascript" src="resources/se2/js/HuskyEZCreator.js"	charset="utf-8"></script>
	<style>
		#insertBoard {
			width: 65%;
			margin: 0 auto;
			margin-top: 80px;
		}
	</style>
</head>
<jsp:include page="../header2.jsp" />
<body>
	<div class="container-fluid">
		<div id="insertBoard">
			<div class="col-md-12">
				<table class="table table-hover">
					<tr>
						<td class="col-4 text-center">제목</td>
						<td class="col-8 text-left">
							<input type="text" id="title" style="width: 100%" />
						</td>
					</tr>
					<tr>
						<td class="col-4 text-center">내용</td>
						<td class="col-8 text-left">
							<textarea rows="35" cols="100" id="ir1" name="ir1"	style="width: 100%; height: auto; resize: none;">
								에디터에 기본으로 삽입할 글(수정 모드)이 없다면 이 value 값을 지정하지 않으시면 됩니다.
							</textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="col-12 text-center">
							<input type="button" id="save" value="저장" /> 
							<input type="button" value="취소" />
						</td>
					</tr>
				</table>
				<div align="right">
					<button type="button" class="btn btn-default navbar-btn"
						onclick="history.back()">게시글 목록</button>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "ir1",
			sSkinURI : "resources/se2/SmartEditor2Skin.html",
			fCreator : "createSEditor2"
		});
	</script>
<jsp:include page="../footer.jsp" />
</body>
</html>

