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

<script>

$(document).ready(function() {

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

function as_cancle(as_no, as_state, order_no, order_state){
	alert("as취소확인");
	var as_no = as_no;
	var as_state = as_state;
	var order_no = order_no;
	var order_state = order_state;
	
	if(as_no == null || as_state == null || order_no == null || order_state == null
		|| order_state == '' || as_no == '' || as_state == '' || order_no == '') {
		alert("오류입니다.");
		return false;
	}
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/as_cancle.do' />");
	comSubmit.addParam("as_no", as_no);
	comSubmit.addParam("as_state", as_state);
	comSubmit.addParam("order_no", order_no);
	comSubmit.addParam("order_state", order_state);
	comSubmit.submit();
}

function as_ok(as_no, as_state, order_no, order_state, gubun){
	alert("as요청확인");
	var as_no = as_no;
	var as_state = as_state;
	var order_no = order_no;
	var order_state = order_state;
	var gubun = gubun;
		
	if(as_no == null || as_state == null || order_no == null || order_state == null  || gubun == null
		|| gubun == '' || order_state == '' || as_no == '' || as_state == '' || order_no == '') {
		alert("오류입니다.");
		return false;
	}
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/as_ok.do' />");
	comSubmit.addParam("as_no", as_no);
	comSubmit.addParam("as_state", as_state);
	comSubmit.addParam("order_no", order_no);
	comSubmit.addParam("order_state", order_state);
	comSubmit.addParam("gubun", gubun);
	comSubmit.submit();
}

</script>

<style>
.list_hidden{display:none; cursor: pointer;}
</style>
 
</head>
<body>
<div class="container">
	<%@include file="/WEB-INF/tiles/adminSide.jsp" %>
	<div class="masthead">
		<h3 class="text-muted">교환/환불/AS 요청처리</h3>
		<p>가급적 오래된 것 부터 처리.</p>
		<nav>
			<ul class="nav nav-justified">
			<c:choose>
				<c:when test="${fn:length(as_admin_list) > 0}">
					<c:forEach items="${as_admin_list }" var="state" begin="0" end="0">
					<c:choose>
						<c:when test="${state.AS_STATE eq '1' }">
						<li class="active"><a href="/stu/as_admin.do?as=1">신규요청</a></li>
						</c:when>
						<c:otherwise>
						<li><a href="/stu/as_admin.do?as=1">신규요청</a></li>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${state.AS_STATE eq '2' }">
						<li class="active"><a href="/stu/as_admin.do?as=2">처리중</a></li>
						</c:when>
						<c:otherwise>
						<li><a href="/stu/as_admin.do?as=2">처리중</a></li>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${state.AS_STATE eq '3' }">
						<li class="active"><a href="/stu/as_admin.do?as=3">처리완료</a></li>
						</c:when>
						<c:otherwise>
						<li><a href="/stu/as_admin.do?as=3">처리완료</a></li>
						</c:otherwise>
					</c:choose>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<c:forEach items="${as_state }" var="state" begin="0" end="0">
					<c:choose>
						<c:when test="${state eq '1' }">
						<li class="active"><a href="/stu/as_admin.do?as=1">신규요청</a></li>
						</c:when>
						<c:otherwise>
						<li><a href="/stu/as_admin.do?as=1">신규요청</a></li>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${state eq '2' }">
						<li class="active"><a href="/stu/as_admin.do?as=2">처리중</a></li>
						</c:when>
						<c:otherwise>
						<li><a href="/stu/as_admin.do?as=2">처리중</a></li>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${state eq '3' }">
						<li class="active"><a href="/stu/as_admin.do?as=3">처리완료</a></li>
						</c:when>
						<c:otherwise>
						<li><a href="/stu/as_admin.do?as=3">처리완료</a></li>
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
			<col width="20%" />
			<col width="15%" />
			<col width="*" />
			<col width="10%" />
			<col width="20%" />
			</colgroup>
			<thead>
				<tr>
					<th scope="col">신청날짜<br />신청번호</th>
					<th scope="col">회원아이디<br />회원등급</th>
					<th scope="col">요청사항</th>
					<th scope="col">분류</th>
					<th scope="col">확인</th>
				</tr>
			</thead>
			<form id="order_select">
			<tbody>
			<c:choose>
				<c:when test="${fn:length(as_admin_list) > 0}">
					<c:forEach items="${as_admin_list }" var="aal">
						<tr class="list_title">
							<td>${aal.AS_SDATE }<br /> / ${aal.AS_NO }</td>
							<td>${aal.MEMBER_ID }<br /> / ${aal.MEMBER_GRADE }</td>
							<td >${aal.AS_TITLE }<br /> 상세내용을 보시려면 [클릭]하세요</td>
							<c:choose>
								<c:when test="${aal.AS_GUBUN eq '1' }">
								<td>교환</td>
								</c:when>
								<c:when test="${aal.AS_GUBUN eq '2' }">
								<td>환불</td>
								</c:when>
								<c:when test="${aal.AS_GUBUN eq '3' }">
								<td>AS</td>
								</c:when>
							</c:choose>
							<c:choose>
								<c:when test="${aal.AS_STATE eq '1' }">
									<td><input type="button" onclick="as_ok(${aal.AS_NO }, ${aal.AS_STATE }, ${aal.ORDER_NO }, ${aal.ORDER_STATE }, ${aal.AS_GUBUN })" value="요청확인" />
									<br /><input type="button" onclick="as_cancle(${aal.AS_NO }, ${aal.AS_STATE }, ${aal.ORDER_NO }, ${aal.ORDER_STATE })" value="요청취소" /></td>
								</c:when>
								<c:when test="${aal.AS_STATE eq '2' }">
									<td><input type="button" onclick="as_ok(${aal.AS_NO }, ${aal.AS_STATE }, ${aal.ORDER_NO }, ${aal.ORDER_STATE }, ${aal.AS_GUBUN })" value="요청승인" />
									<br /><input type="button" onclick="as_cancle(${aal.AS_NO }, ${aal.AS_STATE }, ${aal.ORDER_NO }, ${aal.ORDER_STATE })" value="요청취소" /></td>
								</c:when>
								<%-- <c:when test="${aal.AS_STATE eq '3' }">
									<td>${aal.AS_EDATE }<br /> [처리완료]</td>
								</c:when> --%>
								<c:otherwise>
									<td>${aal.AS_EDATE }<br /> [처리완료]</td>
								</c:otherwise>
							</c:choose>
						</tr>
						
						<tr class ="message list_hidden">
							<th>요청사항</th>
					        <td colspan="4">
							회원이름 : ${aal.MEMBER_NAME } <br />
							회원등급 : ${aal.MEMBER_GRADE } <br />
							회원연락처 : ${aal.MEMBER_PHONE } / 회원이메일 : ${aal.MEMBER_EMAIL }<br />
							요청사항 : <br />
					        ${aal.AS_CONTENT } <br />
					        <p> </p></td>
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
