<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- css -->
<link href="https://fonts.googleapis.com/css?family=Noto+Serif:400,400italic,700|Open+Sans:300,400,600,700" rel="stylesheet">
<link href="/static/css/bootstrap.css" rel="stylesheet" />
<link href="/static/css/bootstrap-responsive.css" rel="stylesheet" />
<link href="/static/css/fancybox/jquery.fancybox.css" rel="stylesheet">
<link href="/static/css/jcarousel.css" rel="stylesheet" />
<link href="/static/css/flexslider.css" rel="stylesheet" />
<link href="/static/css/style.css" rel="stylesheet" />
<!-- Theme skin -->
<link href="/static/skins/default.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/common.css?ver=2"/>">
<script type="text/javascript" src="<c:url value="/static/js/jquery-3.3.1.min.js"/>"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
	$().ready(function() {
		$("#loginBtn").click(function() {
			console.log("click")
			$("#loginForm").attr({
				"method" : "post",
				"action" : "<c:url value="/login" />"
			}).submit();
		});
		
		// 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('801fb68ee415f57ecbb8729f5d28e707');
        // 카카오 로그인 버튼을 생성합니다.
        Kakao.Auth.createLoginButton({
          container: '#kakao-login-btn',
          success: function(authObj) {
            Kakao.API.request({
            	url: '/v1/user/me',
            	success: function(res) {
            		console.log(res);
					$("#loginForm").after(res.properties.nickname);
					$("#loginForm").after($("<img/>",{"src": res.properties.profile_image,"alt":res.properties.nickname+"님의 프로필 사진"}));
				},
				fail: function(err){
					alert(err);
				}
            })
          },
          fail: function(err) {
             alert(JSON.stringify(err));
          }
        });
        
        $("#logout").click(function(){
        	console.log("click");
        	Kakao.Auth.logout(function(){
        		alert("logout!");
        	});
        })
        
        
	});
</script>
</head>
<body>
	<div id="wrapper">
		<jsp:include page="../template/header.jsp" />
		<section id="content">
				<div class="container">
					<div class="row">
						<div class="span12">
							<form:form modelAttribute="loginForm">
								<div class="row">
									<div class="span5 offset4 registContent form-group">
										<span class = "inputValue">아이디</span><input type="text" name="userId" id="userId" class="form-control">
									</div>
								</div>
								<div class="row">
									<div class="span5 offset4 registContent form-group">
										<span class = "inputValue">비밀번호</span><input type="password" name="password" id="password" class="form-control">
									</div>
								</div>
							</form:form>
							<div class="row text-center">
								<input class="btn btn-large btn-theme margintop10" type="button" id="loginBtn" value="로그인"/>
								<input class="btn btn-large btn-theme margintop10" type="button" id="cancelBtn" value="취소"/>
								<a id="kakao-login-btn"></a>
								<input class="btn btn-large btn-theme margintop10" type="button" id="logout" value="로그아웃"/>
							</div>
						</div>
					</div>
				</div>
		</section>
	</div>
<jsp:include page="/WEB-INF/view/template/footer.jsp" />
</body>
</html>