<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/dbcon.jsp" %>
<%
	String goods_no = request.getParameter("goods_no");

	String sql = "select g_name,g_simple,g_detail, "
				+"to_char(g_sdate,'yyyy-mm-dd') g_sdate,to_char(g_edate,'yyyy-mm-dd') g_edate, "
				+"to_char(g_price,'999,999,999') g_price,g_imgn1,g_imgp1,g_imgn2,g_imgp2 "
				+"from goods where goods_no='"+goods_no+"'";
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
	String g_name = rs.getString("g_name");
	String g_simple = rs.getString("g_simple");
	String g_detail = rs.getString("g_detail");
	String g_sdate = rs.getString("g_sdate");
	String g_edate = rs.getString("g_edate");
	String g_price = rs.getString("g_price");
	String g_imgn1 = rs.getString("g_imgn1");
	String g_imgp1 = rs.getString("g_imgp1");
	String g_imgn2 = rs.getString("g_imgn2");
	String g_imgp2 = rs.getString("g_imgp2");
	String g_img1 = ".." +g_imgp1+"/"+g_imgn1;
	String g_img2 = ".." +g_imgp2+"/"+g_imgn2;
%>
<!doctype html>
<html class="no-js" lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>goodsDetail</title>
    <link rel="stylesheet" href="../css/foundation.min.css">
  </head>
  
<script>
	function fn_order(){
		var a = document.getElementById("o_quantity").value;   
		alert(a+"개 바로 구매하기");
		location="../shop/orderWrite.jsp?goods_no1=<%=goods_no%>&o_quantity1="+a;
	}
	function fn_basket(){
		var a = document.getElementById("o_quantity").value;  
		location="../shop/basketWriteSave.jsp?goods_no=<%=goods_no%>&o_quantity="+a;
	}
</script>
   
  <body>

    <!-- Start Top Bar -->
	<%@ include file="../include/top.jsp" %>
    <!-- End Top Bar -->
    
    <br>
    <!-- You can now combine a row and column if you just need a 12 column row -->

    <div class="row">
      <div class="medium-6 columns">
        <img src="<%=g_img1%>" width="80%">	<!-- g_imgn1 -->
      </div>
      <div class="medium-6 large-5 columns">
        <h3><%=g_name %></h3>
        <p>기간 &nbsp&nbsp <%=g_sdate %> ~ <%=g_edate %></p>
		<p>&nbsp&nbsp <pre><%=g_simple %></pre></p>
		<p>가격 &nbsp&nbsp <%=g_price %>원</p>
        
        <label>구매수량
        <select name="o_quantity" id="o_quantity">
          <option value="1">1개</option>
          <option value="2">2개</option>
          <option value="3">3개</option>
          <option value="4">4개</option>
          <option value="5">5개</option>
        </select>
        </label>
		<br>
        <button type="button" class="button large expanded" onclick="fn_order()">바로구매</button>
        <button type="button" class="button large expanded" onclick="fn_basket()">장바구니</button>
        	
        </div>
    </div>

    <div class="column row">
      <hr>
      
      <div class="tabs-content" data-tabs-content="example-tabs">
        <div class="tabs-panel is-active" id="panel1">
          <h4>상세정보</h4>
          <div class="media-object stack-for-small">
            <div class="media-object-section">
              <img src="<%=g_img2%>" width="80%"> <!-- g_imgn2 -->
            </div>
            <div class="media-object-section">
              <h5><%=g_name %></h5>
              <p><pre><%=g_detail %></pre></p>
            </div>
          </div>
          <button type="button" class="button large expanded" onclick="fn_order()">바로구매</button>
        </div>
        
      </div>
    </div>

<!-- ------------------------------------ 하단 메뉴 ----------------------------- -->
	<%@ include file="../include/footer.jsp" %>


