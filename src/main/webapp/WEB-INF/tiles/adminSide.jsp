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
<title>adminSide</title>

<!-- 부트스트랩 -->
<!-- <link href="css/bootstrap.min.css" rel="stylesheet"> -->

</head>
<body>
	
	<!-- /.navbar-header -->
	<div class="navbar-default sidebar" role="navigation" style="width: 250px;">
		<div style="width: 200px;height: 150px;background-color: #2E9AFE;text-align: center;">
		<br />
		<h2>관리자페이지</h2>
		<p>Admin</p>
		</div>
		<div style="width: 200px; height: 80px; background-color: #F8F8F8;">
			<br />
			<p style="text-align: center;"><a href="#">로그아웃</a>하시겠습니까</p>
		</div>
		<div class="sidebar-nav navbar-collapse">
			<ul class="nav" id="side-menu">
				<li><a href="/stu/main.do" style="background: #e7e7e7; border-bottom: 1px solid #F8F8F8;">
						<b class="fa fa-dashboard fa-fw">쇼핑몰로 이동</b> 
				</a></li>
					
				<li><a href="/stu/order_admin_a.do"
					style="background: #e7e7e7; border-bottom: 1px solid #F8F8F8;">
						<b class="fa fa-dashboard fa-fw">주문배송관리</b> 
				</a></li>
				
				<li><a href="/stu/as_admin.do" style="background: #e7e7e7; border-bottom: 1px solid #F8F8F8;">
						<b class="fa fa-dashboard fa-fw">교환/환불/AS</b> 
				</a></li>

				<!-- <li class="active"> 포지션 -->
				
				<li><a href="#" style="background: #e7e7e7;">
						<b class="fa fa-bar-chart-o fa-fw">상품관리</b> <span class="fa arrow">▼</span>
				</a>
					<ul class="nav nav-second-level">
						<li><a href="">- 상품목록/수정</a></li>
						<li><a href="/stu/shop/openGoodsWrite.do">- 상품등록</a></li>
						<!-- <li><a href="">- 할인 적용</a></li> -->
					</ul></li>

				
				<li><a href="/stu/member_admin.do"
					style="background: #e7e7e7; border-bottom: 1px solid #F8F8F8;">
						<b class="fa fa-dashboard fa-fw">회원관리</b> 
				</a></li>

				<li><a href="/stu/adminReport.do"
					style="background: #e7e7e7; border-bottom: 1px solid #F8F8F8;">
						<b class="fa fa-dashboard fa-fw">매출확인</b> 
				</a></li>
				

				<li class="active"><a href="#" style="background: #e7e7e7;">
						<b class="fa fa-bar-chart-o fa-fw">게시판관리</b> <span class="fa arrow">▼</span>
				</a>
					<ul class="nav nav-second-level">
						<li><a href="/stu/">- 공지사항</a></li>
						<li><a href="/stu/">- FAQ</a></li>
						<li><a href="/stu/">- 구매후기</a></li>
						<li><a href="/stu/">- 상품Q&A</a></li>
					</ul></li>
					
				<!-- s 쿠폰 추가 2020.06.25 -->
				<li class="active">
					<a href="#" style="background: #e7e7e7;">
						<b class="fa fa-bar-chart-o fa-fw">쿠폰관리</b> <span class="fa arrow">▼</span>
					</a>
					<ul class="nav nav-second-level">
						<li><a href="/stu/adminCouponList.do">- 쿠폰목록/수정</a></li>
						<li><a href="/stu/adminCouponWriteForm.do">- 쿠폰등록</a></li>
					</ul>
				</li>
				<!-- e 쿠폰 추가 2020.06.25 -->
				
				<!-- s 이벤트 추가 2020.06.30 -->
				<li class="active">
					<a href="#" style="background: #e7e7e7;">
						<b class="fa fa-bar-chart-o fa-fw">이벤트관리</b> <span class="fa arrow">▼</span>
					</a>
					<ul class="nav nav-second-level">
						<li><a href="/stu/adminEventList.do">- 이벤트목록/수정</a></li>
						<li><a href="/stu/adminEventWriteForm.do">- 이벤트등록</a></li>
					</ul>
				</li>
				<!-- e 이벤트 추가 2020.06.30 -->
				
			</ul>
		</div>
		<!-- /.sidebar-collapse -->
	</div>
	<!-- /.navbar-static-side -->







	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->

	<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
	<script src="js/bootstrap.min.js"></script>
</body>
</html>
