<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../header.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	$(document).ready(function() {
		
		 // 필드 공백 제거
		 $("#memMail").val().replace(/\s/g, "");
		 $("#memPw").val().replace(/\s/g, "");
		 
		 $("#login-form").click(function() {
			
			// 공백 여부 점검
			if ($.trim($("#memMail").val()) == "" || 
				$.trim($("#memPw").val()) == "")   {
				
				alert("공백이 입력되었습니다. 다시 입력하십시오.");
				$("#memMail").val("");
				$("#memPw").val("");
			} else {
				
				// 전송
				$("#loginForm").submit();
			}
	   	
	   }) // login
	   
	}) //
</script>
<div id="login-box">
	<h3>로그인</h3>
	
	<c:if test="${error eq 'true'}">
		<div class="msg">${msg.message }</div>
	</c:if>
	
	<form id="login-form" name="login-form" action="login.do" method="POST">
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
						<input id="login" name="login" type="button" value="로그인"/>&nbsp;
						<input id="joinbtn" name="joinbtn" type="button" value="회원가입" onclick="location.href='join'"/>
					</td>
					
					
				</tr>		
			</table>
				
				
		</div>
	</form>
</div>
<jsp:include page="../footer.jsp" />