<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="path1" value="{pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>자료등록</h2>
			<form action="databankinsert.do" method="post" enctype="multipart/form-data">
				<label for="title">제목</label>
				<input type="text" name="title" id="title">
				<label for="file">파일</label>
				<input type="file" name="fileurl" id="fileurl">
				<label for="author">작성자</label>
				<input type="text" name="author" id="author">				
				<br>
				<hr>
				<br>
				<input type="submit" value="파일 업로드">
			</form>
</body>
</html>