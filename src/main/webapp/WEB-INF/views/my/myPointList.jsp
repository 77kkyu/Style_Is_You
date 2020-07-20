<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>장바구니 목록</title>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="/stu/css/bootstrap.min.css">
<!-- Custom styles for this template -->
<link href="css/dashboard.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/justified-nav.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.5.1.js"></script>
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="/stu/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="/stu/js/bootstrap.min.js"></script>
<!-- jQuery -->
<script src="http://code.jquery.com/jquery-3.5.1.js"></script>

<script src="/stu/js/common.js" charset="utf-8"></script>

<style type="text/css">
 
#pointList {
	width : 800px;
	position: relative;
	top : -600px;
	left: 320px;

} 

</style>
 
</head>
<body>
<div class="container">
	<%@include file="/WEB-INF/tiles/mySide.jsp" %>
	<div id="pointList">
	<div class="row" align="center">
        <div>
          <h2>포인트 적립/사용 내역</h2>
          <p>최근 10건의 내역</p>
        </div>
	</div>

	<div class="table-responsive">
		<table class="table table-striped">
			<colgroup>
			<col width="10%" />
			<col width="30%" />
			<col width="20%" />
			<col width="20%" />
			<col width="20%" />
			</colgroup>
			<thead>
				<tr>
					<th style="text-align:center" scope="col">번호</th>
					<th style="text-align:center" scope="col">적립/사용 포인트</th>
					<th style="text-align:center" scope="col">구분</th>
					<th style="text-align:center" scope="col">날짜</th>
					<th style="text-align:center" scope="col">현재 보유포인트</th>
				</tr>
			</thead>
			<tbody>
			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<c:forEach items="${list }" var="row">					
						<tr>
							<td style="text-align:center">
                  				${row.POINT_NO }
                  			</td>
								<c:set var="saveDate" value="${row.POINT_SAVE_DATE }" />
								<c:choose>
    								<c:when test="${saveDate eq null}">
    									<td style="text-align:center">
                  							- ${row.POINT_VAL }
                  						</td>
        								<td style="text-align:center">
											사용
										</td>
										<td style="text-align:center">
        									${row.POINT_USE_DATE }
        								</td>
   					 				</c:when>
   					 				<c:when test="${saveDate ne null}">
        								<td style="text-align:center">
                  							+ ${row.POINT_VAL }
                  						</td>
   					 					<td style="text-align:center">
											적립
										</td>
										<td style="text-align:center">
        									${row.POINT_SAVE_DATE }
   					 					</td>
   					 				</c:when>
								</c:choose>
							<td style="text-align:center">
                  				${row.POINT_TOTAL }
                  			</td>
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

</div>


	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
	<script src="js/bootstrap.min.js"></script>
</body>
</html>
