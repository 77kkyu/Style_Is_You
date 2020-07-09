<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>쿠폰관리</title>

<!-- 부트스트랩 -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/dashboard.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/justified-nav.css" rel="stylesheet">

<!-- 링크) jQuery 링크 -->
<script src='https://code.jquery.com/jquery-3.1.0.min.js'></script>
<!-- 링크) 커스텀 페이징 js -->
<script src="<c:url value='/js/common_dw.js'/>" charset="utf-8"></script>

</head>

<style>
.couponList_option {width: 100px; height: 34px; border: 1px solid gray; border-radius: 10px; font-size: 12px; text-align: center;}
.couponList_searchBtn {width: 50px; height: 34px; border-radius: 5px; font-size: 12px; text-align: center; background: #e5e5e5; border: none; color: darkblue;}
.couponList_searchBtn:hover {font-weight: bold; border: none;}
</style>

<body>

<div style="width: 1200px; margin: 50px 0 0 350px;">
	
	<!-- include) 사이드바 -->	
	<%@include file="/WEB-INF/tiles/adminSide.jsp" %> 

	<!-- s 상단 탭 영역 -->
	<div class="masthead">
		<h3 class="text-muted">쿠폰 관리</h3>
		<nav>
			<ul class="nav nav-justified">
				<li class="active" id="all"><a href="#" name="all">전체</a></li>
				<li id="ing"><a href="#" name="ing">진행중</a></li>
				<li id="pre"><a href="#" name="pre">예정</a></li>
				<li id="end"><a href="#" name="end">종료</a></li>	
			</ul>
		</nav>
	</div>
	<!-- e 상단 탭 영역 -->

	<!-- s 하단 리스트 영역 -->
	<div>
	<form>
	<input type="hidden" id="type" value="all">
		<table name="couponList" class="table table-striped">
			<colgroup>
				<col width="10%" />
				<col width="10%" />
				<col width="30%" />
				<col width="10%" />
				<col width="20%" />
				<col width="10%" />
				<col width="10%" />
			</colgroup>
			<thead>
				<tr>
					<th scope="col" style="text-align:center; padding: 20px 0px 20px 0px;">순번</th>
					<th scope="col" style="text-align:center; padding: 20px 0px 20px 0px;">쿠폰번호</th>
					<th scope="col" style="text-align:center; padding: 20px 0px 20px 0px;">쿠폰명</th>
					<th scope="col" style="text-align:center; padding: 20px 0px 20px 0px;">할인율(%)</th>
					<th scope="col" style="text-align:center; padding: 20px 0px 20px 0px;">쿠폰기간</th>
					<th scope="col" style="text-align:center; padding: 20px 0px 20px 0px;">쿠폰상태</th>
					<th scope="col" style="text-align:center; padding: 20px 0px 20px 0px;">url복사</th>
				</tr>
			</thead>
			<tbody>
			
			</tbody>
		</table>
	</form>
	</div>
	
		<div style="width: 100%; text-align: center;" id="PAGE_NAVI"></div>
		<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
	
	<div style="text-align: center; margin-top: 20px;">
	<form id="search" class="form-inline" method="post">
		<div class="form-group">
			<div style="display: contents;">
				<select id="searchOption" size="1" class="couponList_option" style="width: 100px; height: 34px;">
					<option id="COUPON_NO" value="COUPON_NO" selected="selected">쿠폰번호</option>
					<option id="COUPON_ID" value="COUPON_ID">쿠폰명</option>
				</select>
			</div>
			<div style="display: contents; width: 100px; height: 34px;">
			<input type="text" name="keyword" value="${keyword}" placeholder="검색어 입력" class="form-control" id="exampleInputName2" onkeyup="enteryKey()">
			</div>
		<input type="text" style="display: none;" />
		</div>
		<div style="display: contents;">
		<button type="button" class="couponList_searchBtn" onclick="fn_couponList(1)">검색</button>
		</div>
	</form>
	</div>
	
	<form id="commonForm" name="commonForm"></form>
	
	<!-- e 하단 리스트 영역 -->
	
</div>

</body>

<script>
//최초 조회시 스크립트 호출
$(document).ready(function(){
	fn_couponList(1); //스크립트 호출
});

//검색어 입력 후 엔터 누르면 스크립트 호출
function enteryKey() {
	if(window.event.keyCode == 13) {
		fn_couponList(1); //스크립트 호출
	}
}

//상단 탭 (전체/진행중/예정/종료) 버튼 클릭시 스크립트 호출
$(function(){
	$("a[name='all']").on("click", function(e){ //전체 선택시
		e.preventDefault();
		$('#type').attr('value', 'all'); // type value 'all' 입력
		
		$('#all').addClass('active'); // all class 'active' 입력
		$('#ing').removeClass("active"); // ing class 제거
		$('#pre').removeClass("active"); // pre class 제거
		$('#end').removeClass("active"); // end class 제거
		
		$('#exampleInputName2').val(''); //검색값 초기화
		fn_couponList(1); //스크립트 호출
	});
	$("a[name='ing']").on("click", function(e){ //진행중 선택시
		e.preventDefault();
		$('#type').attr('value', 'ing'); // type value 'ing' 입력
		
		$('#all').removeClass("active"); // all class 제거
		$('#ing').addClass('active'); // ing class 'active' 입력
		$('#pre').removeClass("active"); // pre class 제거
		$('#end').removeClass("active"); // pre class 제거
		
		$('#exampleInputName2').val(''); //검색값 초기화
		fn_couponList(1); //스크립트 호출
	});
	$("a[name='pre']").on("click", function(e){ //예정 선택시
		e.preventDefault();
		$('#type').attr('value', 'pre'); // type value 'pre' 입력
		
		$('#all').removeClass("active"); // all class 제거
		$('#ing').removeClass("active"); // ing class 제거
		$('#pre').addClass('active'); // pre class 'active' 입력
		$('#end').removeClass("active"); // end class 제거
		
		$('#exampleInputName2').val(''); //검색값 초기화
		fn_couponList(1); //스크립트 호출
	});
	$("a[name='end']").on("click", function(e){ //종료 선택시
		e.preventDefault();
		$('#type').attr('value', 'end'); // type value 'end' 입력
		
		$('#all').removeClass("active"); // all class 제거
		$('#ing').removeClass("active"); // ing class 제거
		$('#pre').removeClass("active"); // pre class 제거
		$('#end').addClass('active'); // end class 'active' 입력
		
		$('#exampleInputName2').val(''); //검색값 초기화
		fn_couponList(1); //스크립트 호출
	});
});

/*페이징 함수*/
function fn_couponList(pageNo)	{ //pageNo : 호출하고자 하는 페이지 번호
	var comAjax = new ComAjax();
		
	comAjax.setUrl("<c:url value='/adminCouponList.do' />");
	comAjax.setCallback("fn_listCallBack");
	comAjax.addParam("PAGE_INDEX", pageNo);
	comAjax.addParam("PAGE_ROW", 10);
	comAjax.addParam("type", $("#type").val());
	
	comAjax.addParam("searchOption", $("#searchOption > option:selected").val());
	comAjax.addParam("keyword", $("input[name='keyword']").val());
	
	comAjax.ajax();	
}

function fn_listCallBack(data){
	var total = data.TOTAL;
	var body = $("table[name='couponList'] > tbody");
	
	body.empty();
	if(total == 0){
		var params = {
				divId : "PAGE_NAVI",
				pageIndex : "PAGE_INDEX",
				totalCount : total,
				eventName : "fn_couponList",
				recordCount : 10
			};
			gfn_renderPaging(params);
		var str = "<tr><td colspan='6'>조회된 결과가 없습니다.</td></tr>";
		body.append(str);
	}else{
		var params = {
			divId : "PAGE_NAVI",
			pageIndex : "PAGE_INDEX",
			totalCount : total,
			eventName : "fn_couponList",
			recordCount : 10
		};
		gfn_renderPaging(params);
	var str = "";
		$.each(data.list, function(key, value){
			str += "<tr>"
					+ "<td style='letter-spacing: 1px; text-align: center; vertical-align: middle;'>" + value.RNUM + "</td>"
					+ "<td style='letter-spacing: 1px; text-align: center; vertical-align: middle;'>" + value.COUPON_NO + "</td>"
					+ "<td style='letter-spacing: 1px; text-align: left; vertical-align: middle;'>"
						+ "<a href='#this'name='title'>" + value.COUPON_ID  + "</a>"
						+ "<input type='hidden' id='COUPON_NO' value='"+value.COUPON_NO+"'>"
					+ "</td>"
					+ "<td style='letter-spacing: 1px; text-align: center; vertical-align: middle;'>" + value.COUPON_VALUE  + "</td>"
					+ "<td style='letter-spacing: 1px; text-align: center; vertical-align: middle;'>" + value.COUPON_S_VALIDITY +"&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp;&nbsp;"+ value.COUPON_E_VALIDITY + "</td>"
				    + "<td style='letter-spacing: 1px; text-align: center; vertical-align: middle;'>" + value.COUPON_STATE + "</td>"
				    + "<td style='letter-spacing: 1px; text-align: center; vertical-align: middle;'>"
				    	+ "<a href='#this' name='copy'><img src='http://localhost:8080/stu/img/copy.jpg' width='30px' height='30px' border='0' alt='right'></a>"
				    	+ "<input type='hidden' id='COUPON_NO' value='"+value.COUPON_NO+"'>"
				    + "</td>"
			    + "</tr>";
		});
		
	body.append(str);

		$(function(){
			$("a[name^='title']").on("click", function(e) {
				e.preventDefault();
				fn_detail($(this));
			});
		});
		
		$(function(){
			$("a[name^='copy']").on("click", function(e) {
				e.preventDefault();
				fn_copy($(this));
			});
		});
	}
}
</script>

<script>
//클립보드로 복사하는 기능을 생성
function fn_copy(obj) {
	var emptyInput = document.createElement("input"); // input 생성
	var no = "/stu/couponSave.do?COUPON_NO="
	no += obj.parent().find("#COUPON_NO").val();
	
	emptyInput.setAttribute("value", no); // 값 할당
	document.body.appendChild(emptyInput); // body에 추가
	emptyInput.select(); // 지정된 내용을 선택
	document.execCommand("copy"); // 텍스트를 카피 하는 변수를 생성
	document.body.removeChild(emptyInput); // body 로 부터 다시 반환 한다.
	
	alert ("복사된 URL : "+no);
}

function fn_detail(obj) {
	var comSubmit = new ComSubmit();
	var no = obj.parent().find("#COUPON_NO").val();
	comSubmit.setUrl("<c:url value='/adminCouponDetailForm.do' />");
	comSubmit.addParam("TYPE", "modify");
	comSubmit.addParam("COUPON_NO", no);
	if (no == null || no == "" || no == '0') {
		alert('error.key_empty');
		return false;
	}
	comSubmit.submit();
}
</script>

</html>