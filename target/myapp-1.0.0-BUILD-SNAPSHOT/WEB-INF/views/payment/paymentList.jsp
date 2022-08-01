<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="path1" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/style.css">
	 <script src="https://code.jquery.com/jquery-latest.js"></script>		
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Noto+Sans+KR:wght@300;400;500;700;900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
	<title>즐거운 온라인 쇼핑공간에 오신 것을 환영합니다!</title>	
	<link rel="icon" href="../resources/img/favicon.ico" type="image/x-icon">
</head>
<body>
	
	<c:import url="../inc/header.jsp" />
	<div id="content">
		<div class="content_wrap">
		<div class="title"><h2>주문 내역 보기</h2></div>
			<table class="tb">
				<thead>
				<tr>
					<th>번호</th><th>결제방식</th><th>결제정보</th><th>결제금액</th>
					<th>결제일</th><th>수신자명</th><th>연락처</th><th>주소1</th><th>주소2</th><th>우편번호</th>
					<th>배송회사</th><th>운송장번호</th><th>배송현황</th><th>도착 예정일</th><th>남기신 메모</th><th></th>					
				</tr>
				</thead>
				<tbody>
				<c:set var="limit" value="0"/>
					<c:forEach items="${paymentList }" var="pl" varStatus="status">
					<c:if test="${pl.paytype=='phone' }">
						<c:set var="paytype" value="휴대폰결제"/>
					</c:if>
					<c:if test="${pl.paytype=='mtj' }">
						<c:set var="paytype" value="무통장입금"/>
					</c:if>
					<c:if test="${pl.paytype=='card' }">
						<c:set var="paytype" value="카드결제"/>
					</c:if>
				<tr>
					<td class="td3">${status.count }</td>
					<td class="td3">${paytype }</td>
				<c:set value="${pl.payno }" var="payno"/>
				<c:set value="${fn:replace(payno, '-', '') }" var="payno1"/>												
					<td class="td3"><fmt:formatNumber maxIntegerDigits="4" pattern="**####" value="${payno1 }"/></td>
				 	<td class="td3"><fmt:formatNumber pattern="##,###" value="${pl.money }"/></td>
					<td class="td3"><fmt:formatDate pattern="yy-MM-dd" value="${pl.sdate }"/></td>
					<td class="td3">${pl.rname }</td>
					<td class="td3">${pl.tel }</td>
					<td class="td3">${pl.addr1 }</td>
					<td class="td3">${pl.addr2 }</td>
					<td class="td3">${pl.postcode }</td>
				<c:if test="${sid!='admin' }">
					<td class="td3">${pl.transco }</td>
					<td class="td3">${pl.transno }</td>
					<td class="td3">${pl.rstatus }</td>
					<td class="td3">${pl.rdate }</td>
					<c:set var="limit1" value="${limit+limit2 }"/>
					<c:set var="limit2" value="${limit1+pl.bs_cnt }"/>
				</c:if>
				<c:if test="${sid=='admin' }">
					<form action="${path1 }/payment/update.do" method="post">
						<td class="td3"><input type="text" value="${pl.transco }" name="transco">
							<input type="hidden" value="${pl.userid }" name="userid">
							<input type="hidden" value="${pl.tel }" name="tel">
							<input type="hidden" value="${pl.addr1 }" name="addr1">
							<input type="hidden" value="${pl.addr2 }" name="addr2">
							<input type="hidden" value="${pl.postcode }" name="postcode">
							<input type="hidden" value="${pl.memo }" name="memo">
							<input type="hidden" value="${pl.ono }" name="ono">
					<c:set var="limit1" value="${limit+limit2 }"/>
					<c:set var="limit2" value="${limit1+pl.bs_cnt }"/>
						</td>
						<td class="td3"><input type="text" value="${pl.transno }" name="transno"></td>
						<td class="td3"><input type="text" value="${pl.rstatus }" name="rstatus"></td>
						<td class="td3">
							<input type="text" value="${pl.rdate }" name="rdate">
							<input type="submit" value="작성완료">
						</td>
					</form>
				</c:if>
					<td class="td3">${pl.memo }</td>
					<form action="basketDataList.do" method="post">
					<td class="td3">
						<input type="hidden" value="${pl.bs_cnt }" name="bs_cnt">
						<input type="hidden" value="${limit1 }" name="search_key1">
						<input type="hidden" value="${limit2 }" name="search_key2">
						<input type="hidden" value="${pl.userid }" name="userid">						
						<input type="submit" value="구매 목록 보기" class="btn1">
					</td>
					</form>
				
				</tr>
					</c:forEach>
				</tbody>
			</table>
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