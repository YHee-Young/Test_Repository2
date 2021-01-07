<%@page import="javax.rmi.CORBA.Util"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src='<c:url value="/resources/js/jquery-3.5.1.min.js" />'></script>
</head>
<body>
	<h1>상품 상세보기</h1>
	<c:if test="${!empty param.no}">
		${param.no}번 책
	</c:if>
	<br>
	<br>번호 : ${param.no}<br> 
	도서명 : ${dto.title }<br> 
	가격 : <fmt:formatNumber value="${dto.price}" pattern="#,###원" />
	<br> 
	출판사 : ${dto.publisher }<br> 
	등록일 : <fmt:formatDate value="${dto.joindate}" pattern="yyyy-MM-dd" /><br>
	

	<a href="<c:url value='/book/bookList.do' />">목록 |</a>
	<a href="<c:url value='/book/bookUpd.do?no=${param.no}' />">수정 |</a>
	<a href="<c:url value='/book/bookReply.do?no=${param.no}' />">답변 |</a>
	<a href="<c:url value='/book/bookDel.do?no=${param.no}' />" id="del">삭제</a>
	<script type="text/javascript">
	$(function(){
		$("#del").click(function(){
			if(confirm("삭제하시겠습니까?")){
				location.href="<c:url value='bookDel.do?no=${param.no}' />";
			}
		});
	})
	</script>
</body>
</html>