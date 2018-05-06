<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/common.css?ver=2"/>">
</head>
<body>
	<div id="wrapper">
	<jsp:include page="/WEB-INF/view/template/header.jsp" />
	<section id="inner-headline">
      <div class="container">
        <div class="row">
          <div class="span4">
            <div class="inner-heading">
              <h2>여성 팀 찾기</h2>
            </div>
          </div>
        </div>
      </div>
    </section>
	
	<section id="content">
		<div class="container">
			<div class="row">
				<div class="span3">
		            <aside class="left-sidebar">
		              <div class="widget">
		                <form class="form-search">
		                  <input placeholder="Type something" type="text" class="input-medium search-query">
		                  <button type="submit" class="btn btn-square btn-theme">Search</button>
		                </form>
		              </div>
		              <div class="widget">
		                <h5 class="widgetheading"></h5>
		                <ul class="cat">
		                  <li><i class="icon-angle-right"></i><a href="<c:url value="/search/male"/>">남성 회원</a><span> ${maleCount }</span></li>
		                  <li><i class="icon-angle-right"></i><a href="<c:url value="/search/female"/>">여성 회원</a><span> ${femaleCount }</span></li>
		                  <li><i class="icon-angle-right"></i><a href="<c:url value="/search/maleTeam"/>">남성 팀</a><span> ${maleTeamCount }</span></li>
		                  <li><i class="icon-angle-right"></i><a href="<c:url value="/search/femaleTeam"/>">여성 팀</a><span> ${femaleTeamCount }</span></li>
		                </ul>
		              </div>
		              <div class="widget">
		                <h5 class="widgetheading">최근 등록 회원</h5>
		                <ul class="recent">
		                  
		                </ul>
		              </div>
		              <div class="widget">
		                <h5 class="widgetheading">인기 회원</h5>
		                <ul class="tags">
		                
		                </ul>
		              </div>
		            </aside>
		          </div>
		          <div class="span9">
		          			<c:forEach items="${member}" var="member">
		          	<div class="span4">
		          		<div class="wrapper">
			          			<div class="testimonial">
			          				<div class="author">
			          					<img src="/static/img/dummies/testimonial-author1.png" class="img-circle bordered" alt="">
			          					<p class="name"> ${member.nickname } </p>
			          					<span class="info">${member.name } <a href="#">${member.birthday }</a></span>
			          				</div>
			          				<br>
			          				<p class="text bottom-margin-5">
	                     				<i class="icon-quote-left icon-48">${member.aboutMe }</i>
	                     			</p>
			          			</div>
		          			<!-- <div class="testimonial">
		          				<div class="author">
		          					<img src="/static/img/dummies/testimonial-author1.png" class="img-circle bordered" alt="">
		          					<p class="name"> 강성재 </p>
		          					<span class="info">MBC Entertainment, <a href="#">www.sitename.com</a></span>
		          				</div>
		          				<p class="text">
                     				<i class="icon-quote-left icon-48">밥 잘 사주는 이쁜누나 찾아요~</i>
                     			</p>
		          			</div> -->
		          		</div>
		          	</div>
		          			</c:forEach>
		          </div>
				</div>
			</div>
		</section>
	<jsp:include page="/WEB-INF/view/template/footer.jsp" />
	</div>

</body>
</html>