<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../header.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
</style>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
<!-- <meta name="viewport" content="width=device-width, initial-scale=1"> -->

<!-- jquery -->
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- 부트스트랩 -->
<!-- <link rel="stylesheet" href="css/bootstrap.min.css"> -->

<!-- daum 주소 검색 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- <script src="/ConnectGym/resources/js/join.js" charset="UTF-8"></script> -->
<script type="text/javascript">

	//모든 공백 체크 정규식 
	var empJ = /\s/g;
	// 이메일 검사 정규식
	var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	// 비밀번호 정규식 
	var pwJ = /^[A-Za-z0-9]{4,12}$/;
	// 이름 정규식 
	var nameJ = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
	// 휴대폰 번호 정규식
	var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
	/^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/

	var birthJ = false;
	
// 	var address = $('#mem_de_addr'); 
	
 	$(document).ready(function(){
// 		var address = $('#mem_de_addr');
	
		// 아이디 중복확인
 		$("#mem_mail").blur(function(){ 
			if($('#mem_mail').val() == ''){
			$('#mail_check').text('아이디를 입력하세요.');
			$('#mail_check').css('color', 'red');
		}else if($('#mem_mail').val() != ''){
			
			var mem_mail=$('#mem_mail').val();
			
			$.ajax({
				async: true,
				type: 'POST',
				data: {
					"mail" : mem_mail
				}, // mem_mail 이라는 이름으로 mem_mail라는 데이터를 @Webservlet("/idsearch.do")에 보내겠다
				url : '/ConnectGym/mailcheck.do',
				dateType: 'json',
// 				contentType: "application/json; charset=UTF-8",
				success: function(data){
				console.log(data);	
				
 					if(data > 0){
						$('#mail_check').text('중복된 아이디 입니다.');
						$('#mail_check').css('color','red');
						$("#usercheck").attr("disabled", false);
					} else {
						if(mailJ.test(mem_mail)){
							$('#mail_check').text('사용가능한 아이디 입니다.');
							$('#mail_check').css('color', 'blue');
							$("#usercheck").attr("disabled", false);
						}
						else if(mem_mail == ''){
							$('#mail_check').text('아이디를 입력해주세요.');
							$('#mail_check').css('color', 'red');
							$("#usercheck").attr("disabled", true);
							
							
						} else {
							$('#mail_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다.");
							$('#mail_check').css('color', 'red');
							$("#usercheck").attr("disabled", true);
						}
					}  
				}
				
			}); // ajax
		} // else if
			
		}); // blur
		
		$()
 		$('form').on('submit', function(){
			var inval_Arr = new Array(8).fill(false);
			if (mailJ.test($('#mem_mail').val())) {
				inval_Arr[0] = true;
			} else {
				inval_Arr[0] = false;
				alert('이메일(아이디)을 확인하세요.');
				return false;
			}
// 			// 비밀번호가 같을 경우 && 비밀번호 정규식
// 			if(($('#mem_pw').val() == ($('#mem_pw2').val()))
// 				&& pwJ.test($('#mem_pw').val())) {
// 				inval_Arr[1] = true;
// 			} else {
// 				inval_Arr[1] = false;
// 				alert('비밀번호를 확인하세요.');
// 				return false;
// 			}
			// 이름 정규식
			if(nameJ.test($('#mem_name').val())){
				inval_Arr[2] = true;
			}
		}) 
		
	}) // 레디
	
//   	function searchPost() {

// 		new daum.Postcode(
// 				{

// 					oncomplete : function(data) {
// 						// 팝업에서 검색결과 항목을 클릭했을 때 실행할 코드를 작성하는 부분.

// 						// 각 주소의 노출 규칙에 따라 주소를 조합한다
// 						// 내려오는 변수가 값이 없는 경우에 공백('') 값을 가지므로, 이를 참고할 것
// 						var fullAddr = ''; // 최종 주소 변수
// 						var extraAddr = ''; // 조합형 주소 변수

// 						// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다
// 						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
// 							fullAddr = data.roadAddress;

// 						} else { // 사용자가 지번 주소를 선택했을 경우(J)
// 							fullAddr = data.jibunAddress;

// 						}

// 						// 사용자가 선택한 주소가 도로명 타입일때 조합한다
// 						if (data.userSelectedType === 'R') {
// 							// 법정동명이 있을 경우 추가
// 							if (data.bname !== '') {
// 								extraAddr += data.bname;
// 							}
// 							// 건물명이 있을 경우 추가함
// 							if (data.buildingName !== '') {
// 								extraAddr += (extraAddr !== '' ? ', '
// 										+ data.buildingName : data.buildingName);
// 							}
// 							// 조합형 주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다
// 							fullAddr += (extraAddr !== '' ? '(' + extraAddr
// 									+ ')' : '');

// 						}

// 						// 3단계 : 해당 필드들에 정보 입력
// 						// 우편번호와 주소 정보를 해당 필드에 넣는다.
// 						document.getElementById('mem_zipcode').value = data.zonecode; // 5자리
// 						// 새
// 						// 우편번호
// 						// 사용
// 						document.getElementById('mem_addr').value = fullAddr;

// 					}

// 				}).open();

// 	}; // 
	
</script>
<div id="join">
	<div class="join_wrap">
		<h3>회원가입</h3>
		<div class="join_panel">
			<form action="memberjoin.do" name="join" id="userCheck" method="post"
				role="form">

				<div class="form_group">
					<label for="mail">이메일(아이디)</label> <input type="text"
						class="form-control" id="mem_mail" name="mem_mail" size="30"
						placeholder="EMAIL" />
					<div class="check_font" id="mail_check"></div>
					
					<!-- <script type="text/javascript">
					$("#mem_mail").blur(function(){ 
			 			console.log("안녕");})					
					</script> -->
				</div>
				<div class="form_group">
					<label for="pw">비밀번호</label> <input type="password"
						class="form-control" id="mem_pw" name="mem_pw"
						placeholder="PASSWORD">
					<div class="check_font" id="pw_check"></div>
				</div>
				<div class="form_group">
					<label for="pw2">비밀번호 확인</label> <input type="password"
						class="form-control" id="mem_pw2" name="mem_pw2"
						placeholder="Confirm Password">
					<div class="check_font" id="pw2_check"></div>
				</div>
				<div class="form_group">
					<label for="mem_name">이름</label> <input type="text"
						class="form-control" id="mem_name" name="mem_name"
						placeholder="Name">
					<div class="check_font" id="name_check"></div>
				</div>
				<div class="form_group">
					<label for="mem_nick">닉네임</label> <input type="text"
						class="form-control" id="mem_nick" name="mem_nick"
						placeholder="Nick Name">
					<div class="check_font" id="nick_check"></div>
				</div>
				<div class="form_group">
					<label for="mem_nick">성별</label> <input type="checkbox"
						id="mem_gender" name="mem_gender" value="m" /> 남자 <input
						type="checkbox" id="mem_gender" name="mem_gender" value="f" /> 여자
				</div>
				<div class="form_group">
					<label for="mem_birth">생년월일</label> <input type="tel"
						class="form-control" id="mem_birth" name="mem_birth"
						placeholder="ex) 19910101" />
					<div class="check_font" id="birth_check"></div>
				</div>
				<div class="form_group">
					<label for="mem_phone">휴대폰 번호('-' 없이 번호만 입력해주세요)</label> <input
						type="tel" id="mem_phone" name="mem_phone"
						placeholder="Phone Number" /> 남자
					<div class="check_font" id="phone_check"></div>
				</div>
				<!--  다음 주소 api -->
				<div class="form_group">
					<input class="form_control" style="width: 40%; display: inline;"
						placeholder="우편번호" name="mem_zipcode" id="mem_zipcode" type="text"
						readonly="readonly"> <input type="button"
						class="btn btn-default" onClick="searchPost()"
						name="joinAddressSearchBtn" value="주소검색"><br>
				</div>
				<!-- 기본주소 -->
				<div class="form_group">
					<input class="form-control" style="top: 5px;" placeholder="도로명 주소"
						name="mem_addr" id="mem_addr" type="text" readonly="readonly">
				</div>
				<div class="form_group">
					<input class="form-control" placeholder="상세주소" name="mem_de_addr"
						id="mem_de_addr" type="text">
				</div>
				<div class="form-group text-center">
					<button type="submit" class="btn btn-primary">회원가입</button>
				</div>
			</form>
		</div>
	</div>
</div>
<jsp:include page="../footer.jsp" />
