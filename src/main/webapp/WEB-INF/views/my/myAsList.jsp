<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>myAS상태</title>

<!-- 부트스트랩 -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/dashboard.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/justified-nav.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.5.1.js"></script>


<script src="<c:url value='/js/common_s.js'/>" charset="utf-8"></script>

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

$(document).ready(function() {
	//$(' .message').hide();
	var sw = false;
	
	/* $('.viewHidden').click(function() {
			$('#conlist').find("tr").
		if (sw == false) {
			$(' .message').fadeIn('slow');
			//$(' .message') .show ('slow');
			$('.viewHidden').val("상세닫기");
			sw = true;
		} else {
			$(' .message').fadeOut('slow');
			//$(' .message') .hide ('slow');
			$('.viewHidden').val("상세내용보기");
			sw = false;
		}
	}); */ //span에 있는 readmore클래스. toggle:클릭을 해서 이랬다,저랬다. 그렇기 때문에 function이 2개.

	$(".list_title").click(function(){
		$(".message").each(function(index, item){
			if (!$(this).hasClass("list_hidden")){
				$(this).addClass("list_hidden");
			}
        });
        
		if ($(this).next().hasClass("list_hidden")){
            //$(this).children("div").addClass("select-list");
            $(this).next().removeClass("list_hidden");
		}
	})
});
</script>

<style>
.list_hidden{display:none; }
.list_title{cursor: pointer; }
</style>
 
</head>
<body>
<div class="container">
	<%@include file="/WEB-INF/tiles/mySide.jsp" %>
	<div class="row" align="center">
        <div>
          <h2>교환/환불/AS내역</h2>
          <p>신청 후 담당자가 확인할때까지 일정시간이 소용됩니다.</p>
          <p>단. 요청하신 사항이나 재고 문제로 시간이 필요할 경우 담당자가 직접 고객님께 연락드릴 수 있습니다.</p>
          <p>주문관리 업무시간 (AM.09:30 ~ PM.15:30)이내 신청건은 가급적 당일 처리 할려고 노력합니다..</p>
          <p>신청시간 이후의 신청은 다음날 주문관리 업무시간에 처리됩니다.</p>
        </div>
	</div>

	<div class="row">	
		<div >
        <table align="center" width="100%" id="conlist">
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
			<col width="20%" />
			</colgroup>
			<thead>
				<tr>
					<th scope="col">신청날짜<br />신청번호</th>
					<th scope="col">요청사항</th>
					<th scope="col">처리현황</th>
				</tr>
			</thead>
			<form id="order_select">
			<tbody>
			<c:choose>
				<c:when test="${fn:length(my_as_list) > 0}">
					<c:forEach items="${my_as_list }" var="mal">					
						<tr class="list_title">
							<td>${mal.AS_SDATE }<br /> / ${mal.AS_NO }</td>
							<td >${mal.AS_TITLE }<br />
							상세내용을 보시려면 [클릭]하세요</td>
							<c:choose>
								<c:when test="${mal.AS_STATE eq '1' and mal.AS_GUBUN eq '1' }">
								<td>교환신청 확인중</td>
								</c:when>
								<c:when test="${mal.AS_STATE eq '1' and mal.AS_GUBUN eq '2' }">
								<td>환불신청 확인중</td>
								</c:when>
								<c:when test="${mal.AS_STATE eq '1' and mal.AS_GUBUN eq '3' }">
								<td>AS신청 확인중</td>
								</c:when>
								<c:when test="${mal.AS_STATE eq '2' and mal.AS_GUBUN eq '1' }">
								<td>교환신청 처리중</td>
								</c:when>
								<c:when test="${mal.AS_STATE eq '2' and mal.AS_GUBUN eq '2' }">
								<td>환불신청 처리중</td>
								</c:when>
								<c:when test="${mal.AS_STATE eq '2' and mal.AS_GUBUN eq '3' }">
								<td>AS신청 처리중</td>
								</c:when>
								<c:when test="${mal.AS_STATE eq '3' and mal.AS_GUBUN eq '1' }">
								<td>교환 완료</td>
								</c:when>
								<c:when test="${mal.AS_STATE eq '3' and mal.AS_GUBUN eq '2' }">
								<td>환불 완료</td>
								</c:when>
								<c:when test="${mal.AS_STATE eq '3' and mal.AS_GUBUN eq '3' }">
								<td>AS 완료</td>
								</c:when>
							</c:choose>
						</tr>
						
						<tr class ="message list_hidden">
					        <th>요청사항 상세</th>
					        <td colspan="2">${mal.AS_CONTENT }</td>
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
