<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
				<c:set var="itemcnt" value="0"/>
				 <c:forEach items="${productList }" var="product" varStatus="status"> 	
				<c:set var="itemcnt" value="${itemcnt+1 }"/>         
				 </c:forEach>
				 
					<c:import url="../inc/header.jsp" />
						<div id="content">
					<div class="content_wrap1">
						<div class="menu_wrap">
					        <div class="title">
								<c:if test="${pcode=='42'}">
					        	<h2 id="h2title">ACC</h2>
					        	</c:if>
								<c:if test="${pcode=='22'}">
					        	<h2 id="h2title">DRESS/SKIRT</h2>
					        	</c:if>
								<c:if test="${pcode=='20' || pcode=='30'}">
					        	<h2 id="h2title">DENIM</h2>
					        	</c:if>        
								<c:if test="${pcode=='18' || pcode=='28'}">
					        	<h2 id="h2title">PANTS/SHORTS</h2>
					        	</c:if>        
								<c:if test="${pcode=='16' || pcode=='26'}">
					        	<h2 id="h2title">T-SHIRTS/SHIRTS</h2>
					        	</c:if>        
								<c:if test="${pcode=='14' || pcode=='24'}">
					        	<h2 id="h2title">JUMPER/VEST</h2>
					        	</c:if>
					        	<c:if test="${pcode=='12'}">
					        	<h2 id="h2title">WOMEN</h2>
					        	</c:if>
					        	<c:if test="${pcode=='10'}">
					        	<h2 id="h2title">MEN</h2>
					        	</c:if>
					        </div>
					        <div class="product_inner">
					            <div class="product_menu"> 
								<c:if test="${pcode=='14' || pcode=='16' ||pcode=='18' || pcode=='22'  }">
								    <a href="${path1 }/product/list.do?pid=14">JUMPER/VEST</a>
					                <a href="${path1 }/product/list.do?pid=16">T-SHIRTS/SHIRTS</a>
					                <a href="${path1 }/product/list.do?pid=18">PANTS/SHORTS</a>
					                <a href="${path1 }/product/list.do?pid=20">DENIM</a>
					                <a href="${path1 }/product/list.do?pid=22">DRESS/SKIRT</a>             
					              </c:if>
								<c:if test="${pcode=='24' || pcode=='26' ||pcode=='28' }">
								    <a href="${path1 }/product/list.do?pid=24">JUMPER/VEST</a>
					                <a href="${path1 }/product/list.do?pid=26">T-SHIRTS/SHIRTS</a>
					                <a href="${path1 }/product/list.do?pid=28">PANTS/SHORTS</a>
					                <a href="${path1 }/product/list.do?pid=30">DENIM</a>                            
					              </c:if>              
								 <c:if test="${pcode=='12' || pcode=='20' }">
								    <a href="">STRAIGHT</a>
					                <a href="">SKINNY</a>
					                <a href="">BOY FRIEND</a>
					                <a href="">BOOTCUT/WIDE</a>
					                <a href="">DRESS/SKIRT</a>
					                <a href="">JACKET/SHIRTS</a>
					                <a href="">ETC</a>
					              </c:if>
					              <c:if test="${pcode=='10' || pcode=='30' }">
					                <a href="">STRAIGHT</a>
					              	<a href="">SLIM STRAIGHT</a>
					              	<a href="">TAPERED</a>
					              	<a href="">WIDE</a>
					                <a href="">JACKET/SHIRTS</a>
					                <a href="">ETC</a>
					              </c:if>
					            </div>
					            <div class="product_count"><strong>${itemcnt }</strong> ITEMS</div>
					            <div class="list_sort">
					            <c:if test="${sid=='admin' }">
					            	<a href="${path1}/product/addform.do">상품추가</a>
					            </c:if>
					                <a href="">신상품</a>
					                <a href="">상품명</a>
					                <a href="">낮은가격</a>
					                <a href="">높은가격</a>
					                <a href="">제조사</a>
					                <a href="">사용후기</a>
					            </div>
					        </div>
					       </div>
				            <div class="product_list">
				            <c:forEach items="${productList }" var="product" varStatus="status">
				                <ul>
				                    <li class="product_img"><a href="${path1 }/product/read.do?pid=${product.pid }"><img src="../resources/upload/${product.pimg }" alt="제품사진"></a>
				                    <c:if test="${product.dc != 0 }">
				                    	<p class="product_dc">${product.dc }%</p>
				                    </c:if>
				                    </li>                    
				                    <li class="product_name"><a href="${path1 }/product/read.do?pid=${product.pid }">${product.pname }</a></li>
				                    <li class="product_price"><fmt:formatNumber value="${product.pprice }" pattern="##,###"/>원</li>
				                    <li class="product_dcp"><fmt:formatNumber value="${product.pdcprice }" pattern="##,###"/>원</li>				                    
				                </ul>
				            </c:forEach>
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
<script>
    $(function(){
        $(".menu_wrap").css({"opacity":"1","padding-top":"60px"});
        $(".product_list>ul").css({"opacity":"1","padding-top":"0px"});    });
</script>
	<c:import url="../inc/footer.jsp" />
</body>
</html>