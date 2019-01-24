<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>My_page</title>
<style type="text/css">
a#MOVE_TOP_BTN {
	position: fixed;
	right: 2%;
	bottom: 50px;
	display: none;
	z-index: 999;
}

#myProgress {
	position: relative;
	width: 80%;
	height: 30px;
	background-color: rgba(21, 28, 23, 0.85);
	border-radius: 30px;
}

#myBar {
	position: absolute;
	width: 30%;
	height: 100%;
	background-color: #b1ddad;
	border-radius: 30px 0px 0px 30px;
}

#label {
	text-align: center; /* If you want to center it */
	line-height: 30px;
	/* Set the line-height to the same as the height of the progress bar container, to center it vertically */
	color: white;
}

#myProgress2 {
	position: relative;
	width: 80%;
	height: 30px;
	background-color: rgba(21, 28, 23, 0.85);
	border-radius: 30px;
}

#myBar2 {
	position: absolute;
	width: 30%;
	height: 100%;
	background-color: #b1ddad;
	border-radius: 30px 0px 0px 30px;
}

#label2 {
	text-align: center; /* If you want to center it */
	line-height: 30px;
	/* Set the line-height to the same as the height of the progress bar container, to center it vertically */
	color: white;
}

#gangjo {
	font-size: 35px;
	color: rgb(74, 174, 82);
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

				<li><a href="main.jsp">Home</a></li>
				<li><a href="exerciseList.jsp">운동리스트</a>
					<ul>
						<li><a href="Bochungjae.jsp">보충제</a></li>
						<li><a href="exercise.jsp">운동리스트</a></li>
					</ul></li>
				<li><a href="gym_list.jsp">헬스장 찾기</a>
				<li><a href="eat_list.jsp">추천식단</a></li>
					<ul>
						<li><a href="close_gym.jsp">내 주변 헬스장</a></li>
						<li><a href="gym_list.jsp">전체 헬스장리스트</a></li>
					</ul></li>
				<li class="current"><a href="my_page.jsp">마이페이지</a>
					<ul>
						<li><a href="my_page.jsp">목표달성현황</a></li>
						<li><a href="recommend_exercise.jsp">오늘의 추천운동</a></li>
						<li><a href="my_page_info.jsp">내정보수정</a></li>
					</ul></li>
				<c:choose>
					<c:when test="${uid==null}">
						<li>
							<div style="float: right">
								<a
									onclick="document.getElementById('id02').style.display='block';document.getElementById('id01').style.display='none'">회원가입</a>
							</div>
						</li>
						<li>
							<div style="float: right">
								<a
									onclick="document.getElementById('id01').style.display='block';document.getElementById('id02').style.display='none'">로그인</a>
							</div>
						</li>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${info.email == 'admin'}">
								<div style="float: right">
									<a href="Select.do">회원 관리</a> / <a href="logout.jsp">로그아웃</a>
								</div>
							</c:when>
							<c:otherwise>
								<div style="float: right">
									<a href="main.jsp">로그아웃</a>
								</div>
								<div style="float: right">
									<a href="my_page_info.jsp">내 정보 수정</a>
								</div>
							</c:otherwise>
						</c:choose>

					</c:otherwise>
				</c:choose>
			</ul>
		</nav>

		<!-- Main -->
		<section id="main">
			<div class="container">
				<div class="row">
					<div class="col-3 col-12-medium">
						<div class="sidebar">

							<!-- Sidebar -->

							<!-- Recent Posts -->
							<section>
								<h2 class="major">
									<span>마이페이지</span>
								</h2>
								<ul class="divided">
									<li>
										<article class="box post-summary">
											<h3>
												<a href="my_page.jsp">목표달성현황</a>
											</h3>
										</article>
									</li>
									<li>
										<article class="box post-summary">
											<h3>
												<a href="WorkoutRoutine.do">오늘의 추천운동</a>
											</h3>
										</article>
									</li>
									<li>
										<article class="box post-summary">
											<h3>
												<a href="eat_list.jsp">오늘의 추천식단</a>
											</h3>
										</article>
									</li>
									<li>
										<article class="box post-summary">
											<h3>
												<a href="my_page_info.jsp">내 정보 수정</a>
											</h3>
										</article>
									</li>
								</ul>
							</section>


							<!-- Something -->

						</div>
					</div>
					<div class="col-9 col-12-medium imp-medium">
						<div class="content">

							<!-- Content -->

							<article class="box page-content">

								<header>
									<h2>${uname }님의 목표달성 현황!</h2>
								</header>

								<section>
									<span class="image featured"><img
										src="images/my_page.jpg" alt="" /></span>
								</section>
								<div class="col-12" style="margin-bottom: 50px; height: 500px;">
									<h2 class="major">
										<span><b id="gangjo">달라진</b> 나를 확인하세요</span>
									</h2>

									<div id="changeBar"
										style="float: left; width: 800px; height: 340px; padding-top: 10px; margin-left: 40px; margin-top: 40px;">
										<div>
											<h3>날짜</h3>
											<div id="myProgress">
												<div id="myBar">
													<div id="label">10%</div>
												</div>
											</div>
										</div>

										<div>
											<h3>목표치</h3>
											<div id="myProgress2">
												<div id="myBar2">
													<div id="label2">10%</div>
												</div>
											</div>
										</div>
									</div>


								</div>
						</div>

						<div class="col-12">


							</article>

						</div>
					</div>
					<div class="col-12">

						<!-- Features -->
						<section class="box features">
							<h2 class="major">
								<span> 주요 컨텐츠!</span>
							</h2>
							<div>
								<div class="row">
									<div class="col-3 col-6-medium col-12-small">

										<!-- Feature -->
										<section class="box feature">
											<a href="recommend_exercise.jsp" class="image featured"><img
												src="images/pic01.jpg" alt="" /></a>
											<h3>
												<a href="recommend_exercise.jsp">운동 리스트</a>
											</h3>
											<p>초보자들에게 필요한 운동들이 나열되어 있습니다. 또한 운동화 함께 섭취할 보충제들을
												소개해놨습니다.</p>
										</section>

									</div>
									<div class="col-3 col-6-medium col-12-small">

										<!-- Feature -->
										<section class="box feature">
											<a href="eat_list.jsp" class="image featured"><img
												src="images/pic02.jpg" alt="" /></a>
											<h3>
												<a href="eat_list.jsp"> 식단 리스트</a>
											</h3>
											<p>체형별로 식단 짜기 어려우신분들 , 여기모이세요! 저희 이루어짐이 당신에게 꼭맞는 식단을
												도와줄게요</p>
										</section>

									</div>
									<div class="col-3 col-6-medium col-12-small">

										<!-- Feature -->
										<section class="box feature">
											<a href="my_page.jsp" class="image featured"><img
												src="images/pic03.jpg" alt="" /></a>
											<h3>
												<a href="my_page.jsp"> 워너비리스트</a>
											</h3>
											<p>목표를 달성하고 싶다면 당장, 여기로! 자신의 현위치를 확인할 수 있을 뿐만 아니라 타 회원들의
												목표를 통해 동기부여까지!</p>
										</section>

									</div>
									<div class="col-3 col-6-medium col-12-small">

										<!-- Feature -->
										<section class="box feature">
											<a href="close_gym.jsp" class="image featured"><img
												src="images/pic04.jpg" alt="" /></a>
											<h3>
												<a href="close_gym.jsp"> 내집주변 헬스장 어디?</a>
											</h3>
											<p>주변의 헬스장 어디로 갈지 고민하시는 여기 모두 모이세요 좋기로 소문난 헬스 장 여기다
												모아놨습니다!</p>
										</section>

									</div>
									<div class="col-12">
										<ul class="actions">
											<li><a href="Sign-up.jsp" class="button large">Join
													US</a></li>
											<li><a href="main.jsp" class="button alt large">Think
													About It</a></li>
										</ul>
									</div>
								</div>
							</div>
						</section>

					</div>
					<div class="col-12">


						<!-- Footer -->
						<footer id="footer">
							<div class="container">
								<div class="row gtr-200">
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