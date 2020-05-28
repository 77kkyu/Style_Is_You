<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/dbcon.jsp" %>
<%
	String u_id = (String)session.getAttribute("SessionUserid");


	String sql = "select user_no,u_point from member where u_id='"+u_id+"'";
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
	String user_no = rs.getString("user_no");
	
	sql = "select g.g_name, g.g_imgn1, g.g_imgp1, g.g_price, to_char(g.g_price,'999,999,999')||'원' price2, b.basket_no, g.goods_no, b.b_quantity "
			+ "from  goods g, basket_state b "
			+ "where  g.goods_no=b.b_goods_no and b.b_user_no='"+user_no+"'";	
		ResultSet rs2 = stmt.executeQuery(sql);
		
	%>
	<script>
	function fn_plus(num){ //0부터시작
		var array = document.getElementsByName("o_quantity");
		var n = array[num].value;
		n++;
		array[num].value = n;
		fn_allHap();
	}
	function fn_minus(num){
		var array = document.getElementsByName("o_quantity");
		var n = array[num].value;
		n--;
		if(n>0){
			array[num].value = n;
		}
		fn_allHap();
	}
	function fn_allHap(){
		
		var array1 = document.getElementsByName("o_quantity"); //수량
		var array2 = document.getElementsByName("g_price"); //가격
		
		var len = array1.length;
		var hap = 0;
		for (var i=0; i<len; i++){
			amt = array1[i].value;
			pri = array2[i].value;
			hap += amt*pri;
		}
		hap = hap.toLocaleString();
		document.getElementById("hap").value = hap;
	}
	function fn_allchk(){
		var chk = document.getElementById("allchk").checked; //값: true,false
		var arraychk = document.getElementsByName("chk"); //가격
		var len = arraychk.length;
			for(var i=0; i<len; i++){
				arraychk[i].checked = chk; //chk가 true면 arraychk도 true
			}
	}
	function fn_delete(){
		var arraycode = document.getElementsByName("chk");
		var len = arraycode.length;
		var goods_no="";
		for(var i=0; i<len; i++){
			if(arraycode[i].checked==true){
				goods_no+= document.getElementsByName("goods_no")[i].value+",";
			}
		}
		if(goods_no==""){
			alert("선택된 내용이 없습니다.");
			return false;
		}
		var f = document.detailHiddenForm;
		f.goods_no2.value = goods_no;
		f.submit();
	}
	function fn_get(){
		if(confirm("구매하시겠습니까?")){
			var arraycode = document.getElementsByName("chk");
			var len = arraycode.length;
			var gn="";
			var oq="";
			for(var i=0; i<len; i++){
				if(arraycode[i].checked==true) {
					gn+= document.getElementsByName("goods_no")[i].value+",";
					oq+= document.getElementsByName("o_quantity")[i].value+",";
				}
			}
			if(gn==""){
				alert("선택된 내용이 없습니다.");
				return false;
			}
			var f = document.orderHiddenForm;
			f.goods_no1.value = gn;
			f.o_quantity1.value = oq;
			f.submit();
		}	
	}
	</script>

	<!doctype html>
	<html class="no-js" lang="en">
	  <head>
	    <meta charset="utf-8" />
	    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	    <title>basketList</title>
	    <link rel="stylesheet" href="../css/foundation.min.css">
	  </head>
	  
	  <body onload="fn_allHap()">
	    <!-- Start Top Bar -->
		<%@ include file="../include/top.jsp" %>
	    <!-- End Top Bar -->

		<div class="column row" style="text-align:center; padding:50px;">
			<h2>장바구니</h2>
			<table style="text-align:center; width:1000px; margin:30px;">
	      			<colgroup>
	      				<col width="5%" />
	      				<col width="20%" />
	      				<col width="20%" />
	      				<col width="20%" />
	      				<col width="15%" />
	      				<col width="20%" />
	      			</colgroup>
	      			<tr>
	      				<th>
	      					<input type="checkbox" name="allchk" id="allchk" onclick="fn_allchk()">
	      				</th>
	      				<th>번호</th>
	      				<th>상품명</th>
	      				<th>가격</th>
	      				<th>수량</th>
	      				<th>제품사진</th>
	      			</tr>
	      			<tr>
	      				<%
	      					int num=1;
	      					int hap = 0;
	      					while(rs2.next()){
	      						String goods_no = rs2.getString("goods_no");
	      						String basket_no = rs2.getString("basket_no");
	      						String g_name = rs2.getString("g_name");
	      						String b_quantity = rs2.getString("b_quantity");
	      						int g_price = rs2.getInt("g_price");
	      						String price2 = rs2.getString("price2");
	      						String g_imgp1 = rs2.getString("g_imgp1");
	      						String g_imgn1 = rs2.getString("g_imgn1");
	      						String g_img = ".."+g_imgp1+"/"+g_imgn1;
	      				%>
	      					<td><input type="checkbox" name="chk" id="chk"></td>
	      					<td><%=num %></td>
	      					<td><%=g_name %></td>
	      					<td><%=price2 %>
	      						<input type="hidden" name="g_price" value="<%=g_price %>">
	      						<input type="hidden" name="goods_no" value="<%=goods_no %>">
	      					</td>
	      					<td>
	      						<input type="text" name="o_quantity" value="<%=b_quantity %>" size="3" maxlength="3"><br>
	      						(<a href="javascript:fn_plus(<%=num-1%>)">+</a>) / (<a href="javascript:fn_minus(<%=num-1%>)">-</a>)
	      					</td>
	      					<td><img src="<%=g_img%>" width="100" height="100"></td> <!-- src=<img> -->
	      				<%
	      					hap+=g_price;
	      					num++;
	      				%>
	      					</tr><tr>
	      				<%
	      					}
	      				%>
	      			</tr>

	      	<tr>
	      		<td colspan="6" style="text-align:right; border-top:1px solid #ccc;">
	      		총합계 : <input style="display: inline-block; width:200px;" type="text" name="hap" id="hap" value="<%=hap%>">원<br>
	      			<button type="button" style="border:1px solid #ccc; padding:10px;" onclick="fn_delete(); return false;">삭제</button>
	      			<button type="button" style="border:1px solid #ccc; padding:10px;" onclick="fn_get()">구매하기</button>
	      		</td>	
	      	</tr>
	      </table>
	    </div>
	     
	     <form name="orderHiddenForm" method="post" action="orderWrite.jsp">
	    	<input type="hidden" name="goods_no1" value="">	
	    	<input type="hidden" name="o_quantity1" value="">	
	    </form>
	     
	    <form name="detailHiddenForm" method="post" action="basketDelete.jsp">
	    	<input type="hidden" name="goods_no2" value="">	
	    </form>
	    
	    


	  <!-- ------------------------------------ 하단 메뉴 ----------------------------- -->
		<%@ include file="../include/footer.jsp" %>

