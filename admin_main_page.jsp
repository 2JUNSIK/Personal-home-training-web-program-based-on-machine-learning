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
</style>
<title>Admin_main_page</title>
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

				<li><a href="UserInfo1.do">회원관리</a>
					<ul>
						<li><a href="UserInfo1.do">회원정보</a></li>
						<li><a href="UserInfo2.do">회원목표정보</a></li>
						</ul>
						</li>
				<c:choose>
					<c:when test="${uid!=null }">
					<div style="float: right">
							<a href="Logout">로그아웃</a>
						</div>
					</c:when>
				</c:choose>
					</ul>
		</nav>
		<!-- Login 창 -->
		<div id="id01" class="modal">
			<form class="modal-content animate" action="/login.do">
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
		</nav>

		<!-- Banner -->
		<section id="banner">
			<div class="content">
				<h2>당신의 행복파트너 바로, 이루어Gym 과 함께하세요</h2>
				<p></p>
				<a href="#main" class="button scrolly">Alright let's care</a>
			</div>
		</section>

		<!-- Main -->
		<section id="main">
			<div class="container">
				<div class="row gtr-200">
					<div class="col-12">

						<!-- Highlight -->
						<section class="box highlight">
							<ul class="special">
								<li><a href="#" class="icon fa-search"><span
										class="label">Magnifier</span></a></li>
								<li><a href="#" class="icon fa-tablet"><span
										class="label">Tablet</span></a></li>
								<li><a href="#" class="icon fa-flask"><span
										class="label">Flask</span></a></li>
								<li><a href="#" class="icon fa-cog"><span class="label">Cog?</span></a></li>
							</ul>
							<header>
								<h2>A random assortment of icons in circles</h2>
								<p>And some text that attempts to explain their significance</p>
							</header>
							<p>똑똑한 사람이 살을 더 잘뺀다</p>
						</section>

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
											<a href="exerciseList.jsp" class="image featured"><img
												src="images/pic01.jpg" alt="" /></a>
											<h3>
												<a href="exerciseList.jsp">운동 리스트</a>
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
											<a href="member_goal_list.jsp" class="image featured"><img
												src="images/pic03.jpg" alt="" /></a>
											<h3>
												<a href="member_goal_list.jsp"> 워너비리스트</a>
											</h3>
											<p>목표를 달성하고 싶다면 당장, 여기로! 자신의 현위치를 확인할 수 있을 뿐문 아니라 타 회원들의
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
								</div>
							</div>
						</section>

					</div>
					<div class="col-12">

						<!-- Blog -->
						<section class="box blog">
							<h2 class="major">
								<span>Another Major Heading</span>
							</h2>
							<div>
								<div class="row">
									<div class="col-9 col-12-medium">
										<div class="content">

											<!-- Featured Post -->
											<article class="box post">
												<header>
													<h3>
														<a href="#">Here's a really big heading</a>
													</h3>
													<p>With a smaller subtitle that attempts to elaborate</p>
													<ul class="meta">
														<li class="icon fa-clock-o">15 minutes ago</li>
														<li class="icon fa-comments"><a href="#">8</a></li>
													</ul>
												</header>
												<a href="#" class="image featured"><img
													src="images/pic05.jpg" alt="" /></a>
												<p>Phasellus quam turpis, feugiat sit amet ornare in, a
													hendrerit in lectus. Praesent semper mod quis eget mi.
													Etiam sed ante risus aliquam erat et volutpat. Praesent a
													dapibus velit. Curabitur sed nisi nunc, accumsan vestibulum
													lectus. Lorem ipsum dolor sit non aliquet sed, tempor et
													dolor. Praesent a dapibus velit. Curabitur accumsan.</p>
												<a href="#" class="button">Continue Reading</a>
											</article>

										</div>
									</div>
									<div class="col-3 col-12-medium">
										<div class="sidebar">

											<!-- Archives -->
											<ul class="divided">
												<li>
													<article class="box post-summary">
														<h3>
															<a href="#">A Subheading</a>
														</h3>
														<ul class="meta">
															<li class="icon fa-clock-o">6 hours ago</li>
															<li class="icon fa-comments"><a href="#">34</a></li>
														</ul>
													</article>
												</li>
												<li>
													<article class="box post-summary">
														<h3>
															<a href="#">Another Subheading</a>
														</h3>
														<ul class="meta">
															<li class="icon fa-clock-o">9 hours ago</li>
															<li class="icon fa-comments"><a href="#">27</a></li>
														</ul>
													</article>
												</li>
												<li>
													<article class="box post-summary">
														<h3>
															<a href="#">And Another</a>
														</h3>
														<ul class="meta">
															<li class="icon fa-clock-o">Yesterday</li>
															<li class="icon fa-comments"><a href="#">184</a></li>
														</ul>
													</article>
												</li>
												<li>
													<article class="box post-summary">
														<h3>
															<a href="#">And Another</a>
														</h3>
														<ul class="meta">
															<li class="icon fa-clock-o">2 days ago</li>
															<li class="icon fa-comments"><a href="#">286</a></li>
														</ul>
													</article>
												</li>
												<li>
													<article class="box post-summary">
														<h3>
															<a href="#">And One More</a>
														</h3>
														<ul class="meta">
															<li class="icon fa-clock-o">3 days ago</li>
															<li class="icon fa-comments"><a href="#">8,086</a></li>
														</ul>
													</article>
												</li>
											</ul>
											<a href="#" class="button alt">Archives</a>

										</div>
									</div>
								</div>
							</div>
						</section>

					</div>
				</div>
			</div>
		</section>

		<!-- Footer -->
		<footer id="footer">
			<div class="container">
				<div class="row gtr-200">
					<div class="col-12">

						<!-- About -->
						<section>
							<h2 class="major">
								<span>What's this about?</span>
							</h2>
							<p>
								This is <strong>TXT</strong>, yet another free responsive site
								template designed by <a href="http://twitter.com/ajlkn">AJ</a>
								for <a href="http://html5up.net">HTML5 UP</a>. It's released
								under the <a href="http://html5up.net/license/">Creative
									Commons Attribution</a> license so feel free to use it for whatever
								you're working on (personal or commercial), just be sure to give
								us credit for the design. That's basically it :)
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
								<li><a class="icon fa-facebook" href="#"><span
										class="label">Facebook</span></a></li>
								<li><a class="icon fa-twitter" href="#"><span
										class="label">Twitter</span></a></li>
								<li><a class="icon fa-instagram" href="#"><span
										class="label">Instagram</span></a></li>
								<li><a class="icon fa-dribbble" href="#"><span
										class="label">Dribbble</span></a></li>
								<li><a class="icon fa-linkedin" href="#"><span
										class="label">LinkedIn</span></a></li>
							</ul>
						</section>

					</div>
				</div>

				<!-- Copyright -->
				<div id="copyright">
					<ul class="menu">
						<li>&copy; Untitled. All rights reserved</li>
						<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
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
	<script>
		// Get the modal
		var modal = document.getElementById('id01');

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
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