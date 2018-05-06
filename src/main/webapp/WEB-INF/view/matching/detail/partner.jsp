<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value="/static/css/matching.css?ver=2"/>" />
<script type="text/javascript" src="<c:url value="/static/js/jquery-3.3.1.min.js"/>"></script>
<script type="text/javascript">
	$().ready(function(){
		
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
	              <h2>파트너 정보</h2>
	            </div>
	          </div>
	        </div>
	      </div>
	    </section>
	    <section id="content">
	    	<div class="container">
	    		<div class="row">
	    			<div class="span12">
						<div class="text-center">
							<h2>이번주 새로운 친구는~</h2>
							<div class="row">
								<span class="span1 offset3">이름</span>
								<span class="span2">닉네임(아이디)</span>
								<span class="span3">자기 소개</span>
							</div>
							<div class="row">
								<span class="span1 offset3">${partner.name }</span>
								<span class="span2">${partner.nickname}(${partner.userId })</span>
								<span class="span3">${partner.aboutMe }</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	<jsp:include page="/WEB-INF/view/template/footer.jsp"></jsp:include>
</body>
</html>