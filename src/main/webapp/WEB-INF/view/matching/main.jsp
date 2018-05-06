<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/common.css?ver=1"/>">
<link rel="stylesheet" href="<c:url value="/static/css/matching.css?ver=2"/>" />
<script type="text/javascript" src="<c:url value="/static/js/jquery-3.3.1.min.js"/>"></script>
<script type="text/javascript">
	$().ready(function(){
		
		$(".matchingTeamName").click(function(){
			var teamName = $(this).text();
			location.href="<c:url value='/matching/detail/team/"+teamName+"'/>";
		})
		
		$(".matchingPartnerName").click(function(){
			var partnerMemberId = $(this).data("id");
			location.href="<c:url value='/matching/detail/partner/"+partnerMemberId+"'/>";
		})
		
		$(".acceptBtn").click(function(){
			console.log("click");
			console.log(this);
			var teamName = $(this).closest("div").children(".matchingTeamName").text();
			location.href="<c:url value='/matching/accept/"+teamName+"'/>";
		})		
		
		$(".rejectBtn").click(function(){
			console.log("click");
			console.log(this);
			var teamName = $(this).closest("div").children(".matchingTeamName").text();
			location.href="<c:url value='/matching/reject/"+teamName+"'/>";
		})		
		
		$(".cancelBtn").click(function(){
			console.log("click");
			console.log(this);
			var teamName = $(this).closest("div").children(".matchingTeamName").text();
			location.href="<c:url value='/matching/cancel/"+teamName+"'/>";
		})		
	})
</script>
</head>
<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/view/template/header.jsp" />
		<section id="inner-headline">
	      <div class="container">
	        <div class="row">
	          <div class="span4">
	            <div class="inner-heading">
	              <h2>매칭 정보</h2>
	            </div>
	          </div>
	        </div>
	      </div>
	    </section>
	    <section id="content">
			<div class="container">
				<div class="row">
					<div class="span4">
						<div>
							<h4>매칭 목록</h4>
							<div>
								<c:forEach items="${soloMatching }" var="soloMatching">
									<div><span class="matchingPartnerName" data-id="${soloMatching.partner.memberId }">${soloMatching.partner.name }</span></div>
								</c:forEach>
							</div>
						</div>
					</div>
					<div class="span4">
						<div>
							<h4>팀 목록</h4>
							<div>
								<c:choose>
									<c:when test="${empty matchingTeam }">
										<div>등록된 팀이 없습니다.<a href="<c:url value="/matching/registTeam"/>"> 새로운 팀 등록하기</a></div>
									</c:when>
									<c:otherwise>
										<c:forEach items="${matchingTeam }" var="matchingTeam">
											<div><span class="matchingTeamName">${matchingTeam.matchingTeamName }</span></div>
											
										</c:forEach>
									<a href="<c:url value="/matching/registTeam"/>"> 새로운 팀 등록하기</a>
								</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
					<div class="span4">
						<div id="right-top">
							<div>
								<h4>초대 받은 목록</h4>
								<div>
									<c:forEach items="${yetMatchingTeam }" var="yetMatchingTeam">
										<div>
											<span class="matchingTeamName">${yetMatchingTeam.matchingTeamName }</span>
											<span><input type="button" class="acceptBtn" value="수락"></span>
											<span><input type="button" class="rejectBtn" value="거절"></span>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="span12">
						<div class="solidline"></div>
					</div>
				</div>
				<div class="row">
					<div class="span4"></div>
					<div class="span4">
						<h4>팀원들 수락 대기중인 목록</h4>
						<div>
							<c:forEach items="${yesMatchingTeam }" var="yesMatchingTeam">
								<div>
									<span class="matchingTeamName">${yesMatchingTeam.matchingTeamName }</span>
									<span><input type="button" class="cancelBtn" value="수락 취소"></span>
								</div>
							</c:forEach>
						</div>
					</div>
					<div class="span4">
						<div>
							<h4>초대 거절 목록</h4>
							<div>
								<c:forEach items="${noMatchingTeam }" var="noMatchingTeam">
									<div>
										<span class="matchingTeamName">${noMatchingTeam.matchingTeamName }</span>
										<span><input type="button" class="cancelBtn" value="거절 취소"></span>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	<jsp:include page="/WEB-INF/view/template/footer.jsp" />
</body>
</html>