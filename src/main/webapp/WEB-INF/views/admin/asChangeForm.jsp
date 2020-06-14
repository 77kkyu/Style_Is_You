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
<title>AS교환처리폼</title>

<!-- 부트스트랩 -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/dashboard.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/justified-nav.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.5.1.js"></script>

<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>

 <script>
 $(document).ready(function(){
		/* alert('동작함'); */
	});

 function achfb_change(no){
/* 
	var goods_att_a = ""; // achfbChk
	var goods_att_b = 0; // achfbChk
	//$('input:checkbox[name="no_chk"]').is(":checked").each(function() {	
 /*    $('input:checkbox[name=no_chk]:checked').each(function() { // 체크된 체크박스의 value 값을 가지고 온다.
    	goods_att_no.push(no_chk.val());
    });     */
  
/*     $("input:checkbox:checked").each(function (index) {  
    	goods_att_no = $(this).val();  
    });   

    $('input[name=no_chk]:checkbox').each(function(index){
    	goods_att_a = $(this).attr('checked');
    	goods_att_b = $(this).attr('checked');
		var flag = $(this).attr('checked');
    });  
 */
	var goods_att_no = no;
	alert("goods_att_no : "+goods_att_no);
    
    if(goods_att_no != null){
	    alert("신청이 되었습니다.");
    	var comSubmit = new ComSubmit("change_data");
		comSubmit.setUrl("<c:url value='/asChange_ok.do' />");
		comSubmit.addParam("new_goods_att_no", goods_att_no);
		comSubmit.submit();
    }
    else{
    	alert("교환할 상품을 선택해 주세요.");
    	return false;
    }

} 


</script>
 
</head>
<body>
<div class="container">
<table class="table table-bordered">
    <div class="row" align="center">
        <div>
          <h2>교환 요청 처리</h2>
        </div>
	</div>
	
    <tbody>
    <form id="change_data" name="" method="post" >
        <c:forEach items="${as_change_form_a }" var="achfa">
         <input type="hidden" name="as_no" value="${achfa.AS_NO }"/>
        <input type="hidden" name="order_no" value="${achfa.ORDER_NO }"/>
        <input type="hidden" name="old_goods_att_no" value="${achfa.GOODS_ATT_NO }"/>
        <input type="hidden" name="goods_no" value="${achfa.GOODS_NO }"/>
        <input type="hidden" name="order_detail_price" value="${achfa.ORDER_DETAIL_PRICE }"/>       
        <input type="hidden" name="order_detail_color" value="${achfa.ORDER_DETAIL_COLOR }"/>
        <input type="hidden" name="order_detail_size" value="${achfa.ORDER_DETAIL_SIZE }"/>
        <input type="hidden" name="order_detail_amount" value="${achfa.ORDER_DETAIL_AMOUNT }"/>
        <input type="hidden" name="order_discount_apply" value="${achfa.ORDER_DISCOUNT_APPLY }"/>
        <input type="hidden" name="order_detail_save_point" value="${achfa.ORDER_DETAIL_SAVE_POINT }"/>
        	<colgroup>
			<col width="20%" />
			<col width="30%" />
			<col width="20%" />
			<col width="30%" />
			</colgroup>
            <tr>
                <th scope="col">교환요청번호 : </th>
                <td scope="col">${achfa.AS_NO }</td>
                <th scope="col">상품번호 : </th>
                <td scope="col">${achfa.GOODS_NO }</td>
            </tr>
            <tr>
                <th>제품명 : </th>
                <td>${achfa.GOODS_NAME }</td>
                <th>제품수량 : </th>
                <td>${achfa.ORDER_DETAIL_AMOUNT }</td>
            </tr>
            <tr>
                <th>상품색상 : </th>
                <td>${achfa.ORDER_DETAIL_COLOR }</td>
                <th>상품사이즈 : </th>
                <td>${achfa.ORDER_DETAIL_SIZE }</td>
            </tr>
            <tr>
                <th>요청제목 : </th>
                <td colspan="3">${achfa.AS_TITLE }</td>
            </tr>
            <tr>
                <th>요청내용: </th>
                <td colspan="3">${achfa.AS_CONTENT }</td>
            </tr>
         </c:forEach> 
         </form>  
    </tbody>
</table>    
    <br />
<table class="table table-bordered">
    <tbody>
        	<colgroup>
        	<col width="10%" />
			<col width="20%" />
			<col width="*" />
			<col width="25%" />
			<col width="15%" />
			</colgroup>
            <tr>
            	<th scope="col" style="text-align:center">선택</th>
                <th scope="col">상품사이즈</th>
                <th scope="col">상품색상</th>
                <th scope="col">상품수량</th>
            </tr>
			<c:forEach items="${as_change_form_b }" var="achfb">
            <tr>
            	<td style="text-align:center">
				<input type="submit" name="no_chk" id="no_chk" onclick="achfb_change(${achfb.GOODS_ATT_NO })">
                </td>
                <td>${achfb.GOODS_ATT_SIZE }</td><td>${achfb.GOODS_ATT_COLOR }</td><td>${achfb.GOODS_ATT_AMOUNT }</td>
            </tr>
            </c:forEach>
            <tr>
				<td colspan="4">
					<input type="button" value="목록으로" class="pull-left" onclick="javascript:location.href='/stu/as_admin.do'"/>
					<!-- <input type="submit" value="교환" onclick="achfb_change()" class="pull-right"/> --> 
               	</td>
            </tr>
    </tbody>
</table>
</div>


	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
	<script src="js/bootstrap.min.js"></script>
</body>
</html>
