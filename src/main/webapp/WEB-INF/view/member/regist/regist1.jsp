<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>

		<!-- css -->
<link href="https://fonts.googleapis.com/css?family=Noto+Serif:400,400italic,700|Open+Sans:300,400,600,700" rel="stylesheet">
<link href="/static/css/bootstrap.css" rel="stylesheet"/>
<link href="/static/css/bootstrap-responsive.css" rel="stylesheet"/>
<link href="/static/css/fancybox/jquery.fancybox.css" rel="stylesheet">
<link href="/static/css/jcarousel.css" rel="stylesheet"/>
<link href="/static/css/flexslider.css" rel="stylesheet"/>
<link href="/static/css/style.css" rel="stylesheet"/>
	<!-- Theme skin -->
<link href="/static/skins/default.css" rel="stylesheet"/>
<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/common.css?ver=2"/>">
<script type="text/javascript" src="<c:url value="/static/js/jquery-3.3.1.min.js"/>"></script>
<script type="text/javascript">
	$().ready(function () {
		var uniqueInvalid = false;

		$("#userId").keyup(function () {
			checkInvalid("userId", "아이디");
			$.post("<c:url value="/api/isExist/userId"/>", {
				userId: $("#userId").val()
			}, function (response) {
				if (response.isExist) {
					if ($("#userId").hasClass("invalidUnique")) {
						return false;
					}
					$("#userId").focus();
					afterInvalidUnique("userId", "아이디");
					$("#userId").addClass("invalidUnique");
					uniqueInvalid = true;
					return false;
				} else {
					$("#userId").removeClass("invalidUnique");
					$("#userIdInvalidUniqueSpan").remove();
					uniqueInvalid = false;
				}
			});
		});

		$("#nickname").keyup(function () {
			checkInvalid("nickname", "닉네임");
			$.post("<c:url value="/api/isExist/nickname"/>", {
				nickname: $("#nickname").val()
			}, function (response) {
				if (response.isExist) {
					if ($("#nickname").hasClass("invalidUnique")) {
						return false;
					}
					$("#nickname").focus();
					afterInvalidUnique("nickname", "닉네임");
					$("#nickname").addClass("invalidUnique");
					uniqueInvalid = true;
					return false;
				} else {
					$("#nickname").removeClass("invalidUnique");
					$("#nicknameInvalidUniqueSpan").remove();
					uniqueInvalid = false;
				}
			})
		});

		var passwordInvalid = false;

		$("#password").keyup(function () {
			checkInvalid("password", "비밀번호");
			if ($("#password").val() != $("#passwordConfirm").val()) {
				if($("#password").hasClass("invalidPassword")){
					return false;
				}
				$("#password").addClass("invalidPassword");
				$("#passwordConfirm").addClass("invalidPassword");
				afterInvalidPassword("password", "비밀번호");
				afterInvalidPassword("passwordConfirm", "비밀번호");
				passwordInvalid = true;
			} else {
				$("#password").removeClass("invalidPassword");
				$("#passwordConfirm").removeClass("invalidPassword");
				$("#passwordInvalidPassword").remove();
				$("#passwordConfirmInvalidPassword").remove();
				passwordInvalid = false;
			}
		});

		$("#passwordConfirm").keyup(function () {
			checkInvalid("passwordConfirm", "비밀번호");
			if ($("#password").val() != $("#passwordConfirm").val()) {
				if($("#passwordConfirm").hasClass("invalidPassword")){
					return false;
				}
				$("#password").addClass("invalidPassword");
				$("#passwordConfirm").addClass("invalidPassword");
				afterInvalidPassword("password", "비밀번호");
				afterInvalidPassword("passwordConfirm", "비밀번호");
				passwordInvalid = true;
			} else {
				$("#password").removeClass("invalidPassword");
				$("#passwordConfirm").removeClass("invalidPassword");
				$("#passwordInvalidPassword").remove();
				$("#passwordConfirmInvalidPassword").remove();
				passwordInvalid = false;
			}
		});

		function afterInvalidUnique(elementId, content) {
			$("#" + elementId).after("<div class='span5 invalidUniqueSpan' id='" + elementId + "InvalidUniqueSpan'>" + content + "이(가) 중복됩니다. 다른 " + content + "을(를) 입력해 주세요.</div>");
		}
		
		function afterInvalidPassword(elementId, content){
			$("#" + elementId).after("<div class='span5 invalidUniqueSpan' id='" + elementId + "InvalidPassword'>" + content + "가 일치하지 않습니다.</div>");
		}

		function checkInvalid(elementId, content) {
			if ($("#" + elementId).val() == "") {
				$("#" + elementId).focus();
				if ($("#" + elementId + "InvalidSpan").length == 0) {
					afterInvalid(elementId, content);
				}
				invalid = true;
			} else {
				$("#" + elementId + "InvalidSpan").remove();
			}
		}

		function afterInvalid(elementId, content) {
			$("#" + elementId).after("<div class='span5 invalidSpan' id='" + elementId + "InvalidSpan'>" + content + "을(를) 입력하세요.</div>");
		}

		var invalid = false;
		$("#nextBtn").click(function () {
			invalid = false;

			checkInvalid("nickname", "닉네임");
			checkInvalid("passwordConfirm", "비밀번호확인");
			checkInvalid("password", "비밀번호");
			checkInvalid("userId", "아이디");

			if (invalid == true) {
				invalid = false;
				console.log("invalid 감지");
				return false;
			}

			console.log("invalid check 모두 통과");
			console.log(invalid);
			console.log(uniqueInvalid);
			console.log(passwordInvalid);
			if (invalid != true && uniqueInvalid != true && passwordInvalid != true) {
				$.post("<c:url value="/api/isExist/userId"/>", {
					userId: $("#userId").val()
				}, function (response) {
					if (response.isExist) {
						console.log("id exist");
						$("#userId").focus();
						afterInvalidUnique("userId", "아이디");
						$("#userId").addClass("invalidUnique");
						uniqueInvalid = true;
						return false;
					} else {
						console.log("id check pass")
						$("#userId").removeClass("invalidUnique");
						$("#userIdInvalidUniqueSpan").remove();
						$.post("<c:url value="/api/isExist/nickname"/>", {
							nickname: $("#nickname").val()
						}, function (response) {
							if (response.isExist) {
								console.log("nickname exist");
								$("#nickname").focus();
								afterInvalidUnique("nickname", "닉네임");
								$("#nickname").addClass("invalidUnique");
								uniqueInvalid = true;
								return false;
							} else {
								console.log("nickname check pass");
								$("#nickname").removeClass("invalidUnique");
								$("#nicknameInvalidUniqueSpan").remove();
								$("#memberForm").attr({
									"method": "post",
									"action": "<c:url value="/member/regist/process1 "/>"
								}).submit();
							}
						});
					}
				});
			}
		});

		$("#cancelBtn").click(function () {
			console.log("cancel click");
			$(location).attr('href', "<c:url value=" /logout "/>");
		})
	})
</script>
</head>
<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/view/template/header.jsp"/>
		<section id="inner-headline">
      <div class="container">
        <div class="row">
          <div class="span4">
            <div class="inner-heading">
              <h2>회원가입 (1/3)</h2>
            </div>
          </div>
        </div>
      </div>
    </section>
		<section id="content">
			<div class="container">
				<div class="row">
					<div class="span12">
						<h2 class="text-center">기본 정보</h2>
						<form:form modelAttribute="memberForm" class="registForm">
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
							<div class="row">
								<div class="span5 offset4 registContent form-group">
									<span class = "inputValue">비밀번호 확인</span><input type="password" id="passwordConfirm" class="form-control">
								</div>
							</div>
							<div class="row">
								<div class="span5 offset4 registContent form-group">
									<span class = "inputValue">닉네임</span><input type="text" name="nickname" id="nickname" class="form-control">
								</div>
							</div>
							<div class="row text-center">
								<input class="btn btn-large btn-theme margintop10" type="button" id="nextBtn" value="다음">
								<input class="btn btn-large btn-theme margintop10" type="button" id="cancelBtn" value="취소">
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</section>
	</div>
	<jsp:include page="/WEB-INF/view/template/footer.jsp" />
</body>
</html>
