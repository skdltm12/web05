<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="path1" value="${pageContext.request.contextPath }" />
<header id="header">
<div class="background">
</div>
    <div class="header_wrap" id="header_wrap">        
            <div class="logo_wrap">
                <div class="logo_line">
                    <div class="lg_line1"></div>
                    <div class="lg_line2"></div>
                    <div class="lg_line3"></div>
                </div>
                <a href="${path1 }/">
                    <div class="logo"></div>
                </a>
            </div>
            <nav class="tnb">		
            <c:if test="${sid==null}">
                <a href="${path1 }/member/loginform.do" class="mypage"></a>
            </c:if>
            <c:if test="${sid!=null}">
                <a href="${path1 }/member/mypage.do?id=${sid }" class="mypage"></a>
                <a onclick="logout()" class="logout"></a>
            </c:if>
                <a href="${path1 }/basket/list.do?bsuid=${sid }" class="basket"></a>	
                <a href="${path1 }/member/search.do" class="search"></a>	
            <c:if test="${sid==null }">
                <a class="join" href="${path1 }/member/joinform.do">신규 회원가입</a>
            </c:if>
            </nav>
             <nav class="gnb">
                <ul class="gnb_wrap">
                    <li class="mainmenu_li"><a href="" id="mainmenu1" class="mainmenu">ABOUT</a>
                        <ul class="sub_ul">
                            <li><a href="">SHOP</a></li>
                            <li><a href="">OPEN GUIDE</a></li>
                            <li><a href="${path1 }/board/pageList.do?curPage=1">NOTICE</a></li>
                        </ul>
                    </li>
                    <li class="mainmenu_li"><a href="" id="mainmenu2" class="mainmenu">DENIM</a>
                        <ul class="sub_ul">
                            <li><a href="${path1 }/product/list.do?pid=12">WOMEN</a></li>
                            <li><a href="${path1 }/product/list.do?pid=10">MEN</a></li>
                        </ul>
                    </li>
                    <li class="mainmenu_li"><a href="" id="mainmenu3" class="mainmenu">WOMEN</a>
                        <ul class="sub_ul">
                            <li><a href="${path1 }/product/list.do?pid=14">JUMPER/VEST</a></li>
                            <li><a href="${path1 }/product/list.do?pid=16">T-SHIRTS/SHIRTS</a></li>
                            <li><a href="${path1 }/product/list.do?pid=18">PANTS/SHORTS</a></li>
                            <li><a href="${path1 }/product/list.do?pid=20">DENIM</a></li>
                            <li><a href="${path1 }/product/list.do?pid=22">DRESS/SKIRT</a></li>							
                        </ul>
                    </li>
                    <li><a href="" id="mainmenu4" class="mainmenu">MEN</a>
                        <ul class="sub_ul">
                            <li><a href="${path1 }/product/list.do?pid=24">JUMPER/VEST</a></li>
                            <li><a href="${path1 }/product/list.do?pid=26">T-SHIRTS/SHIRTS</a></li>
                            <li><a href="${path1 }/product/list.do?pid=28">PANTS/SHORTS</a></li>
                            <li><a href="${path1 }/product/list.do?pid=30">DENIM</a></li>							
                        </ul>		
                    </li>
                    <li><a href="${path1 }/product/list.do?pid=42" id="mainmenu5" class="mainmenu">ACC</a></li>
                    <li><a href="" id="mainmenu6" class="mainmenu">SALE</a>
                        <ul class="sub_ul">
                            <li><a href="${path1 }/product/list.do?pid=32">DENIM-MEN</a></li>
                            <li><a href="${path1 }/product/list.do?pid=34">DENIM-WOMEN</a></li>
                            <li><a href="${path1 }/product/list.do?pid=36">T-SHIRTS/SHIRTS</a></li>
                            <li><a href="${path1 }/product/list.do?pid=38">JUMPER/VEST</a></li>
                            <li><a href="${path1 }/product/list.do?pid=40">PANTS/SHORTS</a></li>
                        </ul>		
                    </li>
                </ul>
                <div class="gnb_bar"></div>
                <div class="lb">                
                <a class="lb_a">LOOKBOOK</a>
                </div>
            </nav>
      </div>
<script>
	function logout(){
		if(confirm("로그아웃 하시겠습니까?")){
			location.href="${path1 }/member/logout.do"
		}
	} 
</script>
    </header>