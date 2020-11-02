<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../header.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
	$(document).ready(function() {
		
// 		 // 필드 공백 제거
// 		 $("#memMail").val().replace(/\s/g, "");
// 		 $("#memPw").val().replace(/\s/g, "");
		 
// 		 $("#login-form").click(function() {
			
// 			// 공백 여부 점검
// 			if ($.trim($("#memMail").val()) == "" || 
// 				$.trim($("#memPw").val()) == "")   {
				
// 				alert("공백이 입력되었습니다. 다시 입력하십시오.");
// 				$("#memMail").val("");
// 				$("#memPw").val("");
// 			} else {
				
// 				// 전송
// 				$("#loginForm").submit();
// 			}
	   	
// 	   }) // login
	   
		$("#logoutBtn").on("click", function(){
			location.href="logout";
		})
		
	}) //
	
		
</script>
<div id="login-box">
	<h3>로그인</h3>
	
	<form id="login-form" name="login-form" action="login.do" method="POST">
		<c:if test="${member == null }">
			<div class="join-form_group">
				<table>
					<tr>
						<td><label for="memMail"> 아이디 </label><td>
						<td><input type="text" id="memMail" name="memMail" size="30"/><td>
					<tr>
						<td><label for="memPw"> 패스워드 </label></td>
						<td><input type="password" id="memPw" name="memPw" size="30"/></td>
					<tr>
						<td colspan="2" align="center">
							<input id="login" name="login" type="submit" value="로그인"/>&nbsp;
							<input id="joinbtn" name="joinbtn" type="button" value="회원가입" onclick="location.href='join'"/>
						</td>
					</tr>		
				</table>
			</div>
		</c:if>
		<c:if test="${member != null }">
			<div>
				<p>${member.memNick }님 환영합니다.
				<button id="logoutBtn" type="button">로그아웃</button>
			</div>
		</c:if>
		<c:if test="${msg == false}">
			<p style="color: red;"> 로그인 실패! 아이디와 비밀번호를 확인해주세요.</p>
		</c:if>
	</form>
</div>
<jsp:include page="../footer.jsp" />