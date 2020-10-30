<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../header.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
// 	$("#mem_mail").blur(function() {
		
// 		var mem_mail = $('#mem_mail').val();
		
// 		$.ajax({
			
// 			url : '/ConnectGym/emailCheck?userId='+ mem_mail,
// 			type : 'get',
// 			success : function(data) {
// 				console.log("1 = 중복 o / 0 = 중복x : " + data);
				
// 				if(data == 1){
					
// 					// 1: 아이디가 중복되는 문구
// 					$("#mail_Check").text("사용중인 아이디입니다 :p");
// 					$("#mail_Check").css("color", "red");
// 					$("#reg_submit").attr("disabled", true);
				
// 					}
					
// 				}
			
// 			}, error : function(){
// 				console.log("실패");
// 			}
// 		});
		
// 	});
		
		
</script>

	<div id="join">
		<div class="join_wrap">
			<div class="join_panel">
				<form:form id="joinForm"
					name="joinForm"
					modelAttribute = "memberDTO"
					method="post"
					action= "/ConnectGym/member/join.do">
					
				<table class="joinFormTbl">
				
				<!-- 이메일(아이디) -->
				<tr>
					<td><span class="requiredFld">*</span> 이메일(아이디)</td>
					<td>
						<input type="text"
								id="mem_mail"
								name="mem_mail"
								pattern="[a-zA-Z0-9_+.-]+@([a-zA-Z0-9-]+\.)+[a-zA-Z0-9]{2,4}"
								size="30"
								maxlength="50"
								required
								title="이메일을 입력하십시오">
<!-- 						<span id="mem_mail_err" class="err_msg"></span> -->
						<div class="check_font" id="mail_Check"></div>
						
						
						<input type="button"
								id="emailCheckBtn"
								name="emailCheckBtn"
								value="중복검사"
								onClick="emailCheck()"><br>		
					</td>
				</tr>
				<!-- 패스워드 -->
				<tr>
					<td><span class="requiredFld">*</span> 패스워드</td>
					<td>
						<input type="password"
								id="mem_pw"
								name="mem_pw"
								maxlength="20"
								pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W).{8,20}"
								required
								title="패스워드는 영문 대소문자와 특수문자 숫자를 조합하여, 8~20자로 입력해주세요">
					</td>		
				</tr>
				<!-- 패스워드 확인 -->
				<tr>
					<td><span class="requiredFld">*</span> 패스워드 확인</td>
					<td>
						<input type="password"
								id="mem_cpw"
								name="mem_cpw"
								maxlength="20"
								pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W).{8,20}"
								required
								title="패스워드는 영문 대소문자와 특수문자 숫자를 조합하여, 8~20자로 입력해주세요">
					</td>		
				</tr>
				<!--  이름 -->
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
				<!--  닉네임 -->
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
				<!-- 성별 -->
				<tr>
					<td><span class="requiredFld">*</span> 성별</td>
					<td>
						<input id="radio_gender" type="radio"
										id="memGenderMale"
										name="mem_gender"
										value="m"
										checked
										required>
								<label for="memGenderMale">남자</label>
						<div class="check"></div>		
						<input type="radio"
										id="memGenderFemale"
										name="mem_gender"
										value="f">
						<label for="memGenderfemale">여자</label>
						<div class="check"></div>		
					</td>
				</tr>
				<!-- 다음 주소 api -->
				<!-- 우편번호 -->
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
				<!-- 기본주소 -->
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
				<!-- 상세주소 -->
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
				<!-- 연락처 -->
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
				<table class="joinFormMenu">
				<!-- 서밋 -->
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
				</form:form>
			</div>
		</div>
	</div>
<jsp:include page="../footer.jsp" />
