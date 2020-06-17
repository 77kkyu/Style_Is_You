<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<title>장바구니 목록</title>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="/stu/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="/stu/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="/stu/js/bootstrap.min.js"></script>
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/stu/js/common.js" charset="utf-8"></script>

<style type="text/css">

#myCouponList {
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
	
	<div id="myCouponList">
	<div class="row" align="center">
        <div>
          <h2>쿠폰 내역</h2>
        </div>
	</div>
	<br><br>
	<div class="table-responsive">
		<table class="table table-striped">
			<colgroup>
			<col width="5%" />
			<col width="25%" />
			<col width="20%" />
			<col width="20%" />
			<col width="15%" />
			<col width="15%" />
			</colgroup>
			<thead>
				<tr>
					<th style="text-align:center" scope="col">번호</th>
					<th style="text-align:center" scope="col">쿠폰명(사용기한)</th>
					<th style="text-align:center" scope="col">할인값</th>
					<th style="text-align:center" scope="col">상태</th>
					<th style="text-align:center" scope="col">발행날짜</th>
					<th style="text-align:center" scope="col">사용날짜</th>
				</tr>
			</thead>
			<tbody>
			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<c:forEach items="${list }" var="row">					
						<tr>
							<c:set var="sv" value="${row.COUPON_S_VALIDITY }" />
							<c:set var="ev" value="${row.COUPON_E_VALIDITY }" />
							<c:set var="us" value="${row.COUPON_USE_STATE }" />
							
							<td style="text-align:center">
                  				${row.COUPON_STATUS_NO }
                  			</td>
                  			<td style="text-align:center">
                  				${row.COUPON_ID }
                  				<br>
                  				${sv } ~ ${ev }
                  				</td>
                  			<td style="text-align:center">
                  				${row.COUPON_VALUE }% 할인
                  			</td>
								
								<jsp:useBean id="now" class="java.util.Date" />
								<fmt:formatDate value="${now}" pattern="yyyy/MM/dd" var="nowDate" />
								<c:choose>
    								<c:when test="${sv < nowDate && ev > nowDate}">
    									<c:choose>
    										<c:when test="${us eq '0'}">
    											<td style="text-align:center">
    												사용가능
    											</td>
    										</c:when>
    										<c:otherwise>
    											<td style="text-align:center">
    												사용됨
    											</td>
    										</c:otherwise>
    									</c:choose>
   					 				</c:when>
   					 				<c:otherwise>
   					 					<td style="text-align:center">
    										사용기한 만료됨
    									</td>
									</c:otherwise>
								</c:choose>
							<td style="text-align:center">
                  				${row.COUPON_ISSUE_DATE }
                  			</td>
                  			<c:choose>
    							<c:when test="${COUPON_USE_DATE eq null}">
    								<td style="text-align:center">
    									${row.COUPON_USE_DATE }
    								</td>
    							</c:when>
    							<c:otherwise>
    								<td style="text-align:center">
    									()
    								</td>
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

</div>


	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
	<script src="js/bootstrap.min.js"></script>
</body>
</html>
