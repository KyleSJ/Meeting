<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>



<script type="text/javascript">

</script>
</head>
<body>

	<div id="wrapper">
	<jsp:include page="/WEB-INF/view/template/header.jsp" />
	<section id="featured">
		<!-- start slider -->
		<!-- Slider -->
		<div id="nivo-slider">
			<div class="nivo-slider">
				<img src="/static/img/slides/nivo/main-slide-3-1.jpg" alt="" title="#caption-2" />
				<!-- Slide #3 image -->
				<img src="/static/img/slides/nivo/main-slide-3-2.jpg" alt="" title="#caption-3" />
			</div>
			<div class="container">
				<div class="row">
					<div class="span12">
						<!-- Slide #1 caption -->
						<div class="nivo-caption" id="caption-1">
							<div>
								<h2>이누나가 <strong>밥사줄게</strong></h2>
								<p>
									Lorem ipsum dolor sit amet nsectetuer nec Vivamus. Curabitu laoreet amet eget. Viurab oremd ellentesque ameteget. Lorem ipsum dolor sit amet nsectetuer nec vivamus.
								</p>
								<a href="#" class="btn btn-theme">Read More</a>
							</div>
						</div>
						<!-- Slide #2 caption -->
						<div class="nivo-caption" id="caption-2">
							<div>
								<h2>누나 <strong>사랑해요</strong></h2>
								<p>
									뽀뽀~~~~~~~
								</p>
							</div>
						</div>
						<!-- Slide #3 caption -->
						<div class="nivo-caption" id="caption-3">
							<div>
								<h2>밥 잘 사주는 <strong>예쁜누나</strong></h2>
								<p>
									누나 이뻐여~~~~~~ 밥사줘여~~~~~
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- end slider -->
	</section>
		<div style="text-align:center;">
			메인화면
		</div>
	</div>
	<jsp:include page="/WEB-INF/view/template/footer.jsp" />
</body>
</html>
