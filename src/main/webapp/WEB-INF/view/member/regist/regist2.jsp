<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<script type="text/javascript">
	$().ready(function() {
		console.log(sessionStorage.getItem("registProcess1VO"));
		console.log(sessionStorage.getItem("__USER__"));
		console.log("${sessionScope.registProcess1VO.userId}");
		
		$("#name").keyup(function(){
			if($("#name").val() != ""){
				$("#nameInvalidSpan").remove();
			}else{
				afterInvalid("name","이름");
			}
		});
		
		$("#phoneNumber").keyup(function(){
			if($("#phoneNumber").val() != ""){
				$("#phoneNumberInvalidSpan").remove();
			}else{
				if($("#phoneNumberInvalidSpan").length = 0){
					afterInvalid("phoneNumber","전화번호");
				}
			}
		});
		
		function afterInvalidUnique(elementId, content){
			$("#"+elementId).after("<span id='"
					+ elementId + "InvalidUniqueSpan' class='invalidUniqueSpan'>"
					+ content + "이(가) 중복됩니다. 다른 "
					+ content +"을(를) 입력해 주세요.</span>");
		}
		
		function checkInvalid(elementId, content){
			if($("#"+elementId).val() == ""){
				$("#"+elementId).focus();
				if($("#"+elementId+"InvalidSpan").length == 0){
					afterInvalid(elementId, content);
    				}
    				invalid = true;
    			}else{
    				$("#"+elementId+"InvalidSpan").remove();
    			}
		}
		
		function checkInvalidCheckbox(checkboxName, elementId, content){
			if(!$("input:checkbox[name='"+checkboxName+"']").is(':checked')){
    				$("#"+elementId).focus();
    				if($("#"+elementId+"InvalidSpan").length == 0){
    					afterInvalid(elementId, content);
    				}
    				invalid = true;
    			}else{
    				$("#"+elementId+"invalidSpan").remove();
    			}
		}
		
		function checkInvalidRadio( radioName, elementId, content, afterInvalidElement){
			if( !$("input:radio[name='"+radioName+"']").is(':checked')){
    			$("#"+elementId).focus();
    			if($("#"+afterInvalidElement+"InvalidSpan").length == 0){
    				afterInvalid(afterInvalidElement, content);
    			}
    			invalid = true;
    			}else{
    				$("#"+elementId+"invalidSpan").remove();
    			}
		}
	    
	    function afterInvalid(elementId, content){
	    		$("#"+elementId).after("<span id='"
	    				+ elementId + "InvalidSpan' class='invalidSpan'>"
	    				+ content + "을(를) 입력하세요.</span>");
	    }

		var invalid = false;
	    $("#nextBtn").click(function() {
    		invalid = false;
    		checkInvalid("aboutMe", "자기소개");
    		checkInvalid("militaryService", "군복무");
    		checkInvalid("livingAlone", "자취여부");
    		checkInvalidCheckbox("styleVO.styleId", "style", "스타일");
    		checkInvalid("majorId", "전공");
    		checkInvalid("schoolId", "학교");
    		checkInvalid("phoneNumber", "전화번호");
    		checkInvalid("admissionYear", "학번");
    		if($("#birthYear").val() == "" || $("#birthMonth").val() == "" || $("#birthDay").val() == "" ){
    			$("#birthYear").focus();
    			if($("#birthDayInvalidSpan").length == 0){
    				afterInvalid("birthDay", "생년월일");
    			}
    			invalid = true;
    		}
    		checkInvalidRadio("gender", "genderM", "성별","genderFLabel");
    		checkInvalid("name", "이름");
    		
    		if(invalid == true){
    			invalid = false;
    			console.log("invalid 감지");
    			return false;
    		}
    		
    		console.log("invalid check 모두 통과");
    		$("#memberForm").attr({
				"method" : "post" ,
				"action" : "<c:url value="/member/regist/process2"/>"
			}).submit();
		});
	    
	    $("#cancelBtn").click(function() {
	        console.log("cancel click");
	        sessionStorage.removeItem("registProcess1VO");
	        $(location).attr('href', "<c:url value=" /logout "/>");
	    })
	
	    $(":radio[name=gender]").change(function() {
    			$("#genderFLabelInvalidSpan").remove();
	    		
			var gender = $(":radio[name=gender]:checked").val();
			
			if (gender == "M") {
				$("#none").remove();
				$("#styleCheckBox").remove();
				$("#style").append(
						"<div id='styleCheckBox'>"
						+ "<div>"
						+ "<input type='checkbox' id='skinny' name='styleVO.styleId' value='1' class='preferStyleCheckBox'>"
						+ "<label class='styleLabel' for='skinny'>마른</label>"
						+ "<input type='checkbox' id='plump' name='styleVO.styleId' value='2' class='preferStyleCheckBox'>"
						+ "<label class='styleLabel' for='plump'>통통한</label>"
						+ "<input type='checkbox' id='muscular' name='styleVO.styleId' value='3' class='preferStyleCheckBox'>"
						+ "<label class='styleLabel' for='muscular'>근육질</label>"
						+ "<input type='checkbox' id='lovely' name='styleVO.styleId' value='4' class='preferStyleCheckBox'>"
						+ "<label class='styleLabel' for='lovely'>귀여운</label>"
						+ "</div>"
						+ "<input type='checkbox' id='chic' name='styleVO.styleId' value='5' class='preferStyleCheckBox'>"
						+ "<label class='styleLabel' for='chic'>시크</label>"
						+ "<input type='checkbox' id='active' name='styleVO.styleId' value='6' class='preferStyleCheckBox'>"
						+ "<label class='styleLabel' for='active'>활발</label>"
						+ "<input type='checkbox' id='decent' name='styleVO.styleId' value='7' class='preferStyleCheckBox'>"
						+ "<label class='styleLabel' for='decent'>얌전</label>"
						+ "<input type='checkbox' id='small' name='styleVO.styleId' value='8' class='preferStyleCheckBox'>"
						+ "<label class='styleLabel' for='small'>아담한</label>"
						+ "<div>"
						+ "<input type='checkbox' id='tall' name='styleVO.styleId' value='9' class='preferStyleCheckBox'>"
						+ "<label class='styleLabel' for='tall'>키큰</label>"
						+ "<input type='checkbox' id='intellectual' name='styleVO.styleId' value='10' class='preferStyleCheckBox'>"
						+ "<label class='styleLabel' for='intellectual'>지적인</label>"
						+ "</div>"
						+ "</div>");
			} else if (gender == "F") {
				$("#none").remove();
				$("#militaryService").append("<option id='none' value='none'>해당사항 없음</option>");
				$("#styleCheckBox").remove();
				$("#style").append(
						"<div id='styleCheckBox'>"
						+ "<div>"
						+ "<input type='checkbox' id='sexy' name='styleVO.styleId' value='1' class='preferStyleCheckBox'>"
						+ "<label class='styleLabel' for='sexy'>섹시</label>"
						+ "<input type='checkbox' id='purity' name='styleVO.styleId' value='2' class='preferStyleCheckBox'>"
						+ "<label class='styleLabel' for='purity'>청순</label>"
						+ "<input type='checkbox' id='lovely' name='styleVO.styleId' value='3' class='preferStyleCheckBox'>"
						+ "<label class='styleLabel' for='lovely'>귀여운</label>"
						+ "<input type='checkbox' id='chic' name='styleVO.styleId' value='4' class='preferStyleCheckBox'>"
						+ "<label class='styleLabel' for='chic'>시크</label>"
						+ "</div>"
						+ "<input type='checkbox' id='active' name='styleVO.styleId' value='5' class='preferStyleCheckBox'>"
						+ "<label class='styleLabel' for='active'>활발</label>"
						+ "<input type='checkbox' id='decent' name='styleVO.styleId' value='6' class='preferStyleCheckBox'>"
						+ "<label class='styleLabel' for='decent'>얌전</label>"
						+ "<input type='checkbox' id='small' name='styleVO.styleId' value='7' class='preferStyleCheckBox'>"
						+ "<label class='styleLabel' for='small'>아담한</label>"
						+ "<input type='checkbox' id='tall' name='styleVO.styleId' value='8' class='preferStyleCheckBox'>"
						+ "<label class='styleLabel' for='tall'>키큰</label>"
						+ "<div>"
						+ "<input type='checkbox' id='intellectual' name='styleVO.styleId' value='9' class='preferStyleCheckBox'>"
						+ "<label class='styleLabel' for='intellectual'>지적인</label>"
						+ "<input type='checkbox' id='skinny' name='styleVO.styleId' value='10' class='preferStyleCheckBox'>"
						+ "<label class='styleLabel' for='skinny'>마른</label>"
						+ "<input type='checkbox' id='plump' name='styleVO.styleId' value='11' class='preferStyleCheckBox'>"
						+ "<label class='styleLabel' for='plump'>통통한</label>"
						+ "<input type='checkbox' id='muscular' name='styleVO.styleId' value='12' class='preferStyleCheckBox'>"
						+ "<label class='styleLabel' for='muscular'>근육질</label>"
						+ "</div>"
						+ "</div>");
			}
		});
	})
</script>
<style>

</style>
</head>
<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/view/template/header.jsp" />
		<section id="inner-headline">
      <div class="container">
        <div class="row">
          <div class="span4">
            <div class="inner-heading">
              <h2>회원가입 (2/3)</h2>
            </div>
          </div>
        </div>
      </div>
    </section>
		<section id="content">
			<div class="container">
				<div class="row">
					<div class="span12">
						<h2 class="text-center">개인정보</h2>
						<form:form modelAttribute="memberForm" class="registForm">
							<div class="row">
								<div class="span5 offset4 registContent form-group">
									<span class = "inputValue">이름</span><input type="text" name="name" id="name" class="form-control">
								</div>
							</div>
							<div class="row">
								<div class="span5 offset4 registContent form-group">
									<span class="inputValue">성별</span> <input type="radio" id="genderM" name="gender" value="M"><label class="genderLabel" for="genderM">남</label> <input type="radio" id="genderF" name="gender" value="F"><label class="genderLabel" id="genderFLabel" for="genderF">여</label>
								</div>
							</div>
							<div class="row">
								<div class="span5 offset4 registContent form-group">
									<span class = "inputValue">생일</span>
								<select class="selectBox" name="birthYear" id="birthYear">
										<option value=""></option>
											<c:forEach var="year" begin="${thisYear-35}" varStatus="loop" end="${thisYear-20}" step="1">
												<option value=${ loop.end - loop.count + 1}>${ loop.end - loop.count + 1}</option>
											</c:forEach>
										</select>
										<select class="selectBox" name="birthMonth" id="birthMonth">
											<option value=""></option>
											<c:forEach var="month" begin="1" end="12" step="1">
												<option value=${ month }>${ month }</option>
											</c:forEach>
										</select>
										<select class="selectBox" name="birthDay" id="birthDay">
											<option value=""></option>
											<c:forEach var="day" begin="1" end="31" step="1">
												<option value=${ day }>${ day }</option>
											</c:forEach>
										</select>
								</div>
							</div>
							<div class="row">
								<div class="span5 offset4 registContent form-group">
									<span class = "inputValue">학번</span>
									<select class="selectBox" name="admissionYear" id="admissionYear">
										<option value=""></option>
										<c:forEach var="year" begin="${thisYearStr-10}" varStatus="loop" end="${thisYearStr}" step="1">
											<c:choose>
												<c:when test="${year<10 }">
													<option value=${year }>0${year }</option>
												</c:when>
												<c:otherwise>
													<option value=${ year}>${year}</option>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="row">
								<div class="span5 offset4 registContent form-group">
									<span class = "inputValue">전화번호</span>
									<input type="text" name="phoneNumber" id="phoneNumber" class="form-control">
								</div>
							</div>
							<div class="row">
								<div class="span5 offset4 registContent form-group">
									<span class = "inputValue">학교</span>
									<select name="schoolId" id="schoolId">
										<option value=""></option>
										<c:forEach items="${schoolList }" var="school">
											<option value="${school.schoolId }">${school.schoolName }</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="row">
								<div class="span5 offset4 registContent form-group">
									<span class = "inputValue">전공</span>
									<select name="majorId" id="majorId">
										<option value=""></option>
										<c:forEach items="${majorList }" var="major">
											<c:if test="${major.visible eq 'yes' }">
												<option value="${major.majorId }">${major.major }</option>
											</c:if>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="row">
								<div class="span2 offset3 registContent text-right">본인의 스타일</div>
								<div class="span4 form-group" id="style">
									<div id="styleCheckBox" class="invalidSpan">성별을 체크해 주세요.</div>
								</div>
							</div>
							<div class="row">
								<div class="span5 offset4 registContent form-group">
									<span class = "inputValue">자취여부</span>
									<select name="livingAlone" id="livingAlone">
										<option value=""></option>
										<option value="Y">네</option>
										<option value="N">아니요</option>
									</select>
								</div>
							</div>
							<div class="row">
								<div class="span5 offset4 registContent form-group">
									<span class = "inputValue">군복무</span>
									<select name="militaryService" id="militaryService">
										<option value=""></option>
										<option value="fulfilled">군필</option>
										<option value="inService">복무중</option>
										<option value="unfulfilled">미필</option>
										<option value="exemption">면제</option>
										<option id="none" value="none">해당사항 없음</option>
									</select>
								</div>
							</div>
							<div class="row">
								<div class="span5 offset4 registContent form-group">
									<span class = "inputValue">자기소개</span>
									<textarea name="aboutMe" id="aboutMe" ></textarea>
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
		${registForm.name }
	</div>
	<jsp:include page="/WEB-INF/view/template/footer.jsp" />
</body>
</html>