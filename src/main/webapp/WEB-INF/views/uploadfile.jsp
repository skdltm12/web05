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
			<form action="fileUpload.do" method="post" enctype="multipart/form-data">
				<label for="file">파일 업로드</label>
				<input type="file" name="myfile">
				<br>
				<hr>
				<br>
				<input type="submit" value="파일 업로드">
			</form>
</body>
</html>