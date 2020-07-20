<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://tiles.apache.org/tags-tiles"%>
<%
   String sessionName = (String) session.getAttribute("SESSION_NAME");

if (sessionName == null || sessionName.equals("")) {
   sessionName = "nomal";
}
%>
<link rel="stylesheet" type="text/css"
   href="<c:url value='/css/uii.css'/>" />

<!-- jQuery -->
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="<c:url value='/js/commonn.js'/>" charset="utf-8"></script>
</head>
<style>
.wrapper3 {
   max-width: 1000px;
   margin: 0 auto;
}

h1 {
    text-align: center;
  padding: 50px 0;
  font-weight: normal;
  font-size: 2em;
  letter-spacing: 10px;
}

li {
   list-style: none;
   float: left;
}

.bar {
   height: 1.5px;
   width: 100%;
   background-color: #DCDCDC;
}

.flex-menu li {
   text-align: center;
   width: 100%;
}
</style>
<body>

   <br />
   <div class="pagemid">
      <div class="wrapper3">
         <ul class="flex-menu">
            <li><a href="/stu/faq/openFaqList.do">FAQ</a></li>
            <li><a href="/stu/notice/openNoticeList.do">공지사항</a></li>
            <li><a href="/stu/qna/openQnaList.do">QNA</a></li>
         </ul>
         <br>
         <div class="bar"></div>
      </div>
   </div>

   <br />
   <br />
   <br />
   <h2>FAQ 자주묻는질문</h2>
   <br />
   <br />
   <table class="board_list">
      <colgroup>
         <col width="10%" />
         <col width="*" />
         <col width="20%" />
         <col width="5%" />
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

   <div class="pageNumber" id="PAGE_NAVI"></div>
   <input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />

   <br />
   <p id="wrapBtn" style="display: none;">
      <a href="#this" class="btn" id="write">글쓰기</a>
   </p>

   <form id="commonForm" name="commonForm"></form>
   <script type="text/javascript">
      $(document).ready(function() {
         fn_selectFaqList(1);

         $("#write").on("click", function(e) { //글쓰기 버튼
            e.preventDefault();
            fn_openFaqWrite();
         });

         $("a[name='delete']").on("click", function(e) { //삭제
            e.preventDefault();
            fn_deleteFaq($(this));
         });
   <%
      if (sessionName.trim().equals("admin")) {
   %>
      $("#wrapBtn").show();
      $(".deleteBtn").show();
   <%
      } else if (sessionName.trim().equals("nomal")) {
   %>
      
   <%
      }
   %>
      });

      function fn_deleteFaq(obj) {
         var comSubmit = new ComSubmit();
         comSubmit.setUrl("<c:url value='/faq/deleteFaq.do' />");
         comSubmit.addParam("NOTICE_NO", obj.parent().find(
               "input[name='delete']").val());
         comSubmit.submit();
      }

      function fn_openFaqWrite() {
         var comSubmit = new ComSubmit();
         comSubmit.setUrl("<c:url value='/faq/openFaqWrite.do' />");
         comSubmit.submit();
      }

      function fn_selectFaqList(pageNo) {
         var comAjax = new ComAjax();
         comAjax.setUrl("<c:url value='/faq/selectFaqList.do' />");
         comAjax.setCallback("fn_selectFaqListCallback");
         comAjax.addParam("PAGE_INDEX", $("#PAGE_INDEX").val());
         comAjax.addParam("PAGE_ROW", 10);
         comAjax.addParam("NOTICE_NO_FE", $("#NOTICE_NO_FE").val());
         comAjax.ajax();
      }

      function fn_selectFaqListCallback(data) {
         var total = data.TOTAL;
         var body = $("table>tbody");
         body.empty();
         if (total == 0) {
            var str = "<tr>" + "<td colspan='4'>조회된 결과가 없습니다.</td>"
                  + "</tr>";
            body.append(str);
         } else {
            var params = {
               divId : "PAGE_NAVI",
               pageIndex : "PAGE_INDEX",
               totalCount : total,
               recordCount : 10,
               eventName : "fn_selectFaqList"
            };
            gfn_renderPaging(params);

            var str = "";
            $.each(data.list, function(key, value) {
               str += "<tr id='off'>"
                  + "<td>"
                  + value.RNUM
                  + "</td>"
                  + "<td class='title'>"
                  + "<a href='#this' name='title' class='chk"+ value.RNUM +"'>"
                  + value.NOTICE_TITLE
                  + "</a>"
                  + "<input type='hidden' name='title' value='" + value.NOTICE_NO + "'>"
                  + "</td>"
                  + "<td>"
                  + value.NOTICE_DATE
                  + "</td>"
                  + "<td style='display:none;' class='deleteBtn'>"
                  + "<a href='#this' name='delete'"+ value.NOTICE_NO +"'>삭제</a>"
                  + "<input type='hidden' name='delete' value='" + value.NOTICE_NO + "'>"
                  + "</td>"
                  + "</tr>"
                  + "<tr>"
                  + '<td colspan="3" style="display:none;" id="chk'+ value.RNUM + '">'
                  + value.NOTICE_CONTENT + "</td>"
                  + "</tr>";
            });
            body.append(str);
            
            $("a[name='title']").on("click", function(e) { //제목 
               e.preventDefault();
               var chkShow = $(this).attr('class');
               if ($("." + chkShow).parent().parent().attr('id') == 'on') {
                  $("#" + chkShow).hide();
                  $("." + chkShow).parent().parent().attr('id', 'off');
               } else {
                  $("#" + chkShow).show();
                  $("." + chkShow).parent().parent().attr('id', 'on');
               }
            });
         }
      }
   </script>
</body>
</html>