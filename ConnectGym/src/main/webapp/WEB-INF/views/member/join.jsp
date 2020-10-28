<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../header.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	#join .j_info{
	
	}
	
	#join td {
		padding: 10px;
	}
	
	#join .joinFormTbl{
		margin: 0 auto;
	}
	
	#join .join_wrap{
	}
	
	#join .joinFormMenu{
		margin: 0 auto;
	}
	
	#join .join_panel{
		width: 70%;
		margin: 0 auto;
	}
	
</style>
<!-- jquery -->
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<!-- daum 주소 검색 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- <script src="/ConnectGym/resources/js/join.js" charset="UTF-8"></script> -->
<script>

</script>
	<div id="join">
		<div class="join_wrap">
			<div class="join_panel">
				<form name="join" method="post">
				<br>
					<table class="joinTbl">
						<tr>
							<td><span>이메일(아이디)</span></td>
							<td><input type="text" name="mem_mail" size="30" maxlength="50" required /><td>
						</tr>
						<tr>
							<td><span>비밀번호</span></td>
							<td><input type="password" name="mem_pw" size="20" maxlength="20" required /></td>
						</tr>
						<tr>
							<td><span>비밀번호 확인</span></td>
							<td><input type="password" name="mem_cpw" size="20" maxlength="20" required /></td>
						</tr>
						<tr>
							<td><span>이름</span></td>
							<td><input type="text" name="mem_name" maxlength="10" required /></td>
						</tr>
						<tr>
							<td><span>닉네임</span></td>
							<td><input type="text" name="mem_nick" maxlength="10" required /></td>
						</tr>
						<tr>
							<td><span>성별</span></td>
							<td>
								<input type="radio" name="mem_gender" value="m" required />남자
								<input type="radio" name="mem_gender" value="f"/>여자
								<div class="check"></div>
							</td>
						</tr>
						<!--  다음 주소 api -->
						<tr>
							<td><span>우편번호</span></td>
							<td>
								<input type="text" name="mem_zipcode" maxlength="5" readonly/>
								<input type="button" name="joinAddressSearchBtn" value="주소검색" onClick="searchPost()"><br>
							</td>
						</tr>
						<!-- 기본주소 -->
						<tr>
							<td><span>기본주소</span></td>
							<td>
								<input type="text" name="mem_addr" maxlength="150" readonly/>
							</td>
						</tr>
						<!-- 상세주소 -->
						<tr>
							<td><span>상세주소</span></td>
							<td>
								<input type="text" name="mem_de_addr" maxlength="100" size="50"/>
							</td>
						</tr>
						<!-- 연락처 -->
						<tr>
							<td><span>연락처</span></td>
							<td>
								<input type="text" name="mem_phone" maxlength="13" size="15" required />
								하이픈 - 포함하여 입력해주세요.
							</td>
						</tr>
					</table>
					<p><input type="button" value="회원가입" onclick="validate(this.form)"/>
						<input type="reset" value="다시입력"/>
				</form>
			</div>
		</div>
	</div>
<jsp:include page="../footer.jsp" />
