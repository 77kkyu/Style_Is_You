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
<title>admin주문디테일</title>

<!-- 부트스트랩 -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/dashboard.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/justified-nav.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.5.1.js"></script>
<script src="<c:url value='/js/common1.js'/>" charset="utf-8"></script>

 
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
	

 </script>
 
</head>
<body>
<div class="container">
	<%@include file="/WEB-INF/tiles/adminSide.jsp" %>
	<div class="row">
        <div>
			<p><a href="#" onclick="order_list(); return false;">목록으로</a></p>
        </div>
        <c:forEach items="${order_detail }" var="detail">
        <div style="border: 1px solid gray; bottom: 20px; width: 80%;">
          <h2>받으시는분</h2>
          <p>받는분 이름 : ${detail.ORDER_NAME } / 받는분 연락처 : ${detail.ORDER_PHONE }</p>
          <p>받는분 주소 : ${detail.ZIPDOCE } / ${detail.ORDER_ADDR1 } ${detail.ORDER_ADDR2 } </p>
        </div>

        <table class="table table-striped">
			<tbody>
				<tr>
					<td>주문번호</td><td>${detail.ORDER_NO }</td>
				</tr>
				<tr>									
					<td>주문자</td><td>${detail.MEMBER_NAME }</td>
				</tr>
				<tr>	
					<td>연락처</td><td>${detail.MEMBER_PHONE }</td>
				</tr>
				<tr>	
					<td>이메일</td><td>${detail.MEMBER_EMAIL }</td>
				</tr>
				<br />
				<tr>
					<td>배송상태</td><td>${detail.ORDER_STATE }</td>
				</tr>
				<br />
				<tr>
					<td>결제수단</td><td>${detail.ORDER_PAY_OPTION }</td>
				</tr>
				<tr>	
					<td>제품가격</td><td>${detail.ORDER_TOTAL_ORDER_PRICE }</td>
				</tr>
				<tr>	
					<td>배송비</td><td>${detail.ORDER_FEE }</td>
				</tr>
				<tr>	
					<td>사용포인트</td><td>${detail.ORDER_USE_POINT }</td>
				</tr>
				<tr>	
					<td>최종결제금액</td><td>${detail.ORDER_TOTAL_PAY_PRICE }</td>
				</tr>								

<%--			<td><input type="button" onclick="order_detail(${order.ORDER_NO })" value="상세보기">
				<br /><input type="button" onclick="order_state(${order.ORDER_STATE }, ${order.ORDER_NO })" value="확인버튼"></td> --%>
			</tbody>
		</table>
        </c:forEach>
	</div>
	<hr />
	<div class="table-responsive">
		<table class="table table-striped">
			<colgroup>
			<col width="*" />
			<col width="15%" />
			<col width="10%" />
			<col width="15%" />
			<col width="15%" />
			</colgroup>
			<thead>
				<tr>
					<th scope="col">제품명</th>
					<th scope="col">판매가격</th>
					<th scope="col">수량</th>
					<th scope="col">할인</th>
					<th scope="col">주문금액</th>
				</tr>
			</thead>
			
			<tbody>
			<c:choose>
				<c:when test="${fn:length(order_detail_sub) > 0}">
					<c:forEach items="${order_detail_sub }" var="detail_sub">					
						<tr>
							<td>${detail_sub.GOODS_NAME }</td>
							<td>${detail_sub.ORDER_DETAIL_PRICE }</td>
							<td>${detail_sub.ORDER_DETAIL_AMOUNT }</a>
							<td>${detail_sub.COUPON_DISCOUNT }개</td>
							<td>${detail_sub.ORDER_DISCOUNT_APPLY }원</td>

<%-- 							<td><input type="button" onclick="order_detail(${order.ORDER_NO })" value="상세보기">
							<br /><input type="button" onclick="order_state(${order.ORDER_STATE }, ${order.ORDER_NO })" value="확인버튼"></td> --%>
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

</div>






	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
	<script src="js/bootstrap.min.js"></script>
</body>
</html>
