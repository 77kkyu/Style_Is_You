<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<<<<<<< HEAD
<<<<<<< HEAD
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>      
=======
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
    
>>>>>>> origin/syk_06-05_1
=======
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>      
>>>>>>> origin/05.29-K
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
<<<<<<< HEAD
<link href="css/dashboard.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/justified-nav.css" rel="stylesheet">
<<<<<<< HEAD

<script type="text/javascript">

	/* 필요한거 이페이지가 돌아왔을때 order_state값이 0이면  id="o1"에 추가class="active" */


	$(document).ready(function(){
		$("li#o).on("click", function(e){
=======
<script src="http://code.jquery.com/jquery-3.5.1.js"></script>

<!-- 
<script type="text/javascript">

	/* 필요한거 이페이지가 돌아왔을때 order_state값이 0이면  id="o1"에 추가class="active" */
	
function gfn_isNull(str) {
	if (str == null) return true;
	if (str == "NaN") return true;
	if (new String(str).valueOf() == "undefined") return true;    
    var chkStr = new String(str);
    if( chkStr.valueOf() == "undefined" ) return true;
    if (chkStr == null) return true;    
    if (chkStr.toString().length == 0 ) return true;   
    return false; 
}

function ComSubmit(opt_formId) {
	alert(opt_formId);
	this.formId = gfn_isNull(opt_formId) == true ? "commonForm" : opt_formId;
	this.url = "";
	
	
	if(this.formId == "commonForm"){
		$("#commonForm")[0].reset();
	}
	
	this.setUrl = function setUrl(url){
		this.url = url;
	};
	
	this.addParam = function addParam(key, value){
		$("#"+this.formId).append($("<input type='hidden' name='"+key+"' id='"+key+"' value='"+value+"' >"));
	};
	
	this.submit = function submit(){
		var frm = $("#"+this.formId)[0];
		frm.action = this.url;
		frm.method = "post";
		frm.submit();	
	};
}	
	


	$(document).ready(function(){
		$("#o1").on("click", function(e){
>>>>>>> origin/syk_06-05_1
			e.preventDefault();
			fn_openBoardList();
		});		
	});
	
	function fn_openBoardList(){
<<<<<<< HEAD
		var comSubmit = new ComSubmit();
		$(#id)
		comSubmit.setUrl("<c:url value='/stu/order_admin_a.do' />");
		comSubmit.submit();
	}
</script>

=======
		
		var comSubmit = new ComSubmit();
		var state = 0;
		comSubmit.setUrl("<c:url value='/stu/order_admin_a.do' />");
		comSubmit.addParam("order_state", state);
		comSubmit.submit();
	}
</script>
 -->
 
 <script>
 $(document).ready(function(){
		alert('동작함');
	});

	
 $(document).ready(function(){

	 /* var result = "${order_a}";
	 alert(result); */
	 
		$("#od_detail").on("click", function(e){
			alert("상세보기");

			/* e.preventDefault();
			fn_openBoardList(); */
		});		
	});
	
 function order_chk(state, no){
	 var state = state;
	 var no = no;
	 if(confirm("확인하시겠습니까?")){
	 $.ajax({
         url: "/stu/order_admin_a.do",
         data : {"order_state": state, "order_no": no},
         type: "post",
         async:false,
         success : function(data){
        	 alert("주문상태가 변경되었습니다.");
             window.opener.location.reload();
             self.close();
         }
      })}else{
         return;
      }
	}

 </script>
 
>>>>>>> origin/syk_06-05_1
</head>
<body>
<div class="container">
=======
<link href="dashboard.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="justified-nav.css" rel="stylesheet">

</head>
<body>
<div class="container">

>>>>>>> origin/05.29-K
	<div class="masthead">
		<h3 class="text-muted">Project name</h3>
		<nav>
			<ul class="nav nav-justified">
<<<<<<< HEAD
<<<<<<< HEAD
				<li id="o1"><a href="/stu/order_admin_a.do">신규주문</a></li>
				<li id="o2"><a href="#">입금확인</a></li>
				<li id="o3"><a href="#">배송준비</a></li>
				<li id="o4"><a href="#">수취확인</a></li>
				<li id="o5"><a href="#">거래완료</a></li>
			</ul>
=======
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
			
>>>>>>> origin/syk_06-05_1
=======
				<li class="active"><a href="#">신규주문</a></li>
				<li><a href="#">입금확인</a></li>
				<li><a href="#">배송준비</a></li>
				<li><a href="#">수취확인</a></li>
				<li><a href="#">거래완료</a></li>
			</ul>
>>>>>>> origin/05.29-K
		</nav>
	</div>

	<div class="table-responsive">
		<table class="table table-striped">
			<colgroup>
			<col width="10%" />
<<<<<<< HEAD
			<col width="14%" />
			<col width="*" />
			<col width="10%" />
=======
			<col width="10%" />
			<col width="*" />
			<col width="5%" />
>>>>>>> origin/05.29-K
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
<<<<<<< HEAD
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
<<<<<<< HEAD
							<td><a href="#this" id="od_detail" >상세보기</a>
							<br /><a href="#this" id="od_next" >주문확인</a></td>
=======
							<td><a href="#" id="od_detail" >상세보기</a>
							<br /><input type="button" onclick="order_chk(${order.ORDER_STATE }, ${order.ORDER_NO })" value="확인버튼"></td>
>>>>>>> origin/syk_06-05_1
=======
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
>>>>>>> origin/05.29-K
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
<<<<<<< HEAD
		</form>
=======
>>>>>>> origin/05.29-K
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
