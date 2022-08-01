<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="path1" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="../resources/css/style.css">
		 <script src="https://code.jquery.com/jquery-latest.js"></script>		
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Noto+Sans+KR:wght@300;400;500;700;900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">	
<meta charset="UTF-8">
	<title>즐거운 온라인 쇼핑공간에 오신 것을 환영합니다!</title>	
	<link rel="icon" href="../resources/img/favicon.ico" type="image/x-icon">
</head>
<body>

	<c:import url="../inc/header.jsp" />
			<div id="content">
		<div class="content_wrap">
            <div class="title"><h2>장바구니</h2></div>
			<table class="tb">
				<thead>
					<tr>
						<th>이미지</th><th>상품정보</th><th>판매가</th><th>수량</th><th>배송구분</th><th>배송비</th><th>합계</th><th>선택</th>
					</tr>
				</thead>
				<tbody>
		<c:set value="0" var="sum"/>
		<c:forEach items="${basketList }" var="basket" varStatus="status">
		<c:set value="${sum+(basket.bs_dcprice*basket.bs_amount) }" var="sum"/>

					<tr>					
						<td class="tb_img"><a href="${path1 }/product/read.do?p_id=${basket.bs_id }"><img src="../resources/upload/${basket.bs_img }" alt="상품이미지"></a></td>
						<td class="tb_name"><a href="${path1 }/product/read.do?p_id=${basket.bs_id }">여성) 쿨맥스 오비안밴드 캣 올약 워싱 IG(크롭)</a><br>[옵션: 라이트블루/25]</td>
						<td><fmt:formatNumber value="${basket.bs_dcprice }" pattern="##,###" /></td>				
						<td class="tb_amount">
					<form action="${path1 }/basket/update.do" method="post">
						<input type="number" value="${basket.bs_amount }" min="1" name="bs_amount">
						<input type="hidden" value="${sid }" name="bs_uid">
						<input type="hidden" value="${basket.bs_num }" name="bs_num">
						<input type="submit" value="변경">					
					</form>						
						</td>
						<td>기본배송</td>
						<td>2,500원<br>(30,000원 이상 구매시 무료)</td>
						<td><fmt:formatNumber value="${basket.bs_dcprice*basket.bs_amount }" pattern="##,###" /></td>						
						<td class="tb_td"><input type="button" value="주문하기" onclick="'" class="btn3"><br>
                            <input type="button" value="제거" onclick="location.href='/basket/delete.do?bs_num=${basket.bs_num }&uid=${sid }'" class="btn4">                            
                        </td>				
					</tr>

		</c:forEach>
		<c:set value="2500" var="del"/>
		<c:if test="${sum>=30000 }">
		<c:set value="0" var="del"/>	
		</c:if>
				</tbody>
			</table>
            <table class="tb5">
                <thead>
	                <tr>
    	                <th class="tb5_th">총 상품금액</th><th class="tb5_th">총 배송비</th><th>결제예정금액</th>
               		</tr>
                </thead>
                <tbody>
                	<tr>
                    	<td><fmt:formatNumber value="${sum }" pattern="##,###"/>원</td><td class="tb5_td">+<fmt:formatNumber value="${del }" pattern="##,###"/>원</td><td>= <fmt:formatNumber value="${sum+del }" pattern="##,###"/>원</td>
                  	</tr>
                </tbody>
            </table>
		
		
		
		
		<button onclick="location.href='/payment/payform.do?bs_uid=${sid }'" class="btn3">전체주문하기</button>
        <button onclick="location.href='/'" class="btn2">쇼핑계속하기</button>
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