<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<c:import url ="/include/top.jsp" />
<script>
function delK(idx) {
	alert(idx+"를 삭제합니다.");
	location.href = "${path}/member_deleteMember.do?idx="+idx;
}
</script>
<body>
<section>
 <br>
 <div align ="center">
 <h2>회원목록</h2>
<table border = 1>
<tr>
<td>순번</td>
<td>아이디</td>
<td>비밀번호</td>
<td>이름</td>
<td>주소</td>
<td>우편번호</td>
<td>etc</td>
<td>삭제</td>
</tr>
<c:forEach items="${li}" var="m" >
<tr>
<td><a href = "${path}/member_selectOne.do?idx=${m.idx}">${m.idx}</a></td>
<td>${m.id}</td>
<td>${m.password}</td>
<td>${m.name}</td>
<td>${m.addr1}${m.addr2}</td>
<td>${m.zipcode}</td>
<td>${m.etc}</td>
<td><input type = "button" onclick="delK('${m.idx}')" value ="삭제"></td>
</tr>
</c:forEach>


</table>
</div>
</section>
</body>
<c:import url ="/include/bottom.jsp" />