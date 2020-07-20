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

<script type="text/javascript">



//상품 삭제
function fn_likeDelete(index){
	var array1 = document.getElementsByName("goods_no");
	var goods_no = array1[index].value;

	if(confirm("삭제하시겠습니까?")){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/my/goodsLikeDelete.do' />");
		comSubmit.addParam("GOODS_NO", goods_no);
		comSubmit.submit();
	}
	return false;
}
</script>

<style type="text/css">

#myLikeList {
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

		<div id="myLikeList">

      	<div class="row" align="center">
        	<div>
          	<h2>좋아요</h2>
        	</div>
		</div>
		<br><br>

      <!-- tables -->
      <form id="commonForm" name="commonForm"></form>
      	
          <div class="table-responsive">
            <table class="table table-striped">
            <colgroup>
				<col width="10%" />
				<col width="*" />
				<col width="15%" />
				<col width="15%" />
			</colgroup>
              <thead>
                <tr>
                  <th colspan="2" style="text-align:center">상품명</th>
                  <th style="text-align:center">상품금액</th>
                  <th style="text-align:center">구매</th>
                </tr>
              </thead>
              <tbody>
              	<c:choose>

					<c:when test="${fn:length(list) > 0}">

					<c:forEach items="${list }" var="row" varStatus="status">
					<input type="hidden" name="goods_no" value="${row.GOODS_NO }">
						<tr>
                  			<td>
                  				<img src='/stu/file/${row.GOODS_THUMBNAIL }' width="70px" height="70px">
                  			</td>
							<td style="text-align:left">
				  				<a href="/stu/shop/goodsDetail.do?IDX=${row.GOODS_NO }">${row.GOODS_NAME }</a>
				  			</td>
				  			<td style="text-align:center">
                  				${row.GOODS_SELL_PRICE } 원
                  			</td>
							<td style="text-align:center">
                  				<input type="button" name="goodsDetail" value="구매" onclick="location.href='/stu/shop/goodsDetail.do?IDX=${row.GOODS_NO }'"><br>
                  				<input type="button" name="likeDelete" value="삭제" onclick="fn_likeDelete(${status.index})">
                  			</td>
						</tr>
					</c:forEach>
					</c:when>	
					<c:otherwise>
					<tr>
						<td colspan="7">조회된 결과가 없습니다.</td>
					</tr>
				</c:otherwise>
				</c:choose>
					
					</tbody>
            	</table>
          		</div>
				
				
          <br>
          <br>
          </div>
    </div> <!-- /container -->


    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>