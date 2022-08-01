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
		<div>
			<form>
				<table class="tb">
					<thead>
						<tr>
							<th>번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th>
						</tr>
					</thead>
						<tbody>
						<c:forEach items="${boardPageList }" var="bl" varStatus="status" >
							<tr>
								<td>${bl.bno }</td>
								<td><a href="${path1 }/board/read.do?bno=${bl.bno }">${bl.btitle }</a></td>
								<td>${bl.bwriter }</td>
								<td>${bl.bregdate }</td>
								<td>${bl.bviewcnt }</td>
							</tr>
						</c:forEach>
						</tbody>				 		
					</table>				
			</form>
			</div>
		<div class="row">
				<table class="paging">
					<tbody>
					<tr>
						<td class="item1">
							<c:if test="${page.curPage > 1}">
							<a href="javascript:;" onclick="list('1')">[처음]</a>
							</c:if>
						</td>
						<td class="item2">
							<c:if test="${page.curPage > 1}">
							<a href="javascript:;" onclick="list('${page.curPage-1}')">[이전]</a>
							</c:if>
						</td>
						<td class="item3">
						<c:forEach var="num" begin="${page.startPage }" end="${page.endPage }">
							<c:choose>
								<c:when test="${num == page.curPage}">
									<span style="color:red; font-weight:bold">${num }</span>
								</c:when>
								<c:otherwise>
									<a href="javascript:;" onclick="list('${num }')">${num }</a>&nbsp;
								</c:otherwise>
							</c:choose>
						</c:forEach>
						</td>
						<td class="item4">
							<c:if test="${page.curBlock < page.totBlock}">
							<a href="javascript:;" onclick="list('${page.nextPage}')">[다음]</a>
							</c:if>
						</td>
						<td class="item5">
							&nbsp;<c:if test="${page.curPage < page.totPage}">
							<a href="javascript:;" onclick="list('${page.totPage}')">[끝]</a>
							</c:if>
						</td>
					</tr>
					</tbody>
				</table>
				<script>
				function list(page){
					location.href="../board/pageList.do?curPage="+page;
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
			</div>
		<c:if test="${sid=='admin' }">
			<button onclick="location.href='${path1 }/board/addform.do'" class="btn2">글쓰기</button>
		</c:if>
		
		</div>
	</div>
	<c:import url="../inc/footer.jsp" />
</body>
</html>