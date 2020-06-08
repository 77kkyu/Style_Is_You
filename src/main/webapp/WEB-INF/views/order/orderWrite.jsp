 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="/stu/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="/stu/css/bootstrap-theme.min.css">



<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="/stu/js/bootstrap.min.js"></script>
<script src="/stu/js/jquery-3.0.0.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/stu/js/common.js" charset="utf-8"></script>

<script type="text/javascript">

//기본 주문금액 계산
function fn_allPrice(){
	
	var array1 = document.getElementsByName("goods_sell_price");
	var array2 = document.getElementsByName("basket_goods_amount");
	var array3 = document.getElementsByName("order_price");
	
	var len = array2.length;
	var hap = 0;
	for (var i=0; i<len; i++){
		var sell = array1[i].value;
		var amt = array2[i].value;
		var pri = Number(sell)*Number(amt); //각 상품별 주문금액
		hap = Number(hap)+Number(pri); //주문금액 총합 구하기
		array3[i].value = pri;	
	}
	var fee = document.getElementById("ORDER_FEE").value;
	pay = Number(hap)+Number(fee);
	
	document.getElementById("ORDER_TOTAL_ORDER_PRICE").value = hap; //총주문금액
	document.getElementById("ORDER_TOTAL_PAY_PRICE").value = pay; //(최초,할인들어가기전)최종결제금액
	document.getElementById("pay_price1").value = pay; //결제예정금액(바꿔야됨)
	
	var array7 = document.getElementsByName("member_grade");
	var grade = array7[0].value;
	var val = 0;
	if("nomal" == grade){
		val=0.03;
	}else if("gold" == grade){
		val=0.05;
	}else{
		val=0.1;
	}
	var point = Number(hap)*Number(val); //등급별 적립율
	document.getElementById("ORDER_SAVE_POINT").value = point;
}
//주문자정보와 동일
function fn_chkinfo(){
	var chk = document.getElementById("chkinfo").checked;
	if(chk==true){
		document.getElementById("ORDER_NAME").value = "${map.MEMBER_NAME}";
		document.getElementById("ORDER_PHONE").value = "${map.MEMBER_PHONE}";
		document.getElementById("ORDER_ZIPCODE").value = "${map.MEMBER_ZIPCODE}";
		document.getElementById("ORDER_ADDR1").value = "${map.MEMBER_ADDR1}";
		document.getElementById("ORDER_ADDR2").value = "${map.MEMBER_ADDR2}";
	}else if(chk==false){
		document.getElementById("ORDER_NAME").value = "";
		document.getElementById("ORDER_PHONE").value = "";
		document.getElementById("ORDER_ZIPCODE").value = "";
		document.getElementById("ORDER_ADDR1").value = "";
		document.getElementById("ORDER_ADDR2").value = "";
	}
} 

function fn_order_pay(){
		var f = document.orderWrite;
 		if( f.ORDER_NAME.value=="" ){
 			alert("주문자 이름을 입력해주세요.");
 			f.o_name.focus();
 			return false;
 		}
 		if( f.ORDER_PHONE.value==""){
 			alert("전화번호를 입력해주세요.");
 			f.o_phone.focus(); //커서자동클릭
 			return false;
 		}
 		if( f.ORDER_ZIPCODE.value=="" || f.ORDER_ADDR1.value=="" || f.ORDER_ADDR2.value==""){
 			alert("주소를 입력해주세요.");
 			return false;
 		}
 		if( document.getElementsByName("OPTION1").checked==false && document.getElementsByName("OPTION2").checked==false){
 			alert("결제방법을 선택해주세요.");
 			return false;
 		}
 		if( f.ORDER_PAY_BANK.value=="" ){
 			alert("결제은행을 입력해주세요.");
 			f.ORDER_PAY_BANK.focus();
 			return false;
 		}
 		if( f.ORDER_PAY_NAME.value==""){
 			alert("결제자명을 입력해주세요.");
 			f.ORDER_PAY_NAME.focus(); //커서자동클릭
 			return false;
 		}
 		if( f.orderChk.value==""){
 			alert("서비스 약관에 동의해주세요.");
 			return false;
 		}
 		
		f.submit();
}
/* 
//쿠폰적용팝업 띄우기
// Get the modal
var modal = document.getElementById('myModal');
// Get the button that opens the modal
var btn = document.getElementById("myBtn");
// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];                                          
// When the user clicks on the button, open the modal 
btn.onclick = function() {
    modal.style.display = "block";
}
// When the user clicks on <span> (x), close the modal
span.onclick = function() {
	    modal.style.display = "none";
}
// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
 */
</script>


</head>

<body onload="fn_allPrice()">
<!-- 
쿠폰적용
<div id="myModal" class="modal">
 
      Modal content
      <div class="modal-content">
        <span class="close">X</span>                                                               
        <p>Some text in the Modal..</p>
      </div>
 
</div>
 -->
    <div class="container">

      <div class="masthead">
        <h3 class="text-muted">Project name</h3>
        <nav>
          <ul class="nav nav-justified">
            <li class="active"><a href="#">Home</a></li>
            <li><a href="#">주문</a></li>
            <li><a href="#">입금확인</a></li>
            <li><a href="#">배송중</a></li>
            <li><a href="#">수취확인</a></li>
            <li><a href="#">거래완료</a></li>
          </ul>
        </nav>
      </div>
      
      <div style="width:1140px; height:50px; margin:10px; padding:12px; border:1px solid #dcdcdc">
      	<table>
      		<tr>
      			<td style="text-align:left; font-size:17px; font-weight:bold;">주문작성/결제</td>
      		</tr>
      	</table>
      </div>

      <!-- tables -->
      <form id="commonForm" name="commonForm"></form>
      <form name="orderWrite" method="post" action="/stu/order/orderPay.do">
          <div class="table-responsive">
          	<p><b>주문작성/결제</b></p>
            <table class="table table-striped">
            <colgroup>
				<col width="20" />
				<col width="*" />
				<col width="10%" />
				<col width="13%" />
				<col width="13%" />
			</colgroup>
              <thead>
                <tr>
                  <th colspan="2" style="text-align:center">상품명/옵션</th>
                  <th style="text-align:center">수량</th>
                  <th style="text-align:center">상품가</th>
                  <th style="text-align:center">주문금액</th>
                </tr>
              </thead>
              <tbody>
              
					<c:forEach items="${list }" var="row" varStatus="status">
						<input type="hidden" name="goods_att_amount" value="${row.GOODS_ATT_AMOUNT }">
						<input type="hidden" name="member_grade" value="${row.MEMBER_GRADE }">
						<tr>
                  			<td>
                  				<img src="${row.UPLOAD_SAVE_NAME }" width="50" height="50">
                  			</td>
							<td>
				  				<a href="#">${row.GOODS_NAME }</a> <br>
				  				색상: ${row.GOODS_ATT_COLOR } <br> 
				  				사이즈:${row.GOODS_ATT_SIZE } <br>
				  			</td>
				  			<td style="text-align:center">
                  				<input type="number" name="basket_goods_amount" value="${row.BASKET_GOODS_AMOUNT }" style="width:50px; text-align:right" readonly>
                  			</td>
							<td style="text-align:center">
								<c:set var="price" value="${row.GOODS_SALE_PRICE }" />
								<c:choose>
    								<c:when test="${price eq null}">
        								<input type="text" name="goods_sell_price" value="${row.GOODS_SELL_PRICE }"style="width:60px; text-align:right; border:none;" readonly>원
   					 				</c:when>
   					 				<c:when test="${price ne null}">
        								<input type="text" name="goods_sell_price" value="${row.GOODS_SALE_PRICE }"style="width:60px; text-align:right; border:none;" readonly>원
   					 				</c:when>
								</c:choose>
							</td>
							<td style="text-align:center">
								<input type="text" name="order_price" value="" style="width:60px; text-align:right; border:none;" readonly>원
							</td>
						</tr>
					</c:forEach>
              </tbody>
            </table>
          </div>
          <br><br>
          
          <div class="table-responsive">
          	<table class="table table-striped" style="width:1140px" >
          	<colgroup>
				<col width="11%" />
				<col width="22%" />
				<col width="11%" />
				<col width="22%" />
				<col width="12%" />
				<col width="22%" />
			</colgroup>
          		<tr>
          			<td>주문금액</td>
          			<td style="text-align:right">
          				<input type="text" name="ORDER_TOTAL_ORDER_PRICE" id="ORDER_TOTAL_ORDER_PRICE" style="width:100px; text-align:right; border:none;" readonly>원
          			</td>
          			<td>- 할인금액</td>
          			<td style="text-align:right">
          				<input type="text" name="" id="" style="width:100px; text-align:right; border:none;" readonly>원
          			</td>
          			<td> = 결제예정금액</td>
          			<td style="text-align:right">
          				<input type="text" name="pay_price1" id="pay_price1" value="" style="width:100px; text-align:right; border:none;" readonly>원
          			</td>
          		</tr>
          		<tr rowspan="3">
          			<td >
          				쿠폰할인
          			</td>
          			<td colspan="3" >
          				<input type="text" name="" id="" value="0" style="width:100px; text-align:right; border:none;" readonly> 원 &nbsp;&nbsp;&nbsp;
          				<button id="myBtn">쿠폰적용</button>
          			</td>
          			<td>
          				적립혜택
          			</td>
          			<td>
          			</td>
          		</tr>
          		<tr rowspan="3">
          			<td>
          				포인트
          			</td>
          			<td colspan="3" >
          				<input type="text" name="ORDER_USE_POINT" id="ORDER_USE_POINT" value="0" style="width:100px; text-align:right"> P &nbsp;&nbsp;&nbsp;&nbsp;
          				<input type="button" value="사용" onclick="">
          				(포인트 ${map.POINT_TOTAL }P)
          			</td>
          			<td>
          				포인트적립
          			</td>
          			<td>
          				<input type="text" name="ORDER_SAVE_POINT" id="ORDER_SAVE_POINT" style="width:100px; text-align:right" readonly> P
          			</td>
          		</tr>
          		<tr rowspan="3">
          			<td>
          				선결제배송비
          			</td>
          			<td colspan="3" >
          				<input type="text" id="ORDER_FEE" name="ORDER_FEE" value="3000" style="width:100px; text-align:right; border:none;" readonly>원
          			</td>
          			<td>
          			</td>
          			<td>
          			</td>
          		</tr>
          	</table>
          </div>
         
            <br><br>
            <div class="table-responsive">
          	<p>
          		<b>받으시는분(상품받으실분)</b> &nbsp;
          		<input type="checkbox" name="chkinfo" id="chkinfo" onclick="fn_chkinfo()">
          		주문자 정보와 동일
          	</p>
            <table class="table table-striped">
            <colgroup>
				<col width="15%" />
				<col width="*" />
			</colgroup>
              <tbody>
              	<tr>
              		<td>이름</td>
              		<td style="text-align:left">
                  		<input type="text" name="ORDER_NAME" id="ORDER_NAME" value="" style="width:100px;" >
                  	</td>
				</tr>
				<tr>
              		<td>휴대폰번호</td>
              		<td style="text-align:left">
                  		<input type="text" name="ORDER_PHONE" id="ORDER_PHONE" value="" style="width:120px;" >
                  	</td>
				</tr>
				<tr>
              		<td rowspan="3">주소</td>
              		<td style="text-align:left">
                  		<input type="text" name="ORDER_ZIPCODE" id="ORDER_ZIPCODE" value="" style="width:80px;" >
                  	</td>
				</tr>
				<tr>
              		<td style="text-align:left">
                  		<input type="text" name="ORDER_ADDR1" id="ORDER_ADDR1"value="" style="width:250px;" >
                  	</td>
				</tr>
				<tr>
              		<td style="text-align:left">
                  		<input type="text" name="ORDER_ADDR2" id="ORDER_ADDR2"value="" style="width:250px;" >
                  	</td>
				</tr>
              </tbody>
            </table>
          </div>
          <br><br>
          
          <div class="table-responsive">
          	<p><b>결제선택</b></p>
            <table class="table table-striped">
            <colgroup>
				<col width="20%" />
				<col width="80%" />
			</colgroup>
              <tbody>
              	<tr>
              		<td>총 결제금액</td>
              		<td style="text-align:left">
                  		<input type="text" name="ORDER_TOTAL_PAY_PRICE" id="ORDER_TOTAL_PAY_PRICE" value="" style="width:100px;" readonly>
                  	</td>
				</tr>
				<tr>
              		<td>결제방법</td>
              		<td style="text-align:left">
                  		<input type="radio" name="ORDER_PAY_OPTION" id="OPTION1" value="신용카드" style="width:30px;">신용카드
                  		&nbsp;&nbsp;
                  		<input type="radio" name="ORDER_PAY_OPTION" id="OPTION2" value="계좌이체" style="width:30px;">계좌이체
                  	</td>
				</tr>
				<tr>
              		<td>결제은행</td>
              		<td style="text-align:left">
                  		<input type="text" name="ORDER_PAY_BANK" style="width:150px;">
                  	</td>
				</tr>
				<tr>
              		<td>결제자명</td>
              		<td style="text-align:left">
                  		<input type="text" name="ORDER_PAY_NAME" style="width:100px;">
                  	</td>
				</tr>
              </tbody>
            </table>
            </div>
            <br>
            <div style="text-align:center">
            	<input type="checkbox" name="orderChk" id="orderChk">
          		(필수)결제서비스 약관에 동의하며, 원활한 배송을 위한 개인정보 제공에 동의합니다.
          		<br><br>
          		<input type="button" name="all_order" value="장바구니" onClick="location.href='/basket/basketList.do'">
            	<input type="submit" name="order_pay" value="결제진행" onclick="fn_order_pay(); return false;">
            </div>
      
     </form>

      <!-- Example row of columns -->
      <div class="row">
        <div class="col-lg-4">
          <h2>Safari bug warning!</h2>
          <p class="text-danger">As of v8.0, Safari exhibits a bug in which resizing your browser horizontally causes rendering errors in the justified nav that are cleared upon refreshing.</p>
          <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
          <p><a class="btn btn-primary" href="#" role="button">View details &raquo;</a></p>
        </div>
        
      </div>

      <!-- Site footer -->
      <footer class="footer">
        <p>&copy; Company 2014</p>
      </footer>

    </div> <!-- /container -->


    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
  </body>
</html>