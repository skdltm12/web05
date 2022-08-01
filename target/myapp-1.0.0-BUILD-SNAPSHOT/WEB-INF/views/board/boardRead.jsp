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
			<div class="title"><h2>NOTICE</h2></div>
			<form action="${path1 }/board/update.do" method="post">		
				<table class="tb2">
					<tr>					
						<th>제목</th>
						<td><p>${boardRead.btitle }</p></td>
					</tr>
                    <tr>
						<th>작성자</th>
						<td>${boardRead.bwriter }</td>
					</tr>
					<tr>
						<td class="tb2td"><strong>작성일 </strong>${boardRead.bregdate }</td>						
                        <td><strong>조회수 </strong>${boardRead.bviewcnt }</td>
					</tr>		
                    <tr class="tb2content">
                        <td>${boardRead.bcontent }</td>
                    </tr>			
					<tr>
						<td><input type="button" onclick="location.href='${path1 }/board/pageList.do?curPage=1'" value="목록" class="btn1"></td>
					<c:if test="${sid=='admin' }">
						<td><input type="button" onclick="location.href='${path1 }/board/editform.do?bno=${boardRead.bno }'" value="수정" class="btn1"></td>
						<td><input type="button" onclick="location.href='${path1 }/board/delete.do?bno=${boardRead.bno }'" value="삭제" class="btn1"></td>
					</c:if>
					</tr>
				</table>
			</form>
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
	</div>	
	<c:import url="../inc/footer.jsp" />
</body>
</html>