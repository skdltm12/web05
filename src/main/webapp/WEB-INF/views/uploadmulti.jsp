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
<h2>여러파일 업로드 실습</h2>
			<form action="multifileupload.do" method="post" enctype="multipart/form-data">
				<label for="files">파일1 업로드</label>
				<input type="file" name="files" id="files1">
				<label for="files">파일2 업로드</label>
				<input type="file" name="files" id="files2">
				<label for="files">파일3 업로드</label>
				<input type="file" name="files" id="files3">				
				<br>
				<hr>
				<br>
				<input type="submit" value="파일 업로드">
			</form>
</body>
</html>