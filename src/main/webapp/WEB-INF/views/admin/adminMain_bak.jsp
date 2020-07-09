<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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

<!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
<!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<div style="width: 200px;height: 150px;background-color: #2E9AFE;text-align: center;">
		<br />
		<h2>관리자페이지</h2>
		<p>Admin</p>
	</div>
	<div style="width: 200px; height: 250px; background-color: #F8F8F8;">
		<br />
		<p style="text-align: center;"><a href="#">로그아웃</a>하시겠습니까</p>
		<table align="right" style="width: 185px;">
			<c:forEach items="${dashList}" var="dashList">			
			<tr >
				<td>총회원수</td><td>${dashList.M_CNT }명</td>
			</tr>
			<tr>
				<td>신규주문</td><td>${dashList.O_CNT_A }건</td>
			</tr>
			<tr>
				<td>입금확인</td><td>${dashList.O_CNT_B }건</td>
			</tr>
			<tr>
				<td>배송진행</td><td>${dashList.O_CNT_C }건</td>
			</tr>
			<tr>
				<td>수취확인</td><td>${dashList.O_CNT_D }건</td>
			</tr>
			<tr>
				<td>거래완료</td><td>${dashList.O_CNT_E }건</td>
			</tr>
			<tr>
				<td>AS신청</td><td>${dashList.AS_CNT }건</td>
			</tr>
			<tr>
				<td>상품Q&A</td><td>${dashList.G_CNT }건</td>
			</tr>
			<tr>
				<td>일반Q&A</td><td>${dashList.Q_CNT }건</td>
			</tr>
			</c:forEach>
		</table>
	</div>

	<!-- /.navbar-header -->
	<div class="navbar-default sidebar" role="navigation" style="width: 200px;">
		<div class="sidebar-nav navbar-collapse">
			<ul class="nav" id="side-menu">
				<li><a href="/stu/adminMain.do"
					style="background: #e7e7e7; border-bottom: 1px solid #F8F8F8;">
						<b class="fa fa-dashboard fa-fw">관리자홈</b>
				</a></li>
				<li><a href="/stu/main.do"
					style="background: #e7e7e7; border-bottom: 1px solid #F8F8F8;">
						<b class="fa fa-dashboard fa-fw">쇼핑몰로 이동</b> 
				</a></li>

				<li class="active"><a href="#" style="background: #F8F8F8;">
						<b class="fa fa-bar-chart-o fa-fw">상품관리</b> <span class="fa arrow">▼</span>
				</a>
					<ul class="nav nav-second-level">
						<li><a href="">- 상품목록/수정</a></li>
						<li><a href="">- 상품등록</a></li>
						<li><a href="">- 할인 적용</a></li>
					</ul></li>

				<li><a href="/stu/adminOrder.do"
					style="background: #e7e7e7; border-bottom: 1px solid #F8F8F8;">
						<b class="fa fa-dashboard fa-fw">주문배송관리</b> 
				</a></li>

				<li><a href="#"
					style="background: #e7e7e7; border-bottom: 1px solid #F8F8F8;">
						<b class="fa fa-dashboard fa-fw">회원관리</b> 
				</a></li>

				<li><a href="/stu/adminReport.do"
					style="background: #e7e7e7; border-bottom: 1px solid #F8F8F8;">
						<b class="fa fa-dashboard fa-fw">매출확인</b> 
				</a></li>

				<li><a href="/stu/adminAslist.do"
					style="background: #e7e7e7; border-bottom: 1px solid #F8F8F8;">
						<b class="fa fa-dashboard fa-fw">교환/환불/AS</b> 
				</a></li>

				<li class="active"><a href="#" style="background: #e7e7e7;">
						<b class="fa fa-bar-chart-o fa-fw">게시판관리</b> <span
						class="fa arrow">▼</span>
				</a>
					<ul class="nav nav-second-level">
						<li><a href="/stu/">- 공지사항</a></li>
						<li><a href="/stu/">- FAQ</a></li>
						<li><a href="/stu/">- 구매후기</a></li>
						<li><a href="/stu/">- 상품Q&A</a></li>
					</ul></li>
				
			</ul>
		</div>
		<!-- /.sidebar-collapse -->
	</div>
	<!-- /.navbar-static-side -->







	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
	<script src="js/bootstrap.min.js"></script>
</body>
</html>
