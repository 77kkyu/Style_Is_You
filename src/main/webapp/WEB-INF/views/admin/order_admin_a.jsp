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
<title>adminMain</title>

<!-- 부트스트랩 -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/dashboard.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/justified-nav.css" rel="stylesheet">

<script type="text/javascript">

	/* 필요한거 이페이지가 돌아왔을때 order_state값이 0이면  id="o1"에 추가class="active" */


	$(document).ready(function(){
		$("#od_detail").on("click", function(e){
			e.preventDefault();
			fn_openBoardList();
		});		
	});
	
	function fn_openBoardList(){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/stu/order_admin_a.do' />");
		comSubmit.submit();
	}
</script>

</head>
<body>
<div class="container">
	<div class="masthead">
		<h3 class="text-muted">Project name</h3>
		<nav>
			<ul class="nav nav-justified">
				<li id="o1"><a href="/stu/order_admin_a.do">신규주문</a></li>
				<li id="o2"><a href="#">입금확인</a></li>
				<li id="o3"><a href="#">배송준비</a></li>
				<li id="o4"><a href="#">수취확인</a></li>
				<li id="o5"><a href="#">거래완료</a></li>
			</ul>
		</nav>
	</div>

	<div class="table-responsive">
		<table class="table table-striped">
			<colgroup>
			<col width="10%" />
			<col width="14%" />
			<col width="*" />
			<col width="10%" />
			<col width="15%" />
			<col width="15%" />
			</colgroup>
			<thead>
				<tr>
					<th scope="col">주문날짜<br />주문번호</th>
					<th scope="col">회원아이디<br />회원이름</th>
					<th scope="col">구매상품</th>
					<th scope="col">총 개수</th>
					<th scope="col">총 금액</th>
					<th scope="col">진행상황</th>
				</tr>
			</thead>
			<form id="order_select">
			<tbody>
			<c:choose>
				<c:when test="${fn:length(order_a) > 0}">
					<c:forEach items="${order_a }" var="order">					
						<tr>
							<td>${order.ORDER_DATE }<br />${order.ORDER_NO }</td>
							<td>${order.MEMBER_ID }<br />${order.MEMBER_NAME }</td>
							<td ><a href="#this" name="title">${order.GOODS_NAME }</a>
								<input type="hidden" id="member_no" value="${order.MEMBER_NO }"></td>
							<td>${order.HAP_CNT }건</td>
							<td>${order.ORDER_TOTAL_PAY_PRICE }원</td>
							<td><a href="#this" id="od_detail" >상세보기</a>
							<br /><a href="#this" id="od_next" >주문확인</a></td>
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
