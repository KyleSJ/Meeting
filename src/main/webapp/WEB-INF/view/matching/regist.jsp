<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.valid{
	background-color: red;
}
</style>
<link rel="stylesheet" type="text/css" href="<c:url value="/static/css/common.css?ver=3"/>">
<script type="text/javascript" src="<c:url value="/static/js/jquery-3.3.1.min.js"/>"></script>
<script type="text/javascript">

	$().ready(function(){
		var teamNOP = 1;
		var gender = "${sessionScope.__USER__.gender}";
		
		$("#teamUserId").keyup(function(){
			$("#userList").children().remove();
			if($(this).val() == '' || $(this).val() == null){
				$("#addBtn").prop("disabled", true);
				return false;
			}
			
			var startWith = $(this).val();
			$.post("<c:url value='/api/recommendId'/>", {
				startWith : startWith ,
				gender : gender
			}, function(response){
				var isExist = (response.length > 0);
				if( isExist ){
					$("#addBtn").removeAttr("disabled");
				}
				for( let i=0; i< response.length;i++ ){
					$("#userList").append("<option value='"+response[i].userId +"' label='"+response[i].name+"'>");
				}
			})
		})
		
		$("#addBtn").click(function(){
			var userId = $("#teamUserId").val();
			console.log(userId);
			$.post("<c:url value='/api/isExist/userId'/>", {
				userId : userId
			}, function(response){
				if( response.isExist ){
					$("#teamMember").append(
							"<div class='row clear-marginbot'>"
							+ "<div class='span4 offset5'>"
							+ "<input class='marginleft30' type='text' class='userId' name='matchingTeamMemberVO.userId' readonly=true value='"+response.member.name+" ( "+ userId+" )'>"
							+ "<a href='#' class='btn deleteMember marginbot10'><i class='icon-minus-sign'></i></a>"
							+ "</div>"
							+ "</div>");
					$("#teamUserId").val("");
					teamNOP++;
					$("#userList").children().remove();
					$("#addBtn").prop("disabled", true);
				} else if ( userId == '' ) {
					alert("아이디를 입력해주세요!");
					return false;
				} 
				else{
					alert("해당 아이디가 존재하지 않습니다.");
				}
			})
		})
		
		$("#teamMember").on("click",".deleteMember",function(){
			$(this).parent("div").remove();
			teamNOP--;
		})
		
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
		
		$("#teamRegistBtn").click(function(){
			console.log($("#matchingTeamName").val());
			if($("#matchingTeamName").val() == ""){
				alert("팀명을 입력해 주세요!");
				return false;
			}
			if(teamNOP == 1){
				alert("팀은 최소 두명이상이어야 합니다!");
				return false;
			}
			console.log(teamNOP);
			$("#teamMember").after("<div><input type='hidden' name='teamNOP' value='"+teamNOP+"'></div>");
			$("#teamRegistForm").attr({
				"method" : "post",
				"action" : "<c:url value="/matching/registTeam"/>"
			}).submit();
		})
		
	});
	
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
	              <h2>팀 생성하기</h2>
	            </div>
	          </div>
	        </div>
	      </div>
	    </section>
 		<section id="content">
 			<div class="container">
 				<div class="row">
 					<div class="span12">
					 	<div id="formWrapper" class="row">
					 		<form:form modelAttribute="teamRegistForm">
					 			<div class="row">
					 				<div class="span1 offset4 text-right">팀 이름 : </div>
					 				<div class="span4">
					 					<input type="text" name="matchingTeamName" id="matchingTeamName">
					 				</div>	
					 			</div> 
					 			<div class="row">
					 				<div class="span2 offset3 text-right">초대할 팀원 아이디 : </div>
					 				<div class="span4">
					 					<input type="text" id="teamUserId" autocomplete=false list="userList">
						 				<datalist id="userList"></datalist>
						 				<input class="btn btn-medium btn-theme" type="button" disabled id="addBtn" value="추가">
					 				</div>				 				
					 			</div>
					 			<div class="row" id="teamMember">
					 				<div class="row clear-marginleft clear-marginbot">
					 					<div class="span2 offset3 text-right">팀원목록 :</div>
						 				<div class="span4">
						 					<input type="text" name="matchingTeamMemberVO.userId" value="${sessionScope.__USER__.name } ( ${sessionScope.__USER__.userId } )" readonly>
						 				</div>
					 				</div>
					 			</div>
					 		</form:form>
					 		<div class="span1 offset5">
						 		<input class="btn btn-large btn-theme margintop10" type="button" id="teamRegistBtn" value="팀 등록">
					 		</div>
					 	</div>
					 </div>
				 	<div class="row">
				 	</div>
			 	</div>
		 	</div>
	 	</section>
	 	<jsp:include page="/WEB-INF/view/template/footer.jsp" />
	 </div>
</body>
</html>