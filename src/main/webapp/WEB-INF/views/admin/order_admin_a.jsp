<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
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
<title>admin주문메인</title>

<!-- 부트스트랩 -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/dashboard.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/justified-nav.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.5.1.js"></script>

<script src="<c:url value='/js/common_s.js'/>" charset="utf-8"></script>

<!-- 
<script type="text/javascript">

	/* 필요한거 이페이지가 돌아왔을때 order_state값이 0이면  id="o1"에 추가class="active" */

	$(document).ready(function(){
		$("#o1").on("click", function(e){
			e.preventDefault();
			fn_openBoardList();
		});		
	});
	
	function fn_openBoardList(){
		
		var comSubmit = new ComSubmit();
		var state = 0;
		comSubmit.setUrl("<c:url value='/stu/order_admin_a.do' />");
		comSubmit.addParam("order_state", state);
		comSubmit.submit();
	}
</script>
 -->
 
 
 <script>

  
 
function order_state(state, no){
	 var state = state;
	 var no = no;
	 var exp = $("#express").val();
 
	if(confirm("확인하시겠습니까?")){
	 $.ajax({
         url: "/stu/order_admin_a.do",
         data : {"order_state": state, "order_no": no, "express":exp},
         type: "post",
         async:false,
         success : function(data){
        	 alert("주문상태가 변경되었습니다.");
         	 location.href = "/stu/order_admin_a.do?os="+state;
/*              window.opener.location.reload(); */
             /* self.close(); */
         }
      })}else{
         return;
	}
}

function order_detail(no){
	alert("작동됨?");
	var comSubmit = new ComSubmit();
	var order_no = no;
	comSubmit.setUrl("<c:url value='/order_detail.do' />");
	comSubmit.addParam("order_no", order_no);
	comSubmit.submit();
      
}

 </script>
 
</head>
<body>


<div class="container">
	
	<%@include file="/WEB-INF/tiles/adminSide.jsp" %> 


	<div class="masthead">
		<h3 class="text-muted">주문배송 관리</h3>
		<nav>
			<ul class="nav nav-justified">
			<c:choose>
				<c:when test="${fn:length(order_a) > 0}">
					<c:forEach items="${order_a }" var="state" begin="0" end="0">
					<c:choose>
						<c:when test="${state.ORDER_STATE eq '0' }">
						<li class="active"><a href="/stu/order_admin_a.do?os=0">신규주문</a></li>
						</c:when>
						<c:otherwise>
						<li><a href="/stu/order_admin_a.do?os=0">신규주문</a></li>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${state.ORDER_STATE eq '1' }">
						<li class="active"><a href="/stu/order_admin_a.do?os=1">입금확인</a></li>
						</c:when>
						<c:otherwise>
						<li><a href="/stu/order_admin_a.do?os=1">입금확인</a></li>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${state.ORDER_STATE eq '2' }">
						<li class="active"><a href="/stu/order_admin_a.do?os=2">배송준비</a></li>
						</c:when>
						<c:otherwise>
						<li><a href="/stu/order_admin_a.do?os=2">배송준비</a></li>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${state.ORDER_STATE eq '3' }">
						<li class="active"><a href="/stu/order_admin_a.do?os=3">배송중</a></li>
						</c:when>
						<c:otherwise>
						<li><a href="/stu/order_admin_a.do?os=3">배송중</a></li>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${state.ORDER_STATE eq '4' }">
						<li class="active"><a href="/stu/order_admin_a.do?os=4">수취확인</a></li>
						</c:when>
						<c:otherwise>
						<li><a href="/stu/order_admin_a.do?os=4">수취확인</a></li>
						</c:otherwise>
					</c:choose>				
					<c:choose>
						<c:when test="${state.ORDER_STATE eq '5' }">
						<li class="active"><a href="/stu/order_admin_a.do?os=5">거래완료</a></li>
						</c:when>
						<c:otherwise>
						<li><a href="/stu/order_admin_a.do?os=5">거래완료</a></li>
						</c:otherwise>
					</c:choose>
					</c:forEach>
				</c:when>
				<c:otherwise>
				<c:forEach items="${order_state }" var="state" begin="0" end="0">
					<c:choose>
						<c:when test="${state eq '0' }">
						<li class="active"><a href="/stu/order_admin_a.do?os=0">신규주문</a></li>
						</c:when>
						<c:otherwise>
						<li><a href="/stu/order_admin_a.do?os=0">신규주문</a></li>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${state eq '1' }">
						<li class="active"><a href="/stu/order_admin_a.do?os=1">입금확인</a></li>
						</c:when>
						<c:otherwise>
						<li><a href="/stu/order_admin_a.do?os=1">입금확인</a></li>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${state eq '2' }">
						<li class="active"><a href="/stu/order_admin_a.do?os=2">배송준비</a></li>
						</c:when>
						<c:otherwise>
						<li><a href="/stu/order_admin_a.do?os=2">배송준비</a></li>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${state eq '3' }">
						<li class="active"><a href="/stu/order_admin_a.do?os=3">배송중</a></li>
						</c:when>
						<c:otherwise>
						<li><a href="/stu/order_admin_a.do?os=3">배송중</a></li>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${state eq '4' }">
						<li class="active"><a href="/stu/order_admin_a.do?os=4">수취확인</a></li>
						</c:when>
						<c:otherwise>
						<li><a href="/stu/order_admin_a.do?os=4">수취확인</a></li>
						</c:otherwise>
					</c:choose>				
					<c:choose>
						<c:when test="${state eq '5' }">
						<li class="active"><a href="/stu/order_admin_a.do?os=5">거래완료</a></li>
						</c:when>
						<c:otherwise>
						<li><a href="/stu/order_admin_a.do?os=5">거래완료</a></li>
						</c:otherwise>
					</c:choose>
					</c:forEach>
				</c:otherwise>
			</c:choose>				
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
			
			<tbody>
			<c:choose>
				<c:when test="${fn:length(order_a) > 0}">
					<c:forEach items="${order_a }" var="order">					
						<tr>
							<td>${order.ORDER_DATE }<br />${order.ORDER_NO }</td>
							<td>${order.MEMBER_ID }<br />${order.MEMBER_NAME }</td>
							<%-- 주문상태${order.ORDER_STATE } --%>
							<c:choose>
								<c:when test="${order.ORDER_STATE == 0 }">
								<td><a href="#this" name="title">${order.GOODS_NAME }</a></td>
								</c:when>
								<c:when test="${order.ORDER_STATE == 1 }">
								<td><a href="#this" name="title">${order.GOODS_NAME }</a><br />
								<select name="bank_chk" id="">
									<option >결제 미확인</option>
									<option >결제 확인</option>
								</select>
								</td>
								</c:when>
								<c:when test="${order.ORDER_STATE == 2 }">
								<td><a href="#this" name="title">${order.GOODS_NAME }</a><br />
								[${order.ORDER_PAY_BANK }] / 송장번호:<input type="text" id="express" /></td>
								</c:when>
								<c:when test="${order.ORDER_STATE > 2 }">
								<td><a href="#this" name="title">${order.GOODS_NAME }</a><br />
								[${order.ORDER_PAY_BANK }]/송장번호:[${order.ORDER_EXPRESS }]</td>
								</c:when>
							</c:choose>
							<%-- <td ><a href="#this" name="title">${order.GOODS_NAME }</a>
								<input type="hidden" id="member_no" value="${order.MEMBER_NO }"></td> --%>
							<td>${order.HAP_CNT }건</td>
							<td>${order.ORDER_TOTAL_PAY_PRICE }원</td>
							<c:choose>
								<c:when test="${order.ORDER_STATE < 5 }">
									<td><input type="button" onclick="order_detail(${order.ORDER_NO })" value="상세보기" />
									<br /><input type="button" onclick="order_state(${order.ORDER_STATE }, ${order.ORDER_NO })" value="확인버튼" /></td>
								</c:when>
								<c:otherwise>
									<td><input type="button" onclick="order_detail(${order.ORDER_NO })" value="상세보기" />
									<br />[거래완료]</td>
								</c:otherwise>
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
