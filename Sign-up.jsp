<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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

#sign_upbtn {
	margin: 10px;
	align-content: center;
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

span#pwCheck, span#isDouble {
	display: none;
}
</style>
<title>TXT by HTML5 UP</title>
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
						<li><a href="Bochungjae.jsp">보충제</a></li>
						<li><a href="exerciseList.jsp">운동리스트</a>
							<ul>
								<li class="current"><a href="exerciseList.jsp">전체</a>
									<ul>
										<li><a href="shou_back.jsp">어깨/등</a>
										<li><a href="chest.jsp">가슴</a>
										<li><a href="choco.jsp">복근</a>
										<li><a href="leg.jsp">다리</a>
									</ul>
							</ul></li>
					</ul></li>

				<li><a href="gym_list.jsp">헬스장 찾기</a>
					<ul>
						<li><a href="Sign-up.jsp">내 주변 헬스장</a></li>
						<li><a href="gym_list.jsp">전체 헬스장리스트</a></li>
					</ul></li>

				<c:choose>
					<c:when test="${uname!=null }">
						<li><a href="eat_list.jsp">추천식단</a></li>
						<li><a href="my_page.jsp">마이페이지</a>
							<ul>
								<li><a href="my_page.jsp">목표달성현황</a></li>
								<li><a href="recommend_exercise.jsp">오늘의 추천운동</a></li>
								<li><a href="my_page_info.jsp">내정보수정</a></li>
							</ul></li>
					</c:when>
				</c:choose>

				<c:choose>
					<c:when test="${uname!=null }">
						<div style="float: right">
							<a href="Logout">로그아웃</a>
						</div>
						<div style="float: right">
							<a href="my_page_info.jsp">내 정보 수정</a>
						</div>
						<c:choose>

							<c:when test="${info.email == 'admin'}">
								<a href="Select.do">회원 관리</a>
							</c:when>
							<c:otherwise>

							</c:otherwise>
						</c:choose>
					</c:when>
					<c:otherwise>
						<div style="float: right">
							<a href="Sign-up.jsp">회원가입</a>
						</div>
						<div style="float: right">
							<a
								onclick="document.getElementById('id01').style.display='block';document.getElementById('id02').style.display='none'">로그인</a>
						</div>
					</c:otherwise>
				</c:choose>
			</ul>
		</nav>

		<!-- Login 창 -->
		<div id="id01" class="modal">
			<form class="modal-content animate" action="/login.do">
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
				<form action="Join.do" method="post">
					<!-- controller추가 -->

					<h1 align="center" style="font-size: 30px;">*표시가 없는것을 다 채워 주세요</h1>
					<hr>

					<label for="name"><b>이름</b></label> <input type="text"
						placeholder="Enter Name" name="name" required> <label><b>성별</b></label>
					남자<input type="radio" name="gender" value="male"
						required="required"> 여자<input type="radio" name="gender"
						value="female" required="required"> <label for="age"><b>나이</b></label>
					<input type="text" placeholder="Enter Age" name="age" required>
					<label for="id"><b>아이디</b></label> <input type="text"
						placeholder="Enter Id" name="id" id="id" required>
					<div id="sign_upbtn" align="center">
						<button type="button" onclick="isDouble()">아이디 중복 확인</button>
					</div>
					<span id="isDouble"></span> <label for="pw"><b>비밀번호</b></label> <input
						type="password" placeholder="Enter Pw" name="pw" id="pass"
						required> <label for="pwCheck"><b>비밀번호확인</b></label> <input
						type="password" placeholder="Enter pwCheck" name="pwCheck"
						required id="passC">
					<div id="sign_upbtn" align="center">
						<button type="button" onclick="pwcheck()">비밀번호 일치 확인</button>
					</div>
					<span id="pwCheck"></span> <label for="email"><b>이메일</b></label> <input
						type="text" placeholder="Enter Email" name="email" required>
					<label for="address"><b>주소</b></label> <input type="text"
						placeholder="Enter Address" name="address" required> <label
						for="Hp"><b>핸드폰 번호 </b></label> <input type="text"
						placeholder="Enter Hp" name="hp" required>

					<div id="sign_upbtn" align="center">
						<button onclick="main.jsp">Main</button>
						<button onclick="joinCheck()">NEXT</button>
						<input type="reset" value="Reset">
					</div>
				</form>
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
		// Get the modal
		var modal = document.getElementById('id01');
		var re1 = false;
		var re2 = false;

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}

		function pwcheck() {
			var pw = document.getElementById("pass");
			var pwC = document.getElementById("passC");
			var pass = document.getElementById("pwCheck");

			pass.style.display = "none";

			if (pw.value == "") {
				pass.innerHTML = "비밀번호 또는 비밀번호확인을 입력해주세요.";
			} else if (pwC.value == "") {
				pass.innerHTML = "비밀번호 또는 비밀번호확인을 입력해주세요.";
			} else if (pw.value != pwC.value) {
				pw.value = "";
				pwC.value = "";
				pass.innerHTML = "비밀번호와 비밀번호확인이 일치하지않습니다.";
			} else {
				pass.innerHTML = "비밀번호와 비밀번호확인이 일치합니다.";
				re1 = true;
			}
			pass.style.display = "inline-block";
		}

		function isDouble() {
			var id = document.getElementById("id");
			var txt = document.getElementById("isDouble");
			$.ajax({
				url : 'idDouble?id=' + id.value, //request 보낼 서버의 경로
				type : 'get', // 메소드(get, post, put 등)
				data : 'text', //보낼 데이터
				success : function(data) {
					if (data == 'success') {
						txt.innerHTML = '이 아이디는 사용할 수 있습니다.';
						re2 = true;
					} else if (data == 'fail') {
						txt.innerHTML = '이 아이디는 사용할 수 없습니다.';
						id.value = "";

					}
					txt.style.display = "inline-block";
				},
				error : function(err) {
					//서버로부터 응답이 정상적으로 처리되지 못햇을 때 실행
				}
			});
		}

		function joinCheck() {
			if (re1 && re2) {
			} else {
				alert('아이디, 비밀번호를 확인해 주세요.');
			}
		}
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