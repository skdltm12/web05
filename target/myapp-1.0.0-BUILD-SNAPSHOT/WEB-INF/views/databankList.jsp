<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="path1" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>자료목록</h2>
	<ul class="Lst">
		<c:forEach items="${databankList }" var="db" varStatus="status">
		<li>
			<p>${db.title }</p><br>
			<a><img src="./upload/${db.fileurl }" alt="${db.title }"></a><br>
			<p>${db.author }</p>
		</li>
		</c:forEach>
	</ul>
</body>
</html>