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
			<td align="center">아이디 : </td>
			<td><input type="text" name="id" size="20" maxlength="12"/> 4~12자의 영문 대소문자와 숫자로만 입력</td>
		</tr>
		<tr>
			<td align="center">비밀번호 : </td>
			<td><input type="password" name="pw" size="20" maxlength="12"/> 4~12자의 영문 대소문자와 숫자로만 입력</td>
		</tr>
		<tr> 
			<td align="center">비밀번호 확인 : </td>
			<td><input type="password" name="cpw" size="20" maxlength="12"/></td>	
		</tr>
		<tr>
			<td align="center">메일주소 : </td>
			<td><input type="text" name="email1" size="20"/>
				@
				<input type="email" name="email2" list="domain" size="20" placeholder="직접 입력"/>
					<datalist id="domain">
						<option value="naver.com">naver.com</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="gmail.com">gmail.com</option>
					</datalist>
			</td>
		</tr>
		<tr>
			<td align="center">이름 : </td>	
			<td><input type="text" name="name" size="10"/></td>
		</tr>
		<tr>
			<td align="center">생년월일 : </td>
			<td><input type="number" name="year" size="6" placeholder="년"/> 년 
			<input type="number" name="month" size="5" placeholder="월"/> 월 
			<input type="number" name="day" size="5" placeholder="일"/> 일 
			</td>
		</tr>
			</table>
				</form>
			</div>
		</div>
	</div>
<jsp:include page="footer.jsp" />
