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
	<div id="content">
	<div class="content_wrap">
        <div class="product_wrap">
                <div class="product_imgbox">
                    <img src="../resources/upload/${productRead.pimg }" alt="이미지1">
                </div>   
                <div class="product_infobox">
                    <form action="${path1 }/basket/addbasket.do" method="post" name="form">
                        <table class="tb4">                        
                            <tr>
                            	<td class="tb4_name"  colspan="2">
                                   ${productRead.pname }
                                </td>
                            </tr>
                            <tr  class="tb4_price">
                                <td colspan="2"><fmt:formatNumber value="${productRead.pprice }" pattern="##,###"/>원</td>
                            </tr>
                            <tr class="tb4_tr1">
                                <th class="">판매가</th><td><fmt:formatNumber value="${productRead.pdcprice }" pattern="##,###"/>원</td>
                            </tr>
                            <tr class="tb4_tr2">
                                <th class="">사용후기</th><td>0</td>
                            </tr>
                            <tr class="tb4_tr3">
                                <th class="">배송비</th><td>2,500원 (30,000원 이상 구매 시 무료)</td>
                            </tr>
                            <tr class="tb4_color"><th>색상</th>
                                <td><input type="hidden" value="" id="color">
                                    <select name="bscolor" onchange="fnc2()" id="color">
                                    <option> - [필수] 옵션을 선택해 주세요 -</option>
                                        <option disabled >--------------</option>
                                        <option value="${productRead.pcolor }">${productRead.pcolor }</option>
                                    </select>
                                </td>
                            </tr>
                            <tr class="tb4_size"><th>사이즈</th>
                                <td><input type="hidden" value="" id="size">
                                    <select name="bssize" onchange="fnc3()" id="size">
                                    <option> - [필수] 옵션을 선택해 주세요 -</option>
                                        <option disabled >--------------</option>
                                        <option value="${productRead.psize }">${productRead.psize }</option>
                                    </select>
                                </td>
                            </tr>
                            <tr class="amount">
                                <td colspan="2">(최소주문수량 1개 이상)</td>
                            </tr>
                            <tr class="addproduct">
                               <td colspan="2">위 옵션선택 박스를 선택하시면 아래에 상품이 표시됩니다.</td>
                            </tr>
                            <tr class="show" id="show">
                                <td colspan="2"><c>${productRead.pname }<br><d>-${productRead.pcolor }/${productRead.psize }</d></c><input type="number" value="1" id="bs_amount" name="bsamount" min="1" max="${productRead.pamount }" onchange="fnc4()">
                                    <a><img src="../resources/img/btn_price_delete.gif" alt=""></a>
                                    <b><fmt:formatNumber value="${productRead.pdcprice }" pattern="##,###"/>원</b></td>                                    
                            </tr>
                            <tr class="tp">
                                <th></th>
                                <td><span>Total Price <b id="price">0원</b> <a id="pamount">(0개)</a></span></td>
                            </tr>
                            <tr class="tb4_button">                                
                                <td colspan="2"><input type="button" value="바로구매하기" class="btn3">
                                <input type="hidden" value="${productRead.pid }" name="bsid">
                                <input type="hidden" value="${sid }" name="bsuid" id="sid">                                
                                <input type="hidden" value="${productRead.psize }" name="bssize">
                                <input type="hidden" value="${productRead.pname }" name="bsname">
                                <input type="hidden" value="${productRead.pprice }" name="bsprice">
                                <input type="hidden" value="${productRead.pdcprice }" name="bsdcprice">
                                <input type="hidden" value="${productRead.pimg }" name="bsimg">                                
                            <c:if test="${sid==null }">
                                <input type="button" value="장바구니" class="btn4" onclick="fnc1()">
                             </c:if>
                             <c:if test="${sid!=null }">
                             	<input type="button" value="장바구니" class="btn4" onclick="fnc5()">
                             </c:if>
                                <input type="button" value="관심상품" class="btn4"></td>
                             
                            </tr>
                        </table>
                    </form>
                </div>
    <script>
    	function fnc5(){
            var color = document.getElementById('color').value;
            var size =document.getElementById('size').value;
            var form = document.form;     
            var sid = document.getElementById('sid').value;
    		if(color=='ck' && size=='ck'){
    			form.submit();   			
    		}else{
    			alert("사이즈와 색상을 선택해주세요.");
    		}
    	}
    
        function fnc2(){
            document.getElementById('color').value="ck";
            var color = document.getElementById('color').value;
            var size =document.getElementById('size').value;
            if(color=='ck' && size =='ck'){
                document.getElementById('show').style.display='table-row';
            }
        }
        function fnc3(){
            document.getElementById('size').value="ck";
            var color = document.getElementById('color').value;
            var size =document.getElementById('size').value;
            if(color=='ck' && size =='ck'){
                document.getElementById('show').style.display='table-row';
                var amount = document.getElementById('bs_amount').value;
                var totalprice = amount*${productRead.pdcprice }; 
                var tp = totalprice.toLocaleString();
                document.getElementById('price').innerHTML=tp+"원";
                document.getElementById('pamount').innerHTML="("+amount+"개)";                
            }            
        }
        </script>
    <script>
        function fnc1(){
			alert("로그인 후 이용할 수 있습니다.");
        }
        
        function fnc4(){
            var amount = document.getElementById('bs_amount').value;
            var totalprice = amount*${productRead.pdcprice };
            var tp = totalprice.toLocaleString();
            document.getElementById('price').innerHTML=tp+"원";
            document.getElementById('pamount').innerHTML="("+amount+"개)";
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
			<form action="${path1 }/product/update.do" method="post">		
				<table class="tb2">
					<tr>
						<th>제품코드</th>					
						<td><input type="text" value="${productRead.pid }" name="pid"></td>			
					</tr>
					<tr>
						<th>제품명</th>					
						<td><input type="text" value="${productRead.pname }" name="pname"></td>		
					</tr>
					<tr>
						<th>가격</th>					
						<td><input type="text" value="${productRead.pprice }" name="pprice"></td>
					</tr>
					<tr>
						<th>할인가격</th>					
						<td><input type="text" value="${productRead.pdcprice }" name="pdcprice"></td>				
					</tr>
					<tr>
						<th>이미지</th>					
						<td><input type="text" value="${productRead.pimg }" name="pimg"></td>	
					</tr>
					<tr>
						<th>색상</th>					
						<td><input type="text" value="${productRead.pcolor }" name="pcolor"></td>
					</tr>
					<tr>
						<th>사이즈</th>					
						<td><input type="text" value="${productRead.psize }" name="psize"></td>
					</tr>
					<tr>
						<th>수량</th>					
						<td><input type="text" value="${productRead.pamount }" name="pamount"></td>
					</tr>
					<tr>
						<th>판매량</th>					
						<td><input type="text" value="${productRead.best }" name="best"></td>
					</tr>										
					<tr>
						<th>프리미엄</th>					
						<td><input type="text" value="${productRead.premium }" name="premium"></td>
					</tr>
					<tr>
						<th>할인율</th>
						<td><input type="text" name="dc" value="${productRead.dc }" class="single100"></td>
					</tr>	
					<tr>
						<th>등록일</th>
						<td>2022-07-04</td>
					</tr>
					<tr>	
						<td><input type="submit" class="btn1" value="수정"></td>
						<td><input type="button" onclick="deleteproduct()" class="btn1" value="삭제하기"></td>							
					</tr>
				</table>
    		</form>
    	</c:if>
	</div>
	<script>  	
    	function deleteproduct(){
    		if(confirm("정말 상품을 삭제할까요?")){
    			location.href='${path1 }/product/delete.do?pid=${productRead.pid }';
    		}
    	}
    	</script>
</div>	
	<c:import url="../inc/footer.jsp" />
</body>
</html>