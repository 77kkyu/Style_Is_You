<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>my주문디테일</title>

<!-- 부트스트랩 -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/dashboard.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/justified-nav.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.5.1.js"></script>
<script src="<c:url value='/js/common1.js'/>" charset="utf-8"></script>

<!-- 주소검색 API(카카오) -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

 <style>

a {
  text-decoration: none;
  color: #666;
  text-decoration:none
}

h1 {
    text-align: center;
    padding: 50px 0;
    font-weight: normal;
    font-size: 2em;
    letter-spacing: 10px;
}  
</style>
 <script>
$(document).ready(function(){
	
});

function order_list() {
	var os = "";
	<c:forEach items="${order_detail}" var="detail">
		os = ${detail.ORDER_STATE}
	</c:forEach>
	location.href="/stu/order_admin_a.do?os="+os;
	return;	
}

//주소 찾기
function findAddr() {
	new daum.Postcode( {
		oncomplete : function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var roadAddr = data.roadAddress; // 도로명 주소 변수
			var extraRoadAddr = ''; // 참고 항목 변수

			// 법정동명이 있을 경우 추가한다. (법정리는 제외)
			// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			if (data.bname !== ''
					&& /[동|로|가]$/g.test(data.bname)) {
				extraRoadAddr += data.bname;
			}
			// 건물명이 있고, 공동주택일 경우 추가한다.
			if (data.buildingName !== ''
					&& data.apartment === 'Y') {
				extraRoadAddr += (extraRoadAddr !== '' ? ', '
						+ data.buildingName : data.buildingName);
			}
			// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			if (extraRoadAddr !== '') {
				extraRoadAddr = ' (' + extraRoadAddr + ')';
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('ORDER_ZIPCODE').value = data.zonecode;
			document.getElementById("ORDER_ADDR1").value = roadAddr
					+ data.jibunAddress;

			// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
			if (roadAddr !== '') {
				document.getElementById("ORDER_ADDR2").value = extraRoadAddr;
			} else {
				document.getElementById("ORDER_ADDR2").value = '';
			}
		}
	}).open();
}

function fn_order_modify() { // 유효성체크

	if(confirm("배송지 변경을 하시겠습니까?")){
		var comSubmit = new ComSubmit("orderModify"); // 객체생성
		comSubmit.setUrl("<c:url value='/order/orderModify.do' />"); // url설정

    	if(!$("#ORDER_NAME").val()){
        	alert("주문자 이름을 입력해주세요.");
        	$("#ORDER_NAME").focus();
        	return false;
    	}
    	if(!$("#ORDER_PHONE").val()){
       		alert("주문자 전화번호를 입력해주세요.");
        	$("#ORDER_PHONE").focus();
        	return false;
	    }
	    if(!$("#ORDER_ZIPCODE").val()){
	        alert("주소를 정확히 입력해주세요.");
	        $("#ORDER_ZIPCODE").focus();
	        return false;
	    }
	    if(!$("#ORDER_ADDR1").val()){
	        alert("주소를 정확히 입력해주세요.");
	        $("#ORDER_ADDR1").focus();
	        return false;
	    }
	    if(!$("#ORDER_ADDR2").val()){
	        alert("주소를 정확히 입력해주세요.");
	        $("#ORDER_ADDR2").focus();
	        return false;
	    }
	    
		comSubmit.submit();
	}
	return false;
}
	

 </script>
 
</head>
<body>
<div class="container">
	<%@include file="/WEB-INF/tiles/mySide.jsp" %>
	<div class="row" align="center">
		<br>
        <div>
          <h2>주문 정보</h2>
        </div>
        <br>
        <c:forEach items="${my_detail }" var="detail">
        <table class="table table-striped">
        	<colgroup>
				<col width="20%" />
				<col width="80%" />
			</colgroup>
        	<tbody>
              	<tr>
              		<td style="text-align:center">주문번호</td>
              		<td style="text-align:left">
                  		${detail.ORDER_NO }
                  	</td>
				</tr>
				<tr>
              		<td style="text-align:center">결제방법</td>
              		<td style="text-align:left">
              			${detail.ORDER_PAY_OPTION }
              		</td>
				</tr>
				<tr>
              		<td style="text-align:center">주문일자</td>
              		<td style="text-align:left">
                  		${detail.ORDER_DATE }
                  	</td>
				</tr>
				<tr>
              		<td style="text-align:center">결제방법</td>
              		<td style="text-align:left">
                  		${detail.ORDER_PAY_OPTION }
                  	</td>
				</tr>
				<tr>
              		<td style="text-align:center">결제은행</td>
              		<td style="text-align:left">
                  		${detail.ORDER_PAY_BANK }
                  	</td>
				</tr>
				<tr>
              		<td style="text-align:center">결제자명 </td>
              		<td style="text-align:left">
                  		${detail.ORDER_PAY_NAME }
                  	</td>
				</tr>
				<tr>
              		<td style="text-align:center">최종결제금액</td>
              		<td style="text-align:left">
                  		${detail.ORDER_TOTAL_PAY_PRICE }
                  	</td>
				</tr>
				<tr>
              		<td style="text-align:center">배송비</td>
              		<td style="text-align:left">
                  		${detail.ORDER_FEE }
                  	</td>
				</tr>
				<tr>
              		<td style="text-align:center">사용포인트</td>
              		<td style="text-align:left">
                  		${detail.ORDER_USE_POINT }
                  	</td>
				</tr>
              </tbody>
		</table>
        
	<br>
	<br>
        <div>
          <h2>상품 정보</h2>
        </div>
    <br>
	<div class="table-responsive">
		<table class="table table-striped">
			<colgroup>
			<col width="15%" />
			<col width="*" />
			<col width="18%" />
			<col width="9%" />
			<col width="15%" />
			<col width="18%" />
			</colgroup>
			<thead>
				<tr>
					<th colspan="2" style="text-align:center" scope="col">제품명</th>
					<th style="text-align:center" scope="col">판매가격</th>
					<th style="text-align:center" scope="col">수량</th>
					<th style="text-align:center" scope="col">할인</th>
					<th style="text-align:center" scope="col">주문금액</th>
				</tr>
			</thead>
			
			<tbody>
			<c:choose>
				<c:when test="${fn:length(my_detail_sub) > 0}">
					<c:forEach items="${my_detail_sub }" var="detail_sub">		
					<%-- ${detail_sub } --%>			
						<tr>
							<td style="text-align:center">
                  				<img src='/stu/file/${detail_sub.GOODS_THUMBNAIL }' width="70px" height="70px">
                  			</td>
							<td>
								<a href="/stu/shop/goodsDetail.do?IDX=${detail_sub.GOODS_NO }">${detail_sub.GOODS_NAME }</a> <br> 
								색상: ${detail_sub.ORDER_DETAIL_COLOR } <br> 
				  				사이즈:${detail_sub.ORDER_DETAIL_SIZE } <br>
							</td>
							<td style="text-align:center">${detail_sub.ORDER_DETAIL_PRICE }원</td>
							<td style="text-align:center">${detail_sub.ORDER_DETAIL_AMOUNT }</a>
							<td style="text-align:center">${detail_sub.COUPON_DISCOUNT }원</td>
							<td style="text-align:center">${detail_sub.ORDER_DISCOUNT_APPLY }원</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="6">조회된 결과가 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
			</tbody>
		
		</table>
	</div>
	<br>
	<br>
        <div>
          <h2>배송 정보</h2>
        </div>
    <br>
    <form name="orderModify" id="orderModify" method="post">
    <input type="hidden" name="ORDER_NO" id="ORDER_NO" value="${detail.ORDER_NO }">
    <div class="table-responsive">
    <table class="table table-striped">
            <colgroup>
				<col width="20%" />
				<col width="80%" />
			</colgroup>
              <tbody>
              	<tr>
              		<td style="text-align:center">받는분 이름</td>
              		<td style="text-align:left">
                  		<input type="text" name="ORDER_NAME" id="ORDER_NAME" value="${detail.ORDER_NAME }" style="width:100px;border:none;" >
                  	</td>
				</tr>
				<tr>
              		<td style="text-align:center">받는분 연락처</td>
              		<td style="text-align:left">
                  		<input type="text" name="ORDER_PHONE" id="ORDER_PHONE" value="${detail.ORDER_PHONE }" style="width:120px;border:none;" >
                  	</td>
				</tr>
				<tr>
              		<td style="text-align:center" rowspan="3">받는분 주소</td>
              		<td style="text-align:left">
                  		<input type="text" name="ORDER_ZIPCODE" id="ORDER_ZIPCODE" value="${detail.ORDER_ZIPCODE }" style="width:80px;border:none;" >
                  		<button type="button" id="findAddrBtn" onclick="findAddr()">우편번호 찾기</button>
                  	</td>
				</tr>
				<tr>
              		<td style="text-align:left">
                  		<input type="text" name="ORDER_ADDR1" id="ORDER_ADDR1" value="${detail.ORDER_ADDR1 }" style="width:400px;border:none;" >
                  	</td>
				</tr>
				<tr>
              		<td style="text-align:left">
                  		<input type="text" name="ORDER_ADDR2" id="ORDER_ADDR2" value="${detail.ORDER_ADDR2 }" style="width:400px;border:none;" >
                  	</td>
				</tr>
              </tbody>
            </table>
            </div>
            </form>
            
        	<c:set var="state" value="${detail.ORDER_STATE }" />
    		<c:if test="${state == 0 or state == 1}">
        		<div style="text-align:right"> 
        			<input type="button" name="order_modify" value="배송정보변경" onclick="fn_order_modify()">
    			</div>
   			</c:if>
        
	</c:forEach>

	</div>
</div>






	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
	<script src="js/bootstrap.min.js"></script>
</body>
</html>
