<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table{
		width: 300px;
		border-collapse: collapse;
	}
	#tr1{
		text-align: center;
	}
</style>
<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.5.1.min.js" />"></script>
</head>
<body>
<h1>도서 수정</h1>

<form action="<c:url value="/book/bookUpd.do"/>" name="frmUpd" method="post">
<input type="hidden" name="no" value="${param.no}">
<table border="1">
	<tr>
		<th>도서명 </th>
		<td><input type="text" name="title" value="${dto.title}"></td>
	</tr>
	<tr>
		<th>가격 </th>
		<td><input type="text" name="price" value="${dto.price}"></td>
	</tr>
	<tr>
		<th>출판사 </th>
		<td><input type="text" name="publisher" value="${dto.publisher}"></td>
	</tr>
	<tr id="tr1">
		<td colspan="2"><input type="submit" value="수정">
		<input type="button" value="취소" id="cc"></td>
	</tr>
 </table>
 <br>
<script type="text/javascript">
	$(function(){
		$("#cc").click(function(){
			location.href="bookDetail.do?no=${param.no}";
		});
	});
</script>
<a href="bookList.do">도서 목록</a>
</form>
</body>
</html>