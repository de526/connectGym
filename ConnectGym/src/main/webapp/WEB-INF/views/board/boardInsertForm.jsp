<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	
	<%
		pageContext.setAttribute("crcn", "\r\n");
		pageContext.setAttribute("br", "<br>");
	%>
	
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
				
				<Form id="insertForm" method="post" class="form-horizontal">
					<table class="table table-hover">
						<tr>
							<td class="col-4 text-center">제목</td>
							<td class="col-8 text-left">
								<input type="text" id="title" style="width: 100%" />
							</td>
						</tr>
						<tr>
							<td class="col-4 text-center">작성자</td>
							<td class="col-8 text-left">
								<input type="text" class="form-control" name="writer" value="<c:out value='${memNick}'/>" readonly="readonly"/>
							</td>
						</tr>
						<tr>
							<td class="col-4 text-center">내용</td>
							<td class="col-8 text-left">
								<textarea rows="35" cols="100" id="se2" name="se2"	style="width: 100%; height: auto; resize: none;">
									텍스트 에어리어
								</textarea>
							</td>
						</tr>
						<tr>
							<td colspan="2" class="col-12 text-center">
								<button type="button" id="insertBtn" class="btn btn-custom-success">등록</button> 
								<button type="button" id="cancelBtn" class="btn btn-custom-default">취소</button>
							</td> 
						</tr>
					</table>
				</Form>
				<div align="right">
					<button type="button" class="btn btn-default navbar-btn"
						onclick="history.back()">게시글 목록</button>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	
	
		// SmartEditor2 적용 스크립트
		var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "se2",
			sSkinURI : "resources/se2/SmartEditor2Skin.html",
			fCreator : "createSEditor2"
		});
		
		if(editMode=='I'){
			if(confirm("등록 하시겠습니까?")==true){
				try {
					// SmartEditor의 값을 Textarea로 전달해주는 코드
					oEditors.getById["se2"].exec("UPDATE_CONTENTS_FIELD", []);
					document.frm.action = regAddr;
					document.frm.submit();
					swal("", "등록 되었습니다.", "success");
				}catch(exception){
					swal("","데이터 등록을 실패하였습니다.", "error");
				}
			}
		} else {
			if(confirm("수정 하시겠습니까?")==true){
				if(deleteTarget.length > 0){
					document.frm.deleteTarget.value = deleteTarget;
				}
				try{
					// SmartEditor의 값을 Textarea로 전달해주는 코드
					oEditors.getById["se2"].exec("UPDATE_CONTENTS_FIELD", []);
					document.frm.action = udtAddr;
					document.frm.submit();
					swal("","수정 되었습니다.", "success");
					
				}catch(exception){
					swal("","데이터 수정에 실패했습니다.","error");	
				}
			}
		}
				
		var insertForm = {
				$insertBtn	: $,
				init		: function() {
					this.$insertBtn = $("insertForm");
				},
				
				pageSubmitFn: function(pageName) {
					this.$insertBtn.attr("action", pageName + ".do");
					this.$insertBtn.submit();
				}
		}
		
		$(function() {
			$("#cancelBtn").click(function() {
				left.pageSubmitFn("board");
			});
			
			$("#insertBtn").click(function() {
				insertForm.init();
				insertForm.pageSubmitFn("boardInsert");
			});
		});
				
	</script>
	
	<jsp:include page="../footer.jsp" />
	
</body>
</html>

