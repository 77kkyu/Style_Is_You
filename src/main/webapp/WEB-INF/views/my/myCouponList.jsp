<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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

<script>


</script>
 
</head>
<body>
<div class="container">
	<div class="row" align="center">
        <div>
          <h2>쿠폰 내역</h2>
        </div>
	</div>
	<br><br>
	<div class="table-responsive">
		<table class="table table-striped">
			<colgroup>
			<col width="10%" />
			<col width="20%" />
			<col width="20%" />
			<col width="10%" />
			<col width="20%" />
			<col width="20%" />
			</colgroup>
			<thead>
				<tr>
					<th style="text-align:center" scope="col">번호</th>
					<th style="text-align:center" scope="col">쿠폰명(사용기한)</th>
					<th style="text-align:center" scope="col">쿠폰할인</th>
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
							<td style="text-align:center">
                  				<input type="text" name="point_no" id="point_no" value="${row.POINT_NO }" style="width:50px; border:none; text-align:center;">
                  			</td>
								<c:set var="saveDate" value="${row.POINT_SAVE_DATE }" />
								<c:choose>
    								<c:when test="${saveDate eq null}">
    									<td style="text-align:center">
                  							- <input type="text" name="point_val" value="${row.POINT_VAL }" style="width:100px; border:none; text-align:center;">
                  						</td>
										<td style="text-align:center">
        									<input type="text" name="date" value="${row.POINT_USE_DATE }" style="width:200px; border:none; text-align:center;">
        								</td>
        								<td style="text-align:center">
											<input type="text" name="gubun" value="사용" style="width:100px; border:none; text-align:center;">
										</td>
   					 				</c:when>
   					 				<c:when test="${saveDate ne null}">
        								<td style="text-align:center">
                  							+ <input type="text" name="point_val" value="${row.POINT_VAL }" style="width:100px; border:none; text-align:center;">
                  						</td>
										<td style="text-align:center">
        									<input type="text" name="date" value="${row.POINT_SAVE_DATE }" style="width:200px; border:none; text-align:center;">
   					 					</td>
   					 					<td style="text-align:center">
											<input type="text" name="gubun" value="적립" style="width:100px; border:none; text-align:center;">
										</td>
   					 				</c:when>
								</c:choose>
							<td style="text-align:center">
                  			<input type="text" name="point_total" value="${row.POINT_TOTAL }" style="width:100px; border:none; text-align:center;">
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


	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
	<script src="js/bootstrap.min.js"></script>
</body>
</html>
