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
 $(document).ready(function(){
		/* alert('동작함'); */
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
 
 function order_state(state, no){
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
         	 location.href = "/stu/order_admin_a.do?os="+state;
/*              window.opener.location.reload(); */
             /* self.close(); */
         }
      })}else{
         return;
      }
	}
 function order_detail(no){
	 var no = no;
	 
	 $.ajax({
         url: "/stu/order_detail.do",
         data : {"order_no": no},
         type: "post",
         async:false,
         success : function(data){
        	 location.href = "/stu/order_detail.do"; 
         }
      })
      
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
        
        <table>
			<tbody>
				<tr>
					<td>오늘</td><td>일주일</td><td>1개월</td><td>3개월</td><td>6개월</td>
				</tr>
				<tr>	
					<td>기간조회</td>
				</tr>

			</tbody>
		</table>
        
	</div>

	<div class="table-responsive">
		<table class="table table-striped">
			<colgroup>
			<col width="20%" />
			<col width="*" />
			<col width="20%" />
			<col width="20%" />
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
								<td>주문확인</td>
								</c:when>
								<c:when test="${my_order.ORDER_STATE eq '1' }">
								<td>입금확인</td>
								</c:when>
								<c:when test="${my_order.ORDER_STATE eq '2' }">
								<td>배송중비중</td>
								</c:when>
								<c:when test="${my_order.ORDER_STATE eq '3' }">
								<td>배송중/<br /><a href="">[송장확인]</a></td>
								</c:when>
								<c:when test="${my_order.ORDER_STATE eq '4' }">
								<td><input type="button" onclick="order_state(${order.ORDER_STATE }, ${order.ORDER_NO })" value="수취확인"></td>
								</c:when>
								<c:when test="${my_order.ORDER_STATE eq '5' }">
								<td>배송완료</td>
								</c:when>
							</c:choose>
							<td><input type="button" onclick="order_detail(${order.ORDER_NO })" value="상세보기">
							<br /><input type="button" onclick="order_state(${order.ORDER_STATE }, ${order.ORDER_NO })" value="확인버튼"></td>
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
