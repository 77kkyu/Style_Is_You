<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ taglib prefix="ui" uri= "http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" type="text/css" href="<c:url value='/css/uii.css'/>" />
<%@include file ="/header.jsp" %>
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/js/commonn.js'/>" charset="utf-8"></script>

</head>
<body>
	<h2 align="center">공지사항</h2>
	<table class="board_list">
		<colgroup>
			<col width="10%"/>
			<col width="*"/>
			<col width="20%"/>
		</colgroup>
		<thead>
			<tr>
				<th scope="col">글번호</th>
				<th scope="col">제목</th>
				<th scope="col">작성일</th>
			</tr>
		</thead>
		<tbody>
			
		</tbody>
	</table>
	
	<div id="PAGE_NAVI"></div>
	<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX"/>
	
	<br/>
	<a href="#this" class="btn" id="write">글쓰기</a>


	<script type="text/javascript">
		$(document).ready(function(){
			fn_selectNoticeList(1);
			
			$("#write").on("click", function(e){ //글쓰기 버튼
				e.preventDefault();
				fn_openNoticeWrite();
			});	
			
			$("a[name='notice_title']").on("click", function(e){ //제목 
				e.preventDefault();
				fn_openNoticeDetail($(this).parent()[0].getElementsByTagName('input')[0].value);
			});
		});
		
		
		function fn_openNoticeWrite(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/openNoticeWrite.do' />");
			comSubmit.submit();
		}
		
		function fn_openNoticeDetail(notice_no){
			var comSubmit = new ComSubmit();
			
			comSubmit.setUrl("<c:url value='/board/openNoticeDetail.do' />");
			comSubmit.addParam("NOTICE_NO", notice_no);
			comSubmit.submit();
		}
		
		function fn_selectNoticeList(pageNo){
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/board/selectNoticeList.do' />");
			comAjax.setCallback("fn_selectNoticeListCallback");
			comAjax.addParam("PAGE_INDEX",$("#PAGE_INDEX").val());
			comAjax.addParam("PAGE_ROW", 15);
			comAjax.addParam("NOTICE_NO",$("#NOTICE_NO").val());
			comAjax.ajax();
		}
		
		function fn_selectNoticeListCallback(data){
			var total = data.TOTAL;
			var body = $("table>tbody");
			body.empty();
			if(total == 0){
				var str = "<tr>" + 
								"<td colspan='3'>조회된 결과가 없습니다.</td>" + 
							"</tr>";
				body.append(str);
			}
			else{
				var params = {
					divId : "PAGE_NAVI",
					pageIndex : "NOTICE_NO",
					totalCount : total,
					eventName : "fn_selectNoticeList"
				};
				gfn_renderPaging(params);
				
				var str = "";
				$.each(data.list, function(key, value){
					str += "<tr>" + 
								"<td>" + value.NOTICE_NO + "</td>" + 
								"<td class='notice_title'>" +
									"<a href='#this' name='notice_title'>" + value.NOTICE_TITLE + "</a>" +
									"<input type='hidden' name='notice_title' value=" + value.NOTICE_NO + ">" + 
								"</td>" +
								"<td>" + value.NOTICE_DATE + "</td>" + 
							"</tr>";
				});
				body.append(str);
				
				$("a[name='notice_title']").on("click", function(e){ //제목 
					e.preventDefault();
					fn_openNoticeDetail($(this));
				});
			}
		}
	</script>	
</body>
</html>