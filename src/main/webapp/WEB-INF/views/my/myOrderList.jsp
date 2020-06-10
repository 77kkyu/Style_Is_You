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
<title>my주문메인</title>

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
		/* alert('동작함'); */
	});

	
function order_cancle(mem_no, order_no){
	var mem_no = mem_no;
	var order_no = order_no;
	
	if(mem_no == null || order_no == null || mem_no == '' || order_no == '') {
		alert("오류입니다.");
		return;
	}
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/order_cancle.do' />");
	comSubmit.addParam("mem_no", mem_no);
	comSubmit.addParam("order_no", order_no);
	comSubmit.submit();
}
 
function order_ok(mem_no, order_no){
	alert("동작1");
	var mem_no = mem_no;
	var order_no = order_no;
	
	if(mem_no == null || order_no == null || mem_no == '' || order_no == '') {
		alert("오류입니다.");
		return;
	}
	
	if(confirm("수취확인 후 교환/환분/AS문의는 고객 게시판을 이용해 주시기 바랍니다.")){
	$.ajax({
		url: "/stu/order_ok.do",
		data : {"mem_no": mem_no, "order_no": order_no},
		type: "post",
		async:false,
		success : function(data){
		alert("수취확인이 완료되었습니다.");
		location.href = "/stu/myOrderList.do";
		}
	})
	}else{
	return;
	}
}

 </script>
 
</head>
<body>
<div class="container">
	<div class="row">
        <div class="col-md-4">
          <h2>주문 배송 내역</h2>
          <p>배송추적은 '수취확인' 상태부터 가능합니다.</p>
          <p>수취확인 후에는 반품/교환이 어렵습니다. 기한내 신청 바랍니다.</p>
        </div>
	</div>

	<div class="row">	
		<div >
        <table align="center" width="100%">
        	<colgroup>
			<col width="20%" /><col width="20%" /><col width="20%" /><col width="20%" /><col width="30%" />
			</colgroup>
			<thead>
				<tr>
					<th scope="col">오늘</th>
					<th scope="col">일주일</th>
					<th scope="col">1개월</th>
					<th scope="col">3개월</th>
					<th scope="col">6개월</th>
				</tr>
			</thead>
			<tbody>
				<tr>	
					<td>기간조회</td>
				</tr>
			</tbody>
		</table>
		</div>
	</div>

	<div class="table-responsive">
		<table class="table table-striped">
			<colgroup>
			<col width="20%" />
			<col width="*" />
			<col width="15%" />
			<col width="10%" />
			<col width="10%" />
			</colgroup>
			<thead>
				<tr>
					<th scope="col">주문날짜<br />주문번호</th>
					<th scope="col">구매상품명</th>
					<th scope="col">주문 금액</th>
					<th scope="col">배송현황</th>
					<th scope="col">신청</th>
				</tr>
			</thead>
			<form id="order_select">
			<tbody>
			<c:choose>
				<c:when test="${fn:length(my_order) > 0}">
					<c:forEach items="${my_order }" var="my_order">					
						<tr>
							<td>${my_order.ORDER_DATE }<br />${my_order.ORDER_NO }</td>
							<td ><a href="#this" name="title">${my_order.GOODS_NAME }</a>
								<input type="hidden" id="member_no" value="${my_order.MEMBER_NO }"></td>
							<td>${my_order.ORDER_TOTAL_PAY_PRICE }원</td>
							<c:choose>
								<c:when test="${my_order.ORDER_STATE eq '0' }">
								<td>주문확인중</td>
								</c:when>
								<c:when test="${my_order.ORDER_STATE eq '1' }">
								<td>입금확인중</td>
								</c:when>
								<c:when test="${my_order.ORDER_STATE eq '2' }">
								<td>배송준비중</td>
								</c:when>
								<c:when test="${my_order.ORDER_STATE eq '3' }">
								<td>배송중/<br /><a href="">[송장확인]</a></td>
								</c:when>
								<c:when test="${my_order.ORDER_STATE eq '4' }">
								<td><input type="button" onclick="order_ok(${my_order.MEMBER_NO }, ${my_order.ORDER_NO })" value="수취확인">
								<br /><a href="">[송장확인]</a></td>
								</c:when>
								<c:when test="${my_order.ORDER_STATE eq '5' }">
								<td>배송완료/<br /><a href="">[송장확인]</a></td>
								</c:when>
								<c:when test="${my_order.ORDER_STATE eq '99' }">
								<td>주문취소</td>
								</c:when>
								<c:when test="${my_order.ORDER_STATE eq '98' }">
								<td>주문취소</td>
								</c:when>
								<c:when test="${my_order.ORDER_STATE eq '97' }">
								<td>교환요청</td>
								</c:when>
								<c:when test="${my_order.ORDER_STATE eq '96' }">
								<td>AS요청</td>
								</c:when>
							</c:choose>
							<c:choose>
								<c:when test="${my_order.ORDER_STATE < 2 }">
								<td><input type="button" onclick="order_cancle(${my_order.MEMBER_NO }, ${my_order.ORDER_NO })" value="주문취소"></td>
								</c:when>
								<c:when test="${my_order.ORDER_STATE > 1 && my_order.ORDER_STATE < 5 }">
								<td><input type="button" onclick="order_change(${my_order.ORDER_NO })" value="교환/환불">
								<br /><input type="button" onclick="order_as(${my_order.ORDER_STATE }, ${my_order.ORDER_NO })" value="AS요청"></td>
								</c:when>
								<c:when test="${my_order.ORDER_STATE eq '5' }">
								<td><input type="button" onclick="order_as(${my_order.ORDER_STATE }, ${my_order.ORDER_NO })" value="AS요청"></td>
								</c:when>
								<c:when test="${my_order.ORDER_STATE eq '99' }">
								<td>환불완료</td>
								</c:when>
								<c:when test="${my_order.ORDER_STATE eq '98' }">
								<td>주문취소</td>
								</c:when>
								<c:when test="${my_order.ORDER_STATE > 95 && my_order.ORDER_STATE < 98 }">
								<td>처리중</td>
								</c:when>
							</c:choose>
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
		</form>
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
