<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
a#MOVE_TOP_BTN {
	position: fixed;
	right: 2%;
	bottom: 50px;
	display: none;
	z-index: 999;
}

button {
	text-align: center;
	height: 15%;
	width: 15%;
	margin: auto;
}

#sign_upbtn {
	margin: 10px;
}

div#id02 {
	margin: 50px;
}

h2.major span {
	background-color: #fefefe;
}

id02 {
	padding-left: 50px;
	padding-right: 50px;
}

h2, div.col-12 {
	background-color: white;
}
</style>
<title>Body_list</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
</head>
<body class="homepage is-preload">
	<c:choose>
		<c:when test="${empty visit }">
			<c:set var="visit" value="1" scope="application"></c:set>
		</c:when>
		<c:otherwise>
			<c:set var="visit" value="${visit + 1 }" scope="application"></c:set>
		</c:otherwise>
	</c:choose>

	<div id="page-wrapper">

		<!-- Header -->
		<header id="header">
			<div class="logo container">
				<div>
					<h1>
						<a href="main.jsp" id="logo">이루어Gym</a>
					</h1>
					<p>회원가입</p>
				</div>
			</div>
		</header>

		<!-- Nav -->
		<nav id="nav">
			<ul>
				<div style="float: left">
					<strong>방문자 수</strong> <b>${visit }</b>
				</div>
				<li><a href="main.jsp">Home</a></li>
				<li><a href="exerciseList.jsp">운동리스트</a>
					<ul>
						<li><a href="#">보충제</a></li>
						<li><a href="#">운동리스트</a></li>

					</ul></li>
				<li><a href="eat_list.jsp">식단 리스트</a></li>
				<li><a href="gym.jsp">헬스장 찾기</a></li>
				<li><a href="my_page.jsp">마이 페이지</a>
					<ul>
						<li><a href="#">목표달성현황</a></li>
						<li><a href="#">오늘의 추천운동</a></li>
						<li><a href="#">오늘의 추천식단</a></li>
						<li><a href="#">회원정보 수정</a></li>
					</ul></li>

				<c:choose>
					<c:when test="${empty info}">
						<div style="float: right" class="current">
							<a href="Sign-up.jsp">회원가입</a>
						</div>
						<div style="float: right">
							<a
								onclick="document.getElementById('id01').style.display='block';document.getElementById('id02').style.display='none'">로그인</a>
						</div>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${info.email == 'admin'}">
								<a href="Select.do">회원 관리</a> / <a href="logout.jsp">로그아웃</a>
							</c:when>
							<c:otherwise>
								<a href="update2.jsp">내 정보 수정</a> / <a href="logout.jsp">로그아웃</a>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
			</ul>

			<!-- Login 창 -->
			<div id="id01" class="modal">
				<form class="modal-content animate" action="/login.do" method="post">
					<div class="container">
						<label for="loginID"><b>ID</b></label> <input type="text"
							placeholder="Enter LoginID" name="loginID" required> <label
							for="LoginPW"><b>Password</b></label> <input type="password"
							placeholder="Enter LoginPw" name="LoginPW" required>

						<button type="submit">Login</button>
						<label><input type="checkbox" checked="checked"
							name="remember"> Remember me </label>
					</div>

					<div class="container" style="background-color: #f1f1f1">
						<button type="button"
							onclick="document.getElementById('id01').style.display='none'"
							class="cancelbtn">Cancel</button>
					</div>
				</form>
			</div>


		</nav>

		<!-- 회원가입 창 -->

		<div id="id02">
			<section style="width: 100%; min-width: 600px;">
				<form action="Body.do" method="post">
					<!-- controller추가 -->

					<h1 align="center" style="font-size: 30px;">*표시가 없는것을 다 채워 주세요</h1>
					<hr>

					<label for="height"><b>키</b></label> <input type="text"
						placeholder="Enter Height" id = "height" name="height" required> <label
						for="weight"><b>몸무게</b></label> <input type="text"
						placeholder="Enter Weight" id = "weight" name="weight" required> <label
						for="body-fit"><b>신체 체형</b></label> 마른<input type="radio"
						name="body-fit" value="마른" required> 보통<input type="radio"
						name="body-fit" value="보통" required> 통통<input type="radio"
						name="body-fit" value="통통" required> 뚱뚱<input type="radio"
						name="body-fit" value="뚱뚱" required> 근육<input type="radio"
						name="body-fit" value="근육질" required> <label for="muscle"><b>근육량(*)</b></label>
					표준이하<input type="radio" name="muscle-fit" value="표준이하"> 표준<input
						type="radio" name="muscle-fit" value="표준"> 표준이상<input
						type="radio" name="muscle-fit" value="표준이상">


					<h1 align="center">당신의 목표량을 설정해주세요!</h1>
					<hr>

					<label><b>목표몸무게(kg)</b></label> <input type="text"
						placeholder="target_weight" value="target_weight"
						required="required"> <label for="target_muscle"><b>희망
							부위</b></label> 어깨<input type="checkbox" name="target_muscle" value="어깨">
					등<input type="checkbox" name="target_muscle" value="팔"> 복근<input
						type="checkbox" name="target_muscle" value="복근"> 다리<input
						type="checkbox" name="target_muscle" value="다리"> 전체 <input
						type="checkbox" name="target_muscle" value="전체"> <label><b>
							강도 </b></label> [ 팔굽혀펴기 10개도 힘들어요..] 하<input type="radio" name="burglar"
						value="하" required> [ 남들 하는만큼 합니다!] 중<input type="radio"
						name="burglar" value="중" required> [ 적극적으로 임하고 싶어요!] 상 <input
						type="radio" name="burglar" value="상" required> <label><b>
							운동장소 </b></label> 헬스장 이용<input type="radio" name="HorG" value="Gym"
						required="required"> 홈트레이닝 <input type="radio" name="HorG"
						value="Home" required="required"> <label for="target_date"><b>목표기간</b></label>
					<input type="date" value="2019-01-08" name="start_date" required>
					~ <input type="date" value="2019-01-08" name="target_date" required>

					<div id="sign_upbtn" align="center">
						<input type="submit" value="Submit"> <input type="reset"
							value="Reset">
					</div>
				</form>
				<button onclick = "myClick()">운동강도</button>
        		 <p id = "myClickCheck"></p>
			</section>
		</div>

		<!-- 명언 -->
		<section
			style="background-color: white; border-top: solid 5px #b1ddad;">
			<h2 class="major">날씬한 것 만큼 달콤한 것은 없어요!</h2>

		</section>
	</div>
	<div class="col-12">

		<!-- Copyright -->
		<div id="copyright">
			<ul class="menu">
				<li>&copy; Untitled. All rights reserved</li>
				<li>Design: <a href="main.jsp">이루어Gym</a></li>
			</ul>
		</div>

	</div>
	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>




	<script>
	var myClickCheck = document.getElementeById("myClickCheck");
	   function myClick() {
	      var height = document.getElementById("height");
	      var weight = document.getElementById("weight");
	      var muscle = document.getElementsByName("muscle-fit")[0];
	      var pushup = document.getElementsByName("burglar")[0];
	   
	      $.ajax({
	         type : "get",
	         url : "machineLearning?height="+height.value+"&weight="+weight.value
	           +"&muscle="+muscle.value+"&pushup="+pushup.value,
	           datatype : "text",
	     success: function( result ) {
	           $("#myClickCheck").append("머신러닝 기반 분석 완료!");
	     }, error : function () {
	        
	     }
	      }); 
	        
	   }		
	// Get the modal
				var modal = document.getElementById('id01');
				
				// When the user clicks anywhere outside of the modal, close it
				window.onclick = function(event) {
				    if (event.target == modal) {
				        modal.style.display = "none";
				    }
				}
				
				$(document).ready(function() { 
					if(${uid!=null}){
						
					}else{
						alert('회원가입시간이 초과되어 로그인 후 회원정보 수정을 이용해주세요.');
						window.location.href = 'main.jsp';
					}
				});
			
				
			</script>
	<!— 위로 올라가기 버튼 —>

	<script>

$(function() {

$(window)

.scroll(

function() {

if ($(this)

.scrollTop() > 500) {

$(

'#MOVE_TOP_BTN')

.fadeIn();

} else {

$(

'#MOVE_TOP_BTN')

.fadeOut();

}

});



$("#MOVE_TOP_BTN")

.click(

function() {

$('html, body')

.animate(

{

scrollTop : 0

},

400);

return false;

});

});

</script>

	<a id="MOVE_TOP_BTN" href="#"><img src="images/top.png"></a>

</body>
</html>