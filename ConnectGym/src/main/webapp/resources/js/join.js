/*
 * 회원가입폼
 */

function searchPost() {

	new daum.Postcode({

		oncomplete : function(data) {
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
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName
							: data.buildingName);
				}
				// 조합형 주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다
				fullAddr += (extraAddr !== '' ? '(' + extraAddr + ')' : '');

			}

			// 3단계 : 해당 필드들에 정보 입력
			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('mem_zipcode').value = data.zonecode; // 5자리
																			// 새
																			// 우편번호
																			// 사용
			document.getElementById('mem_addr').value = fullAddr;

		}

	}).open();

}; //

	// 이메일 중복 점검
$("#mem_mail").blur(function() {
	
	console.log("이메일 중복점검");
	
	// 정규식 점검으로 유효 데이터 전송
	var regexEmail = new RegExp($("#mem_mail").attr("pattern"));
	var mem_mail = $("#mem_mail").val();

	if (regexEmail.test(memberEmail)) { // 정규식 점검 통과
	
    	$.ajax({
    		 // url : '${pageContext.request.contextPath}/member/emailCheck.do',
    		 url : rootPath + '/member/emailCheck.do',
             type : 'post',
             dataType:'text',
             data : {
                 memberEmail : $('#mem_mail').val()
             },
             success : function(data) {
               
                console.log("이메일 중복 점검 수신 !");
                
             	// 중복 점검 체크 플래그 재설정
                if (data.trim() == '사용할 수 있는 이메일입니다.') {
            	   // 메시지 초기화 : 정상적일 경우는 메시지 표기 불필요할 경우
            	   $("#mem_mail_err").text("");
            	   emailCheckFlag = true;
                } else {
               	   $("#memberEmail_err").text(data);
                   emailCheckFlag = false;
                }
             	
                // 플래그 인쇄
	                console.log("idCheckFlag : "+ idCheckFlag);
	                console.log("emailCheckFlag : "+ emailCheckFlag);
	                console.log("phoneCheckFlag : "+ phoneCheckFlag);
               
            }, // success
             
             error : function(xhr, status) {
                console.log(xhr+" : "+status); // 에러 코드
            }
 
    	}); // ajax

	} else { // 정규식 점검 실패
		
		// 에러 메시징
		$("#memberEmail_err").text(($("#memberEmail").attr("title")));
		// 재입력 대기
		$("#memberEmail").focus();
	} //
	
});