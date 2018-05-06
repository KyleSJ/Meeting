<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- css -->
<link href="https://fonts.googleapis.com/css?family=Noto+Serif:400,400italic,700|Open+Sans:300,400,600,700" rel="stylesheet">
<link href="/static/css/bootstrap.css" rel="stylesheet" />
<link href="/static/css/bootstrap-responsive.css" rel="stylesheet" />
<link href="/static/css/fancybox/jquery.fancybox.css" rel="stylesheet">
<link href="/static/css/jcarousel.css" rel="stylesheet" />
<link href="/static/css/flexslider.css" rel="stylesheet" />
<link href="/static/css/style.css?ver=1" rel="stylesheet" />
<!-- Theme skin -->
<link href="/static/skins/default.css" rel="stylesheet" />
<!-- start header -->
<header>
	<div class="container ">
		<div class="row nomargin">
			<div class="span12">
				<div class="headnav">
					<c:choose>
						<c:when test="${not empty sessionScope.__USER__ }">
							<div class="dropdown">
								<a href="<c:url value='#'/>"><i class="icon-user"></i>${sessionScope.__USER__.nickname }님 안녕하세요</a>
								<ul class="dropdown-menu">
									<li><a href="#">마이페이지</a></li>
									<li><a href="<c:url value="/logout"/>">로그아웃</a></li>
								</ul>
							</div>
						</c:when>
						<c:otherwise>
						<ul>
							<li><a href="<c:url value='/member/regist'/>"><i class="icon-user"></i> Sign up</a></li>
							<li><a href="<c:url value='/login'/>">Sign in</a></li>
						</ul>
						</c:otherwise>
					</c:choose>				
				</div>
			</div>
		</div>
		<div class="row">
			<div class="span4">
				<div class="logo">
					<a href="<c:url value='/'/>"><img src="/static/img/logo.png" alt="" class="logo" /></a>
					<h1>대학왔으면 미팅정도는 해봐야지</h1>
				</div>
			</div>
			<div class="span8">
				<div class="navbar navbar-static-top">
					<div class="navigation">
						<nav>
							<ul class="nav topnav">
								<li class=" active">
									<a href="<c:url value="/"/>">Home </a>
								</li>
								<li class="dropdown">
									<a href="#">검색 <i class="icon-angle-down"></i></a>
									<ul class="dropdown-menu">
										<li><a href="<c:url value="/search/male"/>">남성 회원</a></li>
										<li><a href="<c:url value="/search/female"/>">여성 회원</a></li>
										<li><a href="<c:url value="/search/male"/>">남성 팀</a></li>
										<li><a href="<c:url value="/search/femaleTeam"/>">여성 팀</a></li>
									</ul>
								</li>
								<li class="dropdown">
									<a href="#">미팅 게시판<i class="icon-angle-down"></i></a>
									<ul class="dropdown-menu">
										<li><a href="#">게시판 1</a></li>
										<li><a href="#">게시판 2</a></li>
									</ul>
								</li>
								<li class="dropdown">
									<a href="#">마이페이지 <i class="icon-angle-down"></i></a>
									<ul class="dropdown-menu">
										<li><a href="<c:url value="/matching/main/${sessionScope.__USER__.memberId }"/>">매칭 정보</a></li>
									</ul>
								</li>
							</ul>
						</nav>
					</div>
					<!-- end navigation -->
				</div>
			</div>
		</div>
	</div>
</header>
<!-- end header -->
