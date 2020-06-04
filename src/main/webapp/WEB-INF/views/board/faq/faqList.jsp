<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../include/include-header.jspf" %>
</head>
<body>
	<h2 align="center">FAQ</h2>
	<table class="board_list">
		<thead id = "test" >	

		</thead>
<!-- 		<tbody> -->
			
<!-- 		</tbody> -->
	</table>
	
	<div id="PAGE_NAVI"></div>
	<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX"/>
	
	<br/>
	<a href="#this" class="btn" id="write">글쓰기</a>
	
	<%@ include file="../include/include-body.jspf" %>
	<script type="text/javascript">
		$(document).ready(function(){
			fn_selectFaqList(1);
			
			$("#write").on("click", function(e){ //글쓰기 버튼
				e.preventDefault();
				fn_openFaqWrite();
			});	
			
// 			$("a[name='notice_title']").on("click", function(e){ //제목 
// 				e.preventDefault();
// 				fn_openFaqDetail($(this).parent()[0].getElementsByTagName('input')[0].value);
// 			});
		});
		
		
		function fn_openFaqWrite(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/openFaqWrite.do' />");
			comSubmit.submit();
		}
		
// 		function fn_openFaqDetail(notice_no){
// 			var comSubmit = new ComSubmit();
			
// 			comSubmit.setUrl("<c:url value='/board/openFaqDetail.do' />");
// 			comSubmit.addParam("NOTICE_NO", notice_no);
// 			comSubmit.submit();
// 		}
		
		function fn_selectFaqList(pageNo){
			var comAjax = new ComAjax();
			comAjax.setUrl("<c:url value='/board/selectFaqList.do' />");
			comAjax.setCallback("fn_selectFaqListCallback");
			comAjax.addParam("PAGE_INDEX",$("#PAGE_INDEX").val());
			comAjax.addParam("PAGE_ROW", 15);
			comAjax.addParam("NOTICE_NO",$("#NOTICE_NO").val());
			comAjax.ajax();
		}

		function hideShow(id){
			console.log("test", id);
		}
		
		function fn_selectFaqListCallback(data){
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
					eventName : "fn_selectFaqList"
				};
				gfn_renderPaging(params);
				
				var str = "";
				
				$.each(data.list, function(key, value){
				
					str += '<tr>' + 
								'<th>' + value.NOTICE_NO + '</th>' + 
								'<th class="notice_title">' +
									'<a href="hideShow(this.id)" name="notice_title">' + value.NOTICE_TITLE + '</a>' +
									'<input type="hidden" name="notice_title" value=' + value.NOTICE_NO + '>' + 
								'</th>' + 
								'<tr style="display: none;" id="'+value.NOTICE_NO+'">' +
								'<td></td><td>' + value.NOTICE_CONTENT + '</td>' +
								'</tr>' +
							'</tr>';
				});
				$("#test").append(str);
				//body.append(str);
				
			/* 	$("a[name='notice_title']").on("click", function(e){ //제목 
					e.preventDefault();
					fn_openFaqDetail($(this));
				}); */
			}
		}
	</script>	
</body>
</html>