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
<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/common.css?ver=10"/>">
<script type="text/javascript" src="<c:url value="/static/js/jquery-3.3.1.min.js"/>"></script>
<script type="text/javascript">
	$().ready(function() {
		
		function afterInvalidUnique(elementId, content){
			$("#"+elementId).after("<span id='" + elementId +"InvalidUniqueSpan' class='invalidUniqueSpan'>" + content + "이(가) 중복됩니다. 다른 "+ content +"을(를) 입력해 주세요.</span>");
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
	    		$("#"+elementId).after("<span id='"+elementId+"InvalidSpan' class='invalidSpan'>" + content + "을(를) 입력하세요.</span>");
	    }

		var invalid = false;
	    $("#registBtn").click(function() {
    		invalid = false;
    		checkInvalidRadio("preferLivingAlone", "preferLivingAlone", "선호하는 자취여부", "preferLivingAlone");
    		checkInvalidCheckbox("preferCollegeVO.collegeId", "preferCollege", "선호하는 단과대학");
    		if($("#preferAgeStart").val() == "" || $("#preferAgeEnd").val() == ""){
    			$("#preferAgeStart").focus();
    			if($("#preferAgeEndInvalidSpan").length == 0){
    				afterInvalid("preferAgeEnd", "선호하는 연령대");
    			}
    			invalid = true;
    		}
    		checkInvalidCheckbox("preferStyleVO.styleId", "preferStyle", "선호하는 스타일");
    		
    		if(invalid == true){
    			invalid = false;
    			console.log("invalid 감지");
    			return false;
    		}
    		
    		console.log("invalid check 모두 통과");
			$("#memberForm").attr({
				"method" : "post" ,
				"action" : "<c:url value="/member/regist/process3"/>"
			}).submit();
	    });
	    
	    $("#cancelBtn").click(function() {
	        console.log("cancel click");
	        $(location).attr('href', "<c:url value=" /logout "/>");
	    })
	
	   
		if ("${gender}" == "M") {
			$("#preferStyle").append(
							"<div id='preferStyleCheckBox'>"
						+ "<div>"
							+ "<input type='checkbox' id='sexy' name='preferStyleVO.styleId' value='1' class='preferStyleCheckBox'>"
							+ "<label class='preferStyleLabel' for='sexy'>섹시</label>"
							+ "<input class='styleLabel' type='checkbox' id='purity' name='preferStyleVO.styleId' value='2' class='preferStyleCheckBox'>"
							+ "<label class='preferStyleLabel' for='purity'>청순</label>"
							+ "<input type='checkbox' id='lovely' name='preferStyleVO.styleId' value='3' class='preferStyleCheckBox'>"
							+ "<label class='preferStyleLabel' for='lovely'>귀여운</label>"
							+ "<input type='checkbox' id='chic' name='preferStyleVO.styleId' value='4' class='preferStyleCheckBox'>"
							+ "<label class='preferStyleLabel' for='chic'>시크</label>"
							+ "</div>"
							+ "<div>"
							+ "<input type='checkbox' id='active' name='preferStyleVO.styleId' value='5' class='preferStyleCheckBox'>"
							+ "<label class='preferStyleLabel' for='active'>활발</label>"
							+ "<input type='checkbox' id='decent' name='preferStyleVO.styleId' value='6' class='preferStyleCheckBox'>"
							+ "<label class='preferStyleLabel' for='decent'>얌전</label>"
							+ "<input type='checkbox' id='small' name='preferStyleVO.styleId' value='7' class='preferStyleCheckBox'>"
							+ "<label class='preferStyleLabel' for='small'>아담한</label>"
							+ "<input type='checkbox' id='tall' name='preferStyleVO.styleId' value='8' class='preferStyleCheckBox'>"
							+ "<label class='preferStyleLabel' for='tall'>키큰</label>"
							+ "</div>"
							+ "<div>"
							+ "<input type='checkbox' id='intellectual' name='preferStyleVO.styleId' value='9' class='preferStyleCheckBox'>"
							+ "<label class='preferStyleLabel' for='intellectual'>지적인</label>"
							+ "<input type='checkbox' id='skinny' name='preferStyleVO.styleId' value='10' class='preferStyleCheckBox'>"
							+ "<label class='preferStyleLabel' for='skinny'>마른</label>"
							+ "<input type='checkbox' id='plump' name='preferStyleVO.styleId' value='11' class='preferStyleCheckBox'>"
							+ "<label class='preferStyleLabel' for='plump'>통통한</label>"
							+ "<input type='checkbox' id='muscular' name='preferStyleVO.styleId' value='12' class='preferStyleCheckBox'>"
							+ "<label class='preferStyleLabel' for='muscular'>근육질</label>"
							+ "</div>"
							+ "</div>");
		} else if ("${gender}" == "F") {
			$("#preferStyle").append(
							"<div id='preferStyleCheckBox'>"
						+ "<div>"
							+ "<input type='checkbox' id='skinny' name='preferStyleVO.styleId' value='1' class='preferStyleCheckBox'>"
							+ "<label class='preferStyleLabel' for='skinny'>마른</label>"
							+ "<input type='checkbox' id='plump' name='preferStyleVO.styleId' value='2' class='preferStyleCheckBox'>"
							+ "<label class='preferStyleLabel' for='plump'>통통한</label>"
							+ "<input type='checkbox' id='muscular' name='preferStyleVO.styleId' value='3' class='preferStyleCheckBox'>"
							+ "<label class='preferStyleLabel' for='muscular'>근육질</label>"
							+ "<input type='checkbox' id='lovely' name='preferStyleVO.styleId' value='4' class='preferStyleCheckBox'>"
							+ "<label class='preferStyleLabel' for='lovely'>귀여운</label>"
							+ "</div>"
							+ "<div>"
							+ "<input type='checkbox' id='chic' name='preferStyleVO.styleId' value='5' class='preferStyleCheckBox'>"
							+ "<label class='preferStyleLabel' for='chic'>시크</label>"
							+ "<input type='checkbox' id='active' name='preferStyleVO.styleId' value='6' class='preferStyleCheckBox'>"
							+ "<label class='preferStyleLabel' for='active'>활발</label>"
							+ "<input type='checkbox' id='decent' name='preferStyleVO.styleId' value='7' class='preferStyleCheckBox'>"
							+ "<label class='preferStyleLabel' for='decent'>얌전</label>"
							+ "<input type='checkbox' id='small' name='preferStyleVO.styleId' value='8' class='preferStyleCheckBox'>"
							+ "<label class='preferStyleLabel' for='small'>아담한</label>"
							+ "</div>"
							+ "<div>"
							+ "<input type='checkbox' id='tall' name='preferStyleVO.styleId' value='9' class='preferStyleCheckBox'>"
							+ "<label class='preferStyleLabel' for='tall'>키큰</label>"
							+ "<input type='checkbox' id='intellectual' name='preferStyleVO.styleId' value='10' class='preferStyleCheckBox'>"
							+ "<label class='preferStyleLabel' for='intellectual'>지적인</label>"
							+ "</div>"
							+ "</div>");
		}
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
              <h2>회원가입 (3/3)</h2>
            </div>
          </div>
        </div>
      </div>
    </section>
		<section id="content">
			<div class="container">
				<div class="row">
					<div class="span12">
						<h2 class="text-center">이상형</h2>
						<form:form modelAttribute="memberForm" class="registForm">
							<div class="row">
								<div class="span6 offset4 registContent">
								<span class = "inputValue">스타일</span>
								<div class="form-group" id="preferStyle">
								</div>
								</div>
							</div>
							<div class="row">
								<div class="span6 offset4 registContent">
									<span class = "inputValue">연령대</span>
								<div class="form-group" id="preferAge">
									<select class="selectBox" id="preferAgeStart" name="preferAgeStart">
										<option value=""></option>
										<c:forEach begin="20" end="35" step="1" var="age">
											<option value=${age }>${age }</option>
										</c:forEach>
									</select>
									~
									<select class="selectBox" id="preferAgeEnd" name="preferAgeEnd">
										<option value=""></option>
										<c:forEach begin="20" end="35" step="1" var="age">
											<option value=${age }>${age }</option>
										</c:forEach>
									</select>
								</div>
								</div>
							</div>
							<div class="row">
								<div class="span7 offset4 registContent">
									<span class = "inputValue">학교</span>
									<div class="form-group" id="preferCollege">
									<c:forEach items="${collegeList }" var="college" varStatus="loop">
											<c:if test="${(not loop.first) && (loop.index%4 == 0) }"><br></c:if>
											<input type="checkbox" id="${college.college }" name="preferCollegeVO.collegeId" value="${college.collegeId }">
											<label class='preferCollege' for="${college.college }">${college.college }</label>
									</c:forEach>
								</div>
								</div>
							</div>
							<div class="row">
								<div class="span6 offset4 registContent">
									<span class = "inputValue">사는곳</span>
									<div class="form-group" id="preferStyle">
								</div>
								</div>
							</div>
							<div class="row">
								<div class="span6 offset4 registContent">
									<span class = "inputValue">자취</span>
									<div class="form-group" id="preferStyle">
									<div>
										<input type="radio" id="livingAloneYes" name="preferLivingAlone" value="True">
										<label class='livingAloneLabel' for="livingAloneYes">혼자사는게 아무래도...</label>
									</div>
									<div> 
										<input type="radio" id="livingAloneNo" name="preferLivingAlone" value="False"> 
										<label class='livingAloneLabel' for="livingALoneNo">역시 부모님과 살아야...</label> 
									</div>
									<div>
										<input type="radio" id="livingAloneBoth" name="preferLivingAlone" value="Both"> 
										<label class='livingAloneLabel' for="livingAloneBoth">난 아무래도 좋소...</label>
									</div>
								</div>
								</div>
							</div>
							<div class="row text-center">
								<input class="btn btn-large btn-theme margintop10" type="button" id="registBtn" value="회원가입">
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