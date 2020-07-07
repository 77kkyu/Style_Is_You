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
.list_hidden{display:none; cursor: pointer;}

thead>tr>th, .list_title {
	text-align: center;
}
#PAGE_NAVI{text-align: center;}
</style>
 
</head>
<body>
<div class="container">
	<%@include file="/WEB-INF/tiles/adminSide.jsp" %>
	<form id="member_select">
	<div class="masthead">
		<h3 class="text-muted">회원 목록/관리</h3>
	</div>
	

		<table class="table table-striped" name="memList">
			<colgroup>
			<col width="8%" />
			<col width="7%" />
			<col width="10%" />
			<col width="15%" />
			<col width="10%" />
			<col width="10%" />
			<col width="10%" />
			<col width="10%" />
			<col width="10%" />
			<col width="10%" />
			</colgroup>
			<thead>
				<tr>
					<th scope="col">아이디</th>
					<th scope="col">이름</th>
					<th scope="col">생년월일</th>
					<th scope="col">이메일</th>
					<th scope="col">핸드폰</th>
					<th scope="col">가입날짜</th>
					<th scope="col">등급</th>
					<th scope="col">총결제금액</th>
					<th scope="col">마지막접속</th>
					<th scope="col">계정상태</th>
				</tr>
			</thead>
					<tbody>
					</tbody>
					</table>
					<div id="PAGE_NAVI">
						<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
					</div>
					<br> 
					
					<select id="searchOption" size="1">
						<option id="all" value="all" selected="selected">전체</option>
						<option id="MEMBER_ID" value="MEMBER_ID">회원 아이디</option>
						<option id="MEMBER_NAME" value="MEMBER_NAME">회원 이름</option>
						<option id="MEMBER_GRADE" value="MEMBER_GRADE">회원 등급</option>
					</select> 
					<input type="text" size="16" name="keyword" value="${keyword}"
						placeholder="검색어 입력" onkeyup="fn_memList(1)">
					<input type="text" style="display: none;" />
					<!-- type="text"가 하나일때는 밑의 설명처럼 서브밋처럼 액션 주소를 따라감, 그래서 꼼수로 보이지않는 텍스트를 하나 더 넣어줌 -->
					<input type="button" value="검 색" onClick="fn_memList(1)">
				</form>
		
	</div>
	<script>
	$(document).ready(function() {
		fn_memList(1);
	});

/* 	function enterkey() { //검색창에서 엔터 누르면 실행
		if (window.event.keyCode == 13) {
			fn_memList(1);
		}
	} */
	
	function fn_memList(pageNo) { //페이징 함수
		var comAjax = new ComAjax();
		comAjax.setUrl("<c:url value='/member_admin_list.do' />");
		comAjax.setCallback("fn_memListCallback"); //ajax요청 후 호출될 함수의 이름 지정
		comAjax.addParam("PAGE_INDEX", pageNo);
		comAjax.addParam("PAGE_ROW", 10);
		comAjax.addParam("searchOption", $("#searchOption > option:selected").val());
		comAjax.addParam("keyword", $("input[name='keyword']").val());
		comAjax.ajax(); //실질적인 ajax기능 수행
	}

	function fn_memListCallback(data) { //콜백함수
		var total = data.TOTAL;
		//alert(total); //총 게시글 개수
		var body = $("table[name='memList'] > tbody");
		//alert(body);
		body.empty();
		if (total == 0) {
			var str = "<tr><td colspan='5' align='center'>조회된 결과가 없습니다.</td></tr>";
			body.append(str);
		} else {
			var params = {
				divId : "PAGE_NAVI",
				pageIndex : "PAGE_INDEX",
				totalCount : total,
				eventName : "fn_memList",
				recordCount : 10
			};
			gfn_renderPaging(params);

			var str = "";
			$.each(data.member_admin_list,function(key, value) {
				
				str += "<tr class='list_title'>"
						+ "<td>"
						+ value.MEMBER_ID
						+ "</td>"
						+ "<td>"
						+ "<a href='#this' name='title'>"
						+ value.MEMBER_NAME
						+ "</a>"
						+ "<input type='hidden' name='title' value=" + value.MEMBER_ID + ">"
						+ "</td>" 
						+ "<td>"
						+ value.MEMBER_BIRTH
						+ "</td>"
						+ "<td>"
						+ value.MEMBER_EMAIL 
						+ "</td>"
						+ "<td>" 
						+ value.MEMBER_PHONE
						+ "</td>" 
						+ "<td>" 
						+ value.MEMBER_DATE
						+ "</td>" 
						+ "<td>" 
						+ value.MEMBER_GRADE
						+ "</td>" 
						+ "<td>" 
						+ value.MEMBER_TOTAL
						+ "</td>" 
						+ "<td>" 
						+ value.MEMBER_LOG
						+ "</td>" 
						+ "<td>" 
						+ value.MEMBER_DELETE
						+ "</td>" 
						+ "</tr>";
			}); 
			//이거 넣어야 데이터 들어감
			body.append(str);

			$("a[name='title']").on("click", function(e) {
				e.preventDefault();
				fn_memDetail($(this));
			});

		}
	}
	</script>
</body>
</html>
