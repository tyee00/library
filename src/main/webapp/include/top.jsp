<%@ page language="java" pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>  
 <c:set var="path" value="${pageContext.request.contextPath}" scope="request"/>
 <% String id = (String)session.getAttribute("id"); %>
 <c:set var="key" value="a0ce51e7c89af8bc4bd7db6fa847a5c5" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서관 검색시스템</title>
<link href="${path}/include/top.css" rel="stylesheet" type="text/css"  />
<style type="text/css">

</style>

</head>
<body>

<header>
 <h2> Library Search </h2>
</header>
<nav>

&emsp;&emsp;<a href="${path}/index.jsp">홈으로.</a>

&emsp;&emsp;<a href="${path}/library_selectAll.do">도서관검색</a>

&emsp;&emsp;<a href="${path}/library/library_form.jsp">도서관추가</a>

<c:if test="${id eq null}">&emsp;&emsp;<a href="${path}/login/login.jsp">로그인</a></c:if>

<c:if test="${id != null}">&emsp;&emsp;<a href="${path}/logout.do">로그아웃</a>
&emsp;&emsp;<a href="${path}/bookmark_selectAll.do">즐겨찾기</a></c:if>


&emsp;&emsp;<a href="${path}/member/member_form.jsp">회원가입</a>


<c:if test="${id != null}">&emsp;&emsp;<a href="${path}/member_selectAll.do">회원목록</a></c:if>

</nav>

