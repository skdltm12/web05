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
		<c:set var="sum_price" value="0"/>
	<form action="${path1 }/payment/addpayment.do" method="post">
			<table class="tb">
				<thead>
					<tr>
						<th>번호</th><th>상품코드</th><th>상품명</th><th>가격</th><th>할인가</th><th>이미지</th><th>색상</th><th>사이즈</th><th>수량</th><th>담은 날짜</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${basketList }" var="basket" varStatus="status">
					<tr>
					<c:set var="price" value="${basket.bsdcprice*basket.bsamount }"/>
					<c:set var="sum_price" value="${sum_price+price }"/>
					<c:set var="bscnt" value="${bscnt+1 }"/>
						<td>${status.count }</td>
						<td>${basket.bsid }
							<input type="hidden" value="${sid }" name="userid">
							<input type="hidden" value="${sid }" name="userid1">
							<input type="hidden" value="${basket.bsid }" name="pid">							
						</td>						
						<td><a href="${path1 }/product/read.do?p_id=${basket.bsid }">${basket.bsname }</a></td>
						<td><fmt:formatNumber value="${basket.bsprice}" pattern="#,###"/></td>
						<td><fmt:formatNumber value="${basket.bsdcprice}" pattern="#,###"/></td>
						<td class="tb_img"><img src="../resources/upload/${basket.bsimg }" alt="상품이미지"></td>
						<td>${basket.bscolor }</td>
						<td>${basket.bssize }</td>
						<td>${basket.bsamount }
						<input type="hidden" value="${basket.bsamount }" name="amount"></td>						
						<td>${basket.bsregdate }</td>
					</tr>
				</c:forEach>
					<tr>
						<th>결제방식</th>
						<td>
							<select name="paytype">
								<option value="card">카드</option>
								<option value="mtj">무통장입금</option>
								<option value="phone">휴대폰 결제</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>결제 회사(카드회사 또는 은행명 또는 휴대폰 통신사)</th>
						<td><input type="text" name="payplace"></td>
					</tr>
					<tr>
						<th>결제 정보(카드번호 또는 계좌번호 또는 휴대폰 번호)</th>
						<td><input type="text" name="payno"></td>
					</tr>
					<tr>
						<th>결제금액</th>
						<td><fmt:formatNumber value="${sum_price}" pattern="#,###"/>
							<input type="hidden" value="${sum_price }" name="money">
						</td>
					</tr>
					<tr>
						<th>받으시는 분 성함</th>
						<td><input type="text" name="rname"></td>
					</tr>
					<tr>
						<th>받으시는 분 주소</th>
						<td><input type="text" name="addr1" id="addr1"></td>
						<td><input type="text" name="addr2" id="addr2"></td>
						<td><input type="button" value="주소 찾기" onclick="findAddr()"></td>
					</tr>
					<tr>
						<th>우편번호</th>
						<td><input type="text" name="postcode" id="postcode"></td>
					</tr>
					<tr>
						<th>받으시는 분 연락처</th>
						<td><input type="text" name="tel" id="tel"></td>
					</tr>
					<tr>
						<th>배송 요청사항</th>
						<td><input type="text" name="memo">
							<input type="hidden" value="${bscnt }" name="bscnt">
						</td>
						
					</tr>
					<tr>
						<td colspan="2"><input type="submit" value="결제완료" class="btn1"></td>
					</tr>
				</tbody>
			</table>
		</form>
		</div>
			<script>
                	function findAddr() {
                		new daum.Postcode({
                			oncomplete: function(data) {
                				console.log(data);
                				var roadAddr = data.roadAddress;
                				var jibunAddr = data.jibunAddress;
                				document.getElementById("postcode").value = data.zonecode;
                				if(roadAddr !== '') {
                					document.getElementById("addr1").value = roadAddr;				
                				} else if(jibunAddr !== ''){
                					document.getElementById("addr1").value = jibunAddr;
                				}
                			}
                		}).open();
                	}                	
           </script>
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
          	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	</div>	
	<c:import url="../inc/footer.jsp" />
</body>
</html>