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

	if (regexEmail.test(mem_mail)) { // 정규식 점검 통과
	
    	$.ajax({
    		 url : '/ConnectGym/emailCheck.do',
             type : 'post',
             dataType:'text',
             data : {
            	 email : $('#mem_mail').val()
             },
             success : function(data) {
               
                console.log("이메일 중복 점검 수신 !");
                
                alert(data);
//             	// 중복 점검 체크 플래그 재설정
//                if (data.trim() == '사용할 수 있는 이메일입니다.') {
//            	   // 메시지 초기화 : 정상적일 경우는 메시지 표기 불필요할 경우
//            	   $("#mem_mail_err").text("");
//            	   emailCheckFlag = true;
//                } else {
//               	   $("#mem_mail_err").text(data);
//                   emailCheckFlag = false;
//                }
             	
                // 플래그 인쇄
	                console.log("idCheckFlag : "+ idCheckFlag);
	                console.log("emailCheckFlag : "+ emailCheckFlag);
	                console.log("phoneCheckFlag : "+ phoneCheckFlag);
               
            }, // success
             
             error : function(xhr, status) {
                alert("실패")
            	 //console.log(xhr+" : "+status); // 에러 코드
            }
 
    	}); // ajax

	} else { // 정규식 점검 실패
		
		// 에러 메시징
		$("#mem_mail_err").text(($("#mem_mail").attr("title")));
		// 재입력 대기
		$("#mem_mail").focus();
	} //
	
});

	// 연락처 중복 점검
$("#mem_phone").blur(function() {
	
	console.log("연락처 중복점검");
	
	// 정규식 점검으로 유효 데이터 전송
	var regexPhone = new RegExp($("#mem_phone").attr("pattern"));
	var mem_phone = $("#mem_phone").val();

	if (regexPhone.test(mem_phone)) { // 정규식 점검 통과
	
    	$.ajax({
    		 // url : '${pageContext.request.contextPath}/member/phoneCheck.do',
    		 url : rootPath + '/member/phoneCheck.do',
             type : 'post',
             dataType:'text',
             data : {
                 memberPhone : $('#mem_phone').val()
             },
             success : function(data) {
               
                console.log("연락처 중복 점검 수신 !");
                
            	// 중복 점검 체크 플래그 재설정
                if (data.trim() == '사용할 수 있는 연락처입니다.') {
            	   // 메시지 초기화 : 정상적일 경우는 메시지 표기 불필요할 경우
            	   $("#mem_phone_err").text("");
            	   phoneCheckFlag = true;
                } else {
                   $("#mem_phone_err").text(data);
                   phoneCheckFlag = false;
                }
            	
             	// 플래그 인쇄
	                console.log("idCheckFlag : "+ idCheckFlag);
	                console.log("emailCheckFlag : "+ emailCheckFlag);
	                console.log("phoneCheckFlag : "+ phoneCheckFlag);
               
            }, // success
             
             error : function(xhr, status) {
                console.log(xhr+" : "+status); // 에러 코드
            }
 
    	});
	
	} else { // 정규식 점검 실패
		
		// 에러 메시징
		$("#mem_phone_err").text(($("#mem_phone").attr("title")));
		// 재입력 대기
		$("#mem_phone").focus();
		
	} //
	
});

	// 폼 데이터 전송
	$("form#joinForm").submit(function(){
		
		alert("폼 전송");
		
		// alert("이메일 중복 점검 : " + emailCheckFlag);
		// alert("연락처 중복 점검 : " + phoneCheckFlag);
		
		if (emailCheckFlag == false || phoneCheckFlag == false) {
			
			
			if (emailCheckFlag == false) {
				$("#msg_modal #modal_body").text("중복되지 않는 이메일을 입력하십시오.");
				$("#msg_modal").show();
				// alert("중복되지 않는 이메일을 입력하십시오.");
				$("#mem_mail").focus();
			}
			
			if (phoneCheckFlag == false) {
				$("#msg_modal #modal_body").text("중복되지 않는 연락처를 입력하십시오.");
				$("#msg_modal").show();
				// alert("중복되지 않는 연락처를 입력하십시오.");
				$("#mem_phone").focus();
			}
			
			return false; // 전송금지
		}
		
		// 우편번호/주소/상세주소 점검
		// 주소 성분이 필수 사항이 아닐지라도 입력할 경우 상세주소 누락되는지 최종적으로 점검
		var regexAddressDetail = new RegExp($("#memberAddressDetail").attr("pattern"));
	var memberAddressDetail = $("#memberAddressDetail").val();
	
	//alert("우편번호 : "+$("#memberZip").val());
	//alert("기본주소 : "+$("#memberAddressBasic").val());
	//alert("상세주소 : "+$("#memberAddressDetail").val());
	    	
		if ($("#member_zipcode").val() != "" &&
		$("#mem_addr").val() != "" &&
		!regexAddressDetail.test(memberAddressDetail) ) 
		{
			$("#msg_modal #modal_body").text("상세주소를 입력하십시오.");
		$("#msg_modal").show();
		// alert("상세주소를 입력하십시오.");
		return false; // 전송 금지
		$("#mem_de_addr").focus();
		} // if
		
		// TODO
		// 우편번호/기본주소가 비었는데 상세주소에 데이터가 입력되었을 때
		// 1) 상세주소 정규식 점검 -> 오류 : 비움(초기화)
		// 2) 전송 금지
		// 3) 메시징 : 기본 주소를 검색하여 입력하십시오.
		// 4) focus : 검색 버튼
		
		// alert($("#memberAddressDetail").val().trim())
		
		if ($("#mem_zipcode").val() == "" &&
		$("#mem_addr").val() == "" &&
		$("#mem_de_addr").val().trim() != "" ) 
		{
			$("#msg_modal #modal_body").text("우편번호와 기본 주소를 입력하십시오.");
		$("#msg_modal").show();
			// alert("우편번호와 기본 주소를 입력하십시오."); 
			return false; // 전송 금지    	 							
		$("#joinAddressSearchBtn").focus();
		} // if
		
	});
