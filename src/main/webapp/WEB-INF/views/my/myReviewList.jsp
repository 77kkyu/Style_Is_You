<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="ui" uri= "http://tiles.apache.org/tags-tiles"%>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/myUI.css'/>" />

<!-- json날짜형식 변환 -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>


<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/js/commonn.js'/>" charset="utf-8"></script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="/stu/css/bootstrap.min.css">
<!-- Custom styles for this template -->
<link href="css/dashboard.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/justified-nav.css" rel="stylesheet">

</head>
<style>
/* 상품문의 */
.board_list th {
	padding: 14px 0;
	background: url(/css/images/ico_board_th_bar.gif) no-repeat 0 center
		#f5f5f5;
	font-size: 14px;
	color: #666;
	font-weight: 400;
	/* text-align: center; */
}

.board_list {
	width: 70%;
	margin-top: 0px;
	background: #fff;
	font-size: 15px;
	line-height: 18px;
}

.board_list2 {
	width: 60%;
	margin-top: 0px;
	background: #fff;
	font-size: 15px;
	line-height: 18px;
}

.board_list2 .tit {
	background: #fff;
	font-size: 15px;
}

.board_list2 .tit td {
	position: relative;
	padding: 20px 0;
	box-sizing: border-box;
	border-top: 1px solid #f2f2f2;
}

.td {
	position: relative;
	box-sizing: border-box;
	border-top: 1px solid #f2f2f2;
	margin-left: 100px;
}


.align_left {
	text-align: left !important;
}

.board_list2 td.align_left {
	padding: 16px 110px;
}

.board_list td {
	padding: 16px 0;
	text-align: left; 
	border-bottom: 1px solid #e0e0e0;
	font-size: 14px;
	color: #444;
	vertical-align: top;
}

p.a {
	cursor: pointer;
}


body {
 /*  font-family: Verdana, Arial; */
  font-family: 'Open Sans', sans-serif;
}

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

img {
	align:left;
}
p{
	align:center;
}

#mrl {
	position: relative;
	top : -620px;
	left: 150px;

}

.board_list1 .hide1{display:none;}
.no{display:table-row;}

</style>
<body>
<div class="container">
	<%@include file="/WEB-INF/tiles/mySide.jsp" %>
<div id="mrl" align="center">
<br/><br/><br/>
	<h2 align="center">나의 상품 후기</h2>
	<br/><br/>

	<table align="center" class="board_list">
		<colgroup>
			<col width="10%"/>
			<col width="20%"/>
			<col width="40%"/>
			<col width="15%"/>
			<col width="15%"/>
		</colgroup>
		<thead>
			<tr>
				<th colspan="2">후기상품</th>
				<th style="text-align:center">제목</th>
				<th style="text-align:center">작성자</th>
				<th style="text-align:center">작성일</th>
			</tr>
		</thead>
		<tbody class="board_list1" name="board_list1">
		
		</tbody>
	</table>
	
</div>	
	<br>
	<div class="pageNumber" id="PAGE_NAVI"></div>
	<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX"/>
	
	<br/>
	
	
	<form id="commonForm" name="commonForm"></form>
	<script type="text/javascript">

		$(document).ready(function(){
			fn_selectReviewList(1);
			$(".show1").click(function(){ //제목 
				console.log("토글실행", $(this).parent());
				$(this).next().toggle( 'slow' );
			});
		});
/* 
		$(document).ready(function(){
			fn_selectReviewList(1);
		     // memu 클래스 바로 하위에 있는 a 태그를 클릭했을때
		     $(".show").click(function(){
		         // 현재 클릭한 태그가 a 이기 때문에
		         // a 옆의 태그중 ul 태그에 hide 클래스 태그를 넣던지 빼던지 한다.
		         $(this).next("tr").toggleClass("hide");
		      });
		  });

		 */	

		
		
		function fn_selectReviewList(pageNo){
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/my/myReviewList.do' />");
			comAjax.setCallback("fn_selectReviewListCallback");
			comAjax.addParam("PAGE_INDEX", $("#PAGE_INDEX").val());
			comAjax.addParam("PAGE_ROW", 15);
			comAjax.ajax();
		}
		
		function fn_selectReviewListCallback(data){
			var total = data.TOTAL;
			var body = $(".board_list1");
			body.empty();
			if (total == 0) {
				var str = "<tr>" + "<td colspan='5' align='center'>조회된 결과가 없습니다.</td>"
						+ "</tr>";
				body.append(str);
			} else {
				var params = {
					divId : "PAGE_NAVI",
					pageIndex : "PAGE_INDEX",
					totalCount : total,
					recordCount : 9,
					eventName : "fn_selectReviewList"
				};
				gfn_renderPaging(params);

				var str = "";
				$.each(data.list, function(key, value) {
									var date = moment(value.REVIEW_DATE).format("YYYY-MM-DD");
									var img = "<img src='/stu/img/icon_201602021908415400.jpg' >"
									var REVIEW_IMG = value.REVIEW_IMG;
									var gubun = value.REVIEW_NO;
									var imgpath = "<img src='/stu/file/"+value.REVIEW_IMG+"' width='500' height='400'>";
									
									
									if(REVIEW_IMG == null){
									str += " <tr class='show1'> "
										+  "<td><img src='/stu/file/"+value.GOODS_THUMBNAIL+"' width='70px' height='70px'></td>"
										+  " <td><a href='/stu/shop/goodsDetail.do?IDX="+value.GOODS_NO +"' name='title'>" + value.GOODS_NAME + "</a></td>"
										+  " <td align='center'><a>"+value.REVIEW_TITLE+"</a></td> "
										+  " <td align='center' > "+value.MEMBER_NAME+"</td>"
										+  " <td align='center' > "+date+"</td>"
										+  " </tr> "
										+  " <tr class='hide1' > "
										+  " <td colspan='5'> "+value.REVIEW_CONTENT+" </td>"
										+  " </tr> ";
										
					 				}else{
										str += " <tr> "
											+  " <td><img src='/stu/file/"+value.GOODS_THUMBNAIL+"' width='70px' height='70px'></td>"
											+  " <td><a href='/stu/shop/goodsDetail.do?IDX="+value.GOODS_NO +"' name='title'>" + value.GOODS_NAME + "</a></td>"
											+  " <td align='center'> "+value.REVIEW_TITLE+" "+img+ "</td> "
											+  " <td align='center' > "+value.MEMBER_NAME+"</td>"
											+  " <td align='center' > "+date+"</td>"
											+  " </tr> "
											+  " <tr class='hide' > "
											+  " <td colspan='5'> "+imgpath
											+  " <br><br><br> "+value.REVIEW_CONTENT+" </td>"
											+  " </tr> ";
									

									}
									
								});
				body.append(str);
				
			}
		}
	</script>	
	</div>
</body>
</html>