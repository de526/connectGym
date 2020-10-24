<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" />
<style>
	#join .j_info{
	
	}
</style>
	<div id="join">
		<div class="j_wrap">
			<div class="j_contents">
				<form name="join_form" method="post">
				<br>
				<table id="j_table">
				<caption style="font-size: 30px;font-weight: bold;">Join Us!</caption>
		<tr></tr>
		<tr>
			<td align="center">이메일 : </td>
			<td><input type="text" name="mem_mail" size="50" maxlength="50"/></td>
		</tr>
		<tr>
			<td align="center">비밀번호 : </td>
			<td><input type="password" name="mem_pw" size="20" maxlength="12"/> 4~12자의 영문 대소문자와 숫자로만 입력</td>
		</tr>
		<tr> 
			<td align="center">비밀번호 확인 : </td>
			<td><input type="password" name="mem_cpw" size="20" maxlength="12"/></td>	
		</tr>
		<tr>
			<td align="center">이름 : </td>	
			<td><input type="text" name="mem_name" size="10"/></td>
		</tr>
		<tr>
			<td align="center">닉네임 : </td>	
			<td><input type="text" name="mem_nick" size="15"/></td>
		</tr>
		<tr>
			<td align="center">생년월일 : </td>
			<td><input type="text" name="mem_birth" size="6"/> 예시) 990101</td>
		</tr>
		<tr>
			<td align="center">성별 : </td>
			<td>
				<input type="radio" name="mem_gender" value="남" checked>남
            	<input type="radio" name="mem_gender" value="여" checked>여
            <td>	
		</tr>
		<tr>
			<td align="center">주소 : </td>
			<!--  주소 api 삽입예정 -->
		</tr>
		<tr>
			<td align="center">연락처 : </td>
			<td><input type="text" name="mem_phone" size="11"/>
		</tr>
			</table>
				</form>
			</div>
		</div>
	</div>
<jsp:include page="footer.jsp" />
