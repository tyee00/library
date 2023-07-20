<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<c:import url ="/include/top.jsp" />

<section>
 <br>
 <div align ="center">
 <h2>도서관 수정 페이지</h2>
 <form name = "f1" action = "${path}/library_updateLibrary.do" method = post>
 <table border = 1>
<input type = hidden name ="idx" value = "${m.idx}">
<tr>
<td>도서관 이름</td>
<td><input type =text name = "libraryName" value = "${m.libraryName}"></td>
</tr>

<tr>
<td>도서관 주소</td>
<td><input type="text" value = "${m.zipcode}" name = "zipcode" id="sample6_postcode" placeholder="우편번호">
<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
<input type="text" value = "${m.libraryAddr1}"  name = "libraryAddr1" id="sample6_address" placeholder="주소"><br>
<input type="text" value = "${m.libraryAddr2}" name = "libraryAddr2" id="sample6_detailAddress" placeholder="상세주소">
</td>

</tr>

<tr>
<td>도서관 전화번호</td>
<td><input type =text name = "libraryTel" value = "${m.libraryTel}"></td>
</tr>

<tr>
<td>도서관 홈페이지</td>
<td><input type =text name = "libraryHomepage" value = "${m.libraryHomepage}"></td>
</tr>

 <tr>
 <td colspan =2 align = center><input type = submit value="수정">
 
 </td>
 </tr>
</table>
</form>

 </div>
 <br>
</section>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    
                
                } 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>

<c:import url ="/include/bottom.jsp" />