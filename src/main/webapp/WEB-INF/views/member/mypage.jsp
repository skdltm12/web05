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
		 <script src="http://code.jquery.com/jquery-latest.js"></script>		
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Noto+Sans+KR:wght@300;400;500;700;900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
</head>
<body>

	<c:import url="../inc/header.jsp" />
<div id="content">
	    <div class="content_wrap">
           <div class="title"><h2>마이페이지</h2></div>
            <div class="grade">
                <span>저희 쇼핑몰을 이용해주셔서 감사합니다. <b>${member.uname }</b> 님은 <b>[MANIA]</b>회원이십니다.
                </span>
                	<c:if test="${sid=='admin' }">
						<input type="button" value="회원관리" onclick="location.href='${path1 }/member/list.do'" class="btn1">
					</c:if>
            </div>
            <div class="my_order">
                <div class="inner">
                    <b>나의 주문처리 현황</b> (최근<b> 3개월 </b>기준)
                </div>
                <div class="order_info1">
                    <span>입금전</span><br>
                    <a>0</a>
                </div>
                <div class="order_info1">
                    <span>배송준비중</span><br>
                    <a>0</a>
                </div>
                <div class="order_info1">
                    <span>배송중</span><br>
                    <a>0</a>
                </div>
                <div class="order_info1">
                    <span>배송완료</span><br>
                    <a>0</a>
                </div>
                <div class="order_info2">
                    <ul>
                        <li>취소 : <b>0</b></li>
                        <li>교환 : <b>0</b></li>
                        <li>반품 : <b>0</b></li>
                    </ul>
                </div>
            </div>
                <div class="my_menu">
                    <ul>
                        <li>
                            <h3></h3>
                            <a href="${path1 }/payment/list.do?userid=${sid }">
                                <b>Order</b>
                                <p>주문내역 조회</p>
                                <span>고객님께서 주문하신 상품의<br>
                                주문내역을 확인하실 수 있습니다</span>
                            </a>
                        </li>
                        <li>
                            <h3></h3>
                            <a href="${path1 }/member/getMember.do?id=${sid }">
                                <b>Profile</b>
                                <p>회원 정보</p>
                                <span>회원이신 고객님의 개인정보를<br>
                                관리하는 공간입니다.
                                </span>
                            </a>
                        </li>
                        <li>
                            <h3></h3>
                            <a>
                                <b>Inquiry</b>
                                <p>문의하기</p>
                                <span>고객님의 궁금하신 문의사항에 대하여<br>
                                답변을 받아보실 수 있습니다.
                                </span>
                            </a>
                        </li>
                        <li>
                            <h3></h3>
                            <a href="${path1 }/board/pageList.do?curPage=1">
                                <b>Notice</b>
                                <p>공지사항</p>
                                <span>공지사항을 확인하실 수 있습니다.</span>
                            </a>
                        </li>
                    </ul>
                </div>
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