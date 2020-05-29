<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="/stu/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="/stu/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="/stu/js/bootstrap.min.js"></script>


</head>
<body>

    <div class="container">

      <div class="masthead">
        <h3 class="text-muted">Project name</h3>
        <nav>
          <ul class="nav nav-justified">
            <li class="active"><a href="#">Home</a></li>
            <li><a href="#">주문</a></li>
            <li><a href="#">입금확인</a></li>
            <li><a href="#">배송중</a></li>
            <li><a href="#">수취확인</a></li>
            <li><a href="#">거래완료</a></li>
          </ul>
        </nav>
      </div>

      <!-- tables -->
      
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>주문번호</th>
                  <th>주문상품</th>
                  <th>총 수량</th>
                  <th>총 금액</th>
                  <th>주문상태</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>1,001</td>
                  <td>반짝반짝 작으별 티셔트</td>
                  <td>2</td>
                  <td>100,000</td>
                  <td>신규주문</td>
                </tr>
                <tr>
                  <td>1,001</td>
                  <td>반짝반짝 작으별 티셔트</td>
                  <td>2</td>
                  <td>100,000</td>
                  <td>신규주문</td>
                </tr>
                <tr>
                  <td>1,001</td>
                  <td>반짝반짝 작으별 티셔트</td>
                  <td>2</td>
                  <td>100,000</td>
                  <td>신규주문</td>
                </tr>
                <tr>
                  <td>1,001</td>
                  <td>반짝반짝 작으별 티셔트</td>
                  <td>2</td>
                  <td>100,000</td>
                  <td>신규주문</td>
                </tr>
                <tr>
                  <td>1,001</td>
                  <td>반짝반짝 작으별 티셔트</td>
                  <td>2</td>
                  <td>100,000</td>
                  <td>신규주문</td>
                </tr>

              </tbody>
            </table>
          </div>

      <!-- Example row of columns -->
      <div class="row">
        <div class="col-lg-4">
          <h2>Safari bug warning!</h2>
          <p class="text-danger">As of v8.0, Safari exhibits a bug in which resizing your browser horizontally causes rendering errors in the justified nav that are cleared upon refreshing.</p>
          <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
          <p><a class="btn btn-primary" href="#" role="button">View details &raquo;</a></p>
        </div>
        <div class="col-lg-4">
          <h2>Heading</h2>
          <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui. </p>
          <p><a class="btn btn-primary" href="#" role="button">View details &raquo;</a></p>
       </div>
        <div class="col-lg-4">
          <h2>Heading</h2>
          <p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa.</p>
          <p><a class="btn btn-primary" href="#" role="button">View details &raquo;</a></p>
        </div>
      </div>

      <!-- Site footer -->
      <footer class="footer">
        <p>&copy; Company 2014</p>
      </footer>

    </div> <!-- /container -->


    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>