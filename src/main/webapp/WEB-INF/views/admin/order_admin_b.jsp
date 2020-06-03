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
<link href="dashboard.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="justified-nav.css" rel="stylesheet">

</head>
<body>
<div class="container">

	<div class="masthead">
		<h3 class="text-muted">Project name</h3>
		<nav>
			<ul class="nav nav-justified">
				<li class="active"><a href="#">신규주문</a></li>
				<li><a href="#">입금확인</a></li>
				<li><a href="#">배송준비</a></li>
				<li><a href="#">수취확인</a></li>
				<li><a href="#">거래완료</a></li>
			</ul>
		</nav>
	</div>

	<div class="table-responsive">
		<table class="table table-striped">
			<colgroup>
			<col width="10%" />
			<col width="10%" />
			<col width="*" />
			<col width="5%" />
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
			<tbody>
			<c:choose>
				<c:when test="${fn:length(order_a) > 0}">
					<c:forEach items="${order_a }" var="order_a">
						<tr>
							<td>${order_a.order_date }<br />${order_a.order_no }</td>
							<td>${order_a.member_id }<br />${order_a.member_name }</td>
							<td ><a href="#this" name="title">${order_a.goods_name }</a>
								<input type="hidden" id="member_no" value="${order_a.member_no }"></td>
							<td>${order_a.hap_cnt }건</td>
							<td>${order_a.order_total_pay_price }원</td>
							<td>[상세보기]<br />[주문확인]</td>
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
