<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="path1" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>즐거운 온라인 쇼핑공간에 오신 것을 환영합니다!</title>	
	<link rel="icon" href="../resources/img/favicon.ico" type="image/x-icon">
	<link rel="stylesheet" href="../resources/css/style.css">
	<script src="https://code.jquery.com/jquery-latest.js"></script>		
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Noto+Sans+KR:wght@300;400;500;700;900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">	
</head>
<body>
	<c:import url="../inc/header.jsp" />
	<div id="content">
		<div class="content_wrap">
			<div class="title"><h2>상품 추가</h2></div>
			<form action="${path1 }/product/add.do" method="post" enctype="multipart/form-data">
				<table class="tb tb6">
					<tr>
						<th>제품번호</th>
						<td><input type="text" name="pid" class="single100"></td>
					</tr>
					<tr>
						<th>제품명</th>
						<td><input type="text" name="pname" class="single100"></td>
					</tr>
					<tr>
						<th>상품가격</th>
						<td><input type="text" name="pprice" class="single100"></td>
					</tr>
					<tr>
						<th>할인가격</th>
						<td><input type="text" name="pdcprice" class="single100"></td>
					</tr>
					<tr>
						<th>이미지</th>
						<td><input type="file" name="pimg" id="p_img" class="single100"></td>
					</tr>
					<tr>
						<th>색상</th>
						<td><input type="text" name="pcolor" class="single100"></td>
					</tr>
					<tr>
						<th>사이즈</th>
						<td><input type="text" name="psize" class="single100"></td>
					</tr>
					<tr>
						<th>수량</th>
						<td><input type="text" name="pamount" class="single100"></td>
					</tr>
					<tr>
						<th>프리미엄 유무 (프리미엄 : 1, 일반 : 0)</th>
						<td><input type="text" name="premium" class="single100"></td>
					</tr>
					<tr>
						<th>상품판매량</th>
						<td><input type="text" name="best" class="single100"></td>
					</tr>
					<tr>
						<th>할인율</th>
						<td><input type="text" name="dc" class="single100"></td>
					</tr>												
					<tr>
						<td colspan="4"><input type="submit" value="등록" class="btn1"></td>
					</tr>																								
				</table>
			</form>
		</div>
    	<script>
$(window).scroll(function() {  
  if($(this).scrollTop() > 10) {
    $("#header_wrap").css('padding-top','0')
      $("#mainmenu1,#mainmenu2,#mainmenu3,#mainmenu4,#mainmenu5,#mainmenu6").css('color','#333');             
    $(".mypage").css({"background":"url(../resources/img/my_bk.svg"}); 			
    $(".basket").css({"background":"url(../resources/img/cart_bk.svg", 'background-repeat' : 'no-repeat'});			
    $(".search").css({"background":"url(../resources/img/sch_bk.svg"}); 			
    $(".logo").css({"background":"url(../resources/img/logo.png"});
      $(".lg_line1,.lg_line2,.lg_line3").css('background-color','black');
      $(".background").css('opacity','1');
      $(".background").css('height','73px');
      $(".lb_a").css({'color':'#333'});
      $(".lb_a").css({'font-weight':'500'});
      $(".gnb_bar").css('background-color','#999')
  }else{
    $("#header_wrap").css('padding-top','16px')
    $(".background").css('opacity','0');
      $(".background").css('height','90px');   
  }});
</script>
	</div>	
	<c:import url="../inc/footer.jsp" />
</body>
</html>