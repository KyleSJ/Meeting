<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/common.css?ver=3"/>">
<script type="text/javascript" src="<c:url value="/static/js/jquery-3.3.1.min.js"/>"></script>
<script type="text/javascript">
	$().ready(function() {
		var uniqueInvalid = false;
		
		$("#userId").keyup(function(){
			checkInvalid("userId","아이디");
			$.post("<c:url value="/api/isExist/userId"/>" , {
				userId : $("#userId").val()
			} , function(response){
				if(response.isExist){
					if($("#userId").hasClass("invalidUnique")){
						return false;
					}
					$("#userId").focus();
					afterInvalidUnique("userId","아이디");
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
		
		$("#nickname").keyup(function(){
			checkInvalid("nickname","닉네임");
			$.post("<c:url value="/api/isExist/nickname"/>" , {
				nickname : $("#nickname").val()
			} , function(response){
				if(response.isExist){
					if($("#nickname").hasClass("invalidUnique")){
						return false;
					}
					$("#nickname").focus();
					afterInvalidUnique("nickname","닉네임");
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
		
		$("#password").keyup(function(){
			checkInvalid("password", "비밀번호");
			if( $("#password").val() != $("#passwordConfirm").val() ){
				$("#password").addClass("invalidPassword");
				$("#passwordConfirm").addClass("invalidPassword");
				passwordInvalid = true;
			} else{
				$("#password").removeClass("invalidPassword");
				$("#passwordConfirm").removeClass("invalidPassword");
				passwordInvalid = false;
			}
		});
		
		$("#passwordConfirm").keyup(function(){
			if( $("#password").val() != $("#passwordConfirm").val() ){
				$("#password").addClass("invalidPassword");
				$("#passwordConfirm").addClass("invalidPassword");
				passwordInvalid = true;
			} else{
				$("#password").removeClass("invalidPassword");
				$("#passwordConfirm").removeClass("invalidPassword");
				passwordInvalid = false;
			}
		});
		
		
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
	    		checkInvalid("aboutMe", "자기소개");
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
	    		checkInvalid("nickname", "닉네임");
	    		checkInvalid("name", "이름");
	    		checkInvalid("passwordConfirm", "비밀번호확인");
	    		checkInvalid("password", "비밀번호");
	    		checkInvalid("userId", "아이디");
	    		

	    		
	    		if(invalid == true){
	    			invalid = false;
	    			console.log("invalid 감지");
	    			return false;
	    		}
	    		
	    		console.log("invalid check 모두 통과");
	    		if(invalid != true && uniqueInvalid != true && passwordInvalid != true){
	    		$.post("<c:url value="/api/isExist/userId"/>" , {
					userId : $("#userId").val()
				} , function(response){
					if(response.isExist){
						$("#userId").focus();
						afterInvalidUnique("userId","아이디");
						$("#userId").addClass("invalidUnique");
						uniqueInvalid = true;
						return false;
					} else {
						$("#userId").removeClass("invalidUnique");
						$("#userIdInvalidUniqueSpan").remove();
						$.post("<c:url value="/api/isExist/nickname"/>" , {
							nickname : $("#nickname").val()
						} , function(response){
							if(response.isExist){
								$("#nickname").focus();
								afterInvalidUnique("nickname","닉네임");
								$("#nickname").addClass("invalidUnique");
								uniqueInvalid = true;
								return false;
							} else {
								$("#nickname").removeClass("invalidUnique");
								$("#nicknameInvalidUniqueSpan").remove();
								$("#memberForm").attr({
									"method" : "post" ,
									"action" : "<c:url value="/regist"/>"
								}).submit();
							}
						});
					}
				});
	    		}
	    });
	    
	    $("#cancelBtn").click(function() {
	        console.log("cancel click");
	        $(location).attr('href', "<c:url value=" / "/>");
	    })
	
	    $(":radio[name=gender]").change(function() {
    			$("#genderFLabelInvalidSpan").remove();
	    		
			var gender = $(":radio[name=gender]:checked").val();
			
			if (gender == "M") {
				$("#none").remove();
				$("#preferStyleCheckBox").remove();
				$("#styleCheckBox").remove();
				$("#style").append(
						"<div id='styleCheckBox'>"
						+ "<input type='checkbox' name='styleVO.styleId' value='1' class='preferStyleCheckBox'>"
						+ "<label for='skinny'>마른</label>"
						+ "<input type='checkbox' name='styleVO.styleId' value='2' class='preferStyleCheckBox'>"
						+ "<label for='plump'>통통한</label>"
						+ "<input type='checkbox' name='styleVO.styleId' value='3' class='preferStyleCheckBox'>"
						+ "<label for='muscular'>근육질</label>"
						+ "<input type='checkbox' name='styleVO.styleId' value='4' class='preferStyleCheckBox'>"
						+ "<label for='lovely'>귀여운</label>"
						+ "<input type='checkbox' name='styleVO.styleId' value='5' class='preferStyleCheckBox'>"
						+ "<label for='chic'>시크</label>"
						+ "<input type='checkbox' name='styleVO.styleId' value='6' class='preferStyleCheckBox'>"
						+ "<label for='active'>활발</label>"
						+ "<input type='checkbox' name='styleVO.styleId' value='7' class='preferStyleCheckBox'>"
						+ "<label for='decent'>얌전</label>"
						+ "<input type='checkbox' name='styleVO.styleId' value='8' class='preferStyleCheckBox'>"
						+ "<label for='small'>아담한</label>"
						+ "<input type='checkbox' name='styleVO.styleId' value='9' class='preferStyleCheckBox'>"
						+ "<label for='tall'>키큰</label>"
						+ "<input type='checkbox' name='styleVO.styleId' value='10' class='preferStyleCheckBox'>"
						+ "<label for='intellectual'>지적인</label>"
						+ "</div>");
				
				$("#preferStyle").append(
								"<div id='preferStyleCheckBox'>"
								+ "<input type='checkbox' id='sexy' name='preferStyleVO.styleId' value='1' class='preferStyleCheckBox'>"
								+ "<label for='sexy'>섹시</label>"
								+ "<input type='checkbox' id='purity' name='preferStyleVO.styleId' value='2' class='preferStyleCheckBox'>"
								+ "<label for='purity'>청순</label>"
								+ "<input type='checkbox' id='lovely' name='preferStyleVO.styleId' value='3' class='preferStyleCheckBox'>"
								+ "<label for='lovely'>귀여운</label>"
								+ "<input type='checkbox' id='chic' name='preferStyleVO.styleId' value='4' class='preferStyleCheckBox'>"
								+ "<label for='chic'>시크</label>"
								+ "<input type='checkbox' id='active' name='preferStyleVO.styleId' value='5' class='preferStyleCheckBox'>"
								+ "<label for='active'>활발</label>"
								+ "<input type='checkbox' id='decent' name='preferStyleVO.styleId' value='6' class='preferStyleCheckBox'>"
								+ "<label for='decent'>얌전</label>"
								+ "<input type='checkbox' id='small' name='preferStyleVO.styleId' value='7' class='preferStyleCheckBox'>"
								+ "<label for='small'>아담한</label>"
								+ "<input type='checkbox' id='tall' name='preferStyleVO.styleId' value='8' class='preferStyleCheckBox'>"
								+ "<label for='tall'>키큰</label>"
								+ "<input type='checkbox' id='intellectual' name='preferStyleVO.styleId' value='9' class='preferStyleCheckBox'>"
								+ "<label for='intellectual'>지적인</label>"
								+ "<input type='checkbox' id='skinny' name='preferStyleVO.styleId' value='10' class='preferStyleCheckBox'>"
								+ "<label for='skinny'>마른</label>"
								+ "<input type='checkbox' id='plump' name='preferStyleVO.styleId' value='11' class='preferStyleCheckBox'>"
								+ "<label for='plump'>통통한</label>"
								+ "<input type='checkbox' id='muscular' name='preferStyleVO.styleId' value='12' class='preferStyleCheckBox'>"
								+ "<label for='muscular'>근육질</label>"
								+ "</div>");
			} else if (gender == "F") {
				$("#none").remove();
				$("#militaryService").append("<option id='none' value='none'>해당사항 없음</option>");
				$("#preferStyleCheckBox").remove();
				$("#styleCheckBox").remove();
				$("#style").append(
						"<div id='styleCheckBox'>"
						+ "<input type='checkbox' name='styleVO.styleId' value='1' class='preferStyleCheckBox'>"
						+ "<label for='sexy'>섹시</label>"
						+ "<input type='checkbox' name='styleVO.styleId' value='2' class='preferStyleCheckBox'>"
						+ "<label for='purity'>청순</label>"
						+ "<input type='checkbox'name='styleVO.styleId' value='3' class='preferStyleCheckBox'>"
						+ "<label for='lovely'>귀여운</label>"
						+ "<input type='checkbox' name='styleVO.styleId' value='4' class='preferStyleCheckBox'>"
						+ "<label for='chic'>시크</label>"
						+ "<input type='checkbox' name='styleVO.styleId' value='5' class='preferStyleCheckBox'>"
						+ "<label for='active'>활발</label>"
						+ "<input type='checkbox' name='styleVO.styleId' value='6' class='preferStyleCheckBox'>"
						+ "<label for='decent'>얌전</label>"
						+ "<input type='checkbox' name='styleVO.styleId' value='7' class='preferStyleCheckBox'>"
						+ "<label for='small'>아담한</label>"
						+ "<input type='checkbox' name='styleVO.styleId' value='8' class='preferStyleCheckBox'>"
						+ "<label for='tall'>키큰</label>"
						+ "<input type='checkbox' name='styleVO.styleId' value='9' class='preferStyleCheckBox'>"
						+ "<label for='intellectual'>지적인</label>"
						+ "<input type='checkbox' name='styleVO.styleId' value='10' class='preferStyleCheckBox'>"
						+ "<label for='skinny'>마른</label>"
						+ "<input type='checkbox' name='styleVO.styleId' value='11' class='preferStyleCheckBox'>"
						+ "<label for='plump'>통통한</label>"
						+ "<input type='checkbox' name='styleVO.styleId' value='12' class='preferStyleCheckBox'>"
						+ "<label for='muscular'>근육질</label>"
						+ "</div>");
				
				$("#preferStyle").append(
								"<div id='preferStyleCheckBox'>"
								+ "<input type='checkbox' id='skinny' name='preferStyleVO.styleId' value='1' class='preferStyleCheckBox'>"
								+ "<label for='skinny'>마른</label>"
								+ "<input type='checkbox' id='plump' name='preferStyleVO.styleId' value='2' class='preferStyleCheckBox'>"
								+ "<label for='plump'>통통한</label>"
								+ "<input type='checkbox' id='muscular' name='preferStyleVO.styleId' value='3' class='preferStyleCheckBox'>"
								+ "<label for='muscular'>근육질</label>"
								+ "<input type='checkbox' id='lovely' name='preferStyleVO.styleId' value='4' class='preferStyleCheckBox'>"
								+ "<label for='lovely'>귀여운</label>"
								+ "<input type='checkbox' id='chic' name='preferStyleVO.styleId' value='5' class='preferStyleCheckBox'>"
								+ "<label for='chic'>시크</label>"
								+ "<input type='checkbox' id='active' name='preferStyleVO.styleId' value='6' class='preferStyleCheckBox'>"
								+ "<label for='active'>활발</label>"
								+ "<input type='checkbox' id='decent' name='preferStyleVO.styleId' value='7' class='preferStyleCheckBox'>"
								+ "<label for='decent'>얌전</label>"
								+ "<input type='checkbox' id='small' name='preferStyleVO.styleId' value='8' class='preferStyleCheckBox'>"
								+ "<label for='small'>아담한</label>"
								+ "<input type='checkbox' id='tall' name='preferStyleVO.styleId' value='9' class='preferStyleCheckBox'>"
								+ "<label for='tall'>키큰</label>"
								+ "<input type='checkbox' id='intellectual' name='preferStyleVO.styleId' value='10' class='preferStyleCheckBox'>"
								+ "<label for='intellectual'>지적인</label>"
								+ "</div>");
			}
		});
		
		<%-- $("#preferAgeStart").change(function(){
			var preferAgeStart = $(this).val();
			
			var preferAgeEndSelect = $(`<select id="preferAgeEnd" name="preferAgeEnd"> 
			<c:forEach begin=${preferAgeStart} end="35" step="1" var="age"> 
			<option value=${age }>${age }</option> 
			</c:forEach> </select> `);
			
			$('#preferAgeEnd').remove();
			$("#preferAgeStart").after(preferAgeEndSelect);
		}) --%>
	})
</script>
<style>

</style>
</head>
<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/view/template/header.jsp" />
		<div>
			<form:form modelAttribute="memberForm" class="registForm" id="registForm">
				<div>
					<sup>*</sup><span class = "inputValue">아이디</span><input type="text" id="userId" name="userId">
					<form:errors path="userId" />
				</div>
				<br>
				<div>
					<sup>*</sup><span class = "inputValue">비밀번호</span><input type="password" id="password" name="password">
				</div>
				<br>
				<div>
					<sup>*</sup><span class = "inputValue">비밀번호확인</span><input type="password" id="passwordConfirm" name="passwordConfirm">
				</div>
				<br>
				<div>
					<sup>*</sup><span class = "inputValue">이름</span><input type="text" id="name" name="name">
				</div>
				<br>
				<div>
					<sup>*</sup><span class = "inputValue">닉네임</span><input type="text" id="nickname" name="nickname">
				</div>
				<br>
				<div id="gender">
					<sup>*</sup>성별<input type="radio" id="genderM" name="gender" value="M"><label for="genderM">남</label>
								   <input type="radio" id="genderF" name="gender" value="F"><label id="genderFLabel" for="genderF">여</label>
				</div>
				<br>
				<div>
					<sup>*</sup>생일
					<select name="birthYear" id="birthYear">
						<option value=""></option>
						<c:forEach var="year" begin="${thisYear-35}" varStatus="loop" end="${thisYear-20}" step="1">
							<option value=${ loop.end - loop.count + 1}>${ loop.end - loop.count + 1}</option>
						</c:forEach>
					</select>
					<select name="birthMonth" id="birthMonth">
						<option value=""></option>
						<c:forEach var="month" begin="1" end="12" step="1">
							<option value=${ month }>${ month }</option>
						</c:forEach>
					</select>
					<select name="birthDay" id="birthDay">
						<option value=""></option>
						<c:forEach var="day" begin="1" end="31" step="1">
							<option value=${ day }>${ day }</option>
						</c:forEach>
					</select>
				</div>

				<br>

				<div>
					학번
					<select name="admissionYear" id="admissionYear">
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

				<br>

				<div>
					<sup>*</sup>전화번호<input type="text" id="phoneNumber" name="phoneNumber">
				</div>
				<br>
				<div>
					주소<input type="text" id="addrId" name="addrStr">
				</div>
				<br>
				<div>
					학교
					<select name="schoolId" id="schoolId">
						<option value=""></option>
						<c:forEach items="${schoolList }" var="school">
							<option value="${school.schoolId }">${school.schoolName }</option>
						</c:forEach>
					</select>
				</div>

				<br>

				<div>전공
					<select name="majorId" id="majorId">
						<option value=""></option>
						<c:forEach items="${majorList }" var="major">
							<c:if test="${major.visible eq 'yes' }">
								<option value="${major.majorId }">${major.major }</option>
							</c:if>
						</c:forEach>
					</select>
				</div>
				
				<br>
				
				<div>
					<span id="style">본인의 스타일</span>
					<div id="styleCheckBox" class="invalidSpan">성별을 체크해 주세요.</div>
				</div>

				<br>

				<div>
					<span id="livingAloneDiv">자취 여부</span>
					<select name="livingAlone" id="livingAlone">
						<option value=""></option>
						<option value="Y">네</option>
						<option value="N">아니요</option>
					</select>
				</div>

				<br>

				<div id="militaryServiceDiv">
					군복무
					<select name="militaryService" id="militaryService">
						<option value=""></option>
						<option value="fulfilled">군필</option>
						<option value="inService">복무중</option>
						<option value="unfulfilled">미필</option>
						<option value="exemption">면제</option>
						<option id="none" value="none">해당사항 없음</option>
					</select>
				</div>

				<br>

				<div id="preference">
					이상형 <br>
					<div>
						<span id="preferStyle">스타일</span> <br>
						<div id="preferStyleCheckBox" class="invalidSpan">성별을 체크해 주세요.</div>
					</div>
					<br>
					<div>
						연령대
						<select id="preferAgeStart" name="preferAgeStart">
							<option value=""></option>
							<c:forEach begin="20" end="35" step="1" var="age">
								<option value=${age }>${age }</option>
							</c:forEach>
						</select>
						~
						<select id="preferAgeEnd" name="preferAgeEnd">
							<option value=""></option>
							<c:forEach begin="20" end="35" step="1" var="age">
								<option value=${age }>${age }</option>
							</c:forEach>
						</select>
					</div>
					<br>
					<div>
						<span id="preferCollege">출신 단과대</span> <br> 
						<c:forEach items="${collegeList }" var="college">
							<input type="checkbox" id="${college.college }" name="preferCollegeVO.collegeId" value="${college.collegeId }">
							<label for="${college.college }">${college.college }</label>
						</c:forEach>
					</div>
					<br>
					<div>선호하는 거주지</div>
					<br>
					<div>
						<span id="preferLivingAlone">자취여부</span> <br> 
						<input type="radio" id="livingAloneYes" name="preferLivingAlone" value="True"> 
						<label for="livingAloneYes">혼자사는게 아무래도...</label> 
						<input type="radio" id="livingAloneNo" name="preferLivingAlone" value="False"> 
						<label for="livingALoneNo">역시 부모님과 살아야...</label> 
						<input type="radio" id="livingAloneBoth" name="preferLivingAlone" value="Both"> 
						<label for="livingAloneBoth">난 아무래도 좋소...</label>
					</div>
					<br>
					<div>
						자기소개<br><textarea id="aboutMe" name="aboutMe"></textarea>
					</div>
				</div>
			</form:form>

			<br> 
			<input type="button" id="registBtn" value="회원가입"> 
			<input type="button" id="cancelBtn" value="취소"> 
		</div>
	</div>
</body>
</html>