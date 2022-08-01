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
	<div class="content" id="content">
		<div class="content_wrap">
		<div class="title"><h2>회원 정보 보기</h2></div>
			<form action="${path1 }/member/update.do" method="post" onsubmit="return updateCheck(this)">
			<div class="page_table">
				<table class="tb tb6">
					<tbody>
					<c:if test="${sid=='admin' || sid==member.id }">
						<tr>
							<th><label for="mid">아이디</label></th>
							<td><input type="text" name="id" id="id" class="single100" value="${member.id }" readonly>
							</td>
						</tr>				
						<tr>
							<th><label for="pwd">비밀번호</label></th>
							<td><input type="password" name="pwd" id="pwd"  class="single100">
							</td>
						</tr>
						<tr>
							<th><label for="pwd2">비밀번호 확인</label></th>
							<td class="pwtd"><input type="password" name="pwd2" id="pwd2"  class="single100">
								<input type="button" value="비밀번호 변경" class="btn1 btn5">
							</td>
						</tr>
						<tr>
							<th><label for="username">이름</label></th>
							<td><input type="text" name="uname" id="uname" class="single100"  value="${member.uname }" required></td>
						</tr>
						<tr>
							<th><label for="email">이메일</label></th>
							<td><input type="email" name="email" id="email" class="single100" value="${member.email }" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" required></td>
						</tr>
						<tr>
							<th><label for="tel">전화번호</label></th>
							<td><input type="tel" name="phone" id="phone" class="single100"  value="${member.phone }" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" required></td>
						</tr>
						<tr>
							<th><label for="birth">생년월일</label></th>
							<td>${member.birth }<input type="hidden" name="birth" value="${member.birth }"></td>
							
							
						</tr>
						<tr>
							<td colspan="2">
								<input type="submit" class="btn1" value="회원정보수정">
								<input type="reset" class="btn1" value="취소">
								<input type="button" onclick="location.href='${path1 }/payment/list.do?userid=${sid }'" value="주문내역보기" class="btn1">
								<input type="button" onclick="location.href='${path1 }/member/logout.do'" value="로그아웃" class="btn1">
							<c:if test="${member.id!='admin' }">
								<input type="button" value="회원탈퇴" onclick="conf()" class="btn1">
							</c:if>
							<c:if test="${sid=='admin' }">
								<input type="button" onclick="location.href='${path1 }/member/list.do'" class="btn" value="회원목록 관리" class="btn1">
							</c:if>
							</td>
						</tr>	
						</c:if>
					</tbody>
				</table>
			</div>
				<script>
				function conf(){
					var id1 = $("#id").val(); 
				    if (confirm("정말로 탈퇴 하시겠습니까?")) {
				     	location.href="${path1 }/member/delete.do?id="+id1;   
				    }
				}
				</script>
				<script>
				$(function(){
					$(".btn5").click(function(){
						var pwd1 = $("#pwd").val();
						var pwd2 = $("#pwd2").val();
						var id1 = $("#id").val();
							if(pwd1!=""){
								if(pwd1 == pwd2){
									$.ajax({
										url: '${path1 }/member/pwupdate.do',
										type: 'post',
										data: {"pwd":pwd1,"id":id1},
										success: function (data){
											alert("비밀번호 변경 성공!");
											},
										error: function(error){
											alert("비밀번호 변경에 실패 했습니다.");
										}
									});
								}else{
									alert("비밀번호 확인이 일치하지 않습니다.");
								}
							}else{
								alert("비밀번호 란이 비어있습니다.");
							}
					})
				})
				</script>
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