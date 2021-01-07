<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	width: 500px;
	border-collapse: collapse;
}
</style>
</head>
<body>
	<h1>상품 목록</h1>
	<br>
	<c:if test="${!empty list && !empty param.searchKeyword}">
		<p>${param.searchKeyword}로 검색결과, ${pvo.totalRecord}건 조회 성공</p>
	</c:if>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>도서명</th>
			<th>가격</th>
			<th>출판사</th>
			<th>등록일</th>
		</tr>
		
	<c:if test="${empty list}">
			<tr>
				<td colspan="5">조회할 데이터가 없습니다.</td>
			</tr>	
	</c:if>
	<c:if test="${!empty list}">
		
		<c:forEach var="dto" items="${list}">
				<tr>
					<td>${dto.no}</td> <!-- CRUD작업으로 시퀀스가 비어도 데이터 갯수만큼 번호출력됨 -->
					<td>
						<a href="<c:url value="/book/bookDetail.do?no=${dto.no}" />">${dto.title}</a>
					 </td>
					<td>${dto.price}</td>
					<td>${dto.publisher}</td>
					<td><fmt:formatDate value="${dto.joindate}" pattern="yyyy-MM-dd" /></td>
				</tr>
			
		</c:forEach>
	</c:if>
	</table>
	<!-- 페이지 번호 -->
	<div class='divPage'>
		<c:if test="${pvo.firstPage>1}">
		<a href="<c:url value='/book/bookList.do?currentPage=${pvo.firstPage-1}&searchCondition=${param.searchCondition}&searchKeyword=${param.searchKeyword}' />">
			<img alt="Prev" src='<c:url value="/resources/images/first.JPG" />'>	
		</a>
		</c:if>
		<c:forEach var="i" begin="${pvo.firstPage}" end="${pvo.lastPage}">
			<c:if test="${i==pvo.currentPage }">
				<a href="<c:url value="/book/bookList.do?currentPage=${i}&searchCondition=${param.searchCondition}&searchKeyword=${param.searchKeyword}"/>">[${i}]</a>
			</c:if>
			<c:if test="${i!=pvo.currentPage }">
				<a href="<c:url value="/book/bookList.do?currentPage=${i}&searchCondition=${param.searchCondition}&searchKeyword=${param.searchKeyword}"/>">${i}</a>		
			</c:if>	
		
		</c:forEach>
		<c:if test="${pvo.lastPage<pvo.totalPage}">
		<a href="<c:url value="/book/bookList.do?currentPage=${pvo.lastPage+1 }&searchCondition=${param.searchCondition}&searchKeyword=${param.searchKeyword}" />">
			<img alt="Next" src='<c:url value="/resources/images/last.JPG" />'>	
		</a>
		</c:if>
	</div>
	<div>
		<form name="frmSearch" method="post" action='<c:url value="/book/bookList.do" />'>
			<select name="searchCondition">
				
				<option value="title" <c:if test='${param.searchCondition=="title"}'>selected="selected"</c:if>>
				제목
				</option>
				<option value="publisher" <c:if test='${param.searchCondition=="publisher"}'>selected="selected"</c:if>>
				출판사
				</option>
			</select>
			<input type="text" id="searchKeyword" name="searchKeyword" value='<c:if test="${!empty param.searchKeyword}">${param.searchKeyword}</c:if>'/>
			<input type="submit" value="검색"> 
		</form>
	</div>
	<br>
	<a href="<c:url value="/book/bookWrite.do" />">도서 등록</a>
</body>
</html>