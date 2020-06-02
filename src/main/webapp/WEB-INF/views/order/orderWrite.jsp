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
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/stu/js/common.js" charset="utf-8"></script>

<script type="text/javascript">

function fn_allchk(){
	
	var chk = document.getElementById("allchk").checked; //값: true,false
	var arraychk = document.getElementsByName("chk"); //가격
	var len = arraychk.length;
		for(var i=0; i<len; i++){
			arraychk[i].checked = chk; //chk가 true면 arraychk도 true
		}
}

function fn_amount(index){

	var array8 = document.getElementsByName("goods_att_amount"); //재고수량
	var array1 = document.getElementsByName("basket_goods_amount"); //수량
	var array4 = document.getElementsByName("chk");

	var att = array8[index].value; 
	var amount = array1[index].value;
	var basket_no = array4[index].value;

	if(amount=!null && amount>0){
		if(amount<=att){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/basket/basketModify.do' />");
			comSubmit.addParam("BASKET_GOODS_AMOUNT", array1[index].value);
			comSubmit.addParam("BASKET_NO", basket_no);
			comSubmit.submit();
		}else if(amount>att){
			alert("재고가 부족합니다.");	
			return false;
		}
	}
	else{
		alert("유효한 숫자가 아닙니다.");	
		return false;
	}
	
}

function fn_allPrice(){
	
	var array = document.getElementsByName("order_price");
	var len = array.length;
	var hap = 0;
	var pay = 0;
	for (var i=0; i<len; i++){
		pri = array[i].value;
		hap = Number(hap)+Number(pri);
	}
	
	
	var fee = document.getElementById("order_fee").value;
	pay = Number(hap)+Number(fee);
	
	//hap = Number(hap).toLocaleString();
	//pay = Number(pay).toLocaleString();
	document.getElementById("all_price").value = hap; //상품금액
	document.getElementById("pay_price").value = pay; //상품금액+배송비
	document.getElementById("all_order_price").value = pay;
	
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
	document.getElementById("point").value = point;
	
}


</script>


</head>
<body onload="fn_allPrice()">

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

      <!-- tables -->
      <form id="commonForm" name="commonForm"></form>
      <form action="">
          <div class="table-responsive">
          	<p><b>내가 담은 장바구니 상품리스트</b></p>
            <table class="table table-striped">
            <colgroup>
				<col width="5%" />
				<col width="10" />
				<col width="*" />
				<col width="10%" />
				<col width="13%" />
				<col width="13%" />
				<col width="10%" />
				<col width="10%" />
			</colgroup>
              <thead>
                <tr>
                  <th style="text-align:center">
                  	<input type="checkbox" name="allchk" id="allchk" onclick="fn_allchk()">
                  </th>
                  <th colspan="2" style="text-align:center">상품명/옵션</th>
                  <th style="text-align:center">수량</th>
                  <th style="text-align:center">상품가</th>
                  <th style="text-align:center">주문금액</th>
                  <th style="text-align:center">주문</th>
                </tr>
              </thead>
              <tbody>
              
              	<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<c:forEach items="${list }" var="row" varStatus="status">
						<input type="hidden" name="goods_att_amount" value="${row.GOODS_ATT_AMOUNT }">
						<input type="hidden" name="member_grade" value="${row.MEMBER_GRADE }">
						<tr>
							<td style="text-align:center">
                  				<input type="checkbox" name="chk" id="chk" value="${row.BASKET_NO }">
                  			</td>
                  			<td>
                  				<img src="${row.UPLOAD_SAVE_NAME }" width="50" height="50">
                  			</td>
							<td>
				  				<a href="#">${row.GOODS_NAME }</a> <br>
				  				색상: ${row.GOODS_ATT_COLOR } <br> 
				  				사이즈:${row.GOODS_ATT_SIZE } <br>
				  			</td>
				  			<td style="text-align:center">
                  				<input type="number" name="basket_goods_amount" value="${row.BASKET_GOODS_AMOUNT }" min="1" max="${row.GOODS_ATT_AMOUNT }" style="width:50px; text-align:right" >
                  			</td>
							<td style="text-align:center">
								<input type="text" name="goods_sell_price" value="${row.GOODS_SELL_PRICE }" style="width:80px; text-align:right">원
							<td style="text-align:center">
								<input type="text" name="order_price" value="${row.GOODS_SELL_PRICE*row.BASKET_GOODS_AMOUNT }" style="width:80px; text-align:right">원
							</td>
							<td style="text-align:center">
                  				<input type="button" name="amount_modify" value="수정" onclick="fn_amount(${status.index})"><br>
                  				<input type="button" name="basket_delete" value="삭제">
                  			</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="7">조회된 결과가 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
              </tbody>
            </table>
          </div>
          <div style="text-align:right">
          	<input type="button" name="select_like" value="찜하기">
            <input type="button" name="all_basket_delete" value="모두삭제">
          </div>
          <br>
          <br>
          <div class="table-responsive">
          	<table class="table table-striped">
          		<tr>
          			<td>주문금액</td>
          			<td>
          				<input type="text" id="all_order_price" style="width:100px; text-align:right">원
          			</td>
          			<td>- 할인금액</td>
          			<td>0원</td>
          			<td> = 결제예정금액</td>
          			<td>
          				<input type="text" id="pay_price" value="" style="width:100px; text-align:right">원
          			</td>
          		</tr>
          		<tr>
          			<td colspan="4">
          				상품금액 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          				<input type="text" id="all_price" style="width:100px; text-align:right">원
          				<br>
          				선결제배송비 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          				<input type="text" id="order_fee" value="3000" style="width:100px; text-align:right" readonly>원
          			</td>
          			<td>
          				적립혜택 <br>
          				포인트적립 
          			</td>
          			<td>
          				<input type="text" id="point" style="width:100px; text-align:right" readonly> P
          			</td>
          		</tr>
          	</table>
          </div>
          <div style="text-align:right">
          	<input type="button" name="all_order" value="전체주문">
            <input type="button" name="select_order" value="선택상품주문">
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
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>