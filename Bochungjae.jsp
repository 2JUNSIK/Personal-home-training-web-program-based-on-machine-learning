<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Bochungjae</title>
<style type="text/css">
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
				<li><a href="main.jsp">Home</a></li>
				<li  class="current"><a href="exerciseList.jsp">운동리스트</a>
					<ul>
						<li><a href="Bochungjae.jsp">보충제</a></li>
						<li><a href="exerciseList.jsp">운동리스트</a>
							<ul>
								<li><a href="exerciseList.jsp">전체</a>
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
						<li><a href="close_gym.jsp">내 주변 헬스장</a></li>
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
							<a onclick="document.getElementById('id01').style.display='block';document.getElementById('id02').style.display='none'">로그인</a>
						</div>
					</c:otherwise>
				</c:choose>
			</ul>
		</nav>
		<!-- Main -->
		<section id="main">
			<div style="width: 15%; position: fixed;">
				<section style="overflow: hidden;">
					<h2 class="major" style="margin-top: 2%;">
						<ul class="divided">
							<h3 align="center">보충제 List</h3>
						</ul>
					</h2>
					<ul class="divided">
						<li align="center">
							<article class="box post-summary">
								<h3>
									<a href="#bochungjae">단백질 보충제/쉐이크</a>
								</h3>
							</article>
						</li>
						<li align="center">
							<article class="box post-summary">
								<h3>
									<a href="#diet">다이어트 보조제</a>
								</h3>
							</article>
						</li>
						<li align="center">
							<article class="box post-summary">
								<h3>
									<a href="#gainer">게이너 보충제</a>
								</h3>
							</article>
						</li>
					</ul>
				</section>
			</div>
			
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
			
			<div class="container">
				<div class="row">
					<div class="col-3 col-12-medium">
						<div class="sidebar">

							<!-- Sidebar -->
							<!-- Something -->
							<section style="text-align: center;">
								<ul class="divided">
									<h2 class="major">
										<span><b id="gangjo">단백질</b>보충제</span>
									</h2>
								</ul>
								<a href="#" class="image featured"><img
									src="images/bochungjae_side.gif" alt="" align="center" /></a>
								<h3 style="color: #f50057; font-size: 30px;">TOP7</h3>
								<p>
									<span style="color: red; font-size: 20px;">1위.</span>머슬쉐이크<br>
									<span style="color: red; font-size: 20px;">2위.</span>데일리 단백질<br>
									<span style="color: red; font-size: 20px;">3위.</span>스파르탄 부스터<br>
									<span style="color: red; font-size: 20px;">4위.</span>스파르탄 아미노<br>
									<span style="color: red; font-size: 20px;">5위.</span>매스게이너<br>
									<span style="color: red; font-size: 20px;">6위.</span>덴마크 밀크프로틴<br>
									<span style="color: red; font-size: 20px;">7위.</span>플렉스골드<br>
								</p>
								<c:choose>
									<c:when test="${uname!=null }">
										<a href="Bochungjae.jsp" class="button alt">View More
											Product</a>
									</c:when>
									<c:otherwise>
										<a href="Sign-up.jsp" class="button alt">View More Product</a>
									</c:otherwise>
								</c:choose>
							</section>

							<!-- Something -->
							<section align="center">
								<h2 class="major">
									<span><b id="gangjo">올바른</b>식습관</span>
								</h2>
								<a href="#" class="image featured"><img
									src="images/eat_list_side2.gif" alt="" align="center" /></a>
								<p>
									<span style="color: red; font-size: 20px;">하나.</span>충분한 수분섭취를
									한다<br> <span style="color: red; font-size: 20px;">둘.</span>영양소
									균형을 맞춰준다<br> <span style="color: red; font-size: 20px;">셋.</span>식사시
									음식에만 집중한다<br> <span style="color: red; font-size: 20px;">넷.</span>오후
									6시이후로 안먹는다<br> <span style="color: red; font-size: 20px;">다섯.</span>계절
									채소로 직접 조리해 먹는다
								</p>
								<c:choose>
									<c:when test="${uname!=null }">
										<a href="eat_list.jsp" class="button alt">My Menu</a>
									</c:when>
									<c:otherwise>
										<a href="Sign-up.jsp" class="button alt">Learn more</a>
									</c:otherwise>
								</c:choose>
							</section>
						</div>
					</div>

					<div class="col-9 col-12-medium imp-medium">
						<div class="content">
							<!-- Content -->

							<div id="bochungjae">
								<article class="box page-content">

									<header style="text-align: center; padding-top: 5.25em;">

										<h2>
											<b style="color: #f50057; font-size: 65px;">단백질</b>보충제/쉐이크
										</h2>
										<h3>근육성장의 3요소중 근육을 보강을 가져다 주는 역활을 하는 보충제!</h3>
									</header>

									<section>
										<span class="image featured">
											<h2 style="text-align: center;">1위</h2> <img
											src="images/bo1.jpg" alt=""
											style="width: 26%; margin-left: 36%;" />
										</span> <span style="font-size: 20px; margin-left: 33%">만인의
											프로틴 <b style="color: #f50057; font-size: 30px;">몬스터 밀크</b>
										</span>
									</section>
									<article class="box page-content">

										<section>
											<hr>
											<span class="image featured">
												<h2 style="text-align: center;">2위</h2> <img
												src="images/bo2.png" alt=""
												style="width: 26%; margin-left: 36%;" />
											</span> <span style="font-size: 20px; margin-left: 35%">깔끔한 맛
												<b style="color: #f50057; font-size: 30px;">엑스에너지</b>
											</span>
										</section>
										<article class="box page-content">

											<section>
												<hr>
												<span class="image featured">
													<h2 style="text-align: center;">3위</h2> <img
													src="images/bo3.png" alt=""
													style="width: 26%; margin-left: 36%;" />
												</span> <span style="font-size: 20px; margin-left: 35%">NOW사<b
													style="color: #f50057; font-size: 30px;"> 웨이프로틴</b></span>
											</section>
											<article class="box page-content">

												<section>
													<hr>
													<span class="image featured">
														<h2 style="text-align: center;">4위</h2> <img
														src="images/bo4.png" alt=""
														style="width: 26%; margin-left: 36%;" />
													</span> <span style="font-size: 20px; margin-left: 35%">맛도
														제품도 무난한 <b style="color: #f50057; font-size: 30px;">엘리트</b>
													</span>
												</section>
												<article class="box page-content">

													<section>
														<hr>
														<span class="image featured">
															<h2 style="text-align: center;">5위</h2> <img
															src="images/bo5.png" alt=""
															style="width: 26%; margin-left: 36%;" />
														</span> <span style="font-size: 20px; margin-left: 35%">요즘
															핫한<b style="color: #f50057; font-size: 30px;"> 마이프로틴</b>

														</span>

													</section>
							</div>
							<div id="diet">
								<article class="box page-content">

									<header style="text-align: center; padding-top: 5.25em;">
										<h2>
											<b style="color: #f50057; font-size: 65px;">다이어트</b>보조제
										</h2>
										<h3>지방을 컷트해주는 효과적인 다이어트 방법</h3>
									</header>

									<section>
										<span class="image featured">
											<h2 style="text-align: center;">1위</h2> <img
											src="images/diet1.png" alt=""
											style="width: 26%; margin-left: 36%;" />
										</span> <span style="font-size: 20px; margin-left: 46%"><b
											style="color: #ff1744; font-size: 30px;">GRN</b></span>
									</section>
									<article class="box page-content">

										<section>
											<hr>
											<span class="image featured">
												<h2 style="text-align: center;">2위</h2> <img
												src="images/diet2.png" alt=""
												style="width: 26%; margin-left: 36%;" />
											</span> <span style="font-size: 20px; margin-left: 42%"><b
												style="color: #ff1744; font-size: 30px;">칼로커트</b></span>
										</section>
										<article class="box page-content">

											<section>
												<hr>
												<span class="image featured">
													<h2 style="text-align: center;">3위</h2> <img
													src="images/diet3.png" alt=""
													style="width: 26%; margin-left: 36%;" />
												</span> <span style="font-size: 20px; margin-left: 43%"><b
													style="color: #ff1744; font-size: 30px;">CJ펫다운</b></span>
											</section>
											<article class="box page-content">

												<section>
													<hr>
													<span class="image featured">
														<h2 style="text-align: center;">4위</h2> <img
														src="images/diet4.png" alt=""
														style="width: 26%; margin-left: 36%;" />
													</span> <span style="font-size: 20px; margin-left: 42.5%;"><b
														style="color: #ff1744; font-size: 30px;">칼로바이</b></span>
												</section>
												<article class="box page-content">

													<section>
														<hr>
														<span class="image featured">
															<h2 style="text-align: center;">5위</h2> <img
															src="images/diet5.png" alt=""
															style="width: 26%; margin-left: 36%;" />
														</span> <span style="font-size: 20px; margin-left: 30%"><b
															style="color: #ff1744; font-size: 30px;">뉴트리디데이</b>
															데이다이어트</span>
													</section>
							</div>
							<div id="gainer">
								<article class="box page-content">

									<header style="text-align: center; padding-top: 5.25em;">
										<h2>
											<b style="color: #f50057; font-size: 65px;">게이너</b>보충제
										</h2>
										<h3>
											<b style="color: #ff1744; font-size: 30px;">멸치</b>들을 위한!<b
												style="color: #ff1744; font-size: 30px;">근육을 만들고 싶은자</b>를 위한
											보충제!
										</h3>
									</header>

									<section>
										<span class="image featured"> <img src="images/bo1.jpg"
											alt="" style="width: 26%; margin-left: 36%;" />
										</span> <span style="font-size: 20px; margin-left: 30%">멸치를 위한
											프로틴 <b style="color: #ff1744; font-size: 30px;">제트 퓨어G30</b>
										</span>
									</section>
							</div>
		</section>


		<!-- Features -->
		<section class="box features" style="background-color: white;">
			<h2 class="major" style="background-color: white;">
				<span> 주요 컨텐츠!</span>
			</h2>
			<c:choose>
				<c:when test="${uname!=null }">
					<div>
						<div class="row" style="background-color: white;">
							<div class="col-3 col-6-medium col-12-small">

								<!-- Feature -->
								<section class="box feature">
									<a href="recommend_exercise.jsp" class="image featured"><img
										src="images/pic01.jpg" alt="" /></a>
									<h3>
										<a href="recommend_exercise.jsp">운동 리스트</a>
									</h3>
									<p>초보자들에게 필요한 운동들이 나열되어 있습니다. 또한 운동화 함께 섭취할 보충제들을 소개해놨습니다.</p>
								</section>

							</div>
				</c:when>
				<c:otherwise>
					<div>
						<div class="row" style="background-color: white;">
							<div class="col-3 col-6-medium col-12-small">

								<!-- Feature -->
								<section class="box feature">
									<a href="exerciseList.jsp" class="image featured"><img
										src="images/pic01.jpg" alt="" /></a>
									<h3>
										<a href="exerciseList.jsp">운동 리스트</a>
									</h3>
									<p>초보자들에게 필요한 운동들이 나열되어 있습니다. 또한 운동화 함께 섭취할 보충제들을 소개해놨습니다.</p>
								</section>

							</div>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${uname!=null }">
					<div class="col-3 col-6-medium col-12-small">
						<!-- Feature -->
						<section class="box feature">
							<a href="eat_list.jsp" class="image featured"><img
								src="images/pic02.jpg" alt="" /></a>
							<h3>
								<a href="eat_list.jsp"> 식단 리스트</a>
							</h3>
							<p>체형별로 식단 짜기 어려우신분들 , 여기모이세요! 저희 이루어짐이 당신에게 꼭맞는 식단을 도와줄게요</p>
						</section>
					</div>
				</c:when>
				<c:otherwise>
					<div class="col-3 col-6-medium col-12-small">
						<!-- Feature -->
						<section class="box feature">
							<a href="Sign-up.jsp" class="image featured"><img
								src="images/pic02.jpg" alt="" /></a>
							<h3>
								<a href="Sign-up.jsp"> 식단 리스트</a>
							</h3>
							<p>체형별로 식단 짜기 어려우신분들 , 여기모이세요! 저희 이루어짐이 당신에게 꼭맞는 식단을 도와줄게요</p>
						</section>
					</div>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${uname!=null }">
					<div class="col-3 col-6-medium col-12-small">

						<!-- Feature -->
						<section class="box feature">
							<a href="member_goal_list.jsp" class="image featured"><img
								src="images/pic03.jpg" alt="" /></a>
							<h3>
								<a href="my_page.jsp"> 워너비리스트</a>
							</h3>
							<p>목표를 달성하고 싶다면 당장, 여기로! 자신의 현위치를 확인할 수 있을 뿐문 아니라 타 회원들의 목표를
								통해 동기부여까지!</p>
						</section>

					</div>

				</c:when>
				<c:otherwise>
					<div class="col-3 col-6-medium col-12-small">

						<!-- Feature -->
						<section class="box feature">
							<a href="Sign-up.jsp" class="image featured"><img
								src="images/pic03.jpg" alt="" /></a>
							<h3>
								<a href="Sign-up.jsp"> 워너비리스트</a>
							</h3>
							<p>목표를 달성하고 싶다면 당장, 여기로! 자신의 현위치를 확인할 수 있을 뿐만 아니라 타 회원들의 목표를
								통해 동기부여까지!</p>
						</section>

					</div>


				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${uname!=null }">
					<div class="col-3 col-6-medium col-12-small">

						<!-- Feature -->
						<section class="box feature">
							<a href="close_gym.jsp" class="image featured"><img
								src="images/pic04.jpg" alt="" /></a>
							<h3>
								<a href="close_gym.jsp"> 내집주변 헬스장 어디?</a>
							</h3>
							<p>주변의 헬스장 어디로 갈지 고민하시는 여기 모두 모이세요 좋기로 소문난 헬스 장 여기다 모아놨습니다!</p>
						</section>

					</div>

				</c:when>
				<c:otherwise>
					<div class="col-3 col-6-medium col-12-small">

						<!-- Feature -->
						<section class="box feature">
							<a href="gym_list.jsp" class="image featured"><img
								src="images/pic04.jpg" alt="" /></a>
							<h3>
								<a href="gym_list.jsp"> 내집주변 헬스장 어디?</a>
							</h3>
							<p>주변의 헬스장 어디로 갈지 고민하시는 여기 모두 모이세요 좋기로 소문난 헬스 장 여기다 모아놨습니다!</p>
						</section>

					</div>


				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${uname!=null }">

					<div class="col-12"
						style="margin-bottom: 20px; background-color: white;">
						<ul class="actions">
							<li><a href="my_page.jsp" class="button large">My Page</a></li>
							<li><a href="main.jsp" class="button alt large">Main</a></li>
						</ul>
					</div>
				</c:when>
				<c:otherwise>


					<div class="col-12"
						style="margin-bottom: 20px; background-color: white;">
						
						<ul class="actions">
							<li><a href="Sign-up.jsp" class="button large">Join US</a></li>
							<li><a href="main.jsp" class="button alt large">Think
									About It</a></li>
						</ul>
					</div>
				</c:otherwise>
			</c:choose>
	</div>
	</div>
	</section>

	</div>
	<div class="col-12">


		<!-- Footer -->
		<footer id="footer" style="background-color: white;">
			<div class="container">
				<div class="row gtr-200">
					<div class="col-12">

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
												이 회사는 <strong>이루어Gym</strong>이라는 헬스 도움 웹사이트로서 건강한 몸, 예쁜 몸에
												도전하려는 초보 운동자들을 위해 다양한 컨텐츠를 준비한 사이트입니다. 웹 사이트를 이용함으로써 좀 더
												당당해지고 자신감 넘치는 당신의 미래를 위해 다가가세요 :)

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