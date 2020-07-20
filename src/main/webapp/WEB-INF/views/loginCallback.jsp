<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>

	<!-- (1) LoginWithNaverId Javscript SDK -->
	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>


	<!-- (2) LoginWithNaverId Javscript 설정 정보 및 초기화 -->
	<script>
		var naverLogin = new naver.LoginWithNaverId(
			{
				clientId: "N7cehmsKQVMvrJ4lCsgv",
				callbackUrl: "http://localhost:8080/stu/loginCallback.do",
				isPopup: true,
				callbackHandle: true
			}
		);

		naverLogin.init();

		window.addEventListener('load', function () {
			naverLogin.getLoginStatus(function (status) {
				if (status) {
					var data={};
					data["ID"] = naverLogin.user.getId();
					data["Name"] = naverLogin.user.getName();
					data["Image"] = naverLogin.user.getProfileImage();
					data["Email"] = naverLogin.user.getEmail();
					data["Birthday"] = naverLogin.user.getBirthday();
					data["Age"] = naverLogin.user.getAge();
					if( naverLogin.user.getName() == undefined || naverLogin.user.getName() == null) {
						alert("이름은 필수정보입니다. 정보제공을 동의해주세요.");
						naverLogin.reprompt();
						return;
					}
					
					$.ajax({
						type : "POST",
						url : "${pageContext.request.contextPath}/socialLoginAction.do",
						data : JSON.stringify(data),
						dataType : "json",   
						contentType:"application/json;charset=UTF-8",
					    async: false,
						success : function(data, status, xhr) {
							console.log(data);
							opener.location.href=data.URL;
						},
						error : function(jqXHR, textStatus, errorThrown) {
							alert("에러가 발생했습니다.");
						}
					});
                    self.close();
                 } else {
					console.log("callback 처리에 실패하였습니다.");
				}
			});
		});
	</script>