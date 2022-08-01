<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="path1" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
	 <script src="https://code.jquery.com/jquery-latest.js"></script>		
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Noto+Sans+KR:wght@300;400;500;700;900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="../resources/css/style.css">	
<meta charset="UTF-8">
	<title>즐거운 온라인 쇼핑공간에 오신 것을 환영합니다!</title>	
	<link rel="icon" href="../resources/img/favicon.ico" type="image/x-icon">
</head>
<body>

	<c:import url="../inc/header.jsp" />
	<div id="content">
		<div class="content_wrap">
			<div class="title"><h2>구매 내역 상세 보기</h2></div>
		<c:set var="sum_price" value="0"/>		
			<table class="tb tb7">
				<thead>
					<tr>
							<th>이미지</th><th>상품정보</th><th>판매가</th><th>수량</th><th>배송구분</th><th>배송비</th><th>합계</th><th>구매날짜</th>
					</tr>
				</thead>
				<tbody>

				<c:forEach items="${basketDataList }" var="basket" varStatus="status">
					<tr>					
					<c:set var="price" value="${basket.bsdcprice*basket.bsamount }"/>
					<c:set var="sum_price" value="${sum_price+price }"/>
						<td class="tb_img"><img src="../resources/upload/${basket.bsimg }" alt="상품이미지"></td>						
						<td><a href="${path1 }/product/read.do?pid=${basket.bsid }">${basket.bsname }</a><br>${basket.bscolor }/${basket.bssize }</td>						
						<td><fmt:formatNumber value="${basket.bsdcprice}" pattern="#,###"/></td>						
						<td>${basket.bsamount }</td>
						<td>일반배송</td>
						<td>${del }</td>
						<td><fmt:formatNumber value="${price }" pattern="##,###"/></td>
						<td>${basket.bsregdate }</td>
						<c:set var="price" value="0"/>
					</tr>					
				</c:forEach>		
				<tr>
					<td colspan="8" class="sum_price"><b>합계금액 : <fmt:formatNumber value="${sum_price }" pattern="##,###"/>원</b></td>
				</tr>
				</tbody>
			</table>
			
			<button onclick="javascript:history.back()" class="btn1">뒤로가기</button>
		</div>
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
	<c:import url="../inc/footer.jsp" />
</body>
</html>