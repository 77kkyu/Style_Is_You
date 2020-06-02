<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
</head>
<body>
	<h2>게시판 목록</h2>
	<table class="notice_list">
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
				fn_openNoticeDetail($(this));
			});
		});
		
		
		function fn_openNoticeWrite(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/openNoticeWrite.do' />");
			comSubmit.submit();
		}
		
		function fn_openNoticeDetail(obj){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/openNoticeDetail.do' />");
			comSubmit.addParam("NOTICE_NO", obj.parent().find("#NOTICE_NO").val());
			comSubmit.submit();
		}
		
		function fn_selectNoticeList(pageNo){
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/board/selectNoticeList.do' />");
			comAjax.setCallback("fn_selectNoticeListCallback");
			comAjax.addParam("PAGE_INDEX",$("#PAGE_INDEX").val());
			comAjax.addParam("PAGE_ROW", 15);
			comAjax.addParam("NOTICE_NO", $("#NOTICE_NO").val());
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
					pageIndex : "PAGE_INDEX",
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