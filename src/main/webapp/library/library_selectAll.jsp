<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<c:import url ="/include/top.jsp" />
<script>
function delK(idx) {
	alert(idx+"를 삭제합니다.");
	location.href = "${path}/library_deleteLibrary.do?idx="+idx;
}
</script>
<section>
 <br>
 <div align ="center">
 <h2>도서관 목록</h2>
<table border = 1>
<tr>
<td align=center>순번</td>
<td align=center>도서관이름</td>
<td align=center>도서관주소</td>
<td align=center>전화번호</td>
<td align=center>우편번호</td>
<td align=center>홈페이지</td>
<td align=center>삭제</td>
</tr>
<c:forEach items="${li}" var="m" >
<tr>
<td align=center><a href = "${path}/library_selectOne.do?idx=${m.idx}">${m.idx}</a></td>
<td align=center><a href = "${path}/library_selectMap.do?idx=${m.idx}">${m.libraryName}</td>
<td align=center>${m.libraryAddr1}${m.libraryAddr2}</td>
<td align=center>${m.zipcode}</td>
<td align=center>${m.libraryTel}</td>
<td align=center>${m.libraryHomepage}</td>
<td align=center><input type = "button" onclick="delK('${m.idx}')" value ="삭제"></td>
</tr>
</c:forEach>


</table>
<form action= "${path}/library_selectAll.do" method=post>

<select name = ch1>
<option value = "name">이름</option>
<option value = "address">주소</option>
</select>
<input type="text" name = ch2>
<input type = submit value ="검색">
</form>
</div>

</section>
<c:import url ="/include/bottom.jsp" />