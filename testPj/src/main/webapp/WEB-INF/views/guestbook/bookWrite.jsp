<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
<script type="text/javascript" src='<c:url value="/resources/js/jquery-3.5.1.min.js" />'></script>
<script type="text/javascript">
	$(function(){
		$("#cc").click(function(){
			history.back();
		})
	});
</script>
</head>
<body>
<h1>도서 등록</h1>
<form action="<c:url value='/guestbook/bookWrite.do'/>" name="frmWrite" method="post">
<table border="1">
	<tr>
		<th>이름 </th>
		<td><input type="text" name="name"></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="text" name="pwd"></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><input type="text" name="content"></td>
	</tr>
	<tr id="tr1">
		<td colspan="2"><input type="submit" value="등록">
		<input type="button" value="취소" id="cc"></td>
	</tr>
 </table>
 <br>
<a href="<c:url value='/guestbook/bookList.do'/>">도서 목록</a>
</form>
</body>
</html>