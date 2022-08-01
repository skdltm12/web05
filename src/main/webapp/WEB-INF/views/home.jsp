<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="path1" value="${pageContext.request.contextPath }"/>
<!DOCTYPE>
<html>
 	 	
<head>
	<title>즐거운 온라인 쇼핑공간에 오신 것을 환영합니다!</title>	
	<link rel="icon" href="resources/img/favicon.ico" type="image/x-icon">
	 <script src="https://code.jquery.com/jquery-latest.js"></script>		
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Noto+Sans+KR:wght@300;400;500;700;900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./resources/css/mainstyle.css">	
</head>
<body>

<div class="wrap">
	<%@ include file="inc/header.jsp" %>
	<div id="content" onscroll = scrollF()>	
        <div class="content_wrap">
            <div id="slideshow">
                <div>
                    <img src="./resources/img/mainBnr_02.jpg">
                </div>
                <div>
                    <img src="./resources/img/mainBnr_03.jpg">
                </div>
             </div>
            <div class="event_col1">
                <a><img src="./resources/img/bnrArea2.jpg" alt="" class="event_col1_img"></a>
            </div>
            <div class="event_col1_tit">
                <h2>2022년 S/S NEW ITEM을 지금 만나보세요</h2>
                <div class="btn_box">
                    <button class="btn3">VIEW MORE</button>
                </div>
            </div>
            <div class="event_col2">
                <div class="event_col2_wrap">
                    <div class="event_col2_tit">
                        <h2>Category Best.</h2>                
                    </div>
                    <div class="event_col2_com">
                    <p>카테고리 베스트 상품입니다.</p>
                    </div>
                    <div class="event_col2_tag">
                        <a href="javascript:fncc1()" id="premium"># Premium</a>
                        <a href="javascript:fncc2()" id="denim"># Denim</a>
                        <a href="javascript:fncc3()" id="woven"># Woven</a>
                        <a href="javascript:fncc4()" id="acc"># Acc</a>
                    </div>
                </div>
                <div class="event_col2_product">
                    <div class="event_col2_product1" id="stop1">
                    <c:forEach items="${premiumList }" var="prL" varStatus="status">
                        <ul>
                            <li class="best_product">BEST ${status.count }</li>
                            <li class="product_img">
                            	<a href="${path1 }/product/read.do?pid=${prL.pid }"><img src="./resources/upload/${prL.pimg }" alt="제품사진"></a>
				               <c:if test="${prL.dc != 0 }">
				                   	<p class="product_dc">${prL.dc }%</p>
				               </c:if>
				           </li>                    
                            <li class="product_name"><a href="${path1 }/product/read.do?pid=${prL.pid }">${prL.pname }</a></li>
                            <li class="product_price"><fmt:formatNumber value="${prL.pprice }" pattern="##,###"/>원</li>
                            <li class="product_dcp"><fmt:formatNumber value="${prL.pdcprice }" pattern="##,###"/>원</li>
                        </ul>  
                    </c:forEach>              
                    </div>
                    <div class="event_col2_product2" id="stop2">
					<c:forEach items="${denimlist }" var="dl" varStatus="status">
                        <ul>
                            <li class="best_product">BEST ${status.count }</li>
                            <li class="product_img"><a href="${path1 }/product/read.do?pid=${dl.pid }"><img src="./resources/upload/${dl.pimg }" alt="제품사진"></a>
          		               <c:if test="${dl.dc != 0 }">
				                   	<p class="product_dc">${dl.dc }%</p>
				               </c:if>
                            </li>  
                            <li class="product_name"><a href="${path1 }/product/read.do?pid=${dl.pid }">${dl.pname }</a></li>         
                            <li class="product_price"><fmt:formatNumber value="${dl.pprice }" pattern="##,###"/>원</li>
                            <li class="product_dcp"><fmt:formatNumber value="${dl.pdcprice }" pattern="##,###"/>원</li>
                        </ul>                
                    </c:forEach>
                    </div>
                    <div class="event_col2_product3" id="stop3">
					<c:forEach items="${wovenlist }" var="wl" varStatus="status">
                        <ul>
                            <li class="best_product">BEST ${status.count }</li>
                            <li class="product_img"><a href="${path1 }/product/read.do?pid=${wl.pid }"><img src="./resources/upload/${wl.pimg }" alt="제품사진"></a>
                               <c:if test="${wl.dc != 0 }">
				                   	<p class="product_dc">${wl.dc }%</p>
				               </c:if>
                            </li>  
                            <li class="product_name"><a href="${path1 }/product/read.do?pid=${wl.pid }">${wl.pname }</a></li>         
                            <li class="product_price"><fmt:formatNumber value="${wl.pprice }" pattern="##,###"/>원</li>
                            <li class="product_dcp"><fmt:formatNumber value="${wl.pdcprice }" pattern="##,###"/>원</li>
                        </ul>                
                    </c:forEach>
                    </div>
                    <div class="event_col2_product4" id="stop4">
					<c:forEach items="${acclist }" var="al" varStatus="status">
                        <ul>
                            <li class="best_product">BEST ${status.count }</li>
                            <li class="product_img"><a href="${path1 }/product/read.do?pid=${al.pid }"><img src="./resources/upload/${al.pimg }" alt="제품사진"></a>
                            	<c:if test="${al.dc != 0 }">
				                   	<p class="product_dc">${al.dc }%</p>
				               </c:if>
                            </li>  
                            <li class="product_name"><a href="${path1 }/product/read.do?pid=${al.pid }">${al.pname }</a></li>         
                            <li class="product_price"><fmt:formatNumber value="${al.pprice }" pattern="##,###"/>원</li>
                            <li class="product_dcp"><fmt:formatNumber value="${al.pdcprice }" pattern="##,###"/>원</li>
                        </ul>                
                    </c:forEach>
                    </div>
                </div>
            </div>
        </div>
        <div class="event_col3_wrap">
	        <div class="event_col3" id="col3_slide1">
	            <div class="event_col3_tit">
	                <span>JAMBANGEE</span>
	                <h2>지금 신규 회원가입하면 1만원 쿠폰 증정</h2>
	                <button class="btn3 btn0" onclick="location.href='${path1 }/member/joinform.do'">회원가입 하러가기</button>
	            </div>            
	        </div>
	        <div class="event_col3_2" id="col3_slide2">
                <div class="event_col3_tit">
                    <span>JAMBANGEE</span>
                    <h2>RENEWAL OPEN MEMBERSHIP</h2>
                    <button class="btn3 btn0" onclick="location.href='${path1 }/member/joinform.do'">멤버십 확인하기</button>
                </div>
            </div>
                <div class="col3_prev_btn">
                    <div class="prev_arrow"></div>
                </div>
                <div class="col3_next_btn">
                    <div class="next_arrow"></div>
                </div>  
	    </div>
        <div class="event_col4">
            <a><img src="./resources/img/fit-guide_PC.jpg" alt="이미지4"></a>
        </div>
        <div class="event_col4_tit">
            <h2>JAMBANGEE FIT GUIDE</h2>
            <p>1985년 런칭하여 다년간 축적된 잠뱅이 청바지 핏 가이드를 통해<br>
            한국인 체형에 맞는 다양한 핏의 스타일을 연출해보세요
            </p>
            <button class="btn3">VIEW MORE</button>
        </div>
        <div class="event_col5">
            <div class="event_col5_tit">
                <h2>NEW ARRIVAL</h2>
                <p>잠뱅이의 신상품을 소개합니다.</p>
            </div>
            <div>
                <div class="product_list">
	                <c:forEach items="${productList }" var="pl" varStatus="status">            
	                    <ul>
	                        <li class="product_img"><a href="${path1 }/product/read.do?pid=${pl.pid }"><img src="./resources/upload/${pl.pimg }" alt="제품사진"></a>
	     	                   <c:if test="${pl.dc != 0 }">
				                   	<p class="product_dc">${pl.dc }%</p>
				               </c:if>
	                        </li>                    
	                        <li class="product_name"><a href="${path1 }/product/read.do?pid=${pl.pid }">${pl.pname }</a></li>
	                        <li class="product_price"><fmt:formatNumber value="${pl.pprice }" pattern="##,###"/>원</li>
	                        <li class="product_dcp"><fmt:formatNumber value="${pl.pdcprice }" pattern="##,###"/>원</li>
	                    </ul>  
	                </c:forEach>                                        
                </div>
            </div>
        </div>
        </div>
        <div class="r_button">
            <img src="./resources/img/btn_kakao01.png" alt="">
        </div>
</div>
     <script> 
$(window).scroll(function() { 
  if($(this).scrollTop() > 10) {
    $("#header_wrap").css('padding-top','0')
      $("#mainmenu1,#mainmenu2,#mainmenu3,#mainmenu4,#mainmenu5,#mainmenu6").css('color','#333');             
      $(".mypage").css({"background":"url(./resources/img/my_bk.svg"}); 			
      $(".basket").css({"background":"url(./resources/img/cart_bk.svg", 'background-repeat' : 'no-repeat'});			
      $(".search").css({"background":"url(./resources/img/sch_bk.svg"}); 			
      $(".logo").css({"background":"url(./resources/img/logo.png"});
      $(".logout").css({"background":"url(./resources/img/logout.svg", 'background-size' : 'cover'});
      $(".lg_line1,.lg_line2,.lg_line3").css('background-color','#333');
      $(".background").css('opacity','1');
      $(".background").css('height','73px');
      $(".lb_a").css({'color':'#333'});
      $(".lb_a").css({'font-weight':'500'});
      $(".gnb_bar").css('background-color','#999')
  } 
  else {   
    $("#header_wrap").css('padding-top','16px')   
      $("#mainmenu1,#mainmenu2,#mainmenu3,#mainmenu4,#mainmenu5,#mainmenu6").css('color','white');      
      $(".mypage").css({"background":"url(./resources/img/my_wh.svg"}); 			
      $(".basket").css({"background":"url(./resources/img/cart_wh.svg)", 'background-repeat' : 'no-repeat'}); 
      $(".search").css({"background":"url(./resources/img/sch_wh.svg"});
      $(".logout").css({"background":"url(./resources/img/logout.png", 'background-size' : 'cover'});
      $(".logo").css({"background":"url(./resources/img/nav_logo_wh.png"})
      $(".lg_line1,.lg_line2,.lg_line3").css('background-color','white');
      $(".background").css('opacity','0');
      $(".background").css('height','90px');
      $(".lb_a").css('color','#fff');
      $(".lb_a").css('font-weight','400');
      $(".gnb_bar").css('background-color','#fff')
  }
});
    </script>
    <script>
    $(window).scroll(function() {
        if($(this).scrollTop() > 400) {
            $(".event_col1, .event_col1").css({"opacity":"1","padding-top":"0"})            
    }
    });
    $(window).scroll(function() {
        if($(this).scrollTop() > 850) {
            $(".event_col1_tit").css({"opacity":"1","padding-top":"0"})            
    }
    });
    $(window).scroll(function() {
        if($(this).scrollTop() > 2100) {
            $(".event_col4").css({"opacity":"1","padding-top":"0"})            
    }
    });
    $(window).scroll(function() {
        if($(this).scrollTop() > 2300) {
            $(".event_col4_tit").css({"opacity":"1","padding-top":"0"})            
    }
    });
    $(window).scroll(function() {
        if($(this).scrollTop() > 2900) {
            $(".event_col5").css({"opacity":"1","padding-top":"0"})            
    }
    });
    </script>
    <script>
$("#slideshow > div:gt(0)").hide();

setInterval(function() { 
  $('#slideshow > div:first')
    .fadeOut(1000)
    .next()
    .fadeIn(1000)
    .end()
    .appendTo('#slideshow');
},  5000);
    </script>
<script>
        var col3_slide = setInterval(slide,5000);
        function slide(){
            var $slide = $("#col3_slide1").css("right");
            if($slide=="0px"){
                $("#col3_slide1").css({"right":"1783px"});
                $("#col3_slide2").css({"left":"0px"});      
            }else {
                $("#col3_slide1").css({"right":"0px"});
                $("#col3_slide2").css({"left":"1783px"}); 
            }            
        }
        $(".col3_prev_btn").click(function(){
            clearInterval(col3_slide);
                $("#col3_slide1").css({"right":"0px"});
                $("#col3_slide2").css({"left":"1783px"});     
            col3_slide = setInterval(slide,5000); 
        });
        $(".col3_next_btn").click(function(){
            clearInterval(col3_slide);
                $("#col3_slide1").css({"right":"1783px"});
                $("#col3_slide2").css({"left":"0px"});      
            col3_slide = setInterval(slide,5000);
        });
    </script>
    <script>       
        fncc1();
        var stop;
        var stop1 = document.getElementById('stop1');
        stop1.addEventListener('mouseover',function(){
            clearInterval(stop);
        })
        stop1.addEventListener('mouseout',function(){
            fncc1();
        })
        var stop2 = document.getElementById('stop2');
        stop2.addEventListener('mouseover',function(){
            clearInterval(stop);
        })
        stop2.addEventListener('mouseout',function(){
            fncc2();
        })
        var stop3 = document.getElementById('stop3');
        stop3.addEventListener('mouseover',function(){
            clearInterval(stop);
        })
        stop3.addEventListener('mouseout',function(){
            fncc3();
        })
        var stop4 = document.getElementById('stop4');
        stop4.addEventListener('mouseover',function(){
            clearInterval(stop);
        })
        stop4.addEventListener('mouseout',function(){
            fncc4();
        })


        function fncc1(){
            clearInterval(stop);
            $(".event_col2_product1").css({"opacity":"1","pointer-events":"auto"})
            $(".event_col2_product2,.event_col2_product3,.event_col2_product4").css({"opacity":"0","pointer-events":"none"})
            $("#premium").css({"color":"#333","font-weight":"700"}) 
            $("#denim,#woven,#acc").css({"color":"rgb(184,184,184)","font-weight":"500"})                        
            stop=setTimeout(fncc2,3000);
        }

        function fncc2(){
            clearInterval(stop);
            $(".event_col2_product2").css({"opacity":"1","pointer-events":"auto"})
            $(".event_col2_product1,.event_col2_product3,.event_col2_product4").css({"opacity":"0","pointer-events":"none"})
            $("#denim").css({"color":"#333","font-weight":"700"}) 
            $("#premium,#woven,#acc").css({"color":"rgb(184,184,184)","font-weight":"500"})           
            stop=setTimeout(fncc3,3000);
        }
        function fncc3(){
            clearInterval(stop);
            $(".event_col2_product3").css({"opacity":"1","pointer-events":"auto"})
            $(".event_col2_product2,.event_col2_product1,.event_col2_product4").css({"opacity":"0","pointer-events":"none"})
            $("#woven").css({"color":"#333","font-weight":"700"}) 
            $("#premium,#denim,#acc").css({"color":"rgb(184,184,184)","font-weight":"500"})
            stop=setTimeout(fncc4,3000);
        }
        function fncc4(){
            clearInterval(stop);
            $(".event_col2_product4").css({"opacity":"1","pointer-events":"auto"})
            $(".event_col2_product3,.event_col2_product2,.event_col2_product1").css({"opacity":"0","pointer-events":"none"})
            $("#acc").css({"color":"#333","font-weight":"700"}) 
            $("#premium,#woven,#denim").css({"color":"rgb(184,184,184)","font-weight":"500"})            
            stop=setTimeout(fncc1,3000);
        }   
    </script>	
	<%@ include file="inc/footer.jsp" %>

</body>
</html>
