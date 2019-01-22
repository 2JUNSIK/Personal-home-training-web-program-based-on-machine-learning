<%@page import="com.model.WorkOutDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Tummy</title>
<style type="text/css">
.workout {
	width: 100%;
}

.workoutvideo {
	margin-left: 170px;
	width: 70%;
}

.routinedesc {
	margin-left: 150px;
	font-family: 나눔고딕;
	width: 100%;
	font-size: 30px;
	margin: 10px;
}

a#MOVE_TOP_BTN {
	position: fixed;
	right: 2%;
	bottom: 50px;
	display: none;
	z-index: 999;
}
</style>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
</head>
<body class="is-preload">
	<div id="page-wrapper">

		<!-- Header -->
		<header id="header">
			<div class="logo container">
				<div style="top: -1.7em;"">
					<!-- <p style="font-size: 50px; color: black;">이루어Gym</p> -->
					<img alt="" src="images/titleBar.png"">
				</div>
			</div>
		</header>
		<!-- Nav -->
		<nav id="nav">
			<ul>
				<div style="float: left">
					<strong>방문자 수</strong> <b>${visit }</b>
				</div>
				<li class="current"><a href="main.jsp">Home</a></li>
				<li><a href="exerciseList.do">운동리스트</a>
					<ul>
						<li><a href="Bochungjae.jsp">보충제</a></li>
						<li class="current"><a href="exerciseList.do">운동리스트</a>
							<ul>
								<li><a href="exerciseList.do">전체</a>
									<ul>
										<li><a href="shou_back.do">어깨/등</a>
										<li><a href="chest.do">가슴</a>
										<li><a href="choco.do">복근</a>
										<li><a href="leg.do">다리</a>
									</ul>
							</ul></li>
					</ul></li>

				<li><a href="gym_list.jsp">헬스장 찾기</a>
					<ul>
						<li><a href="gym_list.jsp">전체 헬스장리스트</a></li>
					</ul></li>

				<c:choose>
					<c:when test="${uname!=null }">
						<li><a href="eat_list.jsp">추천식단</a></li>
						<li><a href="my_page.jsp">마이페이지</a>
							<ul>
								<li><a href="my_page.jsp">목표달성현황</a></li>
								<li><a href="WorkoutRoutine.do">오늘의 추천운동</a></li>
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
			<form class="modal-content animate" action="Login.do" method="post">
				<div class="container">
					<label for="uname"
						style="font-size: 30px; margin-top: 10px; margin-bottom: 10px;"><b>ID</b></label>
					<input type="text" placeholder="Login Id" name="id" required>
					<label for="psw"
						style="font-size: 30px; margin-top: 10px; margin-bottom: 10px;"><b>Password</b></label>
					<input type="password" placeholder="Login Pw" name="pw" required>

					<button type="submit" style="margin-top: 20px;">Login</button>
					<label><input type="checkbox" checked="checked"
						name="remember"> 자동 로그인 </label>
				</div>

				<div class="container">
					<button type="button"
						onclick="document.getElementById('id01').style.display='none'"
						class="cancelbtn">Cancel</button>
				</div>
			</form>
		</div>
		<!-- Main -->
		<section id="main">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<div class="content">

							<!-- Content -->

							<article class="box page-content">
								<header>
									<h2 style="font-size: 40px;text-align: center; margin-bottom: 2%;">복근 운동 리스트</h2>
									<p style="font-size: 20px;text-align: center;">11자 / 초콜릿<b style="font-size:25px; color: #f50057;"> 복근</b>을 만들어가세요! 당신은 할 수 있습니다!</p>
								</header>
								<article class="box post-summary">
											<a href="exerciseList.do" style="float: right;text-decoration: none;  "><h2 style="font-size:30px; color: #009688;">전체 운동</h2></a>
								</article>

								<section>
									<span class="image featured"><img src="" alt="" /></span>

									<section text-align="center">

										<%
											ArrayList<WorkOutDTO> arr = (ArrayList<WorkOutDTO>) session.getAttribute("chocoList");
											if (arr == null) {
										%>
										<h1>db에 아직 안담김</h1>
										<%
											} else {
												for (int i = 0; i < arr.size(); i++) {
										%>
										<section class="workout" class="routinesection">
											<div class="routinedesc">
												<%=(i + 1) + ". " + arr.get(i).getWorkoutname()%>
											</div>
											<iframe text-align="center" class="workoutvideo" height="500"
												src="<%=arr.get(i).getWorkouturl()%>" frameborder="0"
												allow="accelerometer; encrypted-media; gyroscope; picture-in-picture"
												allowfullscreen></iframe>

										</section>
										<%
											}
											}
										%>

									</section>

								</section>
						</div>
					</div>
					<div class="col-12"></div>
					<div class="col-12"></div>
				</div>
			</div>
		</section>

	</div>

	<!-- Footer -->
	<footer id="footer">
		<div class="container">
			<div class="row gtr-200">
				<div class="col-12">

					<!-- About -->
					<section>
						<h2 class="major">
							<span>회사 소개</span>
						</h2>
						<p>
							이 회사는 <strong>이루어Gym</strong>이라는 헬스 도움 웹사이트로서 건강한 몸, 예쁜 몸에 도전하려는
							초보 운동자들을 위해 다양한 컨텐츠를 준비한 사이트입니다. 웹 사이트를 이용함으로써 좀 더 당당해지고 자신감 넘치는
							당신의 미래를 위해 다가가세요 :)

						</p>
					</section>

				</div>
				<div class="col-12">

					<!-- Contact -->
					<section>
						<h2 class="major">
							<span>Get in touch</span>
						</h2>
						<ul class="contact">
							<li><a class="icon fa-facebook"
								href="https://www.facebook.com/gwangjumat"><span
									class="label">Facebook</span></a></li>
							<li><a class="icon fa-instagram"
								href="https://www.instagram.com/explore/tags/%EB%8B%A4%EC%9D%B4%EC%96%B4%ED%8A%B8%EC%8B%9D%EB%8B%A8/"><span
									class="label">Instagram</span></a></li>
						</ul>
					</section>

				</div>
			</div>

			<!-- Copyright -->
			<div id="copyright">
				<ul class="menu">
					<li>&copy; Untitled. All rights reserved</li>
					<li>Design: <a href="main.jsp">이루어Gym</a></li>
				</ul>
			</div>

		</div>
	</footer>

	</div>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
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