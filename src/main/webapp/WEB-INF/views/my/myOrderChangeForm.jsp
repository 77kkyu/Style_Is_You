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
<title>myAS요청폼</title>

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

 function chf_change(gubun){
	var gubun = gubun;
	 
	if($('#chfSubject').val() == null || $('#chfSubject').val() == "" ){
		alert("제목을 입력해주세요");
		$('#chfSubject').focus();
		return false;
	}
	if($('#chfContent').val() == null || $('#chfContent').val() == "" ){
		alert("내용를 입력해주세요");
		$('#chfContent').focus();
		return false;
	}
	if($('#chfPassword').val() == null || $('#chfPassword').val() == "" ){
		alert("패스워드를 입력해주세요");
		$('#chfPassword').focus();
		return false;
	}

	var dbPassword = "";
	$.ajax({
		url: "/stu/password_f.do",
		data : {"mem_no": $('#chfMember_no').val()},
		type: "post",
		async:false,  // ajax동기식
		success : function(data){
			alert("데이터를 가져왔습니다."+data);
			dbPassword = data;
		},
		error : function(){
			alert('연결실패 ㅠㅠ');
		}
	})	
	
	if(dbPassword == $('#chfPassword').val()){

		var select_detail_no = new Array(); // 배열 선언
	    $('input:checkbox[name=chfbChk]:checked').each(function() { // 체크된 체크박스의 value 값을 가지고 온다.
	    	select_detail_no.push(this.value);
	    });
	    
	    if(select_detail_no[0] != null){
		    alert("신청이 완료되었습니다.");
	    	var comSubmit = new ComSubmit("change_info");
			comSubmit.setUrl("<c:url value='/order_change.do' />");
			comSubmit.addParam("select_detail_no", select_detail_no);
			comSubmit.addParam("gubun", gubun);
			comSubmit.submit();
	    }
	    else{
	    	alert("교환할 상품을 선택해 주세요.");
	    	return false;
	    }
	} else {
		alert("비밀번호가 맞지 않습니다.");
		$('#chfPassword').focus();
    	return false;
	}
} 


</script>
 
 <style>

a {
  text-decoration: none;
  color: #666;
  text-decoration:none
}

h1 {
    text-align: center;
    padding: 50px 0;
    font-weight: normal;
    font-size: 2em;
    letter-spacing: 10px;
}  
</style>
</head>
<body>
<div class="container">
<table class="table table-bordered">
    <div class="row" align="center">
        <div>
          <h2>교환/환불/AS</h2>
          <p>배송준비중 교환 신청시 당일출고가 안될 수 있습니다. </p>
          <p>배송 이후 교환/AS는 추가 배송비가 있을수 있습니다.</p>
          <p>수취확인 후 교환/환불/AS는 Q&A게시판이나 매장으로 연락주시면 감사하겠습니다..</p>
        </div>
	</div>
	
    <tbody>
    <form id="change_info" name="" method="post" >
        <c:forEach items="${changeForm_a }" var="chfa">
        <input type="hidden" id="chfMember_no" name="chfMember_no" value="${chfa.MEMBER_NO }"/>
        <input type="hidden" name="chfOrder_no" value="${chfa.ORDER_NO }"/>
        <input type="hidden" name="chfOrder_state" value="${chfa.ORDER_STATE }"/>
        	<colgroup>
			<col width="20%" />
			<col width="30%" />
			<col width="20%" />
			<col width="30%" />
			</colgroup>
            <tr>
                <th scope="col">주문번호: </th>
                <td scope="col">${chfa.ORDER_NO }</td>
                <th scope="col">현재상태: </th>
                <c:choose>
					<c:when test="${chfa.ORDER_STATE eq '2' }">
					<td scope="col">배송준비중</td>
					</c:when>
					<c:when test="${chfa.ORDER_STATE eq '4' }">
					<td scope="col">수취확인중</td>
					</c:when>
				</c:choose>
            </tr>
            <tr>
                <th>제목: </th>
                <td colspan="3"><input type="text" placeholder="제목을 입력하세요. " id="chfSubject" name="chfSubject" class="form-control"/></td>
            </tr>
            <tr>
                <th>내용: </th>
                <td colspan="3"><textarea cols="10" rows="7" placeholder="내용을 입력하세요. " id="chfContent" name="chfContent" class="form-control"></textarea></td>
            </tr>
            <tr>
                <th>비밀번호: </th>
                <td colspan="3"><input type="password" id="chfPassword" name="chfPassword" style="width: 180px;" placeholder="비밀번호를 입력하세요." class="form-control"/> 로그인시 비밀번호</td>
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
                <th scope="col">상품번호</th>
                <th scope="col">상품명</th>
                <th scope="col">상품색상/사이즈</th>
                <th scope="col">상품수량</th>
            </tr>
			<c:forEach items="${changeForm_b }" var="chfb">
            <tr>
            	<td style="text-align:center">
				<input type="checkbox" name="chfbChk" id="chfbChk" value="${chfb.ORDER_DETAIL_NO }">
                </td>
                <td>${chfb.GOODS_NO }</td><td>${chfb.GOODS_NAME }</td>
                <td>${chfb.ORDER_DETAIL_COLOR } / ${chfb.ORDER_DETAIL_SIZE }</td><td>${chfb.ORDER_DETAIL_AMOUNT }</td>
            </tr>
            </c:forEach>
            <c:forEach items="${changeForm_a }" var="chfc">
            <tr>
            	<c:choose>
					<c:when test="${chfc.ORDER_STATE eq '2' }">
					<td colspan="5">
                	<input type="button" value="목록으로" class="pull-left" onclick="javascript:location.href='/stu/myOrderList.do'"/>
                    <input type="submit" value="환불" onclick="chf_change(2)" class="pull-right"/>
                    <input type="submit" value="교환" onclick="chf_change(1)" class="pull-right"/>
                	</td>
					</c:when>
					<c:when test="${chfc.ORDER_STATE eq '4' }">
					<td colspan="5">
                	<input type="button" value="목록으로" class="pull-left" onclick="javascript:location.href='/stu/myOrderList.do'"/>
                    <input type="submit" value="AS교환" onclick="chf_change(3)" class="pull-right"/>
                    <input type="submit" value="환불" onclick="chf_change(2)" class="pull-right"/>
                    <input type="submit" value="교환" onclick="chf_change(1)" class="pull-right"/>
                	</td>
					</c:when>
				</c:choose>
            </tr>
            </c:forEach>
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
