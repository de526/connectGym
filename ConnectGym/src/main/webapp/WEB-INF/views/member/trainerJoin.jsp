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
	// 닉네임 정규식
	var nickJ = /[0-9]|[a-z]|[A-Z]|[가-힣]/;
	
 	$(document).ready(function(){
	
		// 아이디(이메일) 중복확인
 		$("#memMail").blur(function(){ 
			if($('#memMail').val() == ''){
			$('#mail_check').text('아이디(이메일)를 입력하세요.');
			$('#mail_check').css('color', 'red');
		}else if($('#memMail').val() != ''){
			
			var memMail=$('#memMail').val();
			
			$.ajax({
				async: true,
				type: 'POST',
				data: {
					"mail" : memMail
				}, // mail 이라는 이름으로 memMail라는 데이터를 @Webservlet("/idsearch.do")에 보내겠다
				url : '/ConnectGym/mailcheck.do',
				dateType: 'json',
				success: function(data){
				console.log(data);	
				
 					if(data > 0){
						$('#mail_check').text('중복된 아이디(이메일) 입니다.');
						$('#mail_check').css('color','red');
						$("#usercheck").attr("disabled", false);
					} else {
						if(mailJ.test(memMail)){
							$('#mail_check').text('사용가능한 아이디(이메일) 입니다.');
							$('#mail_check').css('color', 'blue');
							$("#usercheck").attr("disabled", false);
						}
						else if(memMail == ''){
							$('#mail_check').text('아이디(이메일)를 입력해주세요.');
							$('#mail_check').css('color', 'red');
							$("#usercheck").attr("disabled", true);
							
							
						} else {
							$('#mail_check').text("이메일 형식이 아닙니다. 다시 입력해주세요.");
							$('#mail_check').css('color', 'red');
							$("#usercheck").attr("disabled", true); 
						}
					}  
				}
				
			}); // ajax
		} // else if
			
		}); // blur
		
		// 비밀번호 유효성 검사 : 추후에 정규식 영소대문자 숫자 특수문자 혼용해서 사용하게 정규식 추가예정 //
		$('#memPw').blur(function() {
			if (pwJ.test($('#memPw').val())) {
				console.log('true');
				$('#pw_check').text('');
			
			} else {
				console.log('false');
				$('#pw_check').text('4~12자의 숫자 , 문자로만 사용 가능합니다.');
				$('#pw_check').css('color', 'red');
				
				} // else if
			
			}); // blur (비밀번호 유효성 검사)
	
		// 비밀번호 일치 확인	
		$("#memPw2").blur(function(){
			if($('#memPw').val() != $(this).val()){
				$('#pw2_check').text('비밀번호가 일치하지 않습니다.');
				$('#pw2_check').css('color', 'red');
				
			}else {
				$('#pw2_check').text('');
		
			}// else if
			
		}); // blur (비밀번호 확인)
		
		// 이름에 특수문자 들어가지 않도록 설정
		$("#memName").blur(function(){
			if(nameJ.test($(this).val())){
				console.log(nameJ.test($(this).val()));
				$('#name_check').text('');
			}else {	
				$('#name_check').text('한글 2~4자 이내로 입력하세요. (특수기호, 공백 사용 불가)');
				$('#name_check').css('color', 'red');
			}
		});
		
		// 생일 유효성 검사
		var birthJ = false;
		
		// 생년월일 birthJ 유효성 검사
		$('#memBirth').blur(function(){
			var dateStr = $(this).val();
			var year = Number(dateStr.substr(0,4)); // 입력한 값의 0~4자리까지 (연)
			var month = Number(dateStr.substr(4,2)); // 입력한 값의 4번째 자리부터 2자리 숫자 (월)
			var day = Number(dateStr.substr(6,2)); // 입력한 값 6번째 자리부터 2자리 숫자 (일)
			var today = new Date(); // 날짜 변수 선언
			var yearNow = today.getFullYear(); // 올해 연도 가져옴
			
			if (dateStr.length <= 8 ){
				// 연도의 경우 1900 보다 작거나 yearNow 보다 크다면 false를 반환합니다.
				if(year > yearNow || year < 1900){
					$('#birth_check').text('생년월일을 확인해주세요');
					$('#birth_check').css('color', 'red');
				}
				else if (month < 1 || month > 12){
					$('#birth_check').text('생년월일을 확인해주세요');
					$('#birth_check').css('color', 'red');
					
				} else if (day < 1 || day > 31){
					$('#birth_check').text('생년월일을 확인해주세요');
					$('#birth_check').css('color', 'red');
					
				} else if ((month == 4 || month == 6 || month == 9 || month == 11) && day == 31) {
					$('#birth_check').text('생년월일을 확인해주세요');
					$('#birth_check').css('color', 'red');
					
				}else if (month == 2){
					var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
					
					if(day > 29 || (day == 29 && !isleap)){
						$('#birth_check').text('생년월일을 확인해주세요');
						$('#birth_check').css('color', 'red');
					} else {
						$('#birth_check').text('');
						birthJ = true;
					}
				} else {
					$('#birth_check').text('');
					birthJ = true;
				} // end of if
			} else {
				// 1. 입력된 생년월일이 8자를 초과할때 : auth : false
				$('#birth_check').text('생년월일을 확인해주세요');
				$('#birth_check').css('color', 'red');
			}

		}); // end of method
		
		// 휴대전화
		$('#memPhone').blur(function(){
			if(phoneJ.test($(this).val())){
				console.log(nameJ.test($(this).val()));
				$("#phone_check").text('');
			} else {
				$('#phone_check').text('휴대폰 번호를 확인해주세요');
				$('#phone_check').css('color', 'red');
			}
		});
		
		//폼 서밋 후 체크	
 		$('form').on('submit', function(){
			var inval_Arr = new Array(8).fill(false);
			if (mailJ.test($('#memMail').val())) {
				inval_Arr[0] = true;
			} else {
				inval_Arr[0] = false;
				alert('이메일(아이디)을 확인하세요.');
				return false;
			}
			
			// 이름 정규식
			if (nameJ.test($('#memName').val())){
				inval_Arr[2] = true;
			}
			
			// 이메일 정규식
			if (mailJ.test($('#memMail').val())){
				inval_Arr[4] = true;
			} else {
				inval_Arr[4] = false;
				alert('이메일을 확인하세요.');
				return false;
			}
			// 휴대폰 번호 정규식
			if (phoenJ.test($('#memPhone').val())) {
				console.log(phoneJ.test($('#memPhone').val()));
				inval_Arr[5] = true;
				alert('휴대폰 번호를 확인하세요.');
				return false;
			}
			// 성별 확인
			if(member.memGender[0].checked == false && member.memGender[1].checked == false){
				inval_Arr[6] = false;
				alert('성별을 확인하세요.');
				return false;
			} else {
				inval_Arr[6] = true;
			}
			// 주소확인
			if(address.val() == ''){
				inval_Arr[7] = false;
				alert('주소를 확인하세요.');
				return false;
			} else 
				inval_Arr[7] = true;
			
			// 전체 유효성 검사
			var validAll = true;
				for (var i = 0; i < inval_Arr.length; i++){
					if(inval_Arr[i] == false){
						validAll = false;
					}
				}
				if (validAll = true){ // 유효성 모두 통과
					alert('커짐에 회원가입 되셨습니다.');
				} else {
					alert('정보를 다시 확인하세요.');
				}
		});
		
	}) // 레디
	
	
	// 다음 주소 api
  	function searchPost() {

		new daum.Postcode(
				{		oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을 때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다
						// 내려오는 변수가 값이 없는 경우에 공백('') 값을 가지므로, 이를 참고할 것
						var fullAddr = ''; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수

						// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							fullAddr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							fullAddr = data.jibunAddress;
						}
						// 사용자가 선택한 주소가 도로명 타입일때 조합한다
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가함
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형 주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다
							fullAddr += (extraAddr !== '' ? '(' + extraAddr
									+ ')' : '');
						}
						// 3단계 : 해당 필드들에 정보 입력
						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('memZipcode').value = data.zonecode; // 5자리
						// 새
						// 우편번호
						// 사용
						document.getElementById('memAddr').value = fullAddr;
					}
				}).open();
	}; // 
	
</script>
<div id="join">
	<div class="join_wrap">
		<h3>트레이너 회원가입</h3>
		<div class="join_panel">
			<form action="memberjoin.do" name="trainer" id="userCheck" method="post"	role="form">

				<div class="join-form_group">
					<label for="mail">이메일(아이디)</label> <input type="text"
						class="form-control" id="memMail" name="memMail" size="30"
						placeholder="EMAIL" />
					<div class="check_font" id="mail_check"></div>
				</div>
				<div class="join-form_group">
					<label for="pw">비밀번호</label> <input type="password"
						class="form-control" id="memPw" name="memPw"
						placeholder="PASSWORD">
					<div class="check_font" id="pw_check"></div>
				</div>
				<div class="join-form_group">
					<label for="pw2">비밀번호 확인</label> <input type="password"
						class="form-control" id="memPw2" name="memPw2"
						placeholder="Confirm Password">
					<div class="check_font" id="pw2_check"></div>
				</div>
				<div class="join-form_group">
					<label for="memName">이름</label> <input type="text"
						class="form-control" id="memName" name="memName"
						placeholder="Name">
					<div class="check_font" id="name_check"></div>
				</div>
				<div class="join-form_group">
					<label for="memNick">닉네임</label> <input type="text"
						class="form-control" id="memNick" name="memNick"
						placeholder="Nick Name">
					<div class="check_font" id="nick_check"></div>
				</div>
				<div class="join-form_group">
					<label for="memGender">성별</label> 
					<input type="radio"	id="memGender" name="memGender" value="M" /> 남자
					 <input	type="radio" id="memGender" name="memGender" value="F" /> 여자
				</div>
				<div class="join-form_group">
					<label for="memBirth">생년월일</label> <input type="tel"
						class="form-control" id="memBirth" name="memBirth"
						placeholder="ex) 19910101" />
					<div class="check_font" id="birth_check"></div>
				</div>
				<div class="join-form_group">
					<label for="memPhone">휴대폰 번호('-' 없이 번호만 입력해주세요)</label> <input
						type="tel" class="form-control" id="memPhone" name="memPhone"
						placeholder="Phone Number" />
					<div class="check_font" id="phone_check"></div>
				</div>
				<!--  다음 주소 api -->
				<div class="join-form_group">
					<input class="form_control" style="display: inline;"
						placeholder="우편번호" name="memZipcode" id="memZipcode" type="text"
						readonly="readonly" size="5" maxlength="5" /> <input type="button"
						class="btn btn-default" onClick="searchPost()"
						name="joinAddressSearchBtn" value="주소검색"><br>
				</div>
				<!-- 기본주소 -->
				<div class="join-form_group">
					<input class="form-control" style="top: 5px;" placeholder="도로명 주소"
						name="memAddr" id="memAddr" type="text" readonly="readonly">
				</div>
				<div class="join-form_group">
					<input class="form-control" placeholder="상세주소" name="memDeAddr"
						id="memDeAddr" type="text">
				</div>
				<!-- 트레이너 가입정보 -->
				<div class="join-form_group">
				<label for="gymNo">소속 헬스장</label> <input
						type="text"class="form-control" id="gymNo" name="gymNo" style="display : inline;"
						readonly="readonly" /> <input type="button" class="btn btn-default" onclick="searchGym()"
						name="joinGymSearchBtn" value="헬스장 검색">
					<div class="check_font" id="phone_check"></div>
				</div>
				<div class="join-form-group text-center">
					<button type="submit" class="btn btn-primary">회원가입</button>
				</div>
			</form>
		</div>
	</div>
</div>
<jsp:include page="../footer.jsp" />
