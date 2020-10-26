<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../header.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<style>
	#join .j_info{
	
	}
</style>
<!-- jquery -->
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<!-- daum 주소 검색 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<div id="join">
		<div class="join_wrap">
			<div class="join_panel">
				<form:form id="joinForm"
					name="joinForm"
					modelAttribute = "memberDTO"
					method="post"
					action= "/member/join.do">
					
				<table id="joinFormTbl">
				
				<!-- 이메일(아이디) -->
				<tr>
					<td><span class="requiredFld">*</span> 아이디</td>
					<td>
						<input type="text"
								id="mem_mail"
								name="mem_mail"
								pattern="[a-zA-Z0-9_+.-]+@([a-zA-Z0-9-]+\.)+[a-zA-Z0-9]{2,4}"
								size="30"
								maxlength="50"
								required
								title="이메일을 입력하십시오">
						<span id="mem_mail_err" class="err_msg"></span>
					</td>
				</tr>
				<tr>
					<td><span class="requiredFld">*</span> 패스워드</td>
					<td>
						<input type="text"
								id="mem_pw"
								name="mem_pw"
								maxlength="20"
								pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W).{8,20}"
								required
								title="패스워드는 영문 대소문자와 특수문자 숫자를 조합하여, 8~20자로 입력해주세요">
					</td>		
				</tr>
				<tr>
					<td><span class="requiredFld">*</span> 이름</td>
					<td>
						<input type="text"
								id="mem_name"
								name="mem_name"
								maxlength="10"
								pattern="[가-힣]{2,10}"
								required
								title="이름은 한글로 입력해주세요">
					</td>
				</tr>
				<tr>
					<td><span class="requiredFld">*</span> 닉네임</td>
					<td>
						<input type="text"
								id="mem_nick"
								name="mem_nick"
								maxlength="10"
								pattern="[가-힣a-zA-Z0-9]{2,10}"
								required
								title="닉네임은 한글과 영어 숫자만 사용해주세요">
					</td>
				</tr>
				<tr>
					<td><span class="requiredFld">*</span> 성별</td>
					<td>
						<ul id="radio_gender">
							<li>
								<input type="radio"
										id="memGenderMale"
										name="mem_gender"
										value="m"
										checked
										required>
								<label for="memGenderMale">남자</label>
								<div class="check"></div>		
							</li>
							<li>
								<input type="radio"
										id="memGenderFemale"
										name="mem_gender"
										value="f">
								<label for="memGenderfemale">여자</label>
								<div class="check"></div>		
							</li>
						</ul>
					</td>
				</tr>
				<!-- 다음 주소 api -->
				<tr>				
					<td>우편번호</td>
					<td>
						<input type="text"
								id="mem_zipcode"
								name="mem_zipcode"
								maxlength="5"
								pattern="/d{5}"
								readonly>
								
						<input type="button"
								id="joinAddressSearchBtn"
								name="joinAddressSearchBtn"
								value="주소검색"
								onClick="searchPost()"><br>		
					</td>
				</tr>
				<tr>
					<td>기본 주소</td>
					<td>
						<input type="text"
							id="mem_addr"
							name="mem_addr"
							pattern="[\w | \W | 가-힣 | / | - | (  |  ) | ,]{2,200}"
							maxlength="200"
							size="50"
							title="기본주소를 입력하세요"
							readonly>
					</td>
				</tr>
				<tr>
					<td>상세주소</td>
					<td>
						<input type="text"
								id="mem_de_addr"
								name="mem_de_addr"
								pattern="[\w | \W | 가-힣 | / | -]{2,100}" 
								maxlength="100"
								size="50"
								title="상세주소를 입력하세요">
					</td>
				</tr>
				<tr>
					<td><span class="requiredFld">*</span>연락처</td>
					<td>
						<input type="text"
							id="mem_phone"
							name="mem_phone"
							maxlength="13"
							pattern="01\d{1}-\d{3,4}-\d{4}"
							required
							size="15"
							title="핸드폰 번호를 다시 입력해주세요">
						ex) 010-1234-5678
						<div id="mem_phone_err" class="err_msg"></div>
					</td>
				</tr>
				</table>
				<table id="joinFormMenu">
					<tr>
						<td>
							<input type="submit"
									id="joinSubmitBtn"
									name="joinSubitBtn"
									value="회원가입">
							<input type="reset"
									id="joinResetBtn"
									name="joinResetBtn"
									value="가입취소">		
						</td>
					</tr>	
				</table>
<!-- 		<tr></tr> -->
<!-- 		<tr> -->
<!-- 			<td align="center">이메일 : </td> -->
<!-- 			<td><input type="text" name="mem_mail" size="50" maxlength="50"/></td> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<td align="center">비밀번호 : </td> -->
<!-- 			<td><input type="password" name="mem_pw" size="20" maxlength="12"/> 4~12자의 영문 대소문자와 숫자로만 입력</td> -->
<!-- 		</tr> -->
<!-- 		<tr>  -->
<!-- 			<td align="center">비밀번호 확인 : </td> -->
<!-- 			<td><input type="password" name="mem_cpw" size="20" maxlength="12"/></td>	 -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<td align="center">이름 : </td>	 -->
<!-- 			<td><input type="text" name="mem_name" size="10"/></td> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<td align="center">닉네임 : </td>	 -->
<!-- 			<td><input type="text" name="mem_nick" size="15"/></td> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<td align="center">생년월일 : </td> -->
<!-- 			<td><input type="text" name="mem_birth" size="6"/> 예시) 990101</td> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<td align="center">성별 : </td> -->
<!-- 			<td> -->
<!-- 				<input type="radio" name="mem_gender" value="남" checked>남 -->
<!--             	<input type="radio" name="mem_gender" value="여" checked>여 -->
<!--             <td>	 -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<td align="center">주소 : </td> -->
<!-- 			<!--  주소 api 삽입예정 -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<td align="center">연락처 : </td> -->
<!-- 			<td><input type="text" name="mem_phone" size="11"/> -->
<!-- 		</tr> -->
<!-- 			</table> -->
<!-- 				<p align="center"> -->
<!-- 					<input type="submit" value="회원가입" style= margin-right:-3px;/> -->
<!-- 					<input type="reset"  style= margin-left:-3px; value="다시입력"/> -->
<!-- 			<br/><br/> -->
<!-- 		</p> -->
				</form:form>
			</div>
		</div>
	</div>
<jsp:include page="../footer.jsp" />
