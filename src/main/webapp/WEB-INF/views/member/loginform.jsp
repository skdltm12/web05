<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>	
<c:set var="path1" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="../resources/css/style.css">
		 <script src="http://code.jquery.com/jquery-latest.js"></script>		
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Noto+Sans+KR:wght@300;400;500;700;900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
<meta charset="UTF-8">
	<title>즐거운 온라인 쇼핑공간에 오신 것을 환영합니다!</title>	
	<link rel="icon" href="../resources/img/favicon.ico" type="image/x-icon">
</head>
<body>
<c:import url="../inc/header.jsp" />
<div id="content">
		<div class="content_wrap">
            <div class="title"><h2>로그인</h2></div>
                <div class="login_box">
						<form action="${path1 }/member/signin.do" method="post">
                                    <div class="login_form">
                                        <div class="login_form_wrap">
                                            <div class="idform">
                                                <p>아이디</p><input type="text"  required id="id" name="id" placeholder="아이디"><br>
                                            </div>
                                            <div class="pwform">
                                                <p>비밀번호</p><input type="password" required id="pwd" name="pwd" placeholder="비밀번호">		
                                            </div>
                                        </div>						
                                        <div class="button_box">
                                            <button>로그인</button>
                                        </div>
                                    </div>
                        </form>
                        <div class="joinbox">
                            <span>아직 JAMBANGEE의 회원이 아니신가요?</span>
                            <p>회원가입하고 다양한 혜택과 서비스를 이용해 보세요!</p>
                            <a href="${path1 }/member/joinform.do">회원가입</a>
                        </div>
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